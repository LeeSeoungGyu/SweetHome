package com.sweethome.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sweethome.domain.Criteria;
import com.sweethome.domain.DonateDTO;
import com.sweethome.domain.KakaoDTO;
import com.sweethome.domain.UserDTO;

public interface UserService {
	boolean login(String userid, String userpw, HttpServletRequest req);
	void goshopping(HttpServletRequest req);
	boolean gobasket(String userid, HttpServletRequest req);
	boolean doorder(String userid, HttpServletRequest req);
	boolean order(String userid, HttpServletRequest req);
	boolean getbakset(String userid, HttpServletRequest req);
	boolean modifyorder(String userid, HttpServletRequest req);
	List<DonateDTO> getList(Criteria cri);
	int getTotal(Criteria cri);
	boolean donateaction(String name, String money, String content);
	boolean join(UserDTO user);
	boolean checkid(String username, String userphone, HttpServletRequest req);
	boolean checkpw(String userid, String userphone, HttpServletRequest req);
	boolean updatepw(String userid, String userpw, HttpServletRequest req);
	void logout(HttpServletRequest req);
	boolean login(String userid, String userpw, HttpServletRequest req, RedirectAttributes ra);
	boolean updatephone(String userid, String userphone);
	boolean userIdExist(String userId, HttpServletResponse resp) throws IOException;
	int sendSMS(String userphone, HttpServletResponse resp) throws IOException;
	boolean checkphone(String userphone, HttpServletResponse resp) throws IOException;
	boolean changepw(String correntpw, String userpw, String userid);
	void kJoin(KakaoDTO kuser, HttpServletResponse resp, HttpServletRequest req)throws IOException;
	boolean adduserphoto(String userid, String userphoto, HttpServletRequest req, HttpServletResponse resp) throws IOException;
}
