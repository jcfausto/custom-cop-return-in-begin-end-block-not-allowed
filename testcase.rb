# frozen_string_literal: true

require 'test/unit'
require_relative 'zig'

# Test example
class TestZig < Test::Unit::TestCase
  def setup
    @zig = Zig.new

    @zig.or_asng_without_return
    @zig.or_asng_without_return
    @zig.or_asng_without_return

    @zig.or_asng_with_return
    @zig.or_asng_with_return
    @zig.or_asng_with_return
  end

  def test_execution_count
    assert_equal(1, @zig.or_asng_with_return_executions)
    assert_equal(1, @zig.or_asng_without_return_executions)
  end

  def test_lvasng
    @zig.do_lvasgn
    assert_equal('lvasgn', @zig.a_value)
  end
end
