class List < ActiveRecord::Base
	has_many :tasks, :dependent => :destroy
  attr_accessible :name
end
