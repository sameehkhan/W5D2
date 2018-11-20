# == Schema Information
#
# Table name: subs
#
#  id           :bigint(8)        not null, primary key
#  title        :string           not null
#  description  :text             not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ApplicationRecord
  validates :title, :description, presence: true
  
  belongs_to :user,
    primary_key: :id,
    foreign_key: :moderator_id,
    class_name: :User
    
  has_many :posts,
    foreign_key: :sub_id,
    class_name: :Post
  
    def moderator?
      return current_user.id == self.moderator_id
    end
    
end
