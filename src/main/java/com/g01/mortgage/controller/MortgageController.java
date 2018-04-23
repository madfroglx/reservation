package com.g01.mortgage.controller;

import com.alibaba.fastjson.JSON;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.g01.mortgage.entity.Mortgage;
import com.g01.mortgage.entity.MortgageVo;
import com.g01.mortgage.service.api.IMortgageService;
import com.g01.reservation.service.impl.SmsService;
import com.google.common.collect.Maps;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.lang3.StringUtils;
import org.roof.roof.dataaccess.api.Page;
import org.roof.roof.dataaccess.api.PageUtils;
import org.roof.spring.Result;
import org.roof.web.dictionary.entity.Dictionary;
import org.roof.web.dictionary.service.api.IDictionaryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Api(value = "mortgage", description = "抵押预约管理")
@Controller
@RequestMapping("test")
public class MortgageController {
    private static final Logger LOGGER = LoggerFactory.getLogger(MortgageController.class);

    private IMortgageService mortgageService;
    private IDictionaryService dictionaryService;

    @RequestMapping(value = "mortgage/create", method = {RequestMethod.POST, RequestMethod.GET})
    public @ResponseBody
    Result create2(Mortgage mortgage, HttpServletResponse response) {
        response.setHeader("Access-Control-Allow-Origin", "*");
        if (mortgage != null) {
            Map<String, String> tempParams = new HashMap<>();
            tempParams.put("bizName", "抵押");
            tempParams.put("name", mortgage.getName());
            tempParams.put("contacts", mortgage.getContacts());
            tempParams.put("time", mortgage.getStartTime());
            tempParams.put("subbranch", mortgage.getSubbranch());
            tempParams.put("manager", mortgage.getManager());
            Dictionary d = dictionaryService.load("S_DIC", "mobile");
            SendSmsResponse smsResponse = SmsService.sendSms(d.getText(), "SMS_133155429", tempParams);
            LOGGER.info(JSON.toJSONString(smsResponse));
            mortgageService.save(mortgage);
            return new Result("保存成功!");
        } else {
            return new Result(Result.FAIL, "数据传输失败!");
        }
    }

    @ApiOperation(value = "获得抵押预约基础信息")
    @RequestMapping(value = "mortgage/base", method = {RequestMethod.GET})
    public @ResponseBody
    Result<Map<String, Object>> base(HttpServletRequest request) {
        Map<String, Object> map = Maps.newHashMap();
        return new Result(Result.SUCCESS, map);
    }

    @ApiOperation(value = "获得抵押预约分页列表")
    @RequestMapping(value = "mortgage", method = {RequestMethod.GET})
    public @ResponseBody
    Result<Page> list(Mortgage mortgage, HttpServletRequest request) {
        Page page = PageUtils.createPage(request);
        page = mortgageService.page(page, mortgage);
        return new Result(Result.SUCCESS, page);
    }


    @ApiOperation(value = "新增抵押预约")
    @RequestMapping(value = "mortgage", method = {RequestMethod.POST})
    public @ResponseBody
    Result create(@RequestBody Mortgage mortgage) {
        if (mortgage != null) {
            mortgageService.save(mortgage);
            return new Result("保存成功!");
        } else {
            return new Result(Result.FAIL, "数据传输失败!");
        }
    }

    @ApiOperation(value = "根据ID加载抵押预约")
    @RequestMapping(value = "mortgage/{id}", method = {RequestMethod.GET})
    public @ResponseBody
    Result<MortgageVo> load(@PathVariable Long id) {
        MortgageVo mortgageVo = mortgageService.load(new Mortgage(id));
        return new Result(Result.SUCCESS, mortgageVo);
    }

    @ApiOperation(value = "根据ID更新抵押预约")
    @RequestMapping(value = "mortgage/{id}", method = {RequestMethod.PUT})
    public @ResponseBody
    Result update(@PathVariable Long id, @RequestBody Mortgage mortgage) {
        if (id != null && mortgage != null) {
            mortgage.setId(id);
            mortgageService.updateIgnoreNull(mortgage);
            return new Result("保存成功!");
        } else {
            return new Result(Result.FAIL, "数据传输失败!");
        }
    }

    @ApiOperation(value = "根据ID删除抵押预约")
    @RequestMapping(value = "mortgage/{id}", method = {RequestMethod.DELETE})
    public @ResponseBody
    Result delete(@PathVariable Long id) {
        // TODO 有些关键数据是不能物理删除的，需要改为逻辑删除
        mortgageService.delete(new Mortgage(id));
        return new Result("删除成功!");
    }

    @Autowired(required = true)
    public void setMortgageService(
            @Qualifier("mortgageService") IMortgageService mortgageService) {
        this.mortgageService = mortgageService;
    }

    @Autowired
    public void setDictionaryService(@Qualifier("dictionaryService") IDictionaryService dictionaryService) {
        this.dictionaryService = dictionaryService;
    }
}
