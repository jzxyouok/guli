package com.server.action.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.server.dao.mapper.CompanyMapper;
import com.server.pojo.entity.Company;

/**
 * 供应商后台管理系统-登录
 * @author tao
 *
 */
@Controller
public class Com_loginCtl {
	@Autowired
	private CompanyMapper companyMapper;
	//到收藏页面
	@RequestMapping("/companySys/login")
	public String login(HttpSession session,Company company){
			
		Company company2 = companyMapper.selectLogin(company);
		session.setAttribute("company", company2);
		return "redirect:/companySys/login.jsp";
	}
}
