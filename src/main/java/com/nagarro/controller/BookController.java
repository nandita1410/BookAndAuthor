package com.nagarro.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.compress.utils.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nagarro.entity.Book;
import com.nagarro.services.BookService;
import com.nagarro.services.BookServiceImpl;
import com.nagarro.utility.ExcelFileExporter;

@Controller
public class BookController {
	 private BookService bookService;

	    public BookController()
	    {
	        bookService=new BookServiceImpl();
	    }
	    /*
	   This mapping will be called when user click on edit button
	   */
	    @RequestMapping("/editBook")
	    public ModelAndView UpdateBook(HttpServletRequest request, HttpServletResponse response)
	    {
	        int bookCode= Integer.parseInt(request.getParameter("bookCode"));
	        Book book=new Book();
	        List<Book> bookDetails = bookService.getBookDetailsById(bookCode);
	        for(Book bookDetail:bookDetails)
	        {
	            if(bookCode == bookDetail.getBookcode())
	            {
	                book = bookDetail;
	                break;
	            }
	        }

	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("EditBook");
	        mv.addObject("book", book);	//passing book object to edit-book-details

	        return mv;


	    }
	   
	    /*
	  This mapping will be called when user click on Save Button in update book page
	  */
	    @RequestMapping("/updateBook")
	    public ModelAndView UpdateBookDetails(HttpServletRequest request, HttpServletResponse response)
	    {
	        int bookCode = Integer.parseInt(request.getParameter("bookcode"));
	        String bookName = request.getParameter("bookname");
	        String author = request.getParameter("author");
	        String dateadded = request.getParameter("dateadded");

	        Book book = new Book();
	        book.setBookcode(bookCode);
	        book.setBookname(bookName);
	        book.setAuthor(author);
	        book.setDateadded(dateadded);
	        bookService.updateBookDetails(book);

	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("Book");
	        return mv;

	    }
	    /*
	  This mapping will be called when user click on Save Button
	  */
	    @RequestMapping("/add-book")
	    public ModelAndView addBook(HttpServletRequest request, HttpServletResponse response) {
	        String bookName = request.getParameter("bookname");
	        String author = request.getParameter("author");
	        String dateadded = request.getParameter("dateadded");

	        Book book = new Book();
	        book.setBookname(bookName);
	        book.setAuthor(author);
	        book.setDateadded(dateadded);
	        bookService.addBookDetails(book);
	        ModelAndView mv=new ModelAndView();
	        mv.setViewName("Book");
	        return mv;

	    }
	    /*
	   This mapping will be called when user click on Logout Button
	   */
	    @RequestMapping("/logout")
	    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
	        ModelAndView mv = new ModelAndView("LibrarianLogin");
	        return mv;

	    }
	    /*
	  This mapping will be called when user click on upload Button
	  */
	    @RequestMapping("/upload")
	    public ModelAndView uploadBook(HttpServletRequest request, HttpServletResponse response) {
	        ModelAndView mv = new ModelAndView("AddBook");
	        return mv;
	    }
	    /*
	   This mapping will be called when user click on download button
	   */
	    @RequestMapping("/download/customers.xlsx")
	    public void downloadCsv(HttpServletResponse response) throws IOException {
	        response.setContentType("application/octet-stream");
	        response.setHeader("Content-Disposition", "attachment; filename=customers.xlsx");
	        ByteArrayInputStream stream = ExcelFileExporter.contactListToExcelFile(bookService.getBookDetails());
	        IOUtils.copy(stream, response.getOutputStream());
	    }

	}