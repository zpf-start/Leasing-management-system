package cn.hniu.controller;

import cn.hniu.domain.OperationInfo;
import cn.hniu.domain.User;
import cn.hniu.service.IUserService;
import cn.hniu.utils.ValidateCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;

@Controller

@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService userService;

    //用户注册
    @ResponseBody
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public OperationInfo register(User user, @RequestParam(value = "code",required = true) String userCode, @RequestParam(value = "key",required = true) String key) throws Exception {
        OperationInfo operationInfo = userService.register(user, userCode,key);
        return operationInfo;
    }

    //用户注册时发送验证码到邮箱
    @ResponseBody
    @RequestMapping(value = "/saveNameAndCodeToRedisRegister",method = RequestMethod.POST)
    public OperationInfo saveNameAndCodeToRedis(String email) throws Exception {
        OperationInfo operationInfo = userService.saveNameAndCodeToRedis(email);
        return operationInfo;
    }

    //用户登录
    @ResponseBody
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public OperationInfo login(User user,@RequestParam(name = "loginValidateCode",required = true) String loginValidateCode, String autoLogin,HttpServletResponse response) throws Exception{
        //调用用户登录Service
        OperationInfo operationInfo = userService.login(user,loginValidateCode,autoLogin,response);
        return operationInfo;
    }

    //用户登录发送验证码并存入session
    @ResponseBody
    @RequestMapping(value = "/validateCodeLogin",method={RequestMethod.GET})
    public void validateCodeLogin(HttpServletResponse response) throws Exception {
        String number = ValidateCode.getNumber(4);
        userService.loginValidateCode(response,number);
    }

    //用户名是否存在
    @ResponseBody
    @RequestMapping(value = "/existUsernameRegister",method = {RequestMethod.POST})
    public OperationInfo existUsernameRegister(@RequestParam(value = "username",required = true) String username){
        OperationInfo operationInfo = userService.existUsername(username);
        return operationInfo;
    }

    //邮箱是否存在
    @ResponseBody
    @RequestMapping(value = "/existEmailRegister",method = {RequestMethod.POST})
    public OperationInfo existEmailRegister(@RequestParam(value = "email",required = true) String email){
        OperationInfo operationInfo = userService.existEmail(email);
        return operationInfo;
    }

    //发送密码重置链接
    @ResponseBody
    @RequestMapping(value = "/sendResetRef",method = {RequestMethod.POST})
    public OperationInfo sendResetRef(@RequestParam(value = "email",required = true) String email){
        OperationInfo operationInfo = userService.sendResetRef(email);
        return operationInfo;
    }

    //根据key查询用户信息并返回
    @RequestMapping(value = "/resetPasswordFindUser",method = {RequestMethod.GET})
    public ModelAndView resetPasswordFindUser(@RequestParam(value = "key",required = true) String key){
        ModelAndView modelAndView = new ModelAndView();
        User userInfo = userService.resetPasswordFindUser(key);
        if(userInfo!=null){ //用户存在
            modelAndView.addObject("user",userInfo);    //添加用户信息
            modelAndView.setViewName("/publicPages/resetPassword.jsp");    //添加修改密码视图
        }else{
            modelAndView.setViewName("/publicPages/invalidResetRef.html");//链接已失效视图
        }
        return modelAndView;
    }

    //修改密码 resetPassword
    @ResponseBody
    @RequestMapping(value = "/resetPassword",method = {RequestMethod.POST})
    public OperationInfo resetPassword(@RequestParam(value = "userId",required = true) Integer userId,@RequestParam(value = "password",required = true) String password){
        OperationInfo operationInfo = userService.resetPassword(userId,password);
        return operationInfo;
    }

    //用户自动登录
    @RequestMapping(value = "/autoLogin")
    public ModelAndView autoLogin(){
        ModelAndView modelAndView = null;
        boolean flag = userService.autoLogin();
        if(flag == true){ //登录成功
            //跳转到主页
            modelAndView.setViewName("/pages/index.html");
        }else{  //登录失败
            //跳转到登录页面
            modelAndView.setViewName("/publicPages/login.html");
        }
        return modelAndView;
    }
}
