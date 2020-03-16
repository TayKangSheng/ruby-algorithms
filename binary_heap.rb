require "byebug"

class BinaryHeap
  def initialize(heap = [])
    @heap = heap
  end

  def to_a
    return @heap
  end

  def insert(num)
  end

  def extract
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
