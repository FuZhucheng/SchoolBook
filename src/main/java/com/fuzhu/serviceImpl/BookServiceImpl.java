package com.fuzhu.serviceImpl;

import com.fuzhu.dao.BookMapper;
import com.fuzhu.entity.Book;
import com.fuzhu.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 符柱成 on 2017/11/29.
 */
@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookMapper bookMapper;
    @Override
    public List<Book> getAllBook() {

        return  bookMapper.getAllBook();
    }

    public Book getOneBook(Long bookId){
        return bookMapper.selectByPrimaryKey(bookId);
    }
    public  int updateByPrimaryKey(Book record){
        return bookMapper.updateByPrimaryKey(record);
    }

    @Override
    public int insert(Book record) {
        return  bookMapper.insert(record);
    }

    @Override
    public List<Book> getAllBookByType(Integer typeId) {
        return bookMapper.getAllBookByType(typeId);
    }

}
