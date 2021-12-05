package com.mycompany.forum;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserAgentFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException{
        Filter.super.init(filterConfig);
    }
    @Override
    public void doFilter(ServletRequest sr, ServletResponse srl, FilterChain fc) throws IOException, ServletException{
        HttpServletRequest request = (HttpServletRequest) sr;
        HttpServletResponse response = (HttpServletResponse) srl;
        String UsrAgent = request.getHeader("User-Agent");
        System.out.printf(UsrAgent);
        if(UsrAgent.equals("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36")){
            request.setAttribute("agent","chrome");
            fc.doFilter(request,response);
        }
        else{
            request.setAttribute("agent","inna");
            fc.doFilter(request,response);
        }
    }
}