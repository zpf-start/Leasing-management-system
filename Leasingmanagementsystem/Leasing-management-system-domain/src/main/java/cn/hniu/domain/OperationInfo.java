package cn.hniu.domain;

/**
 * 用户前后端传输，操作是否成功
 */
public class OperationInfo {

    /**
     * 操作是否成功
     */
    private boolean flag;
    /**
     * 失败信息
     */
    private String errorInfo;
    /**
     * 成功信息
     */
    private String successInfo;
    /**
     * 传输的对象
     */
    private Object object;

    @Override
    public String toString() {
        return "OperationInfo{" +
                "flag=" + flag +
                ", errorInfo='" + errorInfo + '\'' +
                ", successInfo='" + successInfo + '\'' +
                ", object=" + object +
                '}';
    }

    public OperationInfo(boolean flag, String errorInfo, String successInfo) {
        this.flag = flag;
        this.errorInfo = errorInfo;
        this.successInfo = successInfo;
    }

    public OperationInfo(boolean flag, String errorInfo, String successInfo, Object object) {
        this.flag = flag;
        this.errorInfo = errorInfo;
        this.successInfo = successInfo;
        this.object = object;
    }

    public OperationInfo() {
    }

    public Object getObject() {
        return object;
    }

    public void setObject(Object object) {
        this.object = object;
    }

    public String getErrorInfo() {
        return errorInfo;
    }

    public void setErrorInfo(String errorInfo) {
        this.errorInfo = errorInfo;
    }

    public String getSuccessInfo() {
        return successInfo;
    }

    public void setSuccessInfo(String successInfo) {
        this.successInfo = successInfo;
    }

    public boolean getFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

}
