require 'sinatra'
require 'sinatra/reloader'
also_reload('lib/**/*.rb')
require './lib/doctor.rb'
require './lib/patient.rb'
require 'pg'

DB = PG.connect({:dbname => 'doctors_office'})

get('/') do

  erb(:home)
end

get('/new-doctor') do

  erb(:new_doctor)
end

post('/new-doctor') do
  @doctor_name = params[:doctor_name]
  @specialty = params[:specialty]
  doc_item = Doctor.new(:name => @doctor_name, :specialty => @specialty)
  @new_doc = doc_item.save
  @docs = Doctor.all
  erb(:new_doctor)
end

get('/returning-doctor') do

  erb(:doctor)
end

get('/doctor/:id') do

  erb(:doctor)
end

get('/new-patient') do

  erb(:new_patient)
end

post('/new-patient') do
  Patient.all()
  @patient_name = params['patient_name']
  @birthdate = params['birthdate']
  @doc_id = params['doc_id']
  pat_item = Patient.new(:name => @patient_name, :birthdate => @birthdate, :doctor_id => @doc_id)
  pat_item.save

  erb(:new_patient)
end

get('/patient') do

  erb(:patient)
end

get('/returning-patient') do

  erb(:patient)
end

#
# get('/doctor/:id') do
#   Doctor.all()
#   @doc_id = Doctor.find(params[:id])
#
#   erb(:output)
# end
