package com.g01.reservation.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.g01.reservation.entity.AccessToken;
import com.g01.reservation.entity.Sign;
import com.g01.reservation.entity.Ticket;
import com.g01.reservation.service.api.IWeixinService;
import org.apache.commons.lang3.StringUtils;
import org.roof.commons.RoofStringUtils;
import org.roof.httpclinet.HttpClientUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.security.MessageDigest;
import java.text.MessageFormat;

@Service
public class WeixinServiceImpl implements IWeixinService, InitializingBean {
    private static final String ACCESS_TOKEN = "accessToken";
    private HttpClientUtils httpClientUtils;
    private CacheManager cacheManager;
    private Cache cache;
    private static final Logger LOGGER = LoggerFactory.getLogger(WeixinServiceImpl.class);
    private static final String GET_ACCESS_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wx7089dd975f0f98b7&secret=0bb3a1391a5c5861df5706dd1f648e62";
    private static final String GET_TICKET_URL = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token={0}&type=jsapi";
    private static final String SIGN_TMP = "jsapi_ticket={0}&noncestr={1}&timestamp={2}&url={3}";

    private static final char[] HEX_DIGITS = {'0', '1', '2', '3', '4', '5',
            '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

    @Override
    public void afterPropertiesSet() throws Exception {
        cache = cacheManager.getCache("tokenCache");
    }

    private static String getFormattedText(byte[] bytes) {
        int len = bytes.length;
        StringBuilder buf = new StringBuilder(len * 2);
        // 把密文转换成十六进制的字符串形式
        for (int j = 0; j < len; j++) {
            buf.append(HEX_DIGITS[(bytes[j] >> 4) & 0x0f]);
            buf.append(HEX_DIGITS[bytes[j] & 0x0f]);
        }
        return buf.toString();
    }

    public static String encode(String str) {
        if (str == null) {
            return null;
        }
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("SHA1");
            messageDigest.update(str.getBytes());
            return getFormattedText(messageDigest.digest());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Sign getSign(Sign sign) {
        sign.setTimestamp(System.currentTimeMillis() / 1000);
        sign.setNoncestr(RoofStringUtils.randomString(16));
        sign.setJsapi_ticket(getTicket().getTicket());
        String str = MessageFormat.format(SIGN_TMP, sign.getJsapi_ticket(), sign.getNoncestr(), String.valueOf(sign.getTimestamp()), sign.getUrl());
        sign.setSignature(encode(str));
        return sign;
    }

    @Override
    public AccessToken getAccessToken() {
        if (needRefresh()) {
            synchronized (this) {
                if (needRefresh()) {
                    ResponseEntity<String> responseEntity = null;
                    try {
                        responseEntity = httpClientUtils.doGet(GET_ACCESS_TOKEN_URL);
                    } catch (IOException e) {
                        LOGGER.error(e.getMessage(), e);
                    }
                    if (responseEntity != null && responseEntity.getStatusCode().is2xxSuccessful()) {
                        AccessToken accessToken = JSONObject.parseObject(responseEntity.getBody(), AccessToken.class);
                        cache.put(ACCESS_TOKEN, accessToken);
                    } else {
                        if (responseEntity == null) {
                            LOGGER.error("responseEntity is null");
                        } else {
                            LOGGER.error("StatusCode :[" + responseEntity.getStatusCode() + "]+ body :" + responseEntity.getBody());
                        }
                    }
                }
            }
        }
        return getAccessTokenFromCache();
    }

    @Override
    public Ticket getTicket() {
        if (ticketNeedRefresh()) {
            synchronized (this) {
                if (ticketNeedRefresh()) {
                    AccessToken accessToken = getAccessToken();
                    if (accessToken == null) {
                        return null;
                    }
                    String url = MessageFormat.format(GET_TICKET_URL, accessToken.getAccess_token());
                    ResponseEntity<String> responseEntity = null;
                    try {
                        responseEntity = httpClientUtils.doGet(url);
                    } catch (IOException e) {
                        LOGGER.error(e.getMessage(), e);
                    }
                    if (responseEntity != null && responseEntity.getStatusCode().is2xxSuccessful()) {
                        Ticket ticket = JSONObject.parseObject(responseEntity.getBody(), Ticket.class);
                        cache.put("ticket", ticket);
                    } else {
                        if (responseEntity == null) {
                            LOGGER.error("responseEntity is null");
                        } else {
                            LOGGER.error("StatusCode :[" + responseEntity.getStatusCode() + "]+ body :" + responseEntity.getBody());
                        }
                    }
                }
            }

        }
        return getTicketFromCache();
    }

    private AccessToken getAccessTokenFromCache() {
        return cache.get(ACCESS_TOKEN, AccessToken.class);
    }

    private Ticket getTicketFromCache() {
        return cache.get("ticket", Ticket.class);
    }

    private boolean needRefresh() {
        AccessToken currentAccessToken = getAccessTokenFromCache();
        return currentAccessToken == null
                || StringUtils.isEmpty(currentAccessToken.getAccess_token())
                || currentAccessToken.getCreate_at() + currentAccessToken.getExpires_in() * 1000 < System.currentTimeMillis() - 1000 * 10;
    }

    private boolean ticketNeedRefresh() {
        Ticket currentTicket = getTicketFromCache();
        return currentTicket == null
                || StringUtils.isEmpty(currentTicket.getTicket())
                || currentTicket.getCreate_at() + currentTicket.getExpires_in() * 1000 < System.currentTimeMillis() - 1000 * 10;
    }

    @Autowired
    public void setHttpClientUtils(HttpClientUtils httpClientUtils) {
        this.httpClientUtils = httpClientUtils;
    }

    @Autowired
    public void setCacheManager(@Qualifier("cacheManager") CacheManager cacheManager) {
        this.cacheManager = cacheManager;
    }
}
