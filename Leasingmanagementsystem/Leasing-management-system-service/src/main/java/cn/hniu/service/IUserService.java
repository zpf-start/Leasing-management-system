package cn.hniu.service;

import cn.hniu.domain.OperationInfo;
import cn.hniu.domain.User;

import javax.servlet.http.HttpServletResponse;

public interface IUserService {

    /**
     * 生成验证码，并生成一个uuid字符串作为key存入redis
     * @param email
     */
    OperationInfo saveNameAndCodeToRedis(String email) throws Exception;

    /**
     * 用户注册
     * @param user
     * @return
     */
    OperationInfo register(User user, String userCode,String key) throws Exception;

    /**
     * 用户登录
     * @param user
     * @return
     */
    OperationInfo login(User user,String loginValidateCode,String autoLogin,HttpServletResponse response);

    void loginValidateCode(HttpServletResponse response, String number) throws Exception;

    OperationInfo existUsername(String username);

    OperationInfo existEmail(String email);

    OperationInfo sendResetRef(String email);

    User resetPasswordFindUser(String key);

    OperationInfo resetPassword(Integer userId, String password);

    boolean autoLogin();
}
