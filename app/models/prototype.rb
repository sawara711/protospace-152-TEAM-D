class Prototype < ApplicationRecord
  # 空の場合は登録できない
  with_options presence: true do
    validates :title
    validates :catch_copy
    validates :concept
    validates :image
  end

  belongs_to :user
  has_many :comments

end
