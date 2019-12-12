package kr.dongwook.gym.member.service;

import java.util.HashMap;
import java.util.Random;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import kr.dongwook.gym.member.dao.MemberDAO;
import kr.dongwook.gym.member.vo.MemberVO;

@Service
public class MemberService {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(MemberService.class);

	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	// 회원등록
	public void insert(MemberVO memberVO) {
		if (logger.isInfoEnabled()) {
			logger.info("MemberService - insert(MemberVO) - MemberVO memberVO=" + memberVO); //$NON-NLS-1$
		}
		
		if(memberVO==null || memberVO.getEmail()==null) return;
		memberDAO.insert(memberVO); 
		sendEmail(memberVO); // 이메일 보내기
	}
	
	// 로그인 - 아이디 비밀번호 확인 
	public MemberVO loginOk(MemberVO memberVO) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", memberVO.getEmail());
		
		MemberVO dbVO = memberDAO.selectByEmail(map);

		if(dbVO!=null) {
			if(!dbVO.getPassword().equals(memberVO.getPassword())) {
				if (logger.isInfoEnabled()) {
					logger.info("loginOk(MemberVO) - password : dbVO password : " + dbVO.getPassword()+", memberVO password : " + memberVO.getPassword()); //$NON-NLS-1$
				}

				dbVO = null;
			}
		}

		if (logger.isInfoEnabled()) {
			logger.info("loginOk(MemberVO) - dbVO return : " + dbVO); //$NON-NLS-1$
		}

		return dbVO;
	}

	public MemberVO idSearch(MemberVO memberVO) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("phone", memberVO.getPhone());
		map.put("username", memberVO.getUsername());
		
		MemberVO dbVO = memberDAO.selectByPhone(map);
		
		if(dbVO!=null) {
			if(!dbVO.getPhone().equals(memberVO.getPhone()) || !dbVO.getUsername().equals(memberVO.getUsername())) {
				dbVO = null;
			}
		}
		
		return dbVO;
	}

	
	public void sendEmail(MemberVO memberVO) {
        MimeMessagePreparator preparator = getMessagePreparator(memberVO);
        try {
            mailSender.send(preparator);
            
            System.out.println("**********메일 보내기 성공*************");
        } catch (MailException ex) {
            System.err.println(ex.getMessage());
        }
    }
 
    private MimeMessagePreparator getMessagePreparator(final MemberVO memberVO) {
        MimeMessagePreparator preparator = new MimeMessagePreparator() {
 
            public void prepare(MimeMessage mimeMessage) throws Exception {
                mimeMessage.setFrom("sungnam201908@gmail.com");
                mimeMessage.setRecipient(Message.RecipientType.TO,
                        new InternetAddress(memberVO.getEmail()));
                mimeMessage.setText("반갑습니다. " + memberVO.getUsername() + "님!!!\n"
                			+ "회원 가입을 축하드립니다.");
                mimeMessage.setSubject("회원 가입을 축하드립니다.");
            }
        };
        return preparator;
    }
    
	public MemberVO passwordSearch(MemberVO memberVO) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", memberVO.getEmail());
		map.put("phone", memberVO.getPhone());
		
		MemberVO dbVO = memberDAO.selectByPassword(map);
		System.out.println(dbVO);
		if(!(dbVO!=null && dbVO.getEmail().equals(memberVO.getEmail()) && dbVO.getPhone().equals(memberVO.getPhone()))) {
			dbVO = null;
		}else {
			// 임시 비밀번호를 만들어서 사용자에게 메일을 발송
    		//1. 임시 비번 생성
    		StringBuilder sb = new StringBuilder();
    		Random rnd = new Random();
    		for(int i = 0; i < 4; i++) {
    			sb.append((char)(rnd.nextInt(26)+'A')+""); // 대문자 생성
    			sb.append((char)(rnd.nextInt(26)+'a')+""); // 소문자 생성
    			sb.append((char)(rnd.nextInt(10)+'0')+""); // 숫자 생성
    		}
    		
    		final String password = sb.toString();
    		
    		//2. 임시비번으로 DB를 업데이트 해주고

        	HashMap<String, String> map2 = new HashMap<String, String>();
        	map2.put("email", memberVO.getEmail());
        	map2.put("password", password);
        	
    		memberDAO.updatePassword(map2);
    		
    		//3. 메일 발송
    		try {
	    		final MemberVO vo = dbVO;
	    		MimeMessagePreparator preparator = new MimeMessagePreparator() {
					
					@Override
					public void prepare(MimeMessage mimeMessage) throws Exception {
						mimeMessage.setFrom("sungnam201908@gmail.com");
		                mimeMessage.setRecipient(Message.RecipientType.TO,
		                        new InternetAddress(vo.getEmail()));
		                mimeMessage.setText("반갑습니다. " 
		                        			+ vo.getUsername() + "님!!!\n"
					                        + "임시비밀번호입니다.\n"
					                		+ password +"\n");
		                mimeMessage.setSubject("임시비밀번호입니다.");
					}
				};
                mailSender.send(preparator);
				
                if (logger.isInfoEnabled()) {
					logger.info("passwordSearch(MemberVO) - MimeMessagePreparator preparator=" + preparator); //$NON-NLS-1$
				}

                System.out.println("메일 보내기 성공 ***************************************************");
            } catch (MailException ex) {
                System.err.println(ex.getMessage());
                System.out.println("실패");
            }
		}
		return dbVO;
	}
	
	public String idCheck(String email) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		MemberVO vo = memberDAO.selectByEmail(map);
		
		return vo == null ? "0" : "1";
	}
	
	public void updatePassword(String email, String newPassword) {
		if(email!=null && newPassword != null) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("email", email);
			map.put("password", newPassword);
			
			memberDAO.updatePassword(map);
		}
	}	
	public void updatePhone(String email, String newPhone) {
		if(email!=null && newPhone != null) {
			if (logger.isInfoEnabled()) {
				logger.info("updatePhone(String, String)- newPhone=" + newPhone); //$NON-NLS-1$
			}

			HashMap<String, String> map = new HashMap<String, String>();
			map.put("email", email);
			map.put("phone", newPhone);
			
			memberDAO.updatePhone(map);
		}
	}	
	
	
	
}
