# Pass Class to be used with the model 
# pass model
class Pass < ActiveRecord::Base
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
    	    :recoverable, :rememberable, :trackable, :validatable

  	belongs_to :user
  	validates :user, :presence=>{:message=>"Please specify user"}
end
