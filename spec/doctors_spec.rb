require('rspec')
require('pg')
require('doctor')
require('spec_helper')

describe(Doctor) do

  describe(".all") do
    it("starts off with no doctors") do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a doctor object to the doctor table") do
      doctor1 = Doctor.new({:name => "bob", :specialty => "cardiology", :id => 1})
      doctor1.save()
      expect(Doctor.all()).to(eq([doctor1]))
    end
  end
end
