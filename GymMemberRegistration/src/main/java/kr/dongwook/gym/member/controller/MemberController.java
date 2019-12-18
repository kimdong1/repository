package kr.dongwook.gym.member.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.dongwook.gym.member.service.MemberService;
import kr.dongwook.gym.member.service.MembershipService;
import kr.dongwook.gym.member.service.QnACommentService;
import kr.dongwook.gym.member.service.QnAService;
import kr.dongwook.gym.member.vo.MemberVO;
import kr.dongwook.gym.member.vo.MembershipFileVO;
import kr.dongwook.gym.member.vo.MembershipVO;
import kr.dongwook.gym.member.vo.QnACommentVO;
import kr.dongwook.gym.member.vo.QnAVO;

@Controller
public class MemberController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(MemberController.class);
	
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MembershipService membershipService;
	
	@Autowired
	private QnAService qnAService;

	@Autowired
	private QnACommentService qnACommentService;
	
	@RequestMapping(value="/member/join")
	public String join() {
		return "member/join";
	}
	
	@RequestMapping(value="/member/joinOk", method=RequestMethod.GET)
	public String joinOkGET() {
		return "redirect:/";
	}
	@Transactional
	@RequestMapping(value="/member/joinOk", method=RequestMethod.POST)
	public String joinOkPOST(@ModelAttribute MemberVO memberVO) {
		if (logger.isInfoEnabled()) {
			logger.info("MemberController - joinOkPOST(MemberVO) - MemberVO memberVO=" + memberVO); //$NON-NLS-1$
		}
		memberService.insert(memberVO);
		return "redirect:login";
	}
	
	@RequestMapping(value="/member/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/member/loginOk", method=RequestMethod.GET)
	public String loginOkGET() {
		return "redirect:login";
	}
	@RequestMapping(value="/member/loginOk", method=RequestMethod.POST)
	public String loginOkPOST(@ModelAttribute MemberVO memberVO, HttpServletRequest request) {
		MemberVO vo = memberService.loginOk(memberVO);
		if(vo==null) {
			return "redirect:login";
		}
		request.getSession().setAttribute("vo", vo);
		return "redirect:main";
	}
	
	@RequestMapping(value= {"/member/main","/"})
	public String main(Model model) {
		List<MembershipVO> list = membershipService.selectAll();
		List<MembershipFileVO> membershipFiles = membershipService.selectFileAll();
		if(list.size()>=3) {
			for(int i = 0; i < 3; i++) {
				model.addAttribute("desc"+(i+1),list.get(i));
				model.addAttribute("sfile"+(i+1),membershipFiles.get(i));
			}
		}
		return "main";
	}
	
	@RequestMapping(value="/member/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("vo");
		return "redirect:main";
	}
	
	@RequestMapping(value="/member/idSearch")
	public String idSearch() {
		return "member/idSearch";
	}
	
	@RequestMapping(value="/member/idSearchOk",method=RequestMethod.GET)
	public String idSearchOkGET() {
		return "redirect:idSearch";
	}
	@RequestMapping(value="/member/idSearchOk",method=RequestMethod.POST)
	public String idSearchOkPOST(@ModelAttribute MemberVO memberVO, Model model) {
		MemberVO dbVO = memberService.idSearch(memberVO);
		if(dbVO==null) {
			return "redirect:idSearch";
		}else {
			model.addAttribute("dbVO",dbVO);
			return "member/idSearchOk";
		}
	}
	
	@RequestMapping(value="/member/passwordSearch")
	public String passwordSearch() {
		return "member/passwordSearch";
	}
	@RequestMapping(value="/member/passwordSearchOk",method=RequestMethod.GET)
	public String passwordSearchOkGET() {
		return "redirect:idSearch";
	}
	@Transactional
	@RequestMapping(value="/member/passwordSearchOk",method=RequestMethod.POST)
	public String passwordSearchOkPOST(@ModelAttribute MemberVO memberVO, Model model) {
		MemberVO dbVO = memberService.passwordSearch(memberVO);
		if(dbVO==null) {
			return "redirect:passwordSearch";
		}else {
			model.addAttribute("dbVO",dbVO);
			return "member/passwordSearchOk";
		}
	}
	
	@RequestMapping(value="/member/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam String email) {
		String result = memberService.idCheck(email);
		return result;
	}
	
	@RequestMapping(value="/member/myPage")
	public String myPage() {
		return "member/myPage";
	}

	@RequestMapping(value="/member/passwordChange")
	public String passwordChange() {
		return "member/passwordChange";
	}
	
	@Transactional
	@RequestMapping(value="/member/passwordChangeOk")
	public String passwordChangeOkPOST(HttpServletRequest request, String password1, String password2) {
		MemberVO vo = (MemberVO) request.getSession().getAttribute("vo");
		if(password1.equals(password2) && vo!=null) {
			memberService.updatePassword(vo.getEmail(), password1);
			request.getSession().removeAttribute("vo");
			return "main";
		}else {
			return "membership/error";
		}
	}
	
	public String passwordChangeOkGET() {
		return "membership/error";
	}
	

	@RequestMapping(value="/member/phoneChange")
	public String phoneChange() {
		return "member/phoneChange";
	}
	
	@RequestMapping(value="/member/phoneChangeOk",method=RequestMethod.GET)
	public String phoneChangeOkGET() {
		return "membership/error";
	}
	
	@RequestMapping(value="/member/phoneChangeOk",method=RequestMethod.POST)
	public String phoneChangeOkPOST(@ModelAttribute MemberVO vo,HttpServletRequest request,String phone) {
		memberService.updatePhone(vo.getEmail(), vo.getPhone());
		MemberVO beforeVO = (MemberVO) request.getSession().getAttribute("vo");
		vo = beforeVO;
		vo.setPhone(phone);
		request.getSession().setAttribute("vo", vo);
		return "redirect:/member/myPage";
	}
	
	@RequestMapping(value="/member/myBoard")
	public String myBoard(Model model,HttpServletRequest request) {
		MemberVO vo = (MemberVO) request.getSession().getAttribute("vo");
		if(vo.getLev() != 2) {
			List<QnAVO> list = qnAService.selectMyBoard(vo.getEmail());
			model.addAttribute("list",list);
		}else if(vo.getLev() == 2) {
			List<QnACommentVO> commentList = qnACommentService.selectCommentAll();
			model.addAttribute("commentList",commentList);
		}
		
		return "member/myBoard";
	}
	
	
	@RequestMapping(value="/membership/board")
	public String membershipBoard(Model model) {
		List<MembershipVO> list = membershipService.selectAll();
		model.addAttribute("list",list);
		model.addAttribute("size",list.size());
		return "membership/board";
	}
	
	@RequestMapping(value="/membership/write")
	public String membershipWrite() {
		return "membership/write";
	}
	
	
}
