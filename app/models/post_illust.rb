class PostIllust < ApplicationRecord
    belongs_to :poster, class_name: "Member", foreign_key: "member_id"
    has_many :pimages, class_name: "PostImage"

    validates :title, presence: true, length: { maximum: 15 }
    validates :body, presence: true, length: { maximum: 100 }
    validates :posted_at, presence: true
end