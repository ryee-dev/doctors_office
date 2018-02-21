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
      id = list.fetch("id").to_i()
      name = list.fetch("name")
      specialty = list.fetch("specialty")
      doctors.push(Doctor.new({:id => id, :name => name, :specialty => specialty}))
    end
    doctors
  end

  def save
    DB.exec("INSERT INTO doctor (name, specialty) VALUES ('#{@name}', '#{@specialty}');")
  end

  def ==(another_doctor)
    self.id.==(another_doctor.id).&(self.name.==(another_doctor.name)).&(self.specialty.==(another_doctor.specialty))
  end

  def self.find(id)
    Doctor.all.each do |doctor|
      if doctor.id.==(id)
        return doctor
      end
    end
  end
end
