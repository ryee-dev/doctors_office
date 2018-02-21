class Patient
  attr_accessor(:name, :birthdate, :doctor_id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @birthdate = attributes.fetch(:birthdate)
    @doctor_id = attributes.fetch(:doctor_id)
  end

  def self.all
    returned_patients = DB.exec("SELECT * FROM patient;")
    patients = []
    returned_patients.each do |item|
      name = item.fetch("name")
      birthdate = item.fetch("birthdate")
      doctor_id = item.fetch("doctor_id").to_i()
      patients.push(Patient.new({:name => name, :birthdate => birthdate, :doctor_id => doctor_id}))
    end
    patients
  end

  def save
    DB.exec("INSERT INTO patient (name, birthdate, doctor_id) VALUES ('#{@name}', '#{@birthdate}', #{@doctor_id});")
  end

  def ==(another_patient)
    self.name.==(another_patient.name).&(self.birthdate.==(another_patient.birthdate)).&(self.doctor_id.==(another_patient.doctor_id))
  end

  def assign_dr(doctor_id)
   @doc_id = doctor_id
   DB.exec("UPDATE patients SET doc_id = '#{doc_id}' WHERE name='#{@name}'")
  end

  def self.find(id)
    pat_info = DB.exec("SELECT * FROM patients WHERE id='#{id}';")
    Patient.new({:name => "#{pat_info['name']}", :birthdate => "#{pat_info['birthdate']}"})
  end

end
