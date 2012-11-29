class Task < ActiveRecord::Base
	belongs_to :list

  attr_accessible :complete, :content, :list_id, :position

end
