package com.fuzhu.service;

import com.fuzhu.entity.Book;

import java.util.List;

/**
 * Created by 符柱成 on 2017/11/29.
 */
public interface BookService {
    List<Book> getAllBook();
    Book getOneBook(Long bookId);
    int updateByPrimaryKey(Book record);

    int insert(Book record);
}
