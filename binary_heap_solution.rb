require "byebug"

class BinaryHeap
  def initialize(heap = [])
    @heap = heap
  end

  def to_a
    return @heap
  end

  def insert(num)
    @heap.push(num)

    up_heap(@heap.length - 1)
  end

  def extract
    if @heap.length == 0
      return nil
    elsif @heap.length == 1
      return @heap.pop
    else
      value = @heap[0]
      smallest = @heap.pop
      @heap[0] = smallest

      down_heap(0)

      return value
    end
  end

  private

    def down_heap(index)
      left_index = (index * 2) + 1
      right_index = (index * 2) + 2
      largest_index = index

      if left_index < @heap.length && @heap[left_index] > @heap[largest_index]
        largest_index = left_index
      end

      if right_index < @heap.length && @heap[right_index] > @heap[largest_index]
        largest_index = right_index
      end

      if largest_index != index
        temp = @heap[index]
        @heap[index] = @heap[largest_index]
        @heap[largest_index] = temp

        down_heap(largest_index)
      end
    end

    def up_heap(index)
      return if index == 0

      parent_index = (index - 1) / 2

      if @heap[index] > @heap[parent_index]
        current_value = @heap[index]
        @heap[index] = @heap[parent_index]
        @heap[parent_index] = current_value

        up_heap(parent_index)
      end
    end
end

RSpec.describe BinaryHeap do
  let(:initial_heap) { [100, 55, 36, 43, 33] }
  subject { BinaryHeap.new(initial_heap) }

  it "#to_a", "returns heap in array representation" do
    expect(subject.to_a).to eq initial_heap
  end

  it "#insert" do
    subject.insert(45)
    expect(subject.to_a).to eq [100, 55, 45, 43, 33, 36]

    subject.insert(10)
    expect(subject.to_a).to eq [100, 55, 45, 43, 33, 36, 10]

    subject.insert(15)
    expect(subject.to_a).to eq [100, 55, 45, 43, 33, 36, 10, 15]
  end

  it "#extract" do
    expect(subject.extract).to eq 100
    expect(subject.to_a).to eq [55, 43, 36, 33]

    expect(subject.extract).to eq 55
    expect(subject.to_a).to eq [43, 33, 36]

    expect(subject.extract).to eq 43
    expect(subject.to_a).to eq [36, 33]

    expect(subject.extract).to eq 36
    expect(subject.to_a).to eq [33]

    expect(subject.extract).to eq 33
    expect(subject.to_a).to eq []
  end
end
