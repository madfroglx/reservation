package com.g01.reservation.controller;

import java.io.IOException;
import java.util.Map;

import com.google.common.collect.Maps;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.g01.GuaranteeEnum;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.roof.roof.dataaccess.api.Page;
import org.roof.roof.dataaccess.api.PageUtils;
import org.roof.spring.Result;
import com.g01.reservation.entity.Reservation;
import com.g01.reservation.entity.ReservationVo;
import com.g01.reservation.service.api.IReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Api(value = "reservation", description = "预约管理")
@Controller
@RequestMapping("test")
public class ReservationController {
    private IReservationService reservationService;

    @RequestMapping(value = "reservationsave", method = {RequestMethod.POST})
    public @ResponseBody
    Result create1(Reservation reservation) {
        if (reservation != null) {
            reservationService.save(reservation);
            return new Result("保存成功!");
        } else {
            return new Result(Result.FAIL, "数据传输失败!");
        }
    }

    @RequestMapping(value = "page", method = {RequestMethod.GET})
    public ModelAndView page(HttpServletRequest request, HttpServletResponse response) {
//		Page page = PageUtils.createPage(request);
//		page = reservationService.page(page, reservation);
        ModelAndView mav = new ModelAndView("index");
        return mav;
    }

    @ApiOperation(value = "获得预约基础信息")
    @RequestMapping(value = "reservation/base", method = {RequestMethod.GET})
    public @ResponseBody
    Result<Map<String, Object>> base(HttpServletRequest request) {
        Map<String, Object> map = Maps.newHashMap();
        //担保方式
        GuaranteeEnum[] guarantees = GuaranteeEnum.values();
        map.put("guarantees", guarantees);

        return new Result(Result.SUCCESS, map);
    }

    @ApiOperation(value = "获得预约分页列表")
    @RequestMapping(value = "reservation", method = {RequestMethod.GET})
    public @ResponseBody
    Result<Page> list(Reservation reservation, HttpServletRequest request) {
        Page page = PageUtils.createPage(request);
        page = reservationService.page(page, reservation);
        return new Result(Result.SUCCESS, page);
    }


    @ApiOperation(value = "新增预约")
    @RequestMapping(value = "reservation", method = {RequestMethod.POST})
    public @ResponseBody
    Result create(@RequestBody Reservation reservation) {
        if (reservation != null) {
            reservationService.save(reservation);
            return new Result("保存成功!");
        } else {
            return new Result(Result.FAIL, "数据传输失败!");
        }
    }

    @ApiOperation(value = "根据ID加载预约")
    @RequestMapping(value = "reservation/{id}", method = {RequestMethod.GET})
    public @ResponseBody
    Result<ReservationVo> load(@PathVariable Long id) {
        ReservationVo reservationVo = reservationService.load(new Reservation(id));
        return new Result(Result.SUCCESS, reservationVo);
    }

    @ApiOperation(value = "根据ID更新预约")
    @RequestMapping(value = "reservation/{id}", method = {RequestMethod.PUT})
    public @ResponseBody
    Result update(@PathVariable Long id, @RequestBody Reservation reservation) {
        if (id != null && reservation != null) {
            reservation.setId(id);
            reservationService.updateIgnoreNull(reservation);
            return new Result("保存成功!");
        } else {
            return new Result(Result.FAIL, "数据传输失败!");
        }
    }

    @ApiOperation(value = "根据ID删除预约")
    @RequestMapping(value = "reservation/{id}", method = {RequestMethod.DELETE})
    public @ResponseBody
    Result delete(@PathVariable Long id) {
        // TODO 有些关键数据是不能物理删除的，需要改为逻辑删除
        reservationService.delete(new Reservation(id));
        return new Result("删除成功!");
    }

    @Autowired(required = true)
    public void setReservationService(
            @Qualifier("reservationService") IReservationService reservationService
    ) {
        this.reservationService = reservationService;
    }


}
