package cn.hniu.test;

import org.apache.commons.io.FileUtils;

import java.io.File;
import java.util.Calendar;
import java.util.Collection;
import java.util.GregorianCalendar;

public class Test {

    @org.junit.Test
    public void testFileUtils(){
        String directoryName = "";
        Collection<File> publicPages = FileUtils.listFiles(new File("F:\\profession\\java\\workSpace\\idea-git\\Leasingmanagementsystem\\Leasing-management-system-web\\src\\main\\webapp\\publicPages"),null,false);
        for (File file : publicPages) {
            System.out.println(file.getName());
        }
    }

    @org.junit.Test
    public void testCalendar(){
        Calendar calendar = new GregorianCalendar();
        int actualMaximum = calendar.getActualMaximum(Calendar.DAY_OF_YEAR);
        System.out.println(actualMaximum);
    }
}
