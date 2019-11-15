require 'minitest/autorun'
require_relative 'methods_extensions'

class Foo
  def hoge
    puts :hoge
  end

  def fuga(str)
    puts str
  end
end

class Bar
  def self.baz
    puts :baz
  end
end

class MethodsExtensionsTest < MiniTest::Test
  def test_methods_with_owner
    assert Foo.new.methods_with_owner.include?([:hoge, Foo])
    assert Foo.new.methods_with_owner.include?([:__send__, BasicObject])
  end

  def test_methods_with_arity
    foo = Foo.new
    assert foo.methods_with_arity.include?([:hoge, 0])
    assert foo.methods_with_arity.include?([:fuga, 1])
  end

  def test_singleton_methods_with_line
    assert Bar.singleton_methods_with_line.include?([:baz, 15])
  end
end
