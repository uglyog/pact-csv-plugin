module Pact
  module CSV

    class DiffFormatter

      attr_reader :diff, :colour
      def initialize diff, options = {}
        @diff = diff
        @colour = options.fetch(:colour, false)
      end

      def self.call diff, options = {colour: Pact.configuration.color_enabled}
        new(diff, options).call
      end

      def call
        diff.join("\n")
      end

      private



    end

  end
end