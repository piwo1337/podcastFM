class Episode < ApplicationRecord
  belongs_to :podcast
  has_attached_file :episode_thumbnail, styles: { large: "1000x1000#", medium: "550x550#" }, default_url:  "missingepisode.png"
  validates_attachment_content_type :episode_thumbnail, content_type: /\Aimage\/.*\Z/

  has_attached_file :mp3
  validates_attachment_content_type :mp3, content_type: ['audio/mp3', 'audio/mpeg'],
                                          message: 'File must be of filetype .mp3'
end
