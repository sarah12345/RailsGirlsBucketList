class List < ActiveRecord::Base
  attr_accessible :name, :reason
  validates_presence_of :name, :reason
  has_many :steps
end
