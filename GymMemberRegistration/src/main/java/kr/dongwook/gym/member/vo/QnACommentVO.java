package kr.dongwook.gym.member.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class QnACommentVO implements Serializable {
	private static final long serialVersionUID = 5173150595334287499L;
	private int idx;
	private int ref;
	private String id;
	private String content;
	private int lev;
	private Date regdate;
}
