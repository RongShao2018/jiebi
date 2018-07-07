package com.rong.controller;

import com.rong.model.In;
import com.rong.service.IInService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;


/**
 * Created by rongjie on 2017/12/6.
 */
@Controller
@RequestMapping("/In")
public class InController {

    @Resource
    private IInService inService;

    @RequestMapping("/insertIn")
    public ModelAndView insertIn(In in, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        String date1 = request.getParameter("date2");
        String date2 = date1.substring(6,10)+"-"+date1.substring(3,5)+"-"+date1.substring(0,2);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date d = null;
        try {
            d = format.parse(date2);
        } catch (Exception e) {
            e.printStackTrace();
        }
        Date date = new Date(d.getTime());
        in.setDate(date);
        String inSort1 = request.getParameter("inSort1");
        in.setInSort(in.getInSort()+":"+inSort1);
        in.setId(request.getParameter("id"));
        in.setUnit("人民币");
        System.out.println(inService.insertIn(in));
        String url = "redirect:/user/SkipToInout?id="+in.getId()+"&password="+request.getParameter("password");
        return new ModelAndView(url);
        /*try {
            request.getRequestDispatcher("/inout.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        }*/

    }
}
