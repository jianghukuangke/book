package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import util.JdbcUtil;
import vo.Book;

public class BookDao {
		
	public void add(Book book) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = JdbcUtil.getConnection();
			String sql = "insert into book (bookid,bookname,author,press,price,memo)  values (?,?,?,?,?,?) ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, book.getBookid());
			ps.setString(2,book.getBookname());
			ps.setString(3,book.getAuthor());
			ps.setString(4, book.getPress());
			ps.setFloat(5, book.getPrice());
			ps.setString(6, book.getMemo());
			ps.executeUpdate();
		} finally {
			JdbcUtil.free(null, ps, conn);
		}
	}

	public void delete(String bookid) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = JdbcUtil.getConnection();
			String sql = "delete from book where bookid=? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, bookid);
			ps.executeUpdate();
		} finally {
			JdbcUtil.free(null, ps, conn);
		}
	}

	
	public void update(Book book,String oldBookId) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = JdbcUtil.getConnection();
			String sql = "update book set bookid=?,bookname=?,author=?,press=?,price=?,memo=?  where bookid=?  ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, book.getBookid());
			ps.setString(2, book.getBookname());
			ps.setString(3,book.getAuthor());
			ps.setString(4,book.getPress());
			ps.setFloat(5, book.getPrice());
			ps.setString(6, book.getMemo());
			ps.setString(7, oldBookId);
			ps.executeUpdate();
		} finally {
			JdbcUtil.free(null, ps, conn);
		}
	}

	

	public Book findBookById(String bookId) throws Exception{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Book book=null;
		try {
			conn = JdbcUtil.getConnection();
			String sql = "select * from  book where bookId=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, bookId);
			rs = ps.executeQuery();
			if (rs.next()) {
				book = new Book();
				   book.setBookid(rs.getString("bookid"));
				    book.setBookname(rs.getString("bookname"));
				    book.setAuthor(rs.getString("author"));
				    book.setPress(rs.getString("press"));
				    book.setPrice(rs.getFloat("price"));
				    book.setMemo(rs.getString("memo"));
			    
			}
		} finally {
			JdbcUtil.free(rs, ps, conn);
		}
		return book;
	}
	public List<Book> query() throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Book> bookList = new ArrayList<Book>();
		try {
			conn = JdbcUtil.getConnection();
			String sql = "select * from  book ";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Book book = new Book();
			    book.setBookid(rs.getString("bookid"));
			    book.setBookname(rs.getString("bookname"));
			    book.setAuthor(rs.getString("author"));
			    book.setPress(rs.getString("press"));
			    book.setPrice(rs.getFloat("price"));
			    book.setMemo(rs.getString("memo"));
				bookList.add(book);
			}
		} finally {
			JdbcUtil.free(rs, ps, conn);
		}
		return bookList;
	}

	
	
	}

