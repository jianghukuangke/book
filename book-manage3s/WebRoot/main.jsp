<%@ page  pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style>
  body{
      text-align:center;
  }
  th,td{
  border:2px solid gray;
  text-align:center;
  padding:3px 10px;
  }
  table{
  border-collapse:collapse; 
  margin:0 auto;
  }
 </style>
 <script language="javascript">
  function update(bookid,bookname,author,press,price,memo){

   var updatebook= document.getElementById("updatebookForm");

  updatebook.bookid.value=bookid;
  updatebook.oldbookid.value=bookid;
  updatebook.bookname.value=bookname;
  updatebook.author.value=author; 
  updatebook.press.value=press;
  updatebook.price.value=price;
  updatebook.memo.value=memo;
 }
  </script>
</head>

<body>
 <h2>图书信息管理</h2>
  <table >
   <tr><th>id</th><th>书名</th><th>作者</th><th>出版社</th><th>价格</th><th>备注</th><th>修改</th><th>删除</th></tr>
   <c:forEach items="${bookList}" var="book">
   <tr>
   <td>${book.bookid}</td>
   <td>${book.bookname}</td>
   <td>${book.author}</td>
   <td>${book.press}</td>
   <td>${book.price}</td>
   <td>${book.memo}</td>
   <td><a href="javascript:update('${book.bookid}','${book.bookname}','${book.author}','${book.press}',${book.price},'${book.memo}');">修改</a></td>
   <td><a href='deleteBook?bookid=${book.bookid}' onclick="return confirm('确实要删除该 记录吗？')">删除</a></td>
  </tr>
   </c:forEach>
 
 </table>
 <br/>
 <table>
 <tr><td>
<form action="addBook" method="post" >
    <table>
     <tr><td>书号</td><td><input type="text" name="bookid" onclick="document.getElementById('msg').innerHTML=''" /></td></tr>
    <tr><td>书名</td><td><input type="text" name="bookname" /></td></tr>
     <tr><td>作者</td><td><input type="text" name="author" /></td></tr>
     <tr><td>出版社</td><td><input type="text" name="press" /></td></tr>
     <tr><td>价格</td><td><input type="text" name="price" /></td></tr>
     <tr><td>备注</td><td><input type="text" name="memo" /></td></tr>
     <tr><td><input type="submit" value="添加"/></td><td><input type="reset" value="重置"/></td></tr>
       <tr><td colspan="2" style="color:red" id="msg">
            ${msg}
       </td></tr>
    </table>
    </form>    
    </td>
    
    <td>
    <form action="updateBook" method="post" id="updatebookForm">
   <table>
    <tr><td>书号</td><td><input type="text" name="bookid" /></td></tr>
    <tr><td>书名</td><td><input type="text" name="bookname" /></td></tr>
     <tr><td>作者</td><td><input type="text" name="author" /></td></tr>
     <tr><td>出版社</td><td><input type="text" name="press" /></td></tr>
     <tr><td>价格</td><td><input type="text" name="price" /></td></tr>
     <tr><td>备注</td><td><input type="text" name="memo" /></td></tr>
     <tr><td><input type="submit" value="更新"/></td><td><input type="reset" value="重置"/></td></tr>
   
    </table>
     <input type="hidden" name="oldbookid"  />
    </form>
    </td>
    </tr>
    </table>
 
  
</body>
</html>
