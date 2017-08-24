class Assunto < ActiveRecord::Base
  has_and_belongs_to_many :materiais
end
