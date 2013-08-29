class CartesianProduct
  include Enumerable
  # your code here
  # the object will be an Enumerable that consists of the Cartesian product of the things it was initialized with
  
  def initialize(a, b)
    ##set up self as an array containing all the results
    i = 0
    a.each do |aItem|
      self << [aItem] << b[i];
      i=i+1;
    end
  end
  
end
