package cn.hniu.domain;

/**
 * 用户登陆时传递的其他数据信息
 */
public class UserLogin {
    /**
     * 用户登录的验证码
     */
    private String loginValidateCode;
    /**
     * 是否自动登录
     */
    private String autoLogin;

    @Override
    public String toString() {
        return "UserLogin{" +
                "loginValidateCode='" + loginValidateCode + '\'' +
                ", autoLogin='" + autoLogin + '\'' +
                '}';
    }

    public String getLoginValidateCode() {
        return loginValidateCode;
    }

    public void setLoginValidateCode(String loginValidateCode) {
        this.loginValidateCode = loginValidateCode;
    }

    public String getAutoLogin() {
        return autoLogin;
    }

    public void setAutoLogin(String autoLogin) {
        this.autoLogin = autoLogin;
    }
}
