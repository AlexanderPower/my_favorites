class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_marker

  def favorites
    (favorite_companies.includes(:markable_marks) + favorite_people.includes(:markable_marks)).sort do |a, b|
      b.markable_marks.find_by(marker_id: self.id).created_at <=>
          a.markable_marks.find_by(marker_id: self.id).created_at
    end
    # (favorite_companies && favorite_people).order(created_at: :desc)
  end
end
