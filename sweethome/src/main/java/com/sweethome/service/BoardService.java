package com.sweethome.service;

import java.util.List;

import com.sweethome.domain.BoardDTO;
import com.sweethome.domain.Criteria;

public interface BoardService {
   List<BoardDTO> getList(Criteria cri);

   int getTotal(Criteria cri);

   void regist(BoardDTO board);

   Long getMaxBoardnum(String userid);

   BoardDTO getDetail(Long boardnum);

   void remove(Long boardnum);

   boolean modify(BoardDTO board);
}