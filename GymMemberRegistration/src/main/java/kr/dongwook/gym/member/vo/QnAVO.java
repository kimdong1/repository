package kr.dongwook.gym.member.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class QnAVO implements Serializable {
	private static final long serialVersionUID = 3389198609134318270L;
	private int idx;
	private String id;
	private String title;
	private String content;
	private int lev;
	private Date regdate;
}
