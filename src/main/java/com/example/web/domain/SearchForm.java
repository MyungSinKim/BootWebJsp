package com.example.web.domain;

import java.io.Serializable;

public class SearchForm implements Serializable {

	private static final long serialVersionUID = 1L;

	private String schDateType = "real";

	public String getSchDateType() {
		return schDateType;
	}

	public void setSchDateType(String schDateType) {
		this.schDateType = schDateType;
	}
}
