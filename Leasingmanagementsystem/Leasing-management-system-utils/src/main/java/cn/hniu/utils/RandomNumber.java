package cn.hniu.utils;

import java.util.Random;

public class RandomNumber {

    private RandomNumber(){}

    private static Random random = new Random();

    /**
     * 获取一个数字随机字符串
     * @param randomSize
     * @return
     */
    public static String getRandom(int randomSize){
        String randomStr = "";
        for (int i=1;i<=randomSize;i++){
            randomStr += random.nextInt(10);
        }
        return randomStr;
    }

}
