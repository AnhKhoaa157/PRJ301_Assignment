package dto;

import java.sql.Timestamp;

public class UserDTO {
    private int userNumber; // Auto Increment
    private String userID; // Primary Key
    private String userName;
    private String password;
    private String email;
    private String phone;
    private String address;
    private String roleID; // 'Customer' or 'Admin'
    private Timestamp createdAt;

    // Constructors
    public UserDTO() {}

    public UserDTO(int userNumber, String userID, String userName, String password, String email, String phone, String address, String roleID, Timestamp createdAt) {
        this.userNumber = userNumber;
        this.userID = userID;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.roleID = roleID;
        this.createdAt = createdAt;
    }

    public UserDTO(String userID, String userName, String email, String phone, String address, String roleID, Timestamp createdAt) {
        this.userID = userID;
        this.userName = userName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.roleID = roleID;
        this.createdAt = createdAt;
    }

    public UserDTO(String userID, String userName, String password, String email, String phone, String address, String roleID) {
        this.userID = userID;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.roleID = roleID;
    }
    
    
    // Getters and Setters
    public int getUserNumber() { return userNumber; }
    public void setUserNumber(int userNumber) { this.userNumber = userNumber; }

    public String getUserID() { return userID; }
    public void setUserID(String userID) { this.userID = userID; }

    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getRoleID() { return roleID; }
    public void setRoleID(String roleID) { this.roleID = roleID; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    @Override
    public String toString() {
        return "UserDTO{" +
                "userNumber=" + userNumber +
                ", userID='" + userID + '\'' +
                ", userName='" + userName + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", roleID='" + roleID + '\'' +
                ", createdAt=" + createdAt +
                '}';
    }
}
