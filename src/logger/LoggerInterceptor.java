/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 *
 * @author Admin
 */
public class LoggerInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request,
            HttpServletResponse respone, Object handler) throws Exception {
        if (request.getSession().getAttribute("user") == null) {
            respone.sendRedirect(request.getContextPath() + "/user/login.htm");
            
            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request,
            HttpServletResponse respone, Object handler, ModelAndView modelAndView) throws Exception {
        
    }
    
    @Override
    public void afterCompletion(HttpServletRequest request,
            HttpServletResponse respone, Object handler, Exception ex) throws Exception {
        
        }
    }


