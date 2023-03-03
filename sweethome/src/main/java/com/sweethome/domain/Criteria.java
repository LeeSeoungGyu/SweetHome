package com.sweethome.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
   private int pagenum;
   private int amount;
   private String type;
   private String keyword;
   private int startrow;

   public Criteria() {
      this(1, 10);
   }

   public Criteria(int pagenum, int amount) {
      this.pagenum = pagenum;
      this.amount = amount;
      this.startrow = (this.pagenum - 1) * this.amount;
   }

   public void setPagenum(int pagenum) {
      this.pagenum = pagenum;
      this.startrow = (this.pagenum - 1) * this.amount;
   }

   public String[] getTypeArr() {
      return type == null ? new String[] {} : type.split("");
   }
   
   public String getListLink() {
	      UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")   // ? 앞에 붙는 uri 문자열
	                              .queryParam("pagenum", pagenum)      // 파라미터 추가
	                              .queryParam("amount", amount)
	                              .queryParam("keyword", keyword)
	                              .queryParam("type", type);
	      // ?pagenum=4&amount=10&keyword=apple&type=T
	      return builder.toUriString();                              //빌더가 가지고 있는 설정대로 문자열 만들기
	   }


}