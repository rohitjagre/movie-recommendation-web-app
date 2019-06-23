/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.predict.items;

import com.dto.MovieInfo;
import com.dto.Movies;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.recommender.GenericItemBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.LogLikelihoodSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.similarity.ItemSimilarity;

/**
 *
 * @author rohit
 */
public class ItemRecommender {
    
    public static GenericItemBasedRecommender getRecommender() throws TasteException
    {
        try {
            
            DataModel model = new FileDataModel(new File("C:\\Users\\My DeLL\\Downloads\\Documents\\NetBeansProjects\\MahoutRecommEngine\\data\\filteredratings.csv"));
            ItemSimilarity similarity = new LogLikelihoodSimilarity(model);
            GenericItemBasedRecommender recommender = new GenericItemBasedRecommender(model, similarity);

//            ItemSimilarity similarity = new PearsonCorrelationSimilarity(model);
//
//            GenericItemBasedRecommender recommender = new GenericItemBasedRecommender(model, similarity);

            return recommender;
        } catch (IOException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    public static Map<Long,Movies> getAllRecords() throws IOException
    {
        Map<Long, Movies> records = new HashMap<>();
        BufferedReader br = new BufferedReader(new FileReader("C:\\Users\\My DeLL\\Downloads\\Documents\\NetBeansProjects\\MahoutRecommEngine\\data\\movies.csv"));
        String line;
        line = br.readLine();
        while ((line = br.readLine()) != null) {

            String[] content = line.split(",");

            Movies movie = new Movies();
            movie.setId(Long.parseLong(content[0]));
            movie.setName(content[1]);
            movie.setGenre(content[2]);

            records.put(Long.parseLong(content[0]), movie);
        }
        br.close();
        return records;
    }
    
    public static Map<Long,MovieInfo> getMovieInfo() throws FileNotFoundException, IOException
    {
        Map<Long,MovieInfo> record = new HashMap<>();
        BufferedReader br = new BufferedReader(new FileReader("C:\\Users\\My DeLL\\Downloads\\Documents\\NetBeansProjects\\MahoutRecommEngine\\data\\MoviesInfo.tsv"));
        
        String line;
        
        while((line = br.readLine()) != null)
        {
            String[] parts = line.split("\t");
            
            Long id = Long.parseLong(parts[0]);
            String imdbid = parts[1];
            String name = parts[2];
            String info = parts[3];
            float rating = Float.parseFloat(parts[4]);
            int runtime = Integer.parseInt(parts[5]);
            
            MovieInfo m = new MovieInfo();
            
            m.setId(id);
            m.setImdbid(imdbid);
            m.setName(name);
            m.setInfo(info);
            m.setRating(rating);
            m.setRuntime(runtime);
            
            record.put(id, m);
        }
        
        return record;
    }
    
    public static Map<String,Long> getMapping() throws IOException
    {
        Map<String,Long> movieToId = new HashMap<>();
        
        BufferedReader br = new BufferedReader(new FileReader("C:\\Users\\My DeLL\\Downloads\\Documents\\NetBeansProjects\\MahoutRecommEngine\\data\\MoviesInfo.tsv"));

        String line;

        while ((line = br.readLine()) != null) {
            String[] parts = line.split("\t");

            Long id = Long.parseLong(parts[0]);
            String name = parts[2];

            movieToId.put(name, id);
            
        }
        
        return movieToId;
    }
    
}
