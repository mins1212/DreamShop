package com.portfolio.dreamshop.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.portfolio.dreamshop.mapper.UserMapper;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service
public class UserService extends EgovAbstractServiceImpl{
	@Resource
	UserMapper userMapper;
	
	public String getUser() {
		return userMapper.getUser();
	}	
}
