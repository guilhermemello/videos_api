class VideoSerializer < ActiveModel::Serializer
  attributes :id, :titulo, :video, :disciplina_id, :quantidade_votos_uteis, :quantidade_votos_negativos, :autor_id, :publico, :capa_url, :views

  has_one :autor
end
