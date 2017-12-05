package com.fuzhu.controller;

import com.fuzhu.entity.Book;
import com.fuzhu.entity.User;
import com.fuzhu.service.BookService;
import com.fuzhu.service.UserService;
import com.fuzhu.utils.CookieUtil;
import com.fuzhu.utils.JavaWebToken;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 后台页面相关接口
 * Created by xjk on 17-3-11.
 */
@Controller
@RequestMapping("/backend")
public class BackendController {

    public final Logger log = LoggerFactory.getLogger(getClass());

    @Autowired
    private UserService userService;
    @Autowired
    private BookService bookService;

    @RequestMapping(value = "/loginPage", method = {RequestMethod.GET})
    public String loginPage() {
        return "login";
    }

    @RequestMapping(value = "/login", method = {RequestMethod.POST})
    public String login(HttpServletRequest request, HttpServletResponse response, RedirectAttributes model, String account, String password) {
        if ("edehou".equals(account) && "aidou2017".equals(password)) {
            Map<String, Object> loginInfo = new HashMap<>();
            loginInfo.put("isLogin", "yes!");
            loginInfo.put("timestamp", new Date());
            String sessionId = JavaWebToken.createJavaWebToken(loginInfo);
            CookieUtil.addCookie(response, "isLogin", sessionId);
            return "redirect:user/getAllUser";
        } else {
            model.addFlashAttribute("error", "密码错误");
            return "redirect:loginPage";
        }
    }

    @RequestMapping(value = "/logOut", method = {RequestMethod.GET})
    public String loginOut(HttpServletRequest request, HttpServletResponse response) {
        CookieUtil.deleteCookie(response, "isLogin");
        return "redirect:loginPage";
    }

    @RequestMapping(value = "user/getAllUser", method = {RequestMethod.GET})
    public String  accusationPage(@RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo, HttpServletRequest request) {
        List<User> users = userService.getAllUser();
        request.setAttribute("users", users);
        request.setAttribute("pageNo", pageNo);
        return "UserManagement";
    }
    @RequestMapping(value = "user/deleteOneUser", method = {RequestMethod.GET})
    public String deleteOneUser(Integer userId,HttpServletRequest request){
        userService.deleteByPrimaryKey(Long.valueOf(userId));
        List<User> users = userService.getAllUser();
        request.setAttribute("users", users);
        request.setAttribute("pageNo", 0);
        return "UserManagement";
    }
    //所有用户接口
    @RequestMapping(value = "book/getAllBook", method = {RequestMethod.GET})
    public String getAllBook(@RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo, HttpServletRequest request) {
        List<Book> books = bookService.getAllBook();
        request.setAttribute("books", books);
        request.setAttribute("pageNo", pageNo);
        return "BookManagement";
    }

}
