package kr.dongwook.gym.member.dao;


import java.util.List;

import kr.dongwook.gym.member.vo.MembershipFileVO;

public interface MembershipFileDAO {
//	저장
	public void insert(MembershipFileVO vo);
//	ref같은 모든파일 삭제
	public void deleteByRef(int idx);
//	갯수
	public int selectCountByRef(int ref);
//	<!-- ref가 같은 모든파일 1개얻기 -->
	public MembershipFileVO selectByRef(int ref);
	
	public List<MembershipFileVO> selectFileAll();
	
	public void update(MembershipFileVO vo);
}
