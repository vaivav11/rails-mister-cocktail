class Ingredient < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  has_many :doses
  has_many :cocktails, :through => :doses
  before_destroy :check_for_doses

  private

  def check_for_doses
    if doses.any?
      self.errors[:base] << "Error"
      raise ActiveRecord::InvalidForeignKey
    end
  end
end
