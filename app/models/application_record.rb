class ApplicationRecord < ActiveRecord::Base
  include LinkedRails::Model
  self.abstract_class = true
end
