package com.fuzhu.controller;

import com.alibaba.fastjson.JSON;
import com.fuzhu.entity.Book;
import com.fuzhu.entity.Category;
import com.fuzhu.entity.Order;
import com.fuzhu.service.BookService;
import com.fuzhu.service.CategoryService;
import com.fuzhu.service.OrderService;
import com.fuzhu.service.UserService;
import com.fuzhu.utils.CookieUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.*;

/**
 * Created by 符柱成 on 2017/11/28.
 */
@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;
    @Autowired
    private UserService userService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private CategoryService categoryService;

    //所有用户接口
    @RequestMapping(value = "getAllBook", method = {RequestMethod.GET})
    public String getAllBook(@RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo, HttpServletRequest request) {
        List<Book> books = bookService.getAllBook();
        String userId = CookieUtil.getByName(request, "isLogin");
        if (userId == null || "".equals(userId)) {
            request.setAttribute("isLogin", "notLogin");
        } else {
            request.setAttribute("isLogin", "Login");
        }

        request.setAttribute("books", books);
        request.setAttribute("pageNo", pageNo);

        return "buy/BookList";
    }

    @RequestMapping(value = "bookOrder", method = {RequestMethod.GET, RequestMethod.POST})
    public String butOrder(@RequestParam(value = "bookId", required = true) int bookId, HttpServletRequest request) throws Exception {
        String userId = CookieUtil.getByName(request, "isLogin");
        if (userId == null || "".equals(userId)) {
            return "redirect:/user/loginPage";
        }
        Book book = bookService.getOneBook(Long.valueOf(bookId));
        request.setAttribute("book", book);
        return "buy/BookOrder";
    }

    @RequestMapping(value = "buyBook", method = {RequestMethod.GET, RequestMethod.POST})
    public String buyBook(@RequestParam(value = "bookId", required = true) int bookId, @RequestParam(value = "bookNum", required = true) int bookNum, @RequestParam(value = "bookPrice", required = true) int bookPrice, @RequestParam(value = "telephone", required = true) String telephone, @RequestParam(value = "description", required = true) String description, @RequestParam(value = "name", required = true) String name, @RequestParam(value = "targetAddress", required = true) String targetAddress, HttpServletRequest request) {
        String userId = CookieUtil.getByName(request, "isLogin");
        if (userId == null || "".equals(userId)) {
            return "buy/BookList";
        }
        Order order = new Order();
        order.setDescription(description);
        order.setName(name);
        order.setOrderStatus("支付成功");
        order.setUserId(Long.valueOf(userId));
        order.setBookNum(bookNum);
        order.setPrice(bookNum * bookPrice);
        order.setTargetAddress(targetAddress);
        order.setTelephone(telephone);
        //插入订单
        orderService.insert(order);
        Book book = bookService.getOneBook(Long.valueOf(bookId));
        //改书的状态
        book.setBookNum(book.getBookNum() - bookNum);
        bookService.updateByPrimaryKey(book);
        // TODO 改订单状态，改商品状态
        return "success";
    }

    @RequestMapping(value = "salePage", method = {RequestMethod.GET, RequestMethod.POST})
    public String salePage(HttpServletRequest request) throws Exception {
        String userId = CookieUtil.getByName(request, "isLogin");
        if (userId == null || "".equals(userId)) {
            return "buy/BookList";
        }
        return "sale/SalePage";
    }

    @RequestMapping(value = "sale", method = {RequestMethod.GET, RequestMethod.POST})
    public String sale(@RequestParam(value = "author", required = true) String author,
                       @RequestParam(value = "bookName", required = true) String bookName,
                       @RequestParam(value = "pubilshing", required = true) String pubilshing,
                       @RequestParam(value = "totalPage", required = true) int totalPage,
                       @RequestParam(value = "price", required = true) int price,
                       @RequestParam(value = "wordNumber", required = true) int wordNumber,
                       @RequestParam(value = "bookNum", required = true) int bookNum,
                       HttpServletRequest request, @RequestParam(value = "pic", required = false) MultipartFile file) throws Exception {
        String userId = CookieUtil.getByName(request, "isLogin");
        if (userId == null || "".equals(userId)) {
            return "buy/BookList";
        }
        Book book = new Book();
        book.setAuthor(author);
        book.setBookName(bookName);
        book.setPubilshing(pubilshing);
        book.setTotalPage(totalPage);
        book.setOwnerId(Long.valueOf(userId));
        book.setWordNumber(wordNumber);
        book.setPrice(price);
        book.setBookNum(bookNum);
        //(从附件中获取文件名)
        long time = new Date().getTime();
        savePic(file.getInputStream(), author + bookName + time+".jpg");
        book.setBookImage(author + bookName + time+".jpg");
        bookService.insert(book);
        return "sale/success";
    }

    private void savePic(InputStream inputStream, String fileName) {

        OutputStream os = null;
        try {
//            String path = "D:\\testFile\\";
            String pathname = Thread.currentThread().getContextClassLoader()
                    .getResource("").getPath();
            pathname = StringUtils.substringBeforeLast(pathname, "/");
            pathname = StringUtils.substringBeforeLast(pathname, "/");
            pathname = pathname + "/img";
            // 2、保存到临时文件
            // 1K的数据缓冲
            byte[] bs = new byte[1024];
            // 读取到的数据长度
            int len;
            // 输出的文件流保存到本地文件

            File tempFile = new File(pathname);
            if (!tempFile.exists()) {
                tempFile.mkdirs();
            }
            os = new FileOutputStream(tempFile.getPath() + File.separator + fileName);
            // 开始读取
            while ((len = inputStream.read(bs)) != -1) {
                os.write(bs, 0, len);
            }

        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 完毕，关闭所有链接
            try {
                os.close();
                inputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    @ResponseBody
    @RequestMapping(value = "getParentTypeList", method = {RequestMethod.GET, RequestMethod.POST})
    public String getParentTypeList(@RequestParam(value = "type", required = true) String type, HttpServletRequest request) throws Exception {
        String userId = CookieUtil.getByName(request, "isLogin");
        if (userId == null || "".equals(userId)) {
            return "buy/BookList";
        }
        List<Category> categoryList  = categoryService.getParentTypeList();
        return JSON.toJSONString(categoryList);
    }
    @RequestMapping(value = "search", method = {RequestMethod.GET, RequestMethod.POST})
    public String search(HttpServletRequest request,String typeList) throws Exception {
        String userId = CookieUtil.getByName(request, "isLogin");
        if (userId == null || "".equals(userId)) {
            return "buy/BookList";
        }
        List<Book> books = bookService.getAllBookByType(Integer.valueOf(typeList));
        request.setAttribute("books", books);
        return "buy/BookList";
    }
}
