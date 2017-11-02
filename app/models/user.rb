class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  has_many :wikis, dependent: :destroy
  has_many :collaborators, dependent: :destroy
  has_many :collab_wikis, through: :collaborators, source: :wiki

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:standard, :premium, :admin]

  before_save { self.role ||= :standard }

end
