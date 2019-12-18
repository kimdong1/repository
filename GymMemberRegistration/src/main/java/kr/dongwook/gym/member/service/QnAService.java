package kr.dongwook.gym.member.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.dongwook.gym.member.dao.QnADAO;
import kr.dongwook.gym.member.vo.PagingVO;
import kr.dongwook.gym.member.vo.QnAVO;

@Service
public class QnAService {
	@Autowired
	private QnADAO qnaDAO;
	
	public int selectCount() {
		return qnaDAO.selectCount();
	}
	
	public void insertQnA(QnAVO qnaVO) {
		if(qnaVO != null) {
			qnaDAO.insertQnA(qnaVO);
		}
	}
	
	public PagingVO<QnAVO> selectList(int currentPage, int pageSize, int blockSize) {
		int totalCount = qnaDAO.selectCount();
		PagingVO<QnAVO> paging = new PagingVO<QnAVO>(totalCount, currentPage, pageSize, blockSize);
		if(totalCount>0) {
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("startNo", paging.getStartNo());
			map.put("pageSize", paging.getPageSize());
			List<QnAVO> list = qnaDAO.selectList(map);
			paging.setList(list);
		}
		return paging;
	}
	
	public QnAVO selectByIdx(int idx) {
		QnAVO vo = qnaDAO.selectByIdx(idx);
		return vo;
	}
	
	public void delete(int idx) {
		qnaDAO.delete(idx);
	}
	
	public List<QnAVO> selectMyBoard(String id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		List<QnAVO> list = qnaDAO.selectMyBoard(map);
		return list;
	}
	
	
	
}
