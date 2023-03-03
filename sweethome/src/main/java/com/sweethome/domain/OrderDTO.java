package com.sweethome.domain;

import lombok.Data;

@Data
public class OrderDTO {
	private String ordernum_s;
	private String ordernum_i;
	private String ordernum;
	private String orderdate;
	private String userid;
	private String p_condition;
	private String productname;
	private String productphoto;
}
