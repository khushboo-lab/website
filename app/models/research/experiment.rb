class Research::Experiment < ApplicationRecord
  extend  FriendlyId
  friendly_id :title, use: [:slugged, :history]

  def to_param
    slug
  end
end
