class Prototype < ApplicationRecord
  has_many :comments #, dependent: :destroy ⬅︎関連づけされたユーザーテーブルのデータも消える記述。これのために削除機能実装ができなかった
  belongs_to :user
  has_one_attached :image
  
  validates :title, :concept, :catchcopy, :image, presence: true
end
