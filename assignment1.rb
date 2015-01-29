class Events
  def is_array?(obj)
    obj.is_a? Array
  end

  def all_hashes?(array)
    array.all? do |element|
      element.is_a? Hash
    end
  end

  def date?(stringnum)
    stringnum.to_i.between?(1, 31)
  end

  def month?(stringnum)
    stringnum.to_i.between?(1, 12)
  end

  def year?(stringnum)
    stringnum.to_i.between?(0, 3000)
  end

  def date_presence?(array)
    array.all? do |element|
      element[:date].is_a? String and date_formatted_right?(element[:date])
    end
  end

  def date_formatted_right?(string)
    year?(string[0,4]) and month?(string[5, 2]) and date?(string[8, 2])
  end

  def valid_test(events)
    is_array?(events) and all_hashes?(events) and date_presence?(events)
  end

  def make_date_hash(events)
    if valid_test(events)
      events = events.group_by { |e|  e.first }
      events = events.map { |_, e| #underscore is for unused variables
      e.inject(:merge)}

      puts events
    else
      puts 'Your input was not properly formatted.'
    end
  end
end

#date-based events go here, feel fry to try broken ones :)
randevents = [
{date: '2014-01-01', a: 5, b:1},
{date: '2014-01-01', xyz: 11},
{date: '2014-10-10', qbz: 5},
{date: '2014-10-10', v: 4, q: 1, strpm: -99},
{date: '2014-10-10', j: 4, fj: 5}]

calendar = Events.new
calendar.make_date_hash(randevents)