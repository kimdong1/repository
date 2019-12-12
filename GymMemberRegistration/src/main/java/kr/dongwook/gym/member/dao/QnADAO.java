package kr.dongwook.gym.member.dao;

import java.util.HashMap;
import java.util.List;

import kr.dongwook.gym.member.vo.QnAVO;

public interface QnADAO {
	public int selectCount();
	public void insertQnA(QnAVO qnaVO);
	public List<QnAVO> selectList(HashMap<String, Integer> map);
	public QnAVO selectByIdx(int idx);
	public void delete(int idx);
}