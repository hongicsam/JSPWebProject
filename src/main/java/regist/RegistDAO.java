package regist;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class RegistDAO extends JDBConnect{
	
	public RegistDAO(ServletContext application) {
		super(application);
	}

	public int registInsert(RegistDTO dto) {
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
	
	public boolean idOverlap(String id) {
		boolean retValue = true;
		String sql = "SELECT COUNT(*) FROM regist_member WHERE id=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			rs.next();
			int result = rs.getInt(1);
			if(result==1) {
				retValue = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return retValue;
	}
}
