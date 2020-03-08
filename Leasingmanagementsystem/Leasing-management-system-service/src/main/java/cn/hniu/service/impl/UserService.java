package cn.hniu.service.impl;

import cn.hniu.dao.IUserDao;
import cn.hniu.domain.OperationInfo;
import cn.hniu.domain.User;
import cn.hniu.domain.UserLogin;
import cn.hniu.service.IUserService;
import cn.hniu.utils.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.UUID;

@Service
public class UserService implements IUserService {

    @Autowired
    private IUserDao userDao;

    @Autowired
    private HttpServletRequest request;

   //生成验证码，并生成一个uuid字符串作为key存入redis
    public OperationInfo saveNameAndCodeToRedis(String email) throws Exception {
        //1.生成4位随机验证码
        String code = RandomNumber.getRandom(4);
        //3.将验证码发送到用户有邮箱
        MailUtils.sendMail(email,"你好，您的验证码为："+code+"，验证码2分钟后失效！","租聘后台管理系统注册");
        //3.生成uuId字符串保存到redis,并将验证码一并存入，设置过期时间为2分钟
        String uuid = UUID.randomUUID().toString();
        Jedis jedis = JedisPoolUtils.getJedis();
        jedis.setex(uuid,2*60,code);
        jedis.close();
        return new OperationInfo(true,null,uuid);
    }

    //用户注册
    public OperationInfo register(User user, String userCode,String key) throws Exception {
        //返回操作信息对象
        OperationInfo operationInfo = null;
        //操作信息
        String info = null;
        //1.根据传递过来的key查询验证码
        Jedis jedis = JedisPoolUtils.getJedis();
        //2.取出redis中的的验证码
        String redisCode = jedis.get(key);
        //2.客户输入的验证码和存入redis的验证码比较
        if(redisCode==null||redisCode==""){ //验证码不存在，客户未发送验证码,或验证码失效
            info = "验证码已失效";
            operationInfo = new OperationInfo(false,info,null);
        }else if(!userCode.equals(redisCode)){//验证失败
            //返回失败操作信息
            info = "验证码错误";
            operationInfo = new OperationInfo(false,info,null);
        }else{  //验证成功
            //1.将用户保存到数据库
            userDao.save(user);
            //2.返回成功操作信息
            info = "恭喜您注册成功！";
            //3.删除验证码
            if(jedis.exists(key)){  //验证码还存在
                jedis.del(key);
            }
            //4.返回操作信息
            operationInfo = new OperationInfo(true,null,info);
        }
        return operationInfo;
    }

    //用户登录
    public OperationInfo login(User user, UserLogin userLogin, HttpServletResponse response) {
        //返回的操作信息
        OperationInfo operationInfo = null;
        //获取session中的用户信息
        User isLoginUser = (User)request.getSession().getAttribute("user");
        //判断是否有用户登录过
        if(isLoginUser!=null){  //非空验证
            //该用户登录过
            //session中的isUser和本次请求中user的用户名和密码相同    则该用户已登录
            if(user.getUsername().equals(isLoginUser.getUsername()) == true  //该用户已登录
               && user.getPassword().equals(isLoginUser.getPassword()) == true){
                operationInfo = new OperationInfo(true,null,null);
            }
        }
        //该用户未登录
        //获取session总用户的验证码
        String validateCode = (String)request.getSession().getAttribute("loginValidateCode");
        //判断验证码是否正确
        if(validateCode!=null && !validateCode.equals("")){ //session中验证码存在
            if(validateCode.equalsIgnoreCase(userLogin.getLoginValidateCode())){ //验证码匹配
                //根据用户名或邮箱和密码查询用户信息
                User findUser = userDao.findByUsernameAndPasswordOrEmailAndPassword(user.getUsername(), user.getPassword(), user.getUsername(), user.getPassword());
                if(findUser!=null){ //登录成功
                    //1.将用户存入session
                    //获取session
                    HttpSession session = request.getSession();
                    session.setAttribute("user",findUser);
                    //2.删除session中的验证码
                    session.removeAttribute("loginValidateCode");
                    //3.判断是否下次自动登录
                    if(userLogin.getAutoLogin()!=null&& userLogin.getAutoLogin()!=""){    //下次自动登录
                        //创建cookie
                        Cookie cookie = new Cookie("user",findUser.getUserId().toString()); //将用户的 id 以user为key存入cookie
                        cookie.setPath("/");    //设置tomcat任意地址都携带 cookie
                        cookie.setMaxAge(366*60*60*24);    //设置cookie的有效时间为 366天
                        response.addCookie(cookie);         //将用户的cookie存入客户端中
                    }
                    //4.返回操作信息
                    operationInfo = new OperationInfo(true,null,"登录成功");
                }else{  //登陆失败
                    //返回登录失败信息
                    operationInfo = new OperationInfo(false,"用户名或密码错误",null);
                }
            }else{  //验证码不匹配
                operationInfo = new OperationInfo(false,"验证码错误",null);
            }
        }else{//session中验证码不存在
            operationInfo = new OperationInfo(false,"请刷新验证码",null);
        }

        //用户登陆失败
        if(operationInfo.getFlag()==false){
            //将用户的原始信息返回
            ArrayList<Object> objects = new ArrayList<Object>();
            objects.add(user);
            objects.add(userLogin);
            //添加到返回的对象中
            operationInfo.setObject(objects);
        }
        return operationInfo;
    }

