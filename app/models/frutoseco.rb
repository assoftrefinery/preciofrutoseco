class Frutoseco < ActiveRecord::Base
  validates_presence_of :nombrefrutoseco, :preciofrutoseco
  validates :preciofrutoseco, :numericality => { :greater_than => 0 }
end
