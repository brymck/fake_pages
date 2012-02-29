class Ticker < ActiveRecord::Base
  belongs_to :source
  has_many :pages

  def name_with_source
    "#{name} (#{source.name})"
  end
end
