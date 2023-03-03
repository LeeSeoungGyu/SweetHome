package com.sweethome.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sweethome.domain.BoardDTO;
import com.sweethome.domain.Criteria;
import com.sweethome.domain.PageDTO;
import com.sweethome.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
   
   @Autowired
   private BoardService service;
   
   @GetMapping("/list")
   public void list(Criteria cri, Model model) {
      model.addAttribute("list",service.getList(cri));
      model.addAttribute("pageMaker",new PageDTO(service.getTotal(cri), cri));
      
   }
   
   @GetMapping("/regist")
   public void regist(Criteria cri,Model model) {
      model.addAttribute("cri",cri);
   }
   @PostMapping("/regist")
   public String regist(BoardDTO board, RedirectAttributes ra) {
      service.regist(board);
      Long boardnum = service.getMaxBoardnum(board.getUserid());
      ra.addFlashAttribute("s","s");
      ra.addFlashAttribute("boardnum",boardnum);
      return "redirect:/board/list";
   }
   @GetMapping({"/get","/modify"})
   public void get(Long boardnum, @ModelAttribute("cri") Criteria cri, Model model) {
      model.addAttribute("board",service.getDetail(boardnum));
   }
   @PostMapping("/modify")
   public String modify(BoardDTO board, Criteria cri, RedirectAttributes ra) {
      if(service.modify(board)) {
         ra.addFlashAttribute("s",board.getBoardnum());
      }
      else {
         ra.addFlashAttribute("f","f");
      }
      return "redirect:/board/get"+cri.getListLink()+"&boardnum="+board.getBoardnum();
   }
   @PostMapping("/remove")
   public String remove(Long boardnum, Criteria cri, RedirectAttributes ra) {
      service.remove(boardnum);
      ra.addFlashAttribute("f","f");
      return "redirect:/board/list"+cri.getListLink();
   }
}






