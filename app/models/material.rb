class Material < ActiveRecord::Base
  paginates_per 5

  has_many :visitas, -> { where(modulo_id: 18) }, foreign_key: 'recurso_id'
  belongs_to :autor
  has_and_belongs_to_many :assuntos

  class << self
    def ultimos(page)
      where(tipo_conteudo: 'V').order(created_at: :desc).page(page)
    end

    def mais_acessados(page)
      select('materiais.*, COUNT(visitas.id) as quantidade_visitas')
        .joins('INNER JOIN visitas ON materiais.id = visitas.recurso_id')
        .where('visitas.created_at between date_sub(now(), INTERVAL 10 day) and now()')
        .where(tipo_conteudo: 'V')
        .group('materiais.id')
        .order('quantidade_visitas DESC')
        .includes(autor: [:user])
        .page(page)
    end

    def relacionados(video_id)
      videos = []
      video = Material.where(id: video_id).first
      assunto_pai = video.assuntos.where("parent_id IS NULL").first

      if assunto_pai.present?
        videos = assunto_pai.materiais.where('id <> ? AND tipo_conteudo = ?', video.id, 'V').all
      end

      videos
    end

    def por_disciplina(params)
      where(disciplina_id: params[:id]).page(params[:page])
    end

    def search(params)
      search = Material.includes(autor: [:user])
      search = search.where('titulo LIKE ?', "%#{params[:query]}%")
      search = search.where(tipo_conteudo: 'V')
      search = search.order('quantidade_votos_uteis DESC')
      search = search.order('created_at DESC')
      search.page(params[:page]).per(20)
    end
  end

  def like!
    self.increment!(:quantidade_votos_uteis)
  end

  def dislike!
    self.increment!(:quantidade_votos_negativos)
  end

  def view!
    self.increment!(:views)
  end
end
