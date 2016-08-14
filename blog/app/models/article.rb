class Article < ApplicationRecord
  belongs_to :user #un articulo tiene un usuario
  has_many :comments
  validates :title, presence:true,uniqueness:true
  validates :body, presence:true
  before_save :set_visits_count
  def update_visits_count
    self.update(visits_count: self.visits_count+1)

  end
  #antes de crear el blog reinicie el contador
  private

  def set_visits_count
    self.visits_count ||=0

  end
end
