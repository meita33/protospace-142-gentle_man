class Prototype < ApplicationRecord
  has_many :comnmets #, dependent: :destroy ⬅︎関連づけされたユーザーテーブルのデータも消える記述。これのために削除機能実装ができなかった
  belongs_to :user
  has_one_attached :image
  
  validates :title,      presence: true
  validates :concept,    presence: true
  validates :catchcopy,  presence: true
end
