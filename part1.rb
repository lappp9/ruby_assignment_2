# metaprogramming to the rescue!
## Part 1.a
# Add the .in message to the Numeric class 

class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  @target_currency = String.new
  
  def method_missing(method_id, *args)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
    
    if @target_currency != ""
      ##then convert to target
      target = @target_currency
      @target_currency = ""
      if target == "yen"
        self / 0.013
      elsif target == "euro"
        self / 1.292
      elsif target == "rupee"
        self / 0.019
      end
    end
  end
  
  def in(target)
    @target_currency = target
  end
end


## Part 1.b
class String
  def palindrome?
    string = self.gsub(/[^a-z^A-Z]/, "").downcase
    string2 = string.reverse
    if(string2 == string)
      true
    else false
    end
  end
end


## Part 1.c
#  Adapt your palindrome method to work on enumerables
module Enumerable
  def palindrome?
    if self.respond_to? :reverse 
      reversed = self.reverse
      if reversed == self
        true
      else false
      end
    end
  end
end