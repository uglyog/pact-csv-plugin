require 'spec_helper'
require 'pact/csv/diff_formatter'

module Pact
  module CSV

    describe DiffFormatter do

      describe ".call" do

        context "when color_enabled is true" do
          it "formats the diff nicely with color"

        end

        context "when color_enabled is false" do
          it "formats the diff nicely without color"
        end

      end

    end

  end
end