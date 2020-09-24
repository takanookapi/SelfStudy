require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    # ユーザー新規登録
    # 新規登録がうまくいく時

    it "全て存在すれば登録できる" do
      expect(@user).to be_valid
    end

    it "nameが6文字以下で登録できる" do
      @user.name = "aaaaaa"
      expect(@user).to be_valid
    end

    it "passwordが6文字以上であれば登録できる" do
      @user.password = "000000"
      @user.password_confirmation = "000000"
      expect(@user).to be_valid
    end

    # 新規登録がうまくいかない時
    it "nameが空だと登録できない" do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "passwordが5文字以下であれば登録できない" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "emailが空だと登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空だと登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "password_confirmationが空だと登録できない" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordとpassword_confirmationが一致しないと登録できない" do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors[:password_confirmation]).to be_present
    end
  end
end

# bundle exec rspec spec/models/user_spec.rb
