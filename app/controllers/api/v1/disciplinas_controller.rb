class Api::V1::DisciplinasController < Api::V1::ApplicationController
  protect_from_forgery with: :null_session

  def index
    disciplinas = Disciplina.mais_acessadas

    render json: disciplinas, each_serializer: DisciplinaSerializer
  end
end
