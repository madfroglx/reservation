package com.g01.reservation.entity;

import javax.persistence.Id;
import java.util.Date;
import java.io.Serializable;
import org.springframework.format.annotation.DateTimeFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import com.alibaba.fastjson.annotation.JSONField;

/**
 * @author 模版生成 <br/>
 *         表名： t_reservation <br/>
 *         描述：预约 <br/>
 */
@ApiModel(value = "t_reservation", description = "预约")
public class Reservation implements Serializable {
	// 需要手动添加非默认的serialVersionUID
	@ApiModelProperty(value = "主键")
	protected Long id;// 主键
	@ApiModelProperty(value = "客户名称")
	protected String name;// 客户名称
	@ApiModelProperty(value = "担保方式")
	protected Integer guarantee;// 担保方式
	@ApiModelProperty(value = "金额")
	protected Integer amount;// 金额
	@ApiModelProperty(value = "联系方式")
	protected String contacts;// 联系方式
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@ApiModelProperty(value = "用款开始时间")
	protected Date startTime;// 用款开始时间
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@ApiModelProperty(value = "用款结束时间")
	protected Date endTime;// 用款结束时间
	@ApiModelProperty(value = "客户经理")
	protected String manager;// 客户经理
	@ApiModelProperty(value = "客户经理联系方式")
	protected String managerContacts;// 客户经理联系方式

	public Reservation() {
		super();
	}

	public Reservation(Long id) {
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
	
	public Integer getGuarantee() {
		return guarantee;
	}
	public void setGuarantee(Integer guarantee) {
		this.guarantee = guarantee;
	}
	
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	
	public String getContacts() {
		return contacts;
	}
	public void setContacts(String contacts) {
		this.contacts = contacts;
	}
	
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
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
}
