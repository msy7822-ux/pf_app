class User < ApplicationRecord
    # before_saveというコールバック変数は、オブジェクトが保存される前の段階で実行される
    # つまり全てのuserアカウントのemailは小文字で統一されてデータが保存される
    before_save { self.email = self.email.downcase }
    
    validates :name, presence: true, length: { maximum: 50 }
    validates :univ_name, presence: true
    
    # ※emailのフォーマットは正規表現で作る
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    # uniqueness { case_sensitive: false }とすることで、大文字小文字を無視した一意性の保持が可能
    # ※SNSリンクに関してはなくても大丈夫(userモデルのSNSリンクは個人のSNSを想定、postモデルのSNSリンクはサークルの公式SNSを想定)
    
    # セキュアなパスワードを生成する
    has_secure_password
    # パスワードカラムに関するバリデーション
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
    
    # Userのimage_urlのuploader
    # mount_uploader :image_url, ImageUploader
    # mount_uploader :image, ImageUploader
end
