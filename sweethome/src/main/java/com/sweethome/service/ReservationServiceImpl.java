package com.sweethome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sweethome.domain.ReservationDTO;
import com.sweethome.mapper.ReservationMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReservationServiceImpl implements ReservationService {

   @Setter(onMethod_ = @Autowired)
   private ReservationMapper mapper;

   @Override
   public boolean getTimeList(String date, String time) {
      System.out.println("옴?");
      return mapper.getTimeList(date,time) == 1;
   }

   @Override
   public boolean reservation(String name, String date, String time, String content) {

      return mapper.reservation(name, date, time, content) == 1;
   }
   
   @Override
   public List<ReservationDTO> counselList(String date) {
      return mapper.counselList(date);
   }

}