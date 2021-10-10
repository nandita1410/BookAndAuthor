package com.nagarro.services;

import java.util.List;

import com.nagarro.entity.Book;

public interface BookService {
	List<Book> getBookDetails();
	 void updateBookDetails(Book book);
	 void addBookDetails(Book book);
	 List<Book> getBookDetailsById(int bookCode);
	}