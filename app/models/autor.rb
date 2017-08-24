class Autor < ActiveRecord::Base
  belongs_to :user , foreign_key: :user_qc
end
