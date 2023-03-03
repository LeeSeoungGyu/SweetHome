package com.sweethome.service;

import com.sweethome.domain.Criteria;
import com.sweethome.domain.ReplyDTO;
import com.sweethome.domain.ReplyPageDTO;

public interface ReplyService {
   boolean regist(ReplyDTO reply);
   boolean remove(Long replynum);
   boolean modify(ReplyDTO reply);
   ReplyPageDTO getList(Criteria cri, Long boardnum);
   Long getMaxReplyNum(String userid);
}