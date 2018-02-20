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

end
