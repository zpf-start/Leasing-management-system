package cn.hniu.test;

import cn.hniu.dao.IUserDao;
import cn.hniu.domain.User;
import cn.hniu.service.IUserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class UserServiceTest {

    @Autowired
    private IUserService userService;

    @Autowired
    private IUserDao userDao;

    @Test
    public void saveUser(){
        User user = new User();
        user.setUsername("周攀峰");
        user.setEmail("1541086084@qq.com");
        user.setGender("男");
        user.setPassword("zpf123");
        user.setPhoneNumber("18711272916");
    }


    @Test
    public void findUser(){
        User user = new User();
        user.setUsername("周攀峰");
        user.setEmail("1541086084@qq.com");
        user.setPassword("123");
        User findUser = userDao.findByUsernameAndPasswordOrEmailAndPassword(user.getUsername(), user.getPassword(), user.getUsername(), user.getPassword());
        System.out.println(findUser);
    }

    @Test
    public void findByUsername(){
        System.out.println(userDao.findByUsername("周攀峰"));
    }

}
