package kr.dongwook.gym.member.dao;

import java.util.List;


import kr.dongwook.gym.member.vo.MembershipVO;

public interface MembershipDAO {
	
	// 1. 전체 갯수
	public int selectCount();
	// 2. 1개얻기
	public MembershipVO selectByIdx(int idx);
	// 3. 모두얻기
	public List<MembershipVO> selectAll();
	// 4. 저장하기
	public void insert(MembershipVO vo);
	// 5. 수정하기
	public void update(MembershipVO vo);
	// 6. 삭제하기
	public void delete(int idx);
	public int selectLastIdx();
}
