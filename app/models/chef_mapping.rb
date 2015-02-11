class ChefMapping < ActiveRecord::Base
  attr_accessible :cookbook_ref, :git_url, :tool_name, :version, :source_id
  validates :cookbook_ref, :tool_name, :source_id, presence: true

  belongs_to :source
end
