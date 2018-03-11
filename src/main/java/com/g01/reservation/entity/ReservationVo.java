package com.g01.reservation.entity;

import java.util.List;

/**
 * @author 模版生成 <br/>
 *         表名： t_reservation <br/>
 *         描述：预约 <br/>
 */
public class ReservationVo extends Reservation {

	private List<ReservationVo> reservationList;

	public ReservationVo() {
		super();
	}

	public ReservationVo(Long id) {
		super();
		this.id = id;
	}

	public List<ReservationVo> getReservationList() {
		return reservationList;
	}

	public void setReservationList(List<ReservationVo> reservationList) {
		this.reservationList = reservationList;
	}

}
