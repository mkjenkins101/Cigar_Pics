module RaterHelper
  def overall 
    sum = 0
    count = 0
    get_rates.each do |rate|
      if rate.dimension != "overall"
        sum += rate.stars
        count += 1
      end
    end
    return find_avg_rate(sum, count) 
  end

  def get_rates
    @rates = []
    Rate.all.each do |rate|
      if @pin.id == rate.rateable_id
        @rates << rate
      end 
    end
    return @rates
  end

  def find_avg_rate(sum, count)
    if count == 0
      return 0
    else
      init_avg = sum / count
      mod_avg = (sum - (sum % count)) / count
      if (init_avg - mod_avg) >= 0.5
        return mod_avg + 1
      else
        return mod_avg
      end 
    end
  end
end
