package com.g01.reservation.controller;

import com.g01.reservation.entity.Sign;
import com.g01.reservation.entity.Ticket;
import com.g01.reservation.service.api.IWeixinService;
import org.roof.spring.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

/**
 * @author liuxin
 * @since 2018/4/8
 */
@Controller
@RequestMapping("weixin")
public class WeixinController {
    private static final Logger LOGGER = LoggerFactory.getLogger(WeixinController.class);
    private IWeixinService weixinService;

    @RequestMapping("token")
    public String token() {
        return null;
    }

    @RequestMapping("cross")
    public void cross(String url, HttpServletResponse response) {
        try {
            url = URLDecoder.decode(url, "UTF-8");
            response.sendRedirect(url);
        } catch (IOException e) {
            LOGGER.error(e.getMessage(), e);
        }
    }

    @RequestMapping("ticket")
    @ResponseBody
    public Result ticket() {
        Ticket ticket = weixinService.getTicket();
        return new Result(Result.SUCCESS, ticket.getTicket());
    }


    @RequestMapping("sign")
    @ResponseBody
    public Result sign(String url, HttpServletResponse response) throws UnsupportedEncodingException {
        response.setHeader("Access-Control-Allow-Origin", "*");
        Sign sign = new Sign();
        sign.setUrl(URLDecoder.decode(url, "UTF-8"));
        weixinService.getSign(sign);
        return new Result(Result.SUCCESS, sign);
    }

    @Autowired
    public void setWeixinService(IWeixinService weixinService) {
        this.weixinService = weixinService;
    }
}
