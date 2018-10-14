class Event < ApplicationRecord
    mount_uploaders :images, ImageUploader

end
