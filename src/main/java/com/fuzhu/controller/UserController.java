package com.fuzhu.controller;

import com.fuzhu.entity.Order;
import com.fuzhu.entity.User;
import com.fuzhu.service.OrderService;
import com.fuzhu.service.UserService;
import com.fuzhu.utils.CookieUtil;
import com.fuzhu.utils.JavaWebToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 符柱成 on 2017/11/29.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private OrderService orderService;



    @RequestMapping(value = "/registerPage", method = {RequestMethod.GET})
    public String registerPage(HttpServletRequest request) {
        return "register/RegisterPage";
    }

    @RequestMapping(value = "/register", method = {RequestMethod.GET,RequestMethod.POST})
    public String register(HttpServletRequest request, User user) {
        Map<String,Object> map = new HashMap<>();
        map.put("account", user.getAccount());
        map.put("password", user.getPassword());
        User user1 = userService.selectByAccount(map);
        if (user1 != null){
            return "user/error";
        }else {
            user.setCreateTime(new Date());
            user.setRoleId(Long.valueOf(3));
            userService.insert(user);
        }
        return "user/success";
    }


    @RequestMapping(value = "/loginPage", method = {RequestMethod.GET})
    public String loginPage(HttpServletRequest request, String account, String password) {
        return "buy/login";
    }


    @RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
    public String login(String account,String password, HttpServletResponse response) {
        User user = userService.login(account,password);
        if (user == null) {
            return "buy/login";
        } else {
            //把用户登录信息放进Session
            Map<String, Object> loginInfo = new HashMap<>();
            loginInfo.put("isLogin", "yes!");
            loginInfo.put("timestamp", new Date());
            String sessionId = JavaWebToken.createJavaWebToken(loginInfo);
            CookieUtil.addCookie(response, "isLogin", String.valueOf(user.getId()));
            return "redirect:../book/getAllBook";
        }
    }

    @RequestMapping(value = "/logOut", method = {RequestMethod.GET})
    public String loginOut(HttpServletRequest request, HttpServletResponse response) {
        CookieUtil.deleteCookie(response, "isLogin");
        return "redirect:loginPage";
    }
    @RequestMapping(value = "/updateInfoPage", method = {RequestMethod.GET})
    public String updateInfoPage(Integer userId,HttpServletRequest request) {
        User user = userService.selectByPrimaryKey(Long.valueOf(userId));
        request.setAttribute("user",user);
        return "UpdateInfoPage";
    }
    @RequestMapping(value = "updateInfo", method = {RequestMethod.POST})
    public String  accusationPage(User user, HttpServletRequest request) {
        user.setCreateTime(new Date());
        userService.updateByPrimaryKey(user);
        List<User> users = userService.getAllUser();
        request.setAttribute("users", users);
        request.setAttribute("pageNo", 0);
        return "redirect:/backend/user/getAllUser";
    }
    @RequestMapping(value = "/getUserInfoByGoodsId", method = {RequestMethod.GET})
    public String getUserInfoByGoodsId(HttpServletRequest request,@RequestParam(value = "bookId", required = true) int bookId) {
        User user = userService.getUserInfoByGoodsId(bookId);
        request.setAttribute("user",user);
        return "UserInfoPage";
    }
    @RequestMapping(value = "/getMyOrder", method = {RequestMethod.GET})
    public String getMyOrder(HttpServletRequest request) {
        String userId = CookieUtil.getByName(request, "isLogin");
        if (userId == null || "".equals(userId)) {
            return "buy/BookList";
        }
        List<Order> orderList = orderService.getMyOrder(Long.valueOf(userId));
        request.setAttribute("orderList",orderList);
        return "buy/OrderList";
    }
}
