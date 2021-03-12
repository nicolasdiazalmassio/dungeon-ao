class Inventario < ApplicationRecord
  belongs_to :personaje
  belongs_to :objeto
end