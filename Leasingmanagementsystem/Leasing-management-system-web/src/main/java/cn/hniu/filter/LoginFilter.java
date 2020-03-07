package cn.hniu.filter;

import org.apache.commons.io.FileUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

/**
 * 验证用户是否登录
 *  登录后的用户才能够使用系统功能
 *
 */
public class LoginFilter implements Filter {

    //可以不需要登录就 可访问的页面的 以"目录名/文件名"存放 的List
    private ArrayList<String> notVerifyPages;

    //可以不需要登录就可访问的页面的目录
    private String[] publicPageDir = {"publicPages"};

    //不需要登录就可以访问的 请求中uri中最后一个路径 带有的字符 不区分大小写
    private String[] publicRequests = {"login","register","reset"};

    public void init(FilterConfig filterConfig) throws ServletException {
        //获取 notVerifyPages 不需要登录就可访问的页面的 目录名/文件名 的存放
        if(notVerifyPages == null){     //只获取一次
            //遍历文件夹的名字
            for(String DirPath : publicPageDir){
                //将不需要登录就可以访问的页面目录，获取，以 "/目录名/文件名" 的形式存储到list中
                String contextPath = filterConfig.getServletContext().getRealPath(DirPath);
                //获取所有不需要登录验证的文件名
                Collection<File> publicPages = FileUtils.listFiles(new File(contextPath),null,true);
                //只创建一次
                if(notVerifyPages == null){
                    notVerifyPages = new ArrayList<String>();
                }
                //将 /目录名/文件名 保存到list中
                for (File file : publicPages) {
                    notVerifyPages.add("/"+DirPath+"/"+file.getName());
                }
            }
        }
    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        //转换类型
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        //获取请求路径uri
        String requestURI = request.getRequestURI();
        String webDir = request.getContextPath();
        //获取请求的 目录/页面
        String pages = requestURI.replaceAll(webDir,"");
        //获取路径中的最后一个 uri
        String lastUri = pages.substring(pages.lastIndexOf("/")+1);
        //获取session
        HttpSession session = request.getSession();
        //获取session中的user对象
        Object user = session.getAttribute("user");
        //如果请求的是页面
        if(lastUri.indexOf(".")!=-1){
            //如果是登录页面
            if(lastUri.equals("login.html")){
                //判断是否能够自动登录 转发到自动登录请求中
                response.sendRedirect(request.getContextPath()+"/user/autoLogin");
               filterChain.doFilter(request,response); //放行
               return;
            }
            //如果是 不需要登录的页面
            if(notVerifyPages.contains(pages)){
                //放行
                filterChain.doFilter(request,response);
                return;
            }
        }else{  //表示是一个请求
            for(String publicRequestStr:publicRequests){
                //如果是 不需要用户登录的请求
                if(lastUri.toLowerCase().indexOf(publicRequestStr.toLowerCase())!=-1){  //全部转换为小写 查找
                    //放行
                    filterChain.doFilter(request,response);
                    return;
                }
            }
            //其他请求 检查是用户是否登录
            if(user == null){   //用户未登录
               //判断用户是否能自动登录
                //判断是否能够自动登录 转发到自动登录请求中
                filterChain.doFilter(request,response); //放行
                response.sendRedirect(request.getContextPath()+"/user/autoLogin");
                return;
            }
        }
        //跳转到登录页面
        response.sendRedirect(request.getContextPath()+"/publicPages/login.html");
        return;
    }

    public void destroy() {}

}
