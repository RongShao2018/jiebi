package com.rong.model;

import java.sql.Date;

/**
 * Created by rongjie on 2017/12/5.
 */
public class Out {
    private String id;
    private String outSort;
    private double outAmounts;
    private Date date;
    private String place;
    private String object;
    private String notes;
    private String unit;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOutSort() {
        return outSort;
    }

    public void setOutSort(String outSort) {
        this.outSort = outSort;
    }

    public double getOutAmounts() {
        return outAmounts;
    }

    public void setOutAmounts(double outAmounts) {
        this.outAmounts = outAmounts;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public String getObject() {
        return object;
    }

    public void setObject(String object) {
        this.object = object;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }


    @Override
    public String toString() {
        return "Out{" +
                "id='" + id + '\'' +
                ", outSort='" + outSort + '\'' +
                ", outAmounts=" + outAmounts +
                ", date=" + date +
                ", place='" + place + '\'' +
                ", object='" + object + '\'' +
                ", notes='" + notes + '\'' +
                ", unit='" + unit + '\'' +
                '}';
    }
}
