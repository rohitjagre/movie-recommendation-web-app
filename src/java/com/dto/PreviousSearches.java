/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dto;

import javax.persistence.Entity;
import javax.persistence.Id;

/**
 *
 * @author My DeLL
 */
@Entity
public class PreviousSearches {
    @Id
    private String username;
    private String searches;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSearches() {
        return searches;
    }

    public void setSearches(String searches) {
        this.searches = searches;
    }
}
