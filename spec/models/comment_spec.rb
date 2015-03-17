require 'rails_helper'

describe Comment do

  include TestFactories

  describe "after_create" do

    before do
      @post = associated_post
      @user = authenticated_user
      @comment = Comment.new(body: "Comment body text", post: @post, user_id: 1000)
    end

    it "sends an email to users you have favorited the post" do
      @user.favorites.where(post: @post).create

      allow( FavoriteMailer )
        .to receive(:new_comment)
        .with(@user, @post, @comment)
        .and_return( double(deliver_now: true) )

      @comment.save
    end

    it "does not send emails to users who haven't" do
       expect( FavoriteMailer )
         .not_to receive(:new_comment)
 
       @comment.save
     end
   end
 end