# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  body       :text
#  edited_at  :datetime
#  published  :boolean
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer          not null
#
# Indexes
#
#  index_articles_on_author_id  (author_id)
#
# Foreign Keys
#
#  author_id  (author_id => authors.id)
#
class Article < ApplicationRecord
  belongs_to :author
  # belongs_to :author
  # has_and_belongs_to_many :authors

  validates :title, :body, :author, presence: true
  # validates :title, :body, :author, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }

  # def self.published
  #   where(published: true)
  # end

  # default_scope { where(published: true) }

  scope :published, -> { where(published: true) }
  scope :by_creation_date_desc, -> { order(created_at: :desc) }
  scope :by_creation_date_asc, -> { order(created_at: :asc) }
end
