class Flower < ApplicationRecord

    mount_uploader :image, ImageUploader
    belongs_to:user
end
