class Sub < ApplicationRecord
  validates :title, :description, presence: true
  
  belongs_to :user,
    primary_key: :id,
    foreign_key: :moderator_id,
    class_name: :User
  
    def moderator?
      return current_user.id == self.moderator_id
    end
    
end
