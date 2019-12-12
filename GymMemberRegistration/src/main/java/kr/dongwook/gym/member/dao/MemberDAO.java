package kr.dongwook.gym.member.dao;

import java.util.HashMap;

import kr.dongwook.gym.member.vo.MemberVO;

public interface MemberDAO {
	public void insert(MemberVO memberVO); // 회원등록
	public MemberVO selectByEmail(HashMap<String, String> map);
	public MemberVO selectByPhone(HashMap<String, String> map);
	public MemberVO selectByPassword(HashMap<String, String> map);
	public void updatePassword(HashMap<String, String> map);
	
}
