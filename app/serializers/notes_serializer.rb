class NotesSerializer < ActiveModel::Serializer
  attributes :id, :note, :date
  belongs_to :user
end
