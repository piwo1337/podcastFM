class Podcast < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :episodes

  has_attached_file :thumbnail, styles: { large: "1000x1000#", medium: "550x550#" }, default_url:  "missingepodcast.png"
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/

  has_attached_file :mp3
  validates_attachment_content_type :mp3, content_type: ['audio/mp3', 'audio/mpeg'],
                                          message: 'File must be of filetype .mp3'

end
