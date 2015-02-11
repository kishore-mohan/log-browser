class Source < ActiveRecord::Base
  attr_accessible :name, :source_type, :ui_view
  validates :name, :source_type, :ui_view, presence: true
  
  has_many :chef_mappings
  
  def self.get_source(name)
 	where(source_type: name).pluck(:ui_view)
  end
end
