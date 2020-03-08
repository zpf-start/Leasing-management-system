package cn.hniu.controller;


import cn.hniu.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 访问项目名，或访问 index
 * 实现 自动登录成功 后跳转到主页
 *      或
 *     未登录成功 跳转到登录页面
 */
@Controller
public class indexVisitAutoLogin {

    @Autowired
    private IUserService userService;

    @Autowired
    private HttpServletRequest request;

    //访问 index 跳转到 indexVisitAutoLogin 方法
    @RequestMapping(value = "/index")
    public String indexVisitAutoLoginIndex() throws Exception {
        String path;
        //判断用户是否已经登录 获取session中的user对象
        Object user = request.getSession().getAttribute("user");
        if(user!=null){    //已经登录
            //转发到主页
            path = "forward:/WEB-INF/pages/index.jsp";
        }else{  //未登录
            //转发请求 到 indexVisitAutoLogin
            path = "forward:/";
        }
        return path;
    }

    //访问 / 自动登录后跳转到主页  或 跳转到登录页面
    @RequestMapping(value = "/")
    public String indexVisitAutoLogin() throws Exception {
        String path;
        //判断用户是否已经登录 获取session中的user对象
        Object user = request.getSession().getAttribute("user");
        if(user!=null){    //已经登录
            //转发到主页
            path = "forward:/WEB-INF/pages/index.jsp";
        }else{  //未登录
            //调用service判断用户是否能够自动登录
            boolean autoLogin = userService.autoLogin();
            if(autoLogin==true){   //自动登录成功
                //转发到主页
                path = "forward:/WEB-INF/pages/index.jsp";
            }else{  //自动登录失败
                //重定向到登录页面
                path = "redirect:http://localhost:8080"+request.getServletContext().getContextPath()+"/login.jsp";
            }
        }
        return path;
    }

}
