package com.g01;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * Created by zhenglt on 2017/11/25.
 */
@Controller
public class MainController {

    @RequestMapping(value = "currentUser", method = {RequestMethod.GET})
    public @ResponseBody Map currentUser(){
        Map<String,Object> map = Maps.newHashMap();
        map.put("name","Serati Ma");
        map.put("avatar","https://gw.alipayobjects.com/zos/rmsportal/dRFVcIqZOYPcSNrlJsqQ.png");
        map.put("userid","00000001");
        map.put("notifyCount",12);
        return  map;
    }

    @RequestMapping(value = "notices", method = {RequestMethod.GET})
    public @ResponseBody List<Map<String,Object>> notices(){
        List list = Lists.newArrayList();
        Map<String,Object> map = Maps.newHashMap();
        map.put("id","000000001");
        map.put("avatar","https://gw.alipayobjects.com/zos/rmsportal/ThXAXghbEsBCCSDihZxY.png");
        map.put("title","你收到了 14 份新周报");
        map.put("datetime","2017-08-09");
        map.put("type","通知");
        list.add(map);
        return  list;
    }


}
