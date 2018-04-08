package com.g01.mortgage.entity;

import java.util.List;

/**
 * @author 模版生成 <br/>
 *         表名： t_mortgage <br/>
 *         描述：抵押预约 <br/>
 */
public class MortgageVo extends Mortgage {

	private List<MortgageVo> mortgageList;

	public MortgageVo() {
		super();
	}

	public MortgageVo(Long id) {
		super();
		this.id = id;
	}

	public List<MortgageVo> getMortgageList() {
		return mortgageList;
	}

	public void setMortgageList(List<MortgageVo> mortgageList) {
		this.mortgageList = mortgageList;
	}

}
