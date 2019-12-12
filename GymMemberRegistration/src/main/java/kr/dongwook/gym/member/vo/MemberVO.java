package kr.dongwook.gym.member.vo;

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@XmlRootElement
@Data
public class MemberVO implements Serializable{
	private static final long serialVersionUID = 9071035985443468404L;
	private int    idx;		// 고유번호
	private String email;	// 이메일(아이디)
	private String phone;	// 핸드폰번호
	private String password;// 비밀번호
	private String username;// 사용자 이름
	private int    lev;		// 접근 권한부여(0 : 회원, 2 : 관리자)
	private String gender;	// 회원 성별
}
