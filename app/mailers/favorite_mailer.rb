class FavoriteMailer < ActionMailer::Base

  default from: 'sean.mulligan85@gmail.com'

  def new_comment(user, post, comment)

    # New Headers
    headers["Message-ID"] = "comments/#{comment.id}@your-app-name.example"
    headers["In-Reply_Do"] = "post/#{post.id}@your-app-name.example"
    headers["References"] = "post/#{post.id}@your-app-name.example"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
