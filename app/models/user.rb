class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save :downcase_email

  has_many :contacts, -> { order 'first_name ASC' },
			dependent: :destroy

  private
  def downcase_email
    self.email = self.email.downcase
  end
end
