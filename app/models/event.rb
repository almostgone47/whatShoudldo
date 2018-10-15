class Event < ApplicationRecord
    mount_uploaders :images, ImageUploader
    
    include Filterable
    include PgSearch

    pg_search_scope :search_fields, :against => [:title, :category, :sub_category], 
                    using: {tsearch: {prefix: true}}
  

end
