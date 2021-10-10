<%@ page import="java.util.List" %>
<%@ page import="com.nagarro.entity.Book" %>
<%@ page import="com.nagarro.services.BookService" %>
<%@ page import="com.nagarro.services.BookServiceImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

    <style>
        fieldset.scheduler-border {
            border: 3px groove black !important;
            padding: 0 1.4em 1.4em 1.4em !important;
            margin-top: 20px;
            -webkit-box-shadow:  0px 0px 0px 0px #000;
            box-shadow:  0px 0px 0px 0px #000;
        }

         body{
    height:650px;}
    
        legend.scheduler-border {
            width:inherit; /* Or auto */
            padding:0 10px; /* To give a bit of padding on the left and right */
            border-bottom:none;
        }
        .two_buttons{
            align-items: flex-start;
        }



        input[type=submit], input[type=button] {
            background-color: #4287f5;
            color: black;
            padding-right: 30%;

        }

    </style>
    <title>Book</title>
</head>




<body>

<header style="background-image: linear-gradient(#AFAEFD, #efe8de);">
		<H3 class="text-center my-10" style="padding-top: 10px">Book Details</H3>
		<span class="navbar-brand mb-0 h1"
              style="font-color: #6AABD2; font-size: 20px">Welcome!<c:out value=" ${user.username}"></c:out></span> <a href="logout" style="float: right;font-size: 20px">Logout</a>
	</header>

<div class="container">
    <fieldset class="scheduler-border">
    <legend class="scheduler-border">Book Listings</legend>
    <div class="mt-3 p-4 d-flex mx-30x two_buttons">
        <table>
            <tr>
                <form action="upload">
                    <input class="mr-2" type="submit" name="updateBook"
                           value="Add Book Details" />
                </form>
            </tr>
            <tr>

            </tr>
            <tr>
                <form action="download/customers.xlsx">
                    <input class="mr-2" type="submit" name="downloadBook"
                           value="Download Book Details" />
                </form>
            </tr>
        </table>


    </div>


    <div class="container-fluid" style="align-content: center"> 
        <table class="table table-bordered table-condensed" id="bookList" style="bordercolor:black">
            <thead class="text-dark">
            <tr>
                <th>Book Code</th>
                <th>Book name</th>
                <th>Author</th>
                <th>Date Added</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody >
            <%!
                int bookCode;
                String bookName;
                String author;
                String dateadded;

            %>
            <%
                BookService bookService = new BookServiceImpl();
                List<Book> bookDetails = bookService.getBookDetails();
                for (Book book : bookDetails) {
                    bookCode = book.getBookcode();
                    bookName = book.getBookname();
                    author = book.getAuthor();
                    dateadded = book.getDateadded();
            %>
            <tr>
                <td><%=bookCode %>
                </td>
                <td><%=bookName %>
                </td>
                <td><%=author %>
                </td>
                <td><%=dateadded %>
                </td>
                <td>
                    <a href="editBook?bookCode=<%=bookCode%>">Edit </a>
               </td>

            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
    </fieldset>
</div>

<div class="footer">
<footer style="background-image: linear-gradient(#AFAEFD, #efe8de); margin-top:60px">
		<H4 class="text-center my-10 ">@copyright 2020-2021 Fresher Training </H4>
	</footer>
     
</div>

</body>
</html>
