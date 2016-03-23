class Pin < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :image, presence: true
  validates :description, presence: true
  validates :shape, presence: true
  validates :length, presence: true
  validates :ring, presence: true
  validates :wrapper, presence: true

  ratyrate_rateable 'construction', 'burn', 'flavor', 'overall'
	
	def self.cigar_shape
		return ["Corona","Petit Corona","Churchill","Robusto","Corona Gorda",
						"Double Corona","Panetela","Lonsdale","Pyramid","Belicoso",
						"Torpedo","Perfecto","Culebra","Diadem"]
	end
	def self.cigar_wrapper
		return ["Connecticut","Corojo","Habano","Maduro",
						"Candela","Sumatra","Oscuro","Cameroon"]
	end
	def self.cigar_length
		return ["3","4","5","6","7","8","9"]	
	end
	def self.cigar_ring
		return ["20","21","22","23","24","25","26","27","28","29",
						"30","31","33","33","34","35","36","37","38","39",
						"40","41","44","43","44","45","46","47","48","49",
						"50","51","55","53","54","55","56","57","58","59",
						"60","61","66","63","64","65","66","67","68","69",
						"70","71","77","73","74","75","77","77","78","79"]
	end
  
end
