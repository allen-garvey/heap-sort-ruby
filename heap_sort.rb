#takes an array and alters
#it to follow heap min ordering property
def heapify!(array)
	#calculate first non leaf node
	currentIndex = (array.size / 2) - 1
	#percolate from top down, starting at first non-leaf node
	currentIndex = array.size - 1
	while currentIndex >= 0
		adjustHeap!(array, array.size, currentIndex)
		currentIndex = currentIndex - 1
	end
end

#uses heap sort to sort array in descending order
#in-place
def heapSort!(array)
	heapify! array
	size = array.size
	#array of size 1 is already sorted
	while size > 1
		temp = array[size - 1]
		array[size - 1] = array[0]
		array[0] = temp
		size = size - 1
		adjustHeap!(array, size, 0)
	end
end

#percolates value down, starting at pos
def adjustHeap!(array, size, pos)
	#base case
	if pos >= size
		return
	end
	swapIndex = pos
	leftChildIndex = pos * 2 + 1
	rightChildIndex = pos * 2 + 2
	if rightChildIndex < size
		swapIndex = smallestIndex(array, rightChildIndex, leftChildIndex)
		swapIndex = smallestIndex(array, swapIndex, pos)
	elsif leftChildIndex < size
		swapIndex = smallestIndex(array, leftChildIndex, pos)
	end
	if swapIndex != pos
		temp = array[pos]
		array[pos] = array[swapIndex]
		array[swapIndex] = temp
		adjustHeap!(array, size, swapIndex)
	end
end


def smallestIndex(array, index1, index2)
	if array[index1] < array[index2]
		index1
	else
		index2
	end
end


NUM = 10

array = NUM.times.map{ Random.rand(100) } 
puts "Original Array"
puts array.to_s

t1 = Time.now

heapSort!(array)
puts "\n\nSorted Array"
puts array.to_s

t2 = Time.now
delta = t2 - t1
puts "\n\nHeap sort took #{delta * 1000 }ms for #{NUM} items"