require 'sinatra'
require 'sinatra/reloader'
also_reload('lib/**/*.rb')
require './lib/doctor.rb'
require './lib/patient.rb'
require 'pg'

DB = PG.connect({:dbname => 'doctors_office'})

get('/') do

  erb(:select)
end

get('/doctor') do

  erb(:doctor)
end

get('/patient') do

  erb(:patient)
end

post('/doctor') do
  Doctor.all()
  @doctor_name = params['doctor_name']
  @specialty = params['specialty']
  doc_item = Doctor.new(:name => @doctor_name, :specialty => @specialty)
  doc_item.save

  erb(:doctor)
end

post('/patient') do
  Patient.all()
  @patient_name = params['patient_name']
  @birthdate = params['birthdate']
  @doc_id = params['doc_id']
  pat_item = Patient.new(:name => @patient_name, :birthdate => @birthdate, :doctor_id => @doc_id)
  pat_item.save

  erb(:patient)
end

#
# get('/doctor/:id') do
#   Doctor.all()
#   @doc_id = Doctor.find(params[:id])
#
#   erb(:output)
# end
