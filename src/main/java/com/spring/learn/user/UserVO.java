package com.spring.learn.user;

import oracle.sql.DATE;

public class UserVO {
  private String userId, grade, userName, userPwd, userBirth;
  private int points;
  private DATE userRegdate;

  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }

  public String getGrade() {
    return grade;
  }

  public void setGrade(String grade) {
    this.grade = grade;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getUserPwd() {
    return userPwd;
  }

  public void setUserPwd(String userPwd) {
    this.userPwd = userPwd;
  }

  public int getPoints() {
    return points;
  }

  public void setPoints(int points) {
    this.points = points;
  }

  public String getUserBirth() {
    return userBirth;
  }

  public void setUserBirth(String userBirth) {
    this.userBirth = userBirth;
  }

  public DATE getUserRegdate() {
    return userRegdate;
  }

  public void setUserRegdate(DATE userRegdate) {
    this.userRegdate = userRegdate;
  }

  @Override
  public String toString() {
    return "UserVO{" +
        "userId='" + userId + '\'' +
        ", grade='" + grade + '\'' +
        ", userName='" + userName + '\'' +
        ", userPwd='" + userPwd + '\'' +
        ", points=" + points +
        ", userBirth=" + userBirth +
        ", userRegdate=" + userRegdate +
        '}';
  }
}
