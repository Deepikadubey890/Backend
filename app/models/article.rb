class Article < ApplicationRecord
    has_one_attached :image
    # validates_attachment :picture, presence: true
    # do_not_validate_attachment_file_type :image
   
end
