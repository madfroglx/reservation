package com.g01.mortgage.service.impl;

import java.io.Serializable;
import java.util.List;
import org.roof.roof.dataaccess.api.Page;
import com.g01.mortgage.dao.api.IMortgageDao;
import com.g01.mortgage.entity.Mortgage;
import com.g01.mortgage.entity.MortgageVo;
import com.g01.mortgage.service.api.IMortgageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class MortgageService implements IMortgageService {
	private IMortgageDao mortgageDao;

	public Serializable save(Mortgage mortgage){
		return mortgageDao.save(mortgage);
	}

	public void delete(Mortgage mortgage){
		mortgageDao.delete(mortgage);
	}
	
	public void deleteByExample(Mortgage mortgage){
		mortgageDao.deleteByExample(mortgage);
	}

	public void update(Mortgage mortgage){
		mortgageDao.update(mortgage);
	}
	
	public void updateIgnoreNull(Mortgage mortgage){
		mortgageDao.updateIgnoreNull(mortgage);
	}
		
	public void updateByExample(Mortgage mortgage){
		mortgageDao.update("updateByExampleMortgage", mortgage);
	}

	public MortgageVo load(Mortgage mortgage){
		return (MortgageVo)mortgageDao.reload(mortgage);
	}
	
	public MortgageVo selectForObject(Mortgage mortgage){
		return (MortgageVo)mortgageDao.selectForObject("selectMortgage",mortgage);
	}
	
	public List<MortgageVo> selectForList(Mortgage mortgage){
		return (List<MortgageVo>)mortgageDao.selectForList("selectMortgage",mortgage);
	}
	
	public Page page(Page page, Mortgage mortgage) {
		return mortgageDao.page(page, mortgage);
	}

	@Autowired
	public void setIMortgageDao(
			@Qualifier("mortgageDao") IMortgageDao  mortgageDao) {
		this.mortgageDao = mortgageDao;
	}
	

}
