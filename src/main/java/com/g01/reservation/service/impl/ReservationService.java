package com.g01.reservation.service.impl;

import java.io.Serializable;
import java.util.List;
import org.roof.roof.dataaccess.api.Page;
import com.g01.reservation.dao.api.IReservationDao;
import com.g01.reservation.entity.Reservation;
import com.g01.reservation.entity.ReservationVo;
import com.g01.reservation.service.api.IReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class ReservationService implements IReservationService {
	private IReservationDao reservationDao;

	public Serializable save(Reservation reservation){
		return reservationDao.save(reservation);
	}

	public void delete(Reservation reservation){
		reservationDao.delete(reservation);
	}
	
	public void deleteByExample(Reservation reservation){
		reservationDao.deleteByExample(reservation);
	}

	public void update(Reservation reservation){
		reservationDao.update(reservation);
	}
	
	public void updateIgnoreNull(Reservation reservation){
		reservationDao.updateIgnoreNull(reservation);
	}
		
	public void updateByExample(Reservation reservation){
		reservationDao.update("updateByExampleReservation", reservation);
	}

	public ReservationVo load(Reservation reservation){
		return (ReservationVo)reservationDao.reload(reservation);
	}
	
	public ReservationVo selectForObject(Reservation reservation){
		return (ReservationVo)reservationDao.selectForObject("selectReservation",reservation);
	}
	
	public List<ReservationVo> selectForList(Reservation reservation){
		return (List<ReservationVo>)reservationDao.selectForList("selectReservation",reservation);
	}
	
	public Page page(Page page, Reservation reservation) {
		return reservationDao.page(page, reservation);
	}

	@Autowired
	public void setIReservationDao(
			@Qualifier("reservationDao") IReservationDao  reservationDao) {
		this.reservationDao = reservationDao;
	}
	

}
