class Disciplina < ActiveRecord::Base
  class << self
    def mais_acessadas
      order(quantidade_acesso: :desc).limit(30)
    end
  end
end
