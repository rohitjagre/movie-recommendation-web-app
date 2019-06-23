/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.data.file;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author My DeLL
 */
public class History {
    public static List<String> getSearches(String username) throws FileNotFoundException, IOException
    {
        List<String> searches = new ArrayList<>();
        
        BufferedReader br = new BufferedReader(new FileReader("C:\\Users\\My DeLL\\Downloads\\Documents\\NetBeansProjects\\MahoutRecommEngine\\searches\\"+username+".dat"));
        String line;
        while((line = br.readLine()) != null)
            searches.add(line);
        
        br.close();
        
        return searches;
    }
}
