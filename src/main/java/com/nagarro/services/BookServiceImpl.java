package com.nagarro.services;

import java.util.Arrays;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import com.nagarro.entity.Book;

public class BookServiceImpl implements BookService {
	private  RestTemplate restTemplate;

    public  BookServiceImpl()
    {

        restTemplate=new RestTemplate();
    }

    @Override
    public List<Book> getBookDetails() {
        ResponseEntity<Book[]> response = restTemplate.getForEntity("http://localhost:8065/getBookDetails", Book[].class);
        return Arrays.asList(response.getBody());
    }
    @Override
    public List<Book> getBookDetailsById( int bookCode) {
        ResponseEntity<Book[]> response = restTemplate.getForEntity("http://localhost:8065/getBookDetailsById/"+bookCode, Book[].class);
        return Arrays.asList(response.getBody());
    }
    @Override
    public void updateBookDetails(Book book)
    {
         String uri = "http://localhost:8065/updateBookDetails";
        restTemplate.put(uri, book);

    }

    @Override
    public void addBookDetails(Book book) {
        String uri = "http://localhost:8065/addBookDetails";
        @SuppressWarnings("unused")
		ResponseEntity<Book> response = restTemplate.postForEntity(uri, book, Book.class);
    }


}
