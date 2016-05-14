package com.example.web;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.web.domain.SpeedMeter;


@Controller
public class GaugeController {

    @RequestMapping(value="/chartGauge.do", method=RequestMethod.GET)
    public String chartLine() {
        return "chartGauge.jsp";
    }
    
    @MessageMapping("/howfast")
    @SendTo("/topic/yourspeedis")
    public SpeedMeter showSpeed(SpeedMeter req) throws Exception {
//        Thread.sleep(3000); // simulated delay
        return new SpeedMeter(req.getCurrentSpeed());
    }
}
