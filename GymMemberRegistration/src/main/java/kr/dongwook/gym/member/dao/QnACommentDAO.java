package kr.dongwook.gym.member.dao;

import java.util.HashMap;
import java.util.List;

import kr.dongwook.gym.member.vo.QnACommentVO;

public interface QnACommentDAO {
	public void insertComment(QnACommentVO commentVO);
	public List<QnACommentVO> selectByRef(int ref);
	public void delete(HashMap<String, Integer> map);
	public void update(QnACommentVO commentVO);
}
