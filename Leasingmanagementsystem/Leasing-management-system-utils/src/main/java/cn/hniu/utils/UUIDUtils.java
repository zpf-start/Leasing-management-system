package cn.hniu.utils;

import java.util.UUID;

public class UUIDUtils  {

    private UUIDUtils(){}

    /**
     * 获取一个随机字符串
     * @return
     */
    public static String getUUIDStr(){
        return UUID.randomUUID().toString().replace("-","");
    }

}
