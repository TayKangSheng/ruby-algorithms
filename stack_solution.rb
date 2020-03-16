require "minitest/autorun"

# Implementation should follow the interface
#  https://en.wikipedia.org/wiki/Stack_(abstract_data_type)#Array

class Stack
  def initialize
    @stack = []
  end

  def to_a
    return @stack
  end

  def push(element)
    @stack.push(element)
  end

  def pop
    @stack.pop
  end

  def top
    @stack.last
  end

  def bottom
    @stack.first
  end
end

class TestStack < Minitest::Test
  def setup
    @test_stack = Stack.new
  end

  def test_to_a_returns_an_array
    assert_equal Array, @test_stack.to_a.class
  end

  def test_push_adds_element_to_the_top_of_the_stack
    @test_stack.push(10)

    assert_equal 10, @test_stack.to_a.last
  end

  def test_pop_removes_the_element_at_the_top_of_the_stack
    @test_stack.push(11)

    assert_equal 11, @test_stack.pop
  end

  def test_top_returns_the_element_at_the_top_of_the_stack
    @test_stack.push(11)
    @test_stack.push(12)
    @test_stack.push(13)

    assert_equal 13, @test_stack.top
  end

  def test_bottom_returns_the_element_at_the_bottom_of_the_stack
    @test_stack.push(11)
    @test_stack.push(12)
    @test_stack.push(13)

    assert_equal 11, @test_stack.bottom
  end
end
