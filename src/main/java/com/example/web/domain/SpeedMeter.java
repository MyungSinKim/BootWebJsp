package com.example.web.domain;

import java.io.Serializable;

public class SpeedMeter implements Serializable {

	private static final long serialVersionUID = 1L;

	private String currentSpeed;

    public SpeedMeter() {
        super();
    }

    public SpeedMeter(String currentSpeed) {
        this.currentSpeed = currentSpeed;
    }

    public String getCurrentSpeed() {
        return currentSpeed;
    }

    public void setCurrentSpeed(String currentSpeed) {
        this.currentSpeed = currentSpeed;
    }
}
