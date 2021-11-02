class GroupMailer < ApplicationMailer

  def send_mail(users, mail_title, mail_content)
    @mail_title = mail_title
    @mail_content = mail_content
    @users = users
    mail to: users.map{|u| u.email} , subject: mail_title
  end

end
