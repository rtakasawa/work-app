require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe "サインアップ機能" do
    context "ユーザーが正常な値を入力し、サインアップ処理を行った場合" do
      it "ブログ一覧画面に繊維すること" do
        visit new_user_path
        fill_in 'user_name', with: 'test User1'
        fill_in "user_email", with: 'test1@example.com'
        fill_in "user_password", with: 'testtest'
        fill_in "user_password_confirmation", with: 'testtest'
        click_button "Create User"
        expect(page).to have_content "登録に成功しました！"
      end
    end
  end
  
  describe "ログイン機能" do
    context "ユーザーが正常な値を入力し、サインイン処理を行った場合" do
      before do
        User.create(name: 'test User2', 
                    email: 'test2@example.com', 
                    password: 'testtest', 
                    password_confirmation: 'testtest')
      end
      it "ブログ一覧画面に繊維すること" do
        visit new_session_path
        fill_in 'session_email', with: 'test2@example.com'
        fill_in "session_password", with: 'testtest'
        click_button "Save Session"
        expect(page).to have_content "ログインに成功しました！"

      end
    end
  end

end