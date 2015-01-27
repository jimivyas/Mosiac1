
# input is array of hashes
# output is array of hashes


class Events
	def initialize
		$output ||= Array.new
	end


	def date_removed(event)
		event.tap do |e| #tap returns the original event, which is why the method has a passive voice
			e.delete(:date)
		end
	end


	def store_all_events(input_hash, output_hash)
		event_date = output_hash[:date]
		date_removed(input_hash).each do |k, v|
			$output.find {|day| day[:date] == event_date }[k] = v
		end
	end

	def make_date_hash(event_array)
		$output << event_array.first
		puts $output.first[:date]
		event_array.each do |event|
			$output.clone.each do |day|
				if event[:date] == day[:date]
					store_all_events(event, day)
				else
					$output << event
				end
			end
		end
		puts $output
	end
end

random_dates = [
  {date: '2014-01-01', a: 5, b:1},
  {date: '2014-01-01', xyz: 11},
  {date: '2014-10-10', qbz: 5},
  {date: '2014-10-10', v: 4, q: 1, strpm: -99} ]


calendar = Events.new
calendar.make_date_hash(random_dates)