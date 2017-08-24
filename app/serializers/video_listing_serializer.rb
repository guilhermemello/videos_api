class VideoListingSerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper

  attributes :id, :titulo, :video, :disciplina_id, :quantidade_votos_uteis, :quantidade_votos_negativos, :publico, :publicado_em, :duracao, :teste, :capa_url, :views

  has_one :autor

  def publicado_em
    distance_of_time_in_words(object.created_at, Time.now)
  end

  def teste
    # p object.duracao
    # p Time.at(object.duracao).strftime("%H:%M:%S")
    formatted_duration(object.duracao)
  end

  def formatted_duration(total_minute)
    # hours = total_minute / 60
    # # p hours
    # minutes = (total_minute) % 60
    # "#{minutes}"

    # p ActiveSupport::Duration.new(total_minute * 60, [[:seconds, total_minute * 60]])

    # p object.duracao
    # p Time.at(total_minute)#.utc.strftime("%I")

    # p Time.new(object.duracao)
    # p Time.at(object.duracao).utc.strftime("%H:%M:%S")
  end
end
