def reduce(arr, init=0)

  accum=init
  count = 0
  while count < arr.size
    accum = yield(accum, arr[count])
    count += 1
  end
  accum

end

array=[1,2,3,4,5]
ans = reduce(array) { |acc, num| acc + num }
puts ans