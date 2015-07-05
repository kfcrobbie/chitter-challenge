require 'data_mapper'

class Peep

	include DataMapper::Resource

	property :id, Serial
	property :peep, Text
	propert :time_stamp, DateTime

	belongs_to :user, :require => true

end
