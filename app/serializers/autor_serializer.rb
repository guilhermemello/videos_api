class AutorSerializer < ActiveModel::Serializer
  attributes :id, :nome, :avatar

  def avatar
    if object.user.present?
      "https://res.cloudinary.com/qconcursos/image/upload/t_perfil/v#{object.user.image_version}/#{object.user.avatar_id}"
    else
      "https://www.hyperspin-fe.com/uploads/set_resources_7/84c1e40ea0e759e3f1505eb1788ddf3c_default_photo.png"
    end
  end
end
