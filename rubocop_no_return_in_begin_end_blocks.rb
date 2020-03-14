# frozen_string_literal: true

module RuboCop
  module Cop
    module CustomCops
      # This cop checks for *return* inside an *begin..end* block.
      # Avoid using *return* inside a begin..end block as the return will
      # take prececende over any assignment intened by the result of the
      # begin..end block
      #
      # @example
      #
      #   # bad
      #
      #   @some_variable ||= begin
      #     return some_value if some_condition_is_met
      #
      #     do_something
      #   end
      #
      # @example
      #
      #   # good
      #
      #   @some_variable ||= begin
      #     if some_condition_is_met
      #       some_value
      #     else
      #       do_something
      #     end
      #   end
      class ReturnInBeginEndBlockNotAllowed < Cop
        MSG = 'Do not return from `begin..end` block'

        def on_lvasgn(node)
          node.each_node(:return) do |return_code|
            add_offense(return_code)
          end
        end

        def on_or_asgn(node)
          node.each_node(:return) do |return_code|
            add_offense(return_code)
          end
        end
      end
    end
  end
end
