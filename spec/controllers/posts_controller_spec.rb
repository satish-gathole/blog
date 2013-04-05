require 'spec_helper'
include Devise::TestHelpers

describe PostsController do

  let(:user) { FactoryGirl.create(:user) }

  describe "Post creation" do
    before { sign_in user }
    it "should not create a post without content" do
        post :create, :post => {:content => ""}
        assert_equal 302, @response.status
        assert_equal 0, user.posts.count
      end

      it "create a post" do
        post :create, :post => {:content => "testing"}
        assert_equal 302, @response.status
        assert_equal 1, user.posts.count
      end
  end


  describe "post destruction" do
    before { @post = FactoryGirl.create(:post, user: user) }
    before { sign_in user }
    describe "as correct user" do
      it "should delete a post" do
        assert_equal 1, user.posts.count
        delete :destroy, :id => @post.id
        assert_equal 302, @response.status
        assert_equal 0, user.posts.count
      end
    end
  end

end