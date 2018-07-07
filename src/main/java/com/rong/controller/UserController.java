package com.rong.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.rong.dao.IUFundDao;
import com.rong.model.*;
import com.rong.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;

import static java.lang.Integer.parseInt;

/**
 * Created by rongjie on 2017/12/4.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private IUserService userService;

    @Resource
    private IOutService outService;

    @Resource
    private IUFundService uFundService;

    @Resource
    private IInService inService;

    @Resource
    private IFFundService fundService;

    @RequestMapping("/showUser.do")
    public void selectUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String userId =  request.getParameter("id");
        User user = this.userService.selectUser(userId);
        ObjectMapper mapper = new ObjectMapper();
        response.getWriter().write(mapper.writeValueAsString(user));
        response.getWriter().close();
    }

    @RequestMapping("/login")
    public String login(String id, String password, Model model, HttpServletRequest request, HttpServletResponse response)
    {
         System.out.println("用户登录："+id+" "+password);
         double todayOut=0,sevendayOut=0,monthOut=0,todayIn=0,sevendayIn=0,monthIn=0;
         int i=0;
         if (userService.login(id,password))
         {
             List<Out> outs = outService.selectAmoToday(id);
             List<In> ins = inService.selectInToday(id);
             for(i=0;i<outs.size();i++)
             {
                 todayOut+=outs.get(i).getOutAmounts();
             }

             for (i=0;i<ins.size();i++)
             {
                 todayIn+=ins.get(i).getInAmounts();
             }

             outs=outService.selectAmoSevenDay(id);
             ins=inService.selectInSevenDay(id);
             for (i=0;i<outs.size();i++)
             {
                 sevendayOut+=outs.get(i).getOutAmounts();
             }
             System.out.println("sevenout:"+sevendayOut);

             for (i=0;i<ins.size();i++)
             {
                 sevendayIn+=ins.get(i).getInAmounts();
             }

             outs=outService.selectAmoMonth(id);
             ins=inService.selectInMonth(id);

             for (i=0;i<outs.size();i++)
             {
                 monthOut+=outs.get(i).getOutAmounts();
             }

             for (i=0;i<ins.size();i++)
             {
                 monthIn+=ins.get(i).getInAmounts();
             }

             User user = new User();
             UFund uFund1 = new UFund();
             UFund uFund2 = new UFund();
             user=userService.selectUser(id);
             uFund1=uFundService.selectUFund(id);
             System.out.println("AAAuFund1:"+uFund1);
             System.out.println("user"+user);
             System.out.println(request.getParameter("uBudget"));
             String str = request.getParameter("uBudget");
             System.out.println("updateBudget"+request.getParameter("updateBudget"));
             if("1".equals(request.getParameter("updateBudget")))
             {
                 double budget = new Double(str);
                 uFund2.setId(id);
                 uFund2.setuBudget(budget);
                 System.out.println("will updateBudget"+uFundService.updateUBudget(uFund2));
                 model.addAttribute("MonthBudget",uFund2.getuBudget());
             }
             else
             {
                 System.out.println("AAAAA");
                 System.out.println("uFund1:"+uFund1);
                 model.addAttribute("MonthBudget",uFund1.getuBudget());
                 System.out.println("MonthBudget:"+uFund1.getuBudget());
             }
             model.addAttribute("msg",id);
             model.addAttribute("msg1",user.getCapital());
             model.addAttribute("msg2",todayOut);
             model.addAttribute("msg3",sevendayOut);
             model.addAttribute("msg4",monthOut);
             model.addAttribute("msg5",password);
             model.addAttribute("msg6",todayIn);
             model.addAttribute("msg7",sevendayIn);
             model.addAttribute("msg8",monthIn);
             System.out.println(uFund1);

             return "account";
         }
         else
             return "fail";

    }

    @RequestMapping("/regist")
    public String regist(String id, String password, double capital)
    {
        User user = new User();
        user.setId(id);
        user.setPassword(password);
        user.setFlag(1);
        user.setCapital(capital);
        System.out.println("aaaaa"+user.toString());
        if(userService.regist(user)==1)
        {
            System.out.println(user.toString());
            //model.addAttribute("msg","注册成功"+user.getId());
            return "login";
        }
        else
        {
            return "fail";
        }
    }

    @RequestMapping("delete")
    public  String delete(String id,Model model)
    {

        if(userService.delete(id)==1)
        {
            System.out.println("delete success");
            model.addAttribute("msg","删除成功");
            return "sucess";
        }
        else
            return "fail";
    }

    @RequestMapping("updatePW")
    public String updatePW(String id,String password,Model model)
    {
        User user = new User();
        user.setId(id);
        user.setPassword(password);
        if(userService.updateUser(user)==1)
        {
            System.out.println("update success");
            model.addAttribute("msg","更新成功");
            return "sucess";
        }
        else
            return "fail";
    }


    @RequestMapping("SkipToAccount")
    public String SkipToAccount(HttpServletRequest request,HttpServletResponse response)
    {
        return "account";
    }

    @RequestMapping("SkipToForms")
    public String SkipToForms(Model model,HttpServletRequest request,HttpServletResponse response)
    {
        int i=0;
        double sort1=0,sort2=0,sort3=0,sort4=0,sort5=0,sort6=0,sort7=0;
        List<Out> list = outService.SelectSortMonth(request.getParameter("id"),"衣");
        for (i=0;i<list.size();i++)
            sort1 += list.get(i).getOutAmounts();
        list = outService.SelectSortMonth(request.getParameter("id"),"食");
        for (i=0;i<list.size();i++)
            sort2 += list.get(i).getOutAmounts();
        list = outService.SelectSortMonth(request.getParameter("id"),"住");
        for (i=0;i<list.size();i++)
            sort3 += list.get(i).getOutAmounts();
        list = outService.SelectSortMonth(request.getParameter("id"),"行");
        for (i=0;i<list.size();i++)
            sort4 += list.get(i).getOutAmounts();
        list = outService.SelectSortMonth(request.getParameter("id"),"娱乐学习");
        for (i=0;i<list.size();i++)
            sort5 += list.get(i).getOutAmounts();
        list = outService.SelectSortMonth(request.getParameter("id"),"医疗保健");
        for (i=0;i<list.size();i++)
            sort6 += list.get(i).getOutAmounts();
        list = outService.SelectSortMonth(request.getParameter("id"),"其他");
        for (i=0;i<list.size();i++)
            sort7 += list.get(i).getOutAmounts();
        model.addAttribute("sort1",sort1);
        model.addAttribute("sort2",sort2);
        model.addAttribute("sort3",sort3);
        model.addAttribute("sort4",sort4);
        model.addAttribute("sort5",sort5);
        model.addAttribute("sort6",sort6);
        model.addAttribute("sort7",sort7);

        return "forms";
    }

    @RequestMapping("SkipToInout")
    public ModelAndView SkipToInout(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView modelAndView = new ModelAndView();
        int i=0;
        List<Out> outList = outService.selectById(request.getParameter("id"));
        List<In> inList = inService.selectInById(request.getParameter("id"));
        for(i=0;i<outList.size();i++)
            System.out.println(outList.get(i));
        for (i=0;i<inList.size();i++)
            System.out.println(inList.get(i));

        modelAndView.addObject("outList",outList);
        modelAndView.addObject("inList",inList);
        modelAndView.setViewName("inout");
        return modelAndView;
    }

    @RequestMapping("YesterdayInout")
    public ModelAndView YesterdayInout(HttpServletRequest request, HttpServletResponse response)
    {
        System.out.println("YesterdayInoutaaaaaaaa");
        ModelAndView modelAndView = new ModelAndView();
        int i = 0;
        List<Out> outList = outService.selectAmoYesterday(request.getParameter("id"));
        List<In> inList = inService.selectInYesterday(request.getParameter("id"));
        for(i=0;i<outList.size();i++)
            System.out.println("Yesterday"+outList.get(i));
        for (i=0;i<inList.size();i++)
            System.out.println("Yesterday"+inList.get(i));

        modelAndView.addObject("outList",outList);
        modelAndView.addObject("inList",inList);
        modelAndView.setViewName("inout");
        return modelAndView;
    }

    @RequestMapping("SevenDayInout")
    public ModelAndView SevenDayInout(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView modelAndView = new ModelAndView();
        int i = 0;
        List<Out> outList = outService.selectAmoSevenDay(request.getParameter("id"));
        List<In> inList = inService.selectInSevenDay(request.getParameter("id"));
        for(i=0;i<outList.size();i++)
            System.out.println("SevenDay"+outList.get(i));
        for (i=0;i<inList.size();i++)
            System.out.println("SevenDay"+inList.get(i));

        modelAndView.addObject("outList",outList);
        modelAndView.addObject("inList",inList);
        modelAndView.setViewName("inout");
        return modelAndView;
    }

    @RequestMapping("MonthInout")
    public ModelAndView MonthInout(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView modelAndView = new ModelAndView();
        int i = 0;
        List<Out> outList = outService.selectAmoMonth(request.getParameter("id"));
        List<In> inList = inService.selectInMonth(request.getParameter("id"));
        for(i=0;i<outList.size();i++)
            System.out.println("Month"+outList.get(i));
        for (i=0;i<inList.size();i++)
            System.out.println("Month"+inList.get(i));

        modelAndView.addObject("outList",outList);
        modelAndView.addObject("inList",inList);
        modelAndView.setViewName("inout");
        return modelAndView;
    }

    @RequestMapping("Amo500")
    public ModelAndView Amo500(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView modelAndView = new ModelAndView();
        int i = 0;
        List<Out> outList = outService.Amo500(request.getParameter("id"));
        List<In> inList = inService.Amo500(request.getParameter("id"));
        for(i=0;i<outList.size();i++)
            System.out.println("Amo500"+outList.get(i));
        for (i=0;i<inList.size();i++)
            System.out.println("Amo500"+inList.get(i));

        modelAndView.addObject("outList",outList);
        modelAndView.addObject("inList",inList);
        modelAndView.setViewName("inout");
        return modelAndView;
    }

    @RequestMapping("Amo2000")
    public ModelAndView Amo2000(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView modelAndView = new ModelAndView();
        int i = 0;
        List<Out> outList = outService.Amo2000(request.getParameter("id"));
        List<In> inList = inService.Amo2000(request.getParameter("id"));
        for(i=0;i<outList.size();i++)
            System.out.println("Amo2000"+outList.get(i));
        for (i=0;i<inList.size();i++)
            System.out.println("Amo2000"+inList.get(i));

        modelAndView.addObject("outList",outList);
        modelAndView.addObject("inList",inList);
        modelAndView.setViewName("inout");
        return modelAndView;
    }

    @RequestMapping("Amobeyond2000")
    public ModelAndView Amobeyond2000(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView modelAndView = new ModelAndView();
        int i = 0;
        List<Out> outList = outService.Amobeyond2000(request.getParameter("id"));
        List<In> inList = inService.Amobeyond2000(request.getParameter("id"));
        for(i=0;i<outList.size();i++)
            System.out.println("Amobeyond2000"+outList.get(i));
        for (i=0;i<inList.size();i++)
            System.out.println("Amobeyond2000"+inList.get(i));

        modelAndView.addObject("outList",outList);
        modelAndView.addObject("inList",inList);
        modelAndView.setViewName("inout");
        return modelAndView;
    }

    @RequestMapping("SelectSort")
    public ModelAndView SelectSort(String sort,HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView modelAndView = new ModelAndView();
        int i = 0;
        List<Out> outList = outService.SelectSort(request.getParameter("id"),sort);
        List<In> inList = inService.SelectSort(request.getParameter("id"),sort);
        for(i=0;i<outList.size();i++)
            System.out.println("okout"+outList.get(i));
        for (i=0;i<inList.size();i++)
            System.out.println("okin"+inList.get(i));

        modelAndView.addObject("outList",outList);
        modelAndView.addObject("inList",inList);
        modelAndView.setViewName("inout");
        return modelAndView;
    }

    @RequestMapping("SkipToFaccount")
    public ModelAndView SkipToFaccount(Model model,HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView modelAndView = new ModelAndView();
        int i = 0;
        String fId = request.getParameter("id").substring(0,2);
        List<UFund> uFundList = uFundService.selectUFundByFId(fId);
        for(i=0;i<uFundList.size();i++)
            System.out.println("aaaaaaaaa"+uFundList.get(i));

        FFund fFund = new FFund();
        String strfB = request.getParameter("fBudget");
        String strfC = request.getParameter("fCapital");
        if("1".equals(request.getParameter("updateBudget")))
        {
            double budget = new Double(strfB);
            fFund.setfId(fId);
            fFund.setfBudget(budget);
            System.out.println("will updateBudget"+fundService.updateBudget(fFund));
        }
        if ("1".equals(request.getParameter("updateCapital")))
        {
            double capital = new Double(strfC);
            fFund.setfId(fId);
            fFund.setfCapital(capital);
            System.out.println("will updateCapital"+fundService.updateCapital(fFund));
        }
        fFund = fundService.selectFFund(fId);
        DecimalFormat df=new DecimalFormat("#.00");

        model.addAttribute("fExpenditure",df.format(fFund.getfExpenditure()));
        model.addAttribute("fIncome",df.format(fFund.getfIncome()));
        model.addAttribute("fCapital",df.format(fFund.getfCapital()));
        model.addAttribute("fBudget",df.format(fFund.getfBudget()));
        modelAndView.addObject("uFundList",uFundList);

        System.out.println("aaaaaa"+df.format(fFund.getfCapital()));
        modelAndView.setViewName("faccount");
        return modelAndView;
    }
}
