class Connection < ActiveRecord::Base
  belongs_to :favorite, class_name: "User"
  belongs_to :favored, class_name: "User"
end
