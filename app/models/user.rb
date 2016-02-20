class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :word_lists

  def current_list
    word_lists.each do |list|
      return list if list.current_list
    end
    nil
  end
end
