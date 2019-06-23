/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.database;

import com.dto.UserLogin;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author rohit
 */
public class AuthUser {
    public static boolean isAuthUser(String username, String password)
    {
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        session.beginTransaction();
        
        Query query = session.createQuery("from UserLogin where username = :username and password = :password");
        query.setString("username", username);
        query.setString("password", password);
        
        List<UserLogin> users = (List<UserLogin>) query.list();
        session.getTransaction().commit();
        session.close();
        
        for(UserLogin user : users)
        {
            if(user != null)
                return true;
        }
        
        return false;
    }
}
