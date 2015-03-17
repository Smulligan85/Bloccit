require 'rails_helper'

describe User do

  include TestFactories

  describe '#favorited(post)' do

    before do
      @post = associated_post
      @user = authenticated_user
    end

    it "returns 'nil' if the user has not favorited the post" do
    end

    it "returns the appropriate favorited if it exists" do
    end
  end
end