class Api::V1::VideosController < Api::V1::ApplicationController
  protect_from_forgery with: :null_session

  def index
    videos = Material.ultimos(params[:page])

    render json: videos, adapter: :json, each_serializer: VideoListingSerializer, root: :videos, meta: { total_count: videos.total_count, total_pages: videos.total_pages, current_page: videos.current_page }
  end

  def show
    video = Material.find(params[:id])

    render json: video, serializer: VideoSerializer
  end

  def relacionados
    videos = Material.relacionados(params[:id])

    render json: videos, adapter: :json, each_serializer: VideoListingSerializer, root: :videos
  end

  def mais_acessados
    videos = Material.mais_acessados(params[:page])

    render json: videos, adapter: :json, each_serializer: VideoListingSerializer, root: :videos, meta: { total_count: videos.total_count, total_pages: videos.total_pages, current_page: videos.current_page }
  end

  def search
    videos = Material.search(params)

    render json: videos, adapter: :json, each_serializer: VideoListingSerializer, root: :videos, meta: { total_count: videos.total_count, total_pages: videos.total_pages, current_page: videos.current_page }
  end

  def por_disciplina
    videos = Material.por_disciplina(params)

    render json: videos, adapter: :json, each_serializer: VideoListingSerializer, root: :videos, meta: { total_count: videos.total_count, total_pages: videos.total_pages, current_page: videos.current_page }
  end

  def like
    video = Material.find(params[:id])
    video.like!

    render nothing: true, status: :ok
  end

  def dislike
    video = Material.find(params[:id])
    video.dislike!

    render nothing: true, status: :ok
  end

  def view
    video = Material.find(params[:id])
    video.view!
  end
end
