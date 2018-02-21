require 'sinatra'
require 'sinatra/reloader'
also_reload('lib/**/*.rb')
require './lib/doctor.rb'
require './lib/patient.rb'
require 'pg'

DB = PG.connect({:dbname => 'doctors_office'})

get('/') do
  @doctor_list = Doctor.all()
  erb(:doctor)
end

post('/') do
  Doctor.all()
  @doctor_name = params['doctor_name']
  @specialty = params['specialty']
  item = Doctor.new(:name => @doctor_name, :specialty => @specialty)
  item.save
  erb(:doctor)
end

get('/patient') do
  Patient.all()
  @patient_name = params['patient_name']
  @birthdate = params['birthdate']
  item = Doctor.new(:name => @doctor_name, :specialty => @specialty)

  item.save
  erb(:doctor)
end

get('/doctor/:id') do
  Doctor.all()
  @doc_id = Doctor.find(params[:id])

  erb(:output)
end
