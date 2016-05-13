package com.example.web;

import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
