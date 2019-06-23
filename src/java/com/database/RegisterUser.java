/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.database;

import com.dto.PersonalDetails;
import com.dto.UserLogin;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author rohit
 */
public class RegisterUser {
    public static void isRegister(String username, String password) throws IOException {
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        session.beginTransaction();

        UserLogin user = new UserLogin();
        user.setUsername(username);
        user.setPassword(password);
        session.save(user);
                
        session.getTransaction().commit();
        session.close();
        
        session = sf.openSession();
        session.beginTransaction();
        
        PersonalDetails pd = new PersonalDetails();
        pd.setUsername(username);
        
        session.save(pd);
        
        session.getTransaction().commit();
        session.close();
        
//        File f = new File("C:\\Users\\My DeLL\\Downloads\\Documents\\NetBeansProjects\\MahoutRecommEngine\\searches\\"+username+".dat");
//        f.createNewFile();

        BufferedWriter bw = new BufferedWriter(new FileWriter("C:\\Users\\My DeLL\\Downloads\\Documents\\NetBeansProjects\\MahoutRecommEngine\\searches\\"+username+".dat"));
        bw.write("59315\n");
        bw.close();

    }
}
