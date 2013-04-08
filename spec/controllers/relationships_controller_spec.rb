require 'spec_helper'

describe RelationshipsController do

  user = FactoryGirl.create(:user, username: "newuser", email: "newuser@example.com")
  other_user = FactoryGirl.create(:user, username: "other", email: "other@example.com")

  before { sign_in user }

  describe "visit to other users profile and follow" do

    it "should create a relation between user and otheruser" do
      post :create, :relationship => {:followed_id => other_user.id}
      assert_equal 302, @response.status
      assert_include user.followed_users, other_user
      assert_include other_user.followers, user
    end
  end

  describe "visit to other users profile and unfollow" do

    it "should delete a relation between user and otheruser" do
      post :create, :relationship => {:followed_id => other_user.id}
      relationship = user.relationships.find_by_followed_id(other_user)

      expect do
        xhr :delete, :destroy, id: relationship.id
      end.to change(Relationship, :count).by(-1)

    end
  end


end