class Item < ActiveRecord::Base
  has_attached_file :image, 
    :styles => {normal: "300x300"},
    :default_url => "/images/:style/missing.png",
    :storage => :s3,
    :s3_credentials => {bucket: "mining-hardware-comparison", :access_key_id => "026KBCXCTEG49EHZZ1R2", :secret_access_key => "GGj2tW+RgIcBhra/HE5SEeMQauDbTwCuBekqHTZG"},
    :s3_permissions => "public-read",
    :path => "/images/:id/:filename"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
