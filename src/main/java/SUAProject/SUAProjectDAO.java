package SUAProject;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class SUAProjectDAO extends JDBConnect {
	public SUAProjectDAO(ServletContext app) {
		super(app);
	}
	
	// 회원정보 입력은 위한 메서드 정의
	public int registInsert(SUAProjectDTO dto) {
		int result = 0;
		String query = "INSERT INTO regist_member VALUES ("
					+ " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?"
					+ " )";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getTel());
			psmt.setString(5, dto.getMobile());
			psmt.setString(6, dto.getEmail());
			psmt.setString(7, dto.getMailing());
			psmt.setString(8, dto.getZipcode());
			psmt.setString(9, dto.getAddr1());
			psmt.setString(10, dto.getAddr2());

			result = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
