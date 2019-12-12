package kr.dongwook.gym.member.vo;

import java.io.Serializable;
import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@XmlRootElement
@Data
public class MembershipVO implements Serializable {
	private static final long serialVersionUID = 1806920045091680939L;
	private int idx;
	private String products;
	private String content;
	private int price;
	private int lev;
	private Date regdate;
}
