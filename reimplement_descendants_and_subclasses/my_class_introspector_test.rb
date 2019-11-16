require 'minitest/autorun'
require_relative 'my_class_introspector'
require 'set'

class Parent; end
class Foo < Parent; end
class Bar < Foo; end
class Baz < Bar; end

class A < Parent; end
class B < A; end
class C < B; end

class MyClassIntrospectorTest < MiniTest::Test
  def test_descendants
    assert_equal [Foo, Bar, Baz, A, B, C].to_set, Parent.descendants.to_set
    assert_equal [Bar, Baz].to_set, Foo.descendants.to_set
    assert_equal [Baz], Bar.descendants
    assert_equal [], Baz.descendants
  end

  def test_subclasses
    assert_equal [Foo, A].to_set, Parent.subclasses.to_set
    assert_equal [Bar], Foo.subclasses
    assert_equal [Baz], Bar.subclasses
    assert_equal [], Baz.subclasses
  end
end
