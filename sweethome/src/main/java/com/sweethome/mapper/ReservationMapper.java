package com.sweethome.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sweethome.domain.ReservationDTO;


@Mapper
public interface ReservationMapper {
	   int getTimeList(@Param("date")String date, @Param("time")String time);
	   int reservation(@Param("name")String name, @Param("date")String date, @Param("time")String time, @Param("content")String content);
	   List<ReservationDTO> counselList(@Param("date") String date);
}