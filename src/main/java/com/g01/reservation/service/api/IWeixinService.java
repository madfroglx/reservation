package com.g01.reservation.service.api;

import com.g01.reservation.entity.AccessToken;
import com.g01.reservation.entity.Sign;
import com.g01.reservation.entity.Ticket;

/**
 * @author liuxin
 * @since 2018/4/8
 */
public interface IWeixinService {
    AccessToken getAccessToken();

    Ticket getTicket();

    Sign getSign(Sign sign);
}
