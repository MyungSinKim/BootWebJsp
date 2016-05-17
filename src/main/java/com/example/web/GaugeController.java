package com.example.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

@Controller
public class GaugeController {
    
    @RequestMapping(value="/chartGauge.do", method=RequestMethod.GET)
    public String chartLine() {
        return "chartGauge.jsp";
    }

    @RequestMapping(value="/chartData.do", method=RequestMethod.GET)
    @ResponseBody
    public String chartData() throws InterruptedException {
//        Thread.sleep(4000); // simulated delay
        return "" + getRandomNumberInRange(1,200);
    }
    
    private static int getRandomNumberInRange(int min, int max) {
        if (min >= max) {
            throw new IllegalArgumentException("max must be greater than min");
        }
        Random r = new Random();
        return r.nextInt((max - min) + 1) + min;
    }
    
    @RequestMapping(value="/chartGaugeSSE.do", method=RequestMethod.GET)
    public String chartLineSSE() {
        return "chartGaugeSSE.jsp";
    }

    private List<SseEmitter> sseEmitters = Collections.synchronizedList(new ArrayList<>());

    @RequestMapping(value="/chartDataSSEOpen.do", method=RequestMethod.GET)
    @ResponseBody
    public SseEmitter chartDataSSE() {
        
        SseEmitter sseEmitter = new SseEmitter(4000L); 
        synchronized (this.sseEmitters) { 
            this.sseEmitters.add(sseEmitter); 
            sseEmitter.onCompletion(() -> { 
                synchronized (this.sseEmitters) { 
                    this.sseEmitters.remove(sseEmitter); 
                } 
            }); 
        } 
        return sseEmitter;
    }
    
    @RequestMapping(value="/chartDataSSEPublish.do", method=RequestMethod.GET)
    @ResponseBody
    public String chartDataSSEPublish() throws IOException {
        String randomNum = "" + getRandomNumberInRange(1,200);
        synchronized (this.sseEmitters) { 
            for (SseEmitter sseEmitter : this.sseEmitters) { 
                // Servlet containers don't always detect ghost connection, so we must catch exceptions ... 
                try { 
                    sseEmitter.send(randomNum, MediaType.APPLICATION_JSON); 
                } catch (Exception e) {} 
            } 
        } 
        return randomNum;
    }
}
