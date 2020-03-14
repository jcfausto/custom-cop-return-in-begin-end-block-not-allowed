# frozen_string_literal: true

# A Foo
class Foo
  attr_reader :or_asgn, :or_asng_with_return_executions,
              :or_asng_without_return_executions,
              :a_value, :lvasgn_executions

  def initialize
    @or_asng_with_return_executions = 0
    @or_asng_without_return_executions = 0
    @lvasgn_executions = 0
    @a_value = nil
  end

  def or_asng_with_return
    @or_asng_with_return ||= begin
      @or_asng_with_return_executions += 1
      return 'Foo' if ready?

      "I'm not ready"
    end
  end

  def do_lvasgn
    a_value = begin
      @lvasgn_executions += 1
      return 'value' if ready?

      "I'm not ready"
    end
    puts a_value
  end

  def or_asng_without_return
    @or_asng_without_return ||= begin
        @or_asng_without_return_executions += 1
        if ready?
          "I'm ready"
        else
          "I'm not ready"
        end
      end
  end

  def return_outside_begin_end_is_ok
    return 'This is okay' if ready?
  end

  def return_inside_begin_end_without_assignment_is_ok
    begin
      return 'This is okay' if ready?
    end
    puts 'This will never execute'
  end

  private

  def ready?
    true
  end
end
