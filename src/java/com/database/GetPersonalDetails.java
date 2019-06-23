/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.database;

import com.dto.PersonalDetails;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author rohit
 */
public class GetPersonalDetails {
    public static PersonalDetails getDetails(String username)
    {
        PersonalDetails detail = new PersonalDetails();
        
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session session = sf.openSession();
        session.beginTransaction();
        
        Query query = session.createQuery("from PersonalDetails where username=:username");
        query.setString("username", username);
        List<PersonalDetails> details = (List<PersonalDetails>) query.list();
        for(PersonalDetails d : details)
        {
            detail.setRealName(d.getRealName());
            detail.setAge(d.getAge());
            detail.setContactNo(d.getContactNo());
            detail.setEmail(d.getEmail());
            detail.setGender(d.getGender());
        }
        session.getTransaction().commit();
        session.close();
        return detail;
    }
}
