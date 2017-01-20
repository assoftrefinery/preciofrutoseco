class Listacorreo < ActiveRecord::Base
  validates_presence_of :nombre, :email
  #mu basico
  #validates_format_of :email, :with => /@/
  #un poco mejor
  validates_format_of :email, :with => /.+@.+\..+/i
end
