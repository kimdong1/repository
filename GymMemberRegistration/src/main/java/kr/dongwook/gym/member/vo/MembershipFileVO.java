package kr.dongwook.gym.member.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MembershipFileVO {
	private int idx;
	private int ref;
	private String ofile;
	private String sfile;
}
