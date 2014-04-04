class Entry < ActiveRecord::Base
  before_save :generate_slug
  validates :title, presence: true
  validates :body, presence: true
  validates :excerpt, presence: true

  def generate_slug
    self.slug = self.title.gsub(' ', '-').downcase
  end

  def to_param
    self.slug
  end
end