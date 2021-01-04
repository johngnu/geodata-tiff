/*
 * ICG SRL - International Consulting Group 2011
 */
package com.geodata.core.listener;

import java.util.Timer;
import java.util.TimerTask;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.methods.GetMethod;

/**
 * TaskExecutorListener, container interval executable
 *
 * @author Johnston Castillo Valencia email: john.gnu@gmail.com
 * @since 01-03-2011
 */
//@WebListener
public class TaskExecutorListener extends TimerTask implements ServletContextListener {

    private Timer timer;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        timer = new Timer();
        timer.schedule(this, 0, 10 * 1000); // 10 segundos
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        timer.cancel();
    }

    public void run() {
        try {
            System.out.println("call endpoint");
            //execute listener
            String url = "http://localhost:8084/vibh/endpoint/process";
            HttpClient client = new HttpClient();
            HttpMethod method = new GetMethod(url);
            client.executeMethod(method);
            byte[] responseBody = method.getResponseBody();
            method.releaseConnection();
            System.out.println(new String(responseBody));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
