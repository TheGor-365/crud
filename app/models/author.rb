# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Author < ApplicationRecord
  # has_and_belongs_to_many :articles
  # has_many :articles
  # has_one :article
  has_one :article
end
