package com.sweethome.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sweethome.domain.Criteria;
import com.sweethome.domain.ReplyDTO;

public interface ReplyMapper {
   int insert(ReplyDTO reply);

   Long getNum(String userid);

   int getTotal(Long boardnum);

   List<ReplyDTO> getList(@Param("cri")Criteria cri, @Param("boardnum")Long boardnum);

   int delete(Long replynum);

   int update(ReplyDTO reply);
}