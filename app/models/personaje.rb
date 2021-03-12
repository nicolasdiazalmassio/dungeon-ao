class Personaje < ApplicationRecord
  belongs_to :usuario
  validates :nombre, presence: true, 
                uniqueness: { case_sensitive: false }, 
                length: { minimum: 3, maximum: 15 }
  validates :clase, presence: true
  has_many :inventarios
  has_many :objetos, through: :inventarios
end
