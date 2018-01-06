# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  year       :integer          not null
#  band_id    :integer          not null
#  live       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  validates :title, :year, :band, presence: true
  validates :live, inclusion: { in: [true, false] }

  belongs_to :band

  after_initialize :set_defaults

  def set_defaults
    self.live ||= false
  end

end
