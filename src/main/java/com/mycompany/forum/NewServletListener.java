/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.forum;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * Web application lifecycle listener.
 *
 * @author Main-PC
 */
@WebListener
public class NewServletListener implements HttpSessionAttributeListener {
    private static final AtomicInteger activeSessions = new AtomicInteger();

    @Override
    public void attributeAdded(HttpSessionBindingEvent event){
        String attrName = event.getName();
        Object attibuteValue = event.getValue();
        if(attrName.equals("user"))
            activeSessions.incrementAndGet();
    }
    @Override
    public void attributeRemoved(HttpSessionBindingEvent event){
        String attrName = event.getName();
        Object attibuteValue = event.getValue();
        if(attrName.equals("user"))
            activeSessions.decrementAndGet();
    }
    public static int getActiveSessions(){
        return activeSessions.get();
    }
}
