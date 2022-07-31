class Page < ApplicationRecord
  # ========================
  # valid pages:
  #   index, about
  # part names:
  #   main service_1 service_2
  #   main
  # ========================
  validates :name, presence: true, 
  uniqueness: { case_sensitive: false }, 
  length: { minimum: 2, maximum: 50 }  
  
  has_many :parts
  
  before_create do
    if name == "index"
      part_names = %w(main service_1 service_2)
      part_names.each {|part_name| self.parts.new(name: part_name, content: "CONTACT administrator. Newly created part: #{part_name}")}
    else
      self.parts.new(name: "main", content: "CONTACT administrator. Newly created part: main")
    end
  end

  def get_part(name)
    self.parts.find_by name: name
  end

end