    //登录时的验证码图片
    public void loginValidateCode(HttpServletResponse response,String number) throws Exception {
        response.setContentType("application/octet-stream");
        response.addHeader("Content-Disposition", "attachment;filename=" + "vcode.jpeg");
        //将number存入session中
        HttpSession session = request.getSession();
        session.setAttribute("loginValidateCode",number);
        ValidateCode.getImage(response.getOutputStream(),number);
    }

    //用户名是否存在
    public OperationInfo existUsername(String username) {
        OperationInfo operationInfo;
        User user = userDao.findByUsername(username);
        if(user!=null){ //用户存在
            operationInfo = new OperationInfo(false,"用户已存在",null);
        }else{  //用户不存在
            operationInfo = new OperationInfo(true,null,"用户名可用");
        }
        return operationInfo;
    }

    //邮箱是否存在
    public OperationInfo existEmail(String email) {
        OperationInfo operationInfo;
        User user = userDao.findByEmail(email);
        if(user!=null){ //邮箱存在
            operationInfo = new OperationInfo(false,"邮箱已存在",null);
        }else{  //邮箱不存在
            operationInfo = new OperationInfo(true,null,"邮箱可用");
        }
        return operationInfo;
    }

    //发送密码重置链接
    public OperationInfo sendResetRef(String email) {
        OperationInfo operationInfo;
        User user = userDao.findByEmail(email); //查询数据库邮箱是否存在
        if(user!=null){ //邮箱存在
            //1.获取随机字符串作为key
            String key = UUIDUtils.getUUIDStr();
            //2.将用户的id作为value存入redis，并设置有效key的有效时间为10分钟
            Jedis jedis = JedisPoolUtils.getJedis();
            jedis.setex(key,10*60,user.getUserId().toString());
            //4.发送重置密码的链接
            MailUtils.sendMail(email,
                    "<a href='http://localhost:8080/"+request.getServletContext().getContextPath()+"/user/resetPasswordFindUser?key="+
                            key+"'>http://localhost:8080/"+request.getServletContext().getContextPath()+"/user/resetPasswordFindUser?key="+key+"</a><br/>" +
                            "请点击链接重置密码您的密码，该链接10分钟后失效",
                    "租聘后台管理系统-重置密码");
            //返回操作信息
            operationInfo = new OperationInfo(true,null,null);
        }else{  //邮箱不存在
            operationInfo = new OperationInfo(false,"该地址不是经过验证的主要电子邮件，也不与个人用户帐户关联。",null);
        }
        return operationInfo;
    }

    //查询用户
    public User resetPasswordFindUser(String key) {
        User user = null;
        //根据key查询redis中的用户id
        Jedis jedis = JedisPoolUtils.getJedis();
        String userId = jedis.get(key);
        if(userId!=null){   //用户验证码存在
            //查询用户信息并返回
            user = userDao.findOne(Integer.parseInt(userId));
        }
        return user;
    }

    //修改用户密码
    public OperationInfo resetPassword(Integer userId, String password) {
        OperationInfo operationInfo = null;
        User user = userDao.findOne(userId);
        if(user!=null){ //存在用户
            //修改密码
            user.setUserId(userId);
            user.setPassword(password);
            userDao.save(user);//保存用户
            //删除用户的session
            request.getSession().removeAttribute("user");
            //返回密码修改成功信息
            operationInfo = new OperationInfo(true,null,"密码修改成功");

        }else{  //不存在用户
            //返回修改失败操作信息
            operationInfo = new OperationInfo(true,"密码修改失败",null);
        }
        return operationInfo;
    }

    //判断用户能否自动登录
    public boolean autoLogin() {
        //判断用户是否有自动登录属性（366天内自动登录）
        //获取cookie
        Cookie[] cookies = request.getCookies();
        if(cookies!=null){  //cookie存在
            for (Cookie cookie : cookies){  //遍历cookie
                String name = cookie.getName(); //获取key
                if(name.equals("user")){    //如果拥有自动登录属性
                    //获取该用户的id
                    Integer userId = Integer.parseInt(cookie.getValue());
                    //查询用户
                    User findUser = userDao.findOne(userId);
                    if(findUser!=null){   //用户存在
                        //将findUser的信息存入session中
                        request.getSession().setAttribute("user",findUser);
                        //返回登录成功 true
                        return true;
                    }
                }
            }
        }
        return false;
    }

}
