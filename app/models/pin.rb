class Pin < ActiveRecord::Base
	belongs_to :user
    has_many :votes, dependent: :destroy
    has_many :comments
    has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
    validates_attachment_size :image, :in => 0.kilobytes..900.kilobytes

    validates :description, presence: true
    validates :image, presence: true


end
