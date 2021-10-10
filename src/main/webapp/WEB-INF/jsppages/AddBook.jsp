<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add New Book</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

    <style>
    
      body
        {
         height:450px;
        }
    
   .col-25
        {
            float: left;
            width: 20%;
        }

        .col-75 {
            float: left;
            width: 75%;
        }
        .col
        {
        margin-left: 50px;
        }
        
        .md-textarea {
            width: 50%;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 2px;
            resize: vertical;
            max-width: 280px;
        }

        input[type=text], input[type=email] {
            width: 50%;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 2px;
            resize: vertical;
            max-width: 280px;
        }

        .form 
        {
            align-items: center;
        }

        fieldset.scheduler-border {
            border: 3px groove black !important;
            padding: 0 1.4em 1.4em 1.4em !important;
            margin-top: -50px;
            -webkit-box-shadow: 0px 0px 0px 0px #000;
            box-shadow: 0px 0px 0px 0px #000;
        }

        legend.scheduler-border {
            width: inherit; /* Or auto */
            padding: 0 10px; /* To give a bit of padding on the left and right */
            border-bottom: none;
        }
    </style>
</head>

<body>
<header style="background-image: linear-gradient(#AFAEFD, #efe8de);">
		<H3 class="text-center my-10" style="padding-top: 6px;">Add Book Details</H3>
		<span class="navbar-brand mb-0 h1"
              style="font-color: #6AABD2; font-size: 20px">Welcome!</span> <a href="logout" style="float: right;font-size: 20px">Logout</a>
	</header>
<div class="d-md-flex h-100 form">
    <div class="container-fluid">
        <fieldset class="scheduler-border">
            <legend class="scheduler-border">Book Listings</legend>
            <form action="add-book">
                <div class="row form-group">
                    <div class="col-25">
                        <label for="name"class="col-form-label">BookName:</label>
                    </div>
                    <div class="col-75">
                        <input type="text" class="form-control" id="name" name="bookname" pattern=".{3,100}" required>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-25">
                        <label for="author"class="col-form-label">Author:</label>
                    </div>
                    <div class="col-75">
                        <input type="text" class="form-control" id="author" name="author"  pattern=".{5,500}"required >
                    </div>
                </div>


                <div class="row form-group">
                    <div class="col-25">
                        <label  for="dateadded"class="col-form-label">Added On:</label>
                    </div>
                    <div class="col-75">
                        <input type="text" class="form-control" id="dateadded" name="dateadded" required>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col">
                        <button type="submit" class="btn btn-success" id="submit">Submit</button>
                        <button type="button" class="btn btn-danger" onclick="window.history.back();">Cancel</button>
                    </div>
                </div>
            </form>
        </fieldset>
    </div>
</div>

<div class="footer">
<footer style="background-image: linear-gradient(#AFAEFD, #efe8de); margin-top:10px">
		<H4 class="text-center my-10 ">@copyright 2020-2021 Fresher Training </H4>
	</footer>
     
</div>
</body>
</html>

>