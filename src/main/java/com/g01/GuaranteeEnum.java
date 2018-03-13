package com.g01;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.JSONSerializable;
import com.alibaba.fastjson.serializer.JSONSerializer;

import java.io.IOException;
import java.lang.reflect.Type;

/**
 * @author liht
 * 担保方式
 */
public enum GuaranteeEnum implements JSONSerializable {

    pledge(0, "抵押", "pledge"),
    guarantee(1, "担保", "guarantee"),
    credit(2, "信用", "credit");


    private Integer code;
    private String display;
    private String value;

    private GuaranteeEnum(Integer code, String display, String value) {
        this.code = code;
        this.display = display;
        this.value = value;
    }

    public static GuaranteeEnum getEnumByCode(Integer code) {
        for (GuaranteeEnum stateEnum : values()) {
            if (stateEnum.getCode().equals(code)) {
                return stateEnum;
            }
        }
        return null;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getDisplay() {
        return display;
    }

    public void setDisplay(String display) {
        this.display = display;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public void write(JSONSerializer serializer, Object fieldName, Type fieldType, int features) throws IOException {

        JSONObject object = new JSONObject();
        object.put("code", code);
        object.put("display", display);
        serializer.write(object);

    }
}
