package com.sweethome.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sweethome.domain.ReservationDTO;
import com.sweethome.service.ReservationService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/reserv/*")
public class ReservationController {
   @Setter(onMethod_ = @Autowired ) 
   private ReservationService service;
   
   @PostMapping("/checktime")
   public void checktime(@RequestParam("date") String date, @RequestParam("time") String time, Model model, HttpServletResponse resp) throws IOException {
      PrintWriter out = resp.getWriter();
      System.out.println(date);
      boolean resv = service.getTimeList(date, time);
      out.print(resv);
//      model.addAttribute("Reservationlist",service.getTimeList(date));
   }
   
   @PostMapping("/reservation")
   public String reservation(String name, String date, String time, String content, HttpServletRequest req) {
      if(service.reservation(name, date, time, content)) {
         req.setAttribute("successMessage", "상담신청이 완료되었습니다!");
          return "successPage";
      }
      else {
         req.setAttribute("errorMessage", "상담신청에 실패하였습니다. 다시 시도해주세요.");
          return "errorPage";
         }
     }
   @GetMapping("/counsel")
   public String counsel(@RequestParam("date") String date,Model model) {
      System.out.println(service.counselList(date));
      model.addAttribute("list",service.counselList(date));
      model.addAttribute("selectdate",date);
      return "/manager/counsel";
   }
}