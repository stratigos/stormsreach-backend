# Presenter of an Avatar for API consumers.
class AvatarSerializer < ActiveModel::Serializer

  attributes :id, :name, :town, :updated_at

end
