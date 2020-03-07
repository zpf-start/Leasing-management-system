package cn.hniu.dao;

import cn.hniu.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface IUserDao extends JpaRepository<User,Integer> , JpaSpecificationExecutor<User> {


    //用户登录
    //select * from user
    //where (username='周峰' and password='123') or (email='1541086084@qq.com' and password='123')
    User findByUsernameAndPasswordOrEmailAndPassword(String username,String password,String emial,String password2);

    User findByUsername(String username);

    User findByEmail(String email);

}
