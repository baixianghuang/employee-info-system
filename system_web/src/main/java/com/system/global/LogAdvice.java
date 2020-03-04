package com.system.global;

import com.system.entity.Log;
import com.system.entity.Staff;
import com.system.service.LogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Component
@Aspect
/**
 * oprTime and type is set in LogServiceImpl, the rest 4 attributes are set here
 */
public class LogAdvice {
    @Autowired
    private LogService logService;

    @After("execution(* com.system.controller.*.*(..)) && !execution(* com.system.controller.SelfController.*(..)) && !execution(* com.system.controller.*.to*(..))")
    // exclude methods in SelfController and all of methods (in controller package) contain "to" (e.g., toAdd)
    public void operationLog(JoinPoint joinPoint) {
        Log log = new Log();
        log.setModule(joinPoint.getTarget().getClass().getSimpleName());
        log.setOperation(joinPoint.getSignature().getName());
        HttpServletRequest request = (HttpServletRequest) joinPoint.getArgs()[0];
        Staff staff = (Staff) request.getSession().getAttribute("USER");
        log.setOperator(staff.getAccount());
        log.setResult("success");
        logService.addOperationLog(log);
    }

    @AfterThrowing(throwing = "e", pointcut = "execution(* com.system.controller.*.*(..)) && !execution(* com.system.controller.SelfController.*(..))")
    public void systemLog(JoinPoint joinPoint, Throwable e) {
        Log log = new Log();
        log.setModule(joinPoint.getTarget().getClass().getSimpleName());
        log.setOperation(joinPoint.getSignature().getName());
        HttpServletRequest request = (HttpServletRequest) joinPoint.getArgs()[0];
        Staff staff = (Staff) request.getSession().getAttribute("USER");
        log.setOperator(staff.getAccount());
        log.setResult(e.getClass().getSimpleName());
        logService.addSystemLog(log);
    }

    @After("execution(* com.system.controller.SelfController.login(..))")
    public void loginLog(JoinPoint joinPoint) {
        log(joinPoint);
    }

    @Before("execution(* com.system.controller.SelfController.logout(..))")
    public void logoutLog(JoinPoint joinPoint) {
        log(joinPoint);
    }

    private void log(JoinPoint joinPoint) {
        Log log = new Log();
        log.setModule(joinPoint.getTarget().getClass().getSimpleName());
        log.setOperation(joinPoint.getSignature().getName());
        HttpServletRequest request = (HttpServletRequest) joinPoint.getArgs()[0];
        Staff staff = (Staff) request.getSession().getAttribute("USER");
        if (staff == null) {
            log.setOperator(request.getParameter("account"));
            log.setResult("failed");
        } else {
            log.setOperator(staff.getAccount());
            log.setResult("success");
        }
        logService.addLoginLog(log);
    }
}
