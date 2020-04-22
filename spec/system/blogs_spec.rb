require 'rails_helper'

RSpec.describe 'Blogs', type: :system do
  before do
    visit new_user_path
    fill_in 'user_name', with: 'test User1'
    fill_in "user_email", with: 'test1@example.com'
    fill_in "user_password", with: 'testtest'
    fill_in "user_password_confirmation", with: 'testtest'
    click_button "Create User"
  end

  describe "新規登録機能" do
    context "正常な入力をして新規登録した場合" do
      it "ブログ一覧画面に登録したブログが表示されること" do
        click_link "New Blog"
        fill_in "blog_title", with: 'test Blog1'
        fill_in "blog_content", with: 'test Content1'
        click_button "Create Blog"
        expect(page).to have_content "test Blog1"
      end
    end
  end
end