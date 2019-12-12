package kr.dongwook.gym.member.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.dongwook.gym.member.dao.MembershipDAO;
import kr.dongwook.gym.member.dao.MembershipFileDAO;
import kr.dongwook.gym.member.vo.MembershipFileVO;
import kr.dongwook.gym.member.vo.MembershipVO;

@Service
public class MembershipService {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(MembershipService.class);

	@Autowired
	private MembershipFileDAO membershipFileDAO;
	@Autowired
	private MembershipDAO membershipDAO;

	// 2. 저장
	public void insert(MembershipVO vo, MembershipFileVO membershipFileVO) {
		if (vo != null) {
			// 글저장
			membershipDAO.insert(vo);
			// 파일저장
			if (membershipFileVO != null && membershipFileVO.getOfile()!=null) {
				int ref = membershipDAO.selectLastIdx();
				membershipFileVO.setRef(ref);
				membershipFileDAO.insert(membershipFileVO);
			}
		}
	}

	public List<MembershipVO> selectAll() {
		List<MembershipVO> list = membershipDAO.selectAll();
		return list;
	}
	
	public MembershipVO selectByIdx(int idx) {
		return membershipDAO.selectByIdx(idx);
	}

	public MembershipFileVO selectByRef(int ref) {
		return membershipFileDAO.selectByRef(ref);
	}
	
	public List<MembershipFileVO> selectFileAll() {
		List<MembershipFileVO> list = membershipFileDAO.selectFileAll();
		return list;
	}
	
	
	public void delete(int idx) {
		membershipDAO.delete(idx);
		membershipFileDAO.deleteByRef(idx);
	}
	
	
	
	public void update(MembershipVO vo,MembershipFileVO fileVO) {
		if(vo!=null&&fileVO!=null) {
			System.out.println(vo);
			membershipDAO.update(vo);
			System.out.println(fileVO);
			membershipFileDAO.update(fileVO);
		}
	}
	
	
	

}
