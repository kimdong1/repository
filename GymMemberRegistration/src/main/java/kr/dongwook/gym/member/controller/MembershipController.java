package kr.dongwook.gym.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.dongwook.gym.member.service.MembershipService;
import kr.dongwook.gym.member.vo.MembershipFileVO;
import kr.dongwook.gym.member.vo.MembershipVO;

@Controller
public class MembershipController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(MembershipController.class);
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Autowired
	private MembershipService membershipService;
	
	@RequestMapping(value="/membership/error")
	public String errorPage() {
		return "membership/error";
	}

	@RequestMapping(value="/membership/writeOk", method=RequestMethod.GET)
	public String writeOkGET(@ModelAttribute MembershipVO vo) {
		return "membership/error";
	}

	@Transactional
	@RequestMapping(value="/membership/writeOk", method = RequestMethod.POST)
	public String writeOkPOST(MultipartHttpServletRequest request, @ModelAttribute MembershipVO vo, MembershipFileVO membershipFileVO) throws IOException {
		
		if(vo!=null) {
			// 서버의 실제 경로
			@SuppressWarnings("deprecation")
			String realPath = request.getRealPath(uploadPath);
			System.out.println("realPath:"+realPath);
			if (logger.isInfoEnabled()) {
				logger.info("writeOkPOST - realPath=" + realPath); //$NON-NLS-1$
			}
			// 파일받기
			List<MultipartFile> files = request.getFiles("file");
			for(MultipartFile file : files) {
				if(file!=null && file.getSize()>0) {
					String savedName = uploadFile(realPath, file.getOriginalFilename(), file.getBytes());
					membershipFileVO.setOfile(file.getOriginalFilename());
					membershipFileVO.setSfile(savedName);
				}
			}
			membershipService.insert(vo, membershipFileVO);
		}
		return "redirect:/membership/board";
	}

	// 업로드된 파일을 저장하는 함수
	private String uploadFile(String realPath, String originalName, byte[] fileData) throws IOException {
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(realPath, savedName);

		// org.springframework.util 패키지의 FileCopyUtils는 파일 데이터를 파일로 처리하거나, 복사하는 등의 기능이 있다.
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
	
	@RequestMapping(value="/membership/view", method=RequestMethod.POST)
	public String view(int idx, Model model) {
		MembershipVO vo = membershipService.selectByIdx(idx);
		MembershipFileVO membershipFileVO = membershipService.selectByRef(vo.getIdx());
		System.out.println("여기"+membershipFileVO);
		model.addAttribute("vo", vo);
		model.addAttribute("fileVO", membershipFileVO);
		
		return "membership/view";
	}
	
	@Transactional
	@SuppressWarnings("deprecation")
	@RequestMapping(value="/membership/deleteOk", method=RequestMethod.POST)
	public String deleteOkPOST(int idx, int lev, HttpServletRequest request) {
		MembershipFileVO vo = membershipService.selectByRef(idx);
		if(lev == 2) {
			membershipService.delete(idx); // 운영자가 아니면 삭제 못하도록 방지.
			String realPath = request.getRealPath(uploadPath);
			String path = realPath+"\\"+vo.getSfile();
			if (logger.isInfoEnabled()) {
				logger.info("deleteOkPOST(int, int, HttpServletRequest) - String path=" + path); //$NON-NLS-1$
			}
			File file = new File(path);
			if(file.exists() == true){
				file.delete();
			}
		}
		return "redirect:/membership/board";
	}
	@RequestMapping(value="/membership/deleteOk", method=RequestMethod.GET)
	public String deleteOkGET() {
		return "membership/error";
	}
	
	
	@RequestMapping(value="/membership/list")
	public String membershipList(Model model) {
		List<MembershipVO> list = membershipService.selectAll();
		model.addAttribute("list",list);
		model.addAttribute("size",list.size());
		return "membership/list";
	}

	@RequestMapping(value="/membership/update",method=RequestMethod.POST)
	public String update(int idx, Model model) {
		MembershipVO vo = membershipService.selectByIdx(idx);
		model.addAttribute("idx",idx);
		model.addAttribute("vo",vo);
		return "membership/update";
	}
	@Transactional
	@RequestMapping(value="/membership/updateOk",method=RequestMethod.POST)
	public String updateOk(MultipartHttpServletRequest request,@ModelAttribute MembershipVO vo,@ModelAttribute MembershipFileVO fileVO ,int idx) throws IOException {
		MembershipFileVO oVO = membershipService.selectByRef(idx);
		// 서버의 실제 경로
		@SuppressWarnings("deprecation")
		String realPath = request.getRealPath(uploadPath);
		if (logger.isInfoEnabled()) {
			logger.info("writeOkPOST - realPath=" + realPath); //$NON-NLS-1$
		}
		
		// 기존 파일 삭제
		String path = realPath+"\\" + oVO.getSfile();
		if (logger.isInfoEnabled()) {
			logger.info("삭제할 파일" + path); //$NON-NLS-1$
		}
		
		File file1 = new File(path);
			if(file1.exists() == true){
			file1.delete();
		}
		
			
		// 파일받기
		List<MultipartFile> files = request.getFiles("file");
		for(MultipartFile file : files) {
			if(file!=null && file.getSize()>0) {
				String savedName = uploadFile(realPath, file.getOriginalFilename(), file.getBytes());
				fileVO.setOfile(file.getOriginalFilename());
				fileVO.setSfile(savedName);
			}
		}
		
		vo.setIdx(idx);
		fileVO.setRef(idx);
		membershipService.update(vo,fileVO);
		return "redirect:/membership/list";
	}
	
}
