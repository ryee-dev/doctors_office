class Doctor
  attr_reader(:id, :name, :specialty)

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @specialty = attributes.fetch(:specialty)
  end

  def self.all
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each() do |list|
      id = list.fetch("id").to_i()
      name = list.fetch("name")
      specialty = list.fetch("specialty")
      doctors.push(Doctor.new({:id => id, :name => name, :specialty => specialty}))
    end
    doctors
  end
end
