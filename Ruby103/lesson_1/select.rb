def select(array)
  ans=[]
  count=0
  while (count < array.size)
    ans << array[count] if yield(array[count])
    count += 1
  end
  ans
end

the = select([1,2,3,4,5,6,7]) {|val| val < 5}
puts the.inspect