package kr.dongwook.gym.member.service;

import org.apache.log4j.Logger;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.dongwook.gym.member.dao.QnACommentDAO;
import kr.dongwook.gym.member.vo.QnACommentVO;

@Service
public class QnACommentService {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(QnACommentService.class);
	
	@Autowired
	QnACommentDAO qnaCommentDAO;
	
	public void insertComment(QnACommentVO commentVO) {
		qnaCommentDAO.insertComment(commentVO);
	}
	
	public List<QnACommentVO> selectByRef(int ref) {
		return qnaCommentDAO.selectByRef(ref);
	}
	
	public void delete(QnACommentVO commentVO) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("ref", commentVO.getRef());
		map.put("idx", commentVO.getIdx());

		if (logger.isInfoEnabled()) {
			logger.info("Service delete(QnACommentVO) - ref:"+commentVO.getRef()); //$NON-NLS-1$
			logger.info("Service delete(QnACommentVO) - idx:"+commentVO.getIdx()); //$NON-NLS-1$
		}

		qnaCommentDAO.delete(map);
	}

	public void update(QnACommentVO commentVO) {
		qnaCommentDAO.update(commentVO);
	}
	
	public List<QnACommentVO> selectCommentAll() {
		return qnaCommentDAO.selectCommentAll();
	}
}
