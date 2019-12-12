package kr.dongwook.gym.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.support.RequestContextUtils;

import kr.dongwook.gym.member.service.QnACommentService;
import kr.dongwook.gym.member.service.QnAService;
import kr.dongwook.gym.member.vo.MemberVO;
import kr.dongwook.gym.member.vo.PagingVO;
import kr.dongwook.gym.member.vo.QnACommentVO;
import kr.dongwook.gym.member.vo.QnAVO;

@Controller
public class QnAController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(QnAController.class);
	
	@Autowired
	private QnAService qnaService;
	
	@Autowired
	private QnACommentService qnaCommentService;
	
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="/QnA/count")
	public String selectCount(Model model) {
		int count = qnaService.selectCount();
		model.addAttribute("count",count);
		return "qnaBoard/count";
	}

	@RequestMapping(value="/QnA/list")
	public String selectList(@RequestParam(defaultValue = "1", value = "p", required = false) int currentPage, 
							 @RequestParam(defaultValue = "10", value = "s", required = false) int pageSize, 
							 @RequestParam(defaultValue = "10", value = "b", required = false) int blockSize,
							 Model model) {
		
		PagingVO<QnAVO> paging = qnaService.selectList(currentPage,pageSize,blockSize);
		model.addAttribute("paging",paging);
		return "qnaBoard/list";
	}
	
	@RequestMapping(value="/QnA/write")
	public String insertQnA(HttpServletRequest request ,@ModelAttribute QnAVO qnaVO, Model model) {
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("vo");
		if(memberVO!=null) {
			qnaVO.setId(memberVO.getEmail());
			return "qnaBoard/write";
		}else {
			return "login";
		}
	}
	@Transactional
	@RequestMapping(value="/QnA/writeOk")
	public String writeOkPOST(HttpServletRequest request,@ModelAttribute QnAVO qnaVO) {
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("vo");
		qnaVO.setId(memberVO.getEmail());
		qnaVO.setLev(memberVO.getLev());
		qnaService.insertQnA(qnaVO);
		return "redirect:/QnA/list";
	}
	// Post 방식 파일 업로드
	@Transactional
	@RequestMapping(value = "/QnA/profileImage", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String multiUploadFormPOST(MultipartHttpServletRequest request) throws Exception {
		// 서버의 실제 경로
		@SuppressWarnings("deprecation")
		String realPath = request.getRealPath(uploadPath);
		if (logger.isInfoEnabled()) {
			logger.info("multiUploadFormPOST(MultipartHttpServletRequest) - String realPath=" + realPath); //$NON-NLS-1$
		}

		// 파일받기
		List<MultipartFile> files = request.getFiles("file");
		if (files == null || files.size() == 0) {
			return "redirect:/QnA/write";
		}
		String savedName = "";
		for (MultipartFile file : files) {
			if (file != null && file.getSize() > 0) {
				savedName = uploadFile(request, realPath, file.getOriginalFilename(), file.getBytes());
			}
		}
		return savedName;
	}

	// 업로드된 파일을 저장하는 함수
	private String uploadFile(MultipartHttpServletRequest request, String realPath, String originalName, byte[] fileData) throws IOException {
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(realPath, savedName);
		// org.springframework.util 패키지의 FileCopyUtils는 파일 데이터를 파일로 처리하거나, 복사하는 등의 기능
		FileCopyUtils.copy(fileData, target);
		String contextPath = request.getContextPath();
		return contextPath + "/upload/" + savedName;
	}
	
	@RequestMapping(value="/QnA/view")
	public String view(@RequestParam(required=false,defaultValue="0") int idx, Model model,HttpServletRequest request) {
		
		//받는 부분
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if(flashMap !=null) {  
			@SuppressWarnings("unchecked")
			HashMap<String, Integer> map = (HashMap<String, Integer>) flashMap.get("idx");
			idx = Integer.parseInt(map.get("idx").toString());
		}
		
		QnAVO vo = qnaService.selectByIdx(idx);
		List<QnACommentVO> commentVO = qnaCommentService.selectByRef(idx);
		
//		QnAVO comment = qnaCommentService.sele
		model.addAttribute("vo", vo);
		
		model.addAttribute("list", commentVO);
		
		return "qnaBoard/view";
	}
	@Transactional
	@RequestMapping(value="/QnA/delete")
	public String delete(int idx,HttpServletRequest request) {
		QnAVO vo = qnaService.selectByIdx(idx);
		// 서버에 존재하던 파일 삭제
		@SuppressWarnings("deprecation")
		String realPath = request.getRealPath(uploadPath);
		if(vo.getContent().contains("<img src=")) {
			
			String path = realPath+"\\"+vo.getContent().split("<img src=\"/gym/upload/")[1].split("\"")[0];
		
			if (logger.isInfoEnabled()) {
				logger.info("삭제할 파일" + path); //$NON-NLS-1$
			}
			
			File file1 = new File(path);
				if(file1.exists() == true){
				file1.delete();
			}
		}
		if (logger.isInfoEnabled()) {
			logger.info("delete(int, Model) - idx:"+idx); //$NON-NLS-1$
		}
		qnaService.delete(idx);
		return "redirect:/QnA/list";
	}
	@Transactional
	@RequestMapping(value="/QnA/commentWriteOk", method=RequestMethod.POST)
	public String commentWriteOk(@RequestParam int idx, @ModelAttribute QnACommentVO qnaCommentVO,HttpServletRequest request) {
		qnaCommentVO.setIdx(0);
		qnaCommentVO.setRef(idx);

		qnaCommentService.insertComment(qnaCommentVO);
		System.out.println(qnaCommentVO);
		if (logger.isInfoEnabled()) {
			logger.info("commentWriteOk(int,qnaCommentVO) - idx:"+idx); //$NON-NLS-1$
			logger.info("commentWriteOk(int,qnaCommentVO) - qnaCommentVO:"+qnaCommentVO); //$NON-NLS-1$
		}
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("idx", idx);
		FlashMap fm = RequestContextUtils.getOutputFlashMap(request);
		fm.put("idx", map);
		return "redirect:/QnA/view";
	}
	@Transactional
	@RequestMapping(value="/QnA/comment/deleteOk",method=RequestMethod.POST)
	public String deleteComment(@ModelAttribute QnACommentVO vo, HttpServletRequest request) {
		if (logger.isInfoEnabled()) {
			logger.info("ref:"+vo.getRef()); //$NON-NLS-1$
			logger.info("idx:"+vo.getIdx()); //$NON-NLS-1$
		}
		qnaCommentService.delete(vo);
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("idx", vo.getRef());
		//보내는 부분
		FlashMap fm = RequestContextUtils.getOutputFlashMap(request);
		fm.put("idx", map);
		return "redirect:/QnA/view";
	}
	@Transactional
	@RequestMapping(value="/QnA/comment/updateOk",method=RequestMethod.POST)
	public String updateCommentOk(@ModelAttribute QnACommentVO vo, HttpServletRequest request) {
		int idx=vo.getRef();
		vo.setRef(vo.getIdx());
		vo.setIdx(idx);
		qnaCommentService.update(vo);
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("idx", vo.getRef());
		FlashMap fm = RequestContextUtils.getOutputFlashMap(request);
		fm.put("idx", map);
		System.out.println(vo);
		System.out.println(map);
		return "redirect:/QnA/view";
	}
	
	
	
	
}
