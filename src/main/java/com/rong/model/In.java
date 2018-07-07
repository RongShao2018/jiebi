package com.rong.model;

import java.sql.Date;

/**
 * Created by rongjie on 2017/12/5.
 */
public class In {
    private String id;
    private String inSort;
    private double inAmounts;
    private Date date;
    private String notes;
    private String unit;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getInSort() {
        return inSort;
    }

    public void setInSort(String inSort) {
        this.inSort = inSort;
    }

    public double getInAmounts() {
        return inAmounts;
    }

    public void setInAmounts(double inAmounts) {
        this.inAmounts = inAmounts;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
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
        return "In{" +
                "id='" + id + '\'' +
                ", inSort='" + inSort + '\'' +
                ", inAmounts=" + inAmounts +
                ", date=" + date +
                ", notes='" + notes + '\'' +
                ", unit='" + unit + '\'' +
                '}';
    }
}
