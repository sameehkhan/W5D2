# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  user_id    :integer          not null
#  sub_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, presence: true
  
  belongs_to :user,
    foreign_key: :user_id,
    class_name: :User
    
  belongs_to :sub,
    foreign_key: :sub_id,
    class_name: :Sub
    
  has_many :post_subs
    
  def author?
    current_user.id == self.user_id
  end
end
