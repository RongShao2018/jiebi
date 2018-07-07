package com.rong.model;


import java.sql.Date;

/**
 * Created by rongjie on 2017/12/5.
 */
public class UFund {
    private String id;
    private Date date;
    private double uExpenditure;
    private double uIncome;
    private double uBudget;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getuExpenditure() {
        return uExpenditure;
    }

    public void setuExpenditure(double uExpenditure) {
        this.uExpenditure = uExpenditure;
    }

    public double getuIncome() {
        return uIncome;
    }

    public void setuIncome(double uIncome) {
        this.uIncome = uIncome;
    }

    public double getuBudget() {
        return uBudget;
    }

    public void setuBudget(double uBudget) {
        this.uBudget = uBudget;
    }

    @Override
    public String toString() {
        return "UFund{" +
                "id='" + id + '\'' +
                ", date=" + date +
                ", uExpenditure=" + uExpenditure +
                ", uIncome=" + uIncome +
                ", uBudget=" + uBudget +
                '}';
    }
}
