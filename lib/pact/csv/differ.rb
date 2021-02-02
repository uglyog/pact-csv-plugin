require 'cucumber'

module Pact
  module CSV

    class Differ

      attr_reader :expected, :actual, :options
      def initialize expected, actual, options = {}
        @expected = expected
        @actual = actual
        @options = options
        puts caller.join("\n")
      end

      def self.call expected, actual, options = {}
        new(expected, actual, options).call
      end

      def call
        expected_data = ::CSV.parse(expected, headers: true)
        actual_data = ::CSV.parse(actual, headers: true)
        compare(expected_data, actual_data, options)
      end
      def compare(expected, actual, options)
        expected_table = Cucumber::Ast::Table.new(expected.map(&:to_hash))
        actual_table = Cucumber::Ast::Table.new(actual.map(&:to_hash))
        errors = []
        begin
          p options
          expected_table.diff!(actual_table, surplus_col: options["allow_unexpected_keys"])
        rescue => e
          errors = [e.table]
        end
        errors
      end
    end
  end
end
