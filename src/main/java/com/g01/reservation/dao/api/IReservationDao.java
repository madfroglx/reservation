package com.g01.reservation.dao.api;

import org.roof.roof.dataaccess.api.IDaoSupport;
import org.roof.roof.dataaccess.api.Page;

import com.g01.reservation.entity.Reservation;

public interface IReservationDao extends IDaoSupport {
	Page page(Page page, Reservation reservation);
}