class Record < ApplicationRecord
  belongs_to :languages, class_name: "Record"
end
