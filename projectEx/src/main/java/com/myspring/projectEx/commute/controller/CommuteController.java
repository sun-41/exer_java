package com.myspring.projectEx.commute.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.projectEx.commute.vo.CommuteVO;

public interface CommuteController {
	public ModelAndView listcommute(@ModelAttribute("commute") CommuteVO commute, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addcommute(@ModelAttribute("info") CommuteVO commuteVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView removecommute(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView login(@ModelAttribute("commute") CommuteVO commute,
            RedirectAttributes rAttr,
            HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	ModelAndView listcommute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
