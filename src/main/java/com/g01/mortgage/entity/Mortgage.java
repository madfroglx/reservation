package com.g01.mortgage.entity;

import javax.persistence.Id;
import java.util.Date;
import java.io.Serializable;
import org.springframework.format.annotation.DateTimeFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import com.alibaba.fastjson.annotation.JSONField;

/**
 * @author 模版生成 <br/>
 *         表名： t_mortgage <br/>
 *         描述：抵押预约 <br/>
 */
@ApiModel(value = "t_mortgage", description = "抵押预约")
public class Mortgage implements Serializable {
	// 需要手动添加非默认的serialVersionUID
	@ApiModelProperty(value = "id")
	protected Long id;// id
	@ApiModelProperty(value = "客户名称")
	protected String name;// 客户名称
	@ApiModelProperty(value = "联系方式")
	protected String contacts;// 联系方式
	@ApiModelProperty(value = "时间")
	protected String startTime;// 时间
	@ApiModelProperty(value = "客户经理")
	protected String manager;// 客户经理
	@ApiModelProperty(value = "客户经理联系方式")
	protected String managerContacts;// 客户经理联系方式
	@ApiModelProperty(value = "支行")
	protected String subbranch;// 支行
	@ApiModelProperty(value = "分理处")
	protected String office;// 分理处

	public Mortgage() {
		super();
	}

	public Mortgage(Long id) {
		super();
		this.id = id;
	}
	
	@Id// 主键
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getContacts() {
		return contacts;
	}
	public void setContacts(String contacts) {
		this.contacts = contacts;
	}
	
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	
	public String getManager() {
		return manager;
	}
	public void setManager(String manager) {
		this.manager = manager;
	}
	
	public String getManagerContacts() {
		return managerContacts;
	}
	public void setManagerContacts(String managerContacts) {
		this.managerContacts = managerContacts;
	}
	
	public String getSubbranch() {
		return subbranch;
	}
	public void setSubbranch(String subbranch) {
		this.subbranch = subbranch;
	}
	
	public String getOffice() {
		return office;
	}
	public void setOffice(String office) {
		this.office = office;
	}
}
