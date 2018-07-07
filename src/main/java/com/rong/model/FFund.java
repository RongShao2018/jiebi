package com.rong.model;

import java.sql.Date;

/**
 * Created by rongjie on 2017/12/5.
 */
public class FFund {
    private String fId;
    private Date date;
    private double fExpenditure;
    private double fIncome;
    private double fBudget;
    private double fCapital;

    public String getfId() {
        return fId;
    }

    public void setfId(String fId) {
        this.fId = fId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getfExpenditure() {
        return fExpenditure;
    }

    public void setfExpenditure(double fExpenditure) {
        this.fExpenditure = fExpenditure;
    }

    public double getfIncome() {
        return fIncome;
    }

    public void setfIncome(double fIncome) {
        this.fIncome = fIncome;
    }

    public double getfBudget() {
        return fBudget;
    }

    public void setfBudget(double fBudget) {
        this.fBudget = fBudget;
    }

    public double getfCapital() {
        return fCapital;
    }

    public void setfCapital(double fCapital) {
        this.fCapital = fCapital;
    }

    @Override
    public String toString() {
        return "FFund{" +
                "fId='" + fId + '\'' +
                ", date=" + date +
                ", fExpenditure=" + fExpenditure +
                ", fIncome=" + fIncome +
                ", fBudget=" + fBudget +
                ", fCapital=" + fCapital +
                '}';
    }
}
