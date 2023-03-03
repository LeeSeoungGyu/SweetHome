package com.sweethome.domain;

import lombok.Data;

@Data
public class BoardDTO {
   private Long boardnum;
   private String boardtitle;
   private String boardcontents;
   private String regdate;
   private String updatedate;
   private String readcount;
   private String userid;
}