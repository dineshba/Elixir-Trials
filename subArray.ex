defmodule SubArray do
  def sum([], _req_sum), do: {-1, -1}
  def sum([_non_req_sum], _req_sum), do: {-1, -1}
  def sum(array, req_sum), do:
   _sum(array, 0, 1, req_sum, Enum.count(array), Enum.at(array, 0) + Enum.at(array, 1)) 
  
  def _sum(_array, _start, endIndex, _req_sum, count, _local_sum) when endIndex >= count, do: {-1, -1}
  def _sum(_array, start, endIndex, req_sum, _count, req_sum), do: {start, endIndex}
  def _sum(array, start, endIndex, req_sum, count, local_sum) when local_sum > req_sum, do:
    _sum(array, start + 1, endIndex, req_sum, count, local_sum - Enum.at(array, start))
  def _sum(array, start, endIndex, req_sum, count, local_sum), do:
    _sum(array, start, endIndex + 1, req_sum, count, local_sum + Enum.at(array, endIndex + 1))
end
a = [1,2,3,4,5,6,10]
IO.inspect(SubArray.sum(a, 9))
