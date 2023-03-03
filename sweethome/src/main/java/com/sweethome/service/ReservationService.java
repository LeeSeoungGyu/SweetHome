package com.sweethome.service;

import java.util.List;

import com.sweethome.domain.ReservationDTO;

public interface ReservationService {

	   boolean getTimeList(String date, String time);

	   boolean reservation(String name, String date, String time, String content);

	   List<ReservationDTO> counselList(String date);
}