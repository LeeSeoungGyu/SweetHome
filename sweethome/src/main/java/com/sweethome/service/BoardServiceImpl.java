package com.sweethome.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sweethome.domain.BoardDTO;
import com.sweethome.domain.Criteria;
import com.sweethome.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardServiceImpl implements BoardService{
   
   @Autowired
   private BoardMapper mapper;
   
   @Override
   public List<BoardDTO> getList(Criteria cri) {
      List<BoardDTO> list = mapper.getList(cri);
      log.info(list);
      return list;
   }

   @Override
   public int getTotal(Criteria cri) {
      return mapper.getTotal(cri);
   }

   @Override
   public void regist(BoardDTO board) {
      mapper.insert(board);
   }
   
   @Override
   public Long getMaxBoardnum(String userid) {
      return mapper.getMaxBoardnum(userid);
   }
   
   @Override
   public BoardDTO getDetail(Long boardnum) {
      return mapper.getDetail(boardnum);
   }
   
   @Override
   public void remove(Long boardnum) {
      mapper.remove(boardnum);
   }
   
   @Override
   public boolean modify(BoardDTO board) {
      return mapper.modify(board) == 1;
   }
}




