class Doctor
  attr_accessor(:name, :specialty)
  attr_reader(:id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @specialty = attributes.fetch(:specialty)
  end

  def self.all
    returned_doctors = DB.exec("SELECT * FROM doctor;")
    doctors = []
    returned_doctors.each() do |list|
      # id = list.fetch("id").to_i()
      name = list.fetch("name")
      specialty = list.fetch("specialty")
      doctors.push(Doctor.new({:name => name, :specialty => specialty}))
    end
    doctors
  end

  def save
    DB.exec("INSERT INTO doctor (name, specialty) VALUES ('#{@name}', '#{@specialty}');")
  end

  def ==(another_doctor)
    self.id.==(another_doctor.id).&(self.name.==(another_doctor.name)).&(self.specialty.==(another_doctor.specialty))
  end

  # def get_id
  #   id = DB.exec("SELECT id FROM doctor WHERE name='#{@name}';")
  #   [0]['id'].to_i
  # end

  # def self.find(id)
  #
  # end

  def self.get_name(id)
    DB.exec("SELECT name FROM doctor WHERE id='#{id}';")[0]['name']
  end

end
