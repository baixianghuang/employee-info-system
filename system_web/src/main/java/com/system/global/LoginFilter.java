package com.system.global;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        // Note the difference between getServletPath() and getContextPath()
        String path = request.getServletPath();  // part of this request's URL that calls the servlet.
//        System.out.println("getServletPath: "+path);
//        System.out.println("getContextPath: "+request.getContextPath());
        // filter page whose path doesn't contain "login"
        if (path.toLowerCase().contains("login")) {
            filterChain.doFilter(request, response);
        } else {
            if (request.getSession().getAttribute("USER") != null) {
                filterChain.doFilter(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/toLogin.do");
            }
        }
    }

    public void destroy() {

    }
}
