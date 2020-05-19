package com.myspring.projectEx.commute.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.projectEx.commute.service.CommuteService;
import com.myspring.projectEx.commute.vo.CommuteVO;
import com.myspring.projectEx.member.vo.MemberVO;




@Controller("commuteController")
public class CommuteControllerImpl   implements CommuteController {
	@Autowired
	private CommuteService commuteService;
	@Autowired
	private CommuteVO commuteVO ;
	
	@Override
	@RequestMapping(value="/commute/listCommute.do" ,method = RequestMethod.GET)
	public ModelAndView listcommute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		//세션에서 아이디정보 가져다
		List commutesList = commuteService.listCommute();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("commutesList", commutesList);  //議고쉶�븳 �쉶�썝 �젙蹂대�� modelandview�쓽 addObject硫붿냼�뱶瑜� �씠�슜�빐 諛붿씤�뵫 �빀�땲�떎
		return mav;
	}

	@Override
	@RequestMapping(value="/commute/addCommute.do" ,method = RequestMethod.POST)
	public ModelAndView addcommute(@ModelAttribute("commute") CommuteVO commute,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int result = 0;
		result = commuteService.addCommute(commute);
		ModelAndView mav = new ModelAndView("redirect:/commute/listCommute.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/commute/removeCommute.do" ,method = RequestMethod.GET)
	public ModelAndView removecommute(@RequestParam("id") String id, 
			           HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		commuteService.removeCommute(id);
		ModelAndView mav = new ModelAndView("redirect:/commute/listCommute.do");
		return mav;
	}
	
	/*@RequestMapping(value = { "/commute/loginForm.do", "/commute/commuteForm.do" }, method =  RequestMethod.GET) */
	@RequestMapping(value = "/commute/*Form.do", method =  RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	} //�뜲�씠�꽣踰좎씠�뒪 �뿰�룞 �옉�뾽�씠 �뾾�뒗 �엯�젰李� �슂泥� �떆 酉� �씠由꾨쭔 ModelandView濡� 諛섑솚
	
	@Override
	@RequestMapping(value = "/commute/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("commute") CommuteVO commute,
				              RedirectAttributes rAttr,
		                       HttpServletRequest request, HttpServletResponse response) throws Exception {
	ModelAndView mav = new ModelAndView();
	commuteVO = commuteService.login(commute);
	if(commuteVO != null) { //濡쒓렇�씤�뿉 �꽦怨�
		    HttpSession session = request.getSession();
		    session.setAttribute("commute", commuteVO);
		    session.setAttribute("isLogOn", true);
		    mav.setViewName("redirect:/commute/listCommute.do");
	}else {
		    rAttr.addAttribute("result","loginFailed");
		    mav.setViewName("redirect:/commute/loginForm.do");
	}
	return mav;
	}

	@Override
	@RequestMapping(value = "/commute/logout.do", method =  RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("commute");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/commute/listCommute.do");
		return mav;
	}
	
	

	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String viewName = uri.substring(begin, end);
		if (viewName.indexOf(".") != -1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if (viewName.lastIndexOf("/") != -1) {
			viewName = viewName.substring(viewName.lastIndexOf("/",1), viewName.length());
		}
		return viewName;
	}

	@Override
	public ModelAndView listcommute(CommuteVO commute, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


}
