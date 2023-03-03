package com.sweethome.domain;


import lombok.Data;

@Data
public class ReservationDTO {
   private int reservnum;
   private String userid;
   private String reservdate;
   private String reservtime;
   private String resvcontents;
}