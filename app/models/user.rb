class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_marker

  def favorites
    (favorite_companies + favorite_people).sort{|a,b| b.created_at <=> a.created_at }
    # (favorite_companies && favorite_people).order(created_at: :desc)
  end
end
