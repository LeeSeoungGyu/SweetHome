package com.sweethome.mapper;

import java.util.List;

import com.sweethome.domain.BoardDTO;
import com.sweethome.domain.Criteria;

public interface BoardMapper {
   List<BoardDTO> getList(Criteria cri);

   int getTotal(Criteria cri);

   void insert(BoardDTO board);

   Long getMaxBoardnum(String userid);

   BoardDTO getDetail(Long boardnum);

   void remove(Long boardnum);

   int modify(BoardDTO board);
}