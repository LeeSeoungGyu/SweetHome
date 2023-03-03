package com.sweethome.mapper;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sweethome.domain.Criteria;
import com.sweethome.domain.DonateDTO;
import com.sweethome.domain.KakaoDTO;
import com.sweethome.domain.OrderDTO;
import com.sweethome.domain.ProductDTO;
import com.sweethome.domain.UserDTO;

@Mapper
public interface UserMapper {

   //MyBatis는 두개 이상의 파라미터를 넘길 때 객체나 Map, List, 혹은 @Param을 이용한다.
   //정해진 파라미터는 MyBatis에서 #{param명}으로 사용 가능하다.
   List<ProductDTO> goshopping(HttpServletRequest req);
   void insertshoppinglist(@Param("userid")String userid, @Param("productnum")String productnum);
   List<ProductDTO> showshoppinglist(String userid);
   void deleteshoppinglist(String userid);
   List<String> getshoppinglist(String userid);
   void insertorderlist(@Param("productnum")String productnum, @Param("userid")String userid);
   ProductDTO getorderlist(@Param("productnum")String productnum);
   List<String> getordernum(String userid);
   String getorderlistsimple(String userid);
   List<OrderDTO> getorderdate(String userid);
   void modifyorder(String userid);
   void deleteorderlist(String userid);
   List<DonateDTO> getList(Criteria cri);
   int getTotal(Criteria cri);
   int donateaction(@Param("name")String name, @Param("money")String money, @Param("content")String content);
   int join(UserDTO user);
   //MyBatis는 두개 이상의 파라미터를 넘길 때 객체나 Map, List, 혹은 @Param을 이용한다.
   //정해진 파라미터는 MyBatis에서 #{param명}으로 사용 가능하다.
   UserDTO login(@Param("userid")String userid, @Param("userpw")String userpw);
   String checkid(@Param("username")String username, @Param("userphone")String userphone);
   int checkpw(@Param("userid")String userid, @Param("userphone")String userphone);
   boolean updatepw(@Param("userid")String userid, @Param("userpw")String userpw);
   int getUserAge(String userbirth);
   boolean updatephone(@Param("userid")String userid, @Param("userphone")String userphone);
   int userIdExist(String userid);
   int checkphone(String userphone);
   boolean changepw(@Param("correntpw")String correntpw, @Param("userpw")String userpw, @Param("userid")String userid);
   boolean kJoin(KakaoDTO kuser);
   boolean addPhoto(@Param("userid")String userid, @Param("userphoto")String userphoto);
   String newProfile(String userid);
}