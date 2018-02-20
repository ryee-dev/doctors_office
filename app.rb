require 'sinatra'
require 'sinatra/reloader'
also_reload('lib/**/*.rb')
require './lib/doctor.rb'
require './lib/patient.rb'
require 'pg'

DB = PG.connect({:dbname => 'doctor_office'})

get('/') do
  @doctor_list = Doctor.all()
  erb(:doctor)
end

post('/') do
  new_task= Task.new(:description, :due_date)
  new_task.save()
  erb(:to_do)
end
