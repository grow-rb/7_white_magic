require 'minitest/autorun'

class C1
  def name
    '[C1]'
  end
end

module M1
  def name
    super + "[M1]"
  end
end

class C5 < C1
  def name
    super + "[C5]"
  end
end

require_relative 'method_lookup'

class MethodLookupTest < MiniTest::Test
  def test_c2
    assert_equal '[C1][C2]', C2.new.name
    assert C2.ancestors.include?(C1)
  end

  def test_c3
    assert_equal '[C1][M1][C3]', C3.new.name
    assert C3.ancestors.include?(C1)
  end

  def test_c4
    assert_equal '[C1][C4][M1]', C4.new.name
    assert C4.ancestors.include?(C1)
  end

  def test_c5
    skip
    assert_equal '[C1]', C5.new.name
    assert C5.ancestors.include?(C1)
  end
end
