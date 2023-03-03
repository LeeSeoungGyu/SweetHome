package com.sweethome.domain;

import lombok.Data;

@Data
public class DonateDTO {
   private int donatenum;
   private String name;
   private int money;
   private String content;
   private String date;
}