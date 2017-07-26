class Post < ActiveRecord::Base
  belongs_to :user
  validates_length_of :caption, :in => 3..800 ,:allow_blank => true, :message => " must be 3 to 800 characters"
  validates :user_id, presence: true
  validates :image, presence: true
  has_attached_file :image, styles: { :medium => "640px" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  has_many :comments, dependent: :destroy
end
