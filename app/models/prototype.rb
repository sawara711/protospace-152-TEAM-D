class Prototype < ApplicationRecord
  # 空の場合は登録できない
  with_options presence: true do
    validates :title
    validates :catch_copy
    validates :concept
  end

  has_one_attached :image
  validate :was_attached?
  def was_attached?
    self.image.attached?
  end

    belongs_to :user
    has_many :comments

end
