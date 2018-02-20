require('rspec')
require('pg')
require('patient')
require('spec_helper')

  describe(".all") do
    it("starts off with no doctors") do
      expect(Patient.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a patient object to the patient table") do
      patient1 = Patient.new({:name => "bob", :birthdate => "1990-09-12 00:00:00", :doctor_id => 1})
      patient1.save()
      expect(Patient.all()).to(eq([patient1]))
    end
  end
