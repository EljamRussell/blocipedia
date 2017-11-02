class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators, dependent: :destroy
  has_many :users, through: :collaborators
  validates :user, presence: true

  def possible_collaborators(current_user_id)
    pc_ids = User.ids - users.map(&:id) - [current_user_id]
    User.find(pc_ids)
  end

  def public?
    !private?
  end
end
