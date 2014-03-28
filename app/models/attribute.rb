class Attribute < ActiveRecord::Base
  acts_as_list
  default_scope -> { order("position ASC") }
end
