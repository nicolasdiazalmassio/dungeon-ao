class Objeto < ApplicationRecord
  has_many :inventarios
  has_many :personajes, through: :inventarios
end