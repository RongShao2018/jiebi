package com.rong.controller;

import com.rong.model.Out;
import com.rong.service.IOutService;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * Created by rongjie on 2017/12/6.
 */
@Controller
@RequestMapping("/Out")
public class OutController {
    @Resource
    private IOutService outService;

    @RequestMapping("/insertOut")
    public ModelAndView insertOut(Out out, Model model, HttpServletRequest request, HttpServletResponse response)
    {
        String date1 = request.getParameter("date1");
        System.out.println("date:::"+date1);
        String date2 = date1.substring(6,10)+"-"+date1.substring(3,5)+"-"+date1.substring(0,2);
        String outSort1 = request.getParameter("outSort1");
        System.out.println("OutSort1:"+outSort1+" aaaaaaaaaaaa");
        out.setOutSort(out.getOutSort()+":"+outSort1);
        out.setUnit("人民币");
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date d = null;
        try {
            d = format.parse(date2);
        } catch (Exception e) {
            e.printStackTrace();
        }
        Date date = new Date(d.getTime());
        out.setDate(date);
        String object1 = request.getParameter("object1");
        System.out.println("object1"+object1+"ok!!!");
        out.setObject(out.getObject()+":"+object1);
        out.setId(request.getParameter("id"));
        System.out.println(request.getParameter("id"));
        System.out.println(outService.insertOut(out));
        String url = "redirect:/user/SkipToInout?id="+out.getId()+"&password="+request.getParameter("password");
        return new ModelAndView(url);

        //return "inout";
       /* try
        {
            request.getRequestDispatcher("/inout.jsp").forward(request,response);
        }
        catch (ServletException e)
        {
            e.printStackTrace();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }*/


    }


    @RequestMapping("/selectAmoToday")
    public void selectAmoToday()
    {

    }

    @RequestMapping("/selectById")
    public String selectById(HttpServletRequest request, HttpServletResponse response)
    {


        return "inout";
    }

    @RequestMapping("/SkipToInOut")
    public String SkipToInOut(HttpServletRequest request,HttpServletResponse response)
    {
        request.setAttribute("id",request.getParameter("id"));
        return "inout";
    }
}
