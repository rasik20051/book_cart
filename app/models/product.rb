class Product < ActiveRecord::Base

	# default_scope order: 'title'

	validates :title,:description,:image_url,:price,presence: true
	validates :title,uniqueness: true
	validates :title,length: {minimum: 10}

	validates :price, numericality: {:greater_than_or_equal_to => 0.01}
	validates :image_url, allow_blank: true,format: {
				with: %r{\.(gif|jpg|png)$}i,multiline: true,
				message: "Use valid image extension"
			}

			def self.latest
				Product.order.(:updated_at).last
			end
end
