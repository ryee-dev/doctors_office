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
  erb(:doctor)
end
