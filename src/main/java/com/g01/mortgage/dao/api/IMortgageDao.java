package com.g01.mortgage.dao.api;

import org.roof.roof.dataaccess.api.IDaoSupport;
import org.roof.roof.dataaccess.api.Page;

import com.g01.mortgage.entity.Mortgage;

public interface IMortgageDao extends IDaoSupport {
	Page page(Page page, Mortgage mortgage);
}