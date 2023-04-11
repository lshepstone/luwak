# frozen_string_literal: true

require 'csv'
require 'pry'
require 'qif'

module Luwak
  class CLI
    def run(args = ARGV)
      path_in = args.first
      path_out = args.last

      Qif::Writer.open(path_out, type = 'Bank', format = 'dd/mm/yyyy') do |qif|
        CSV.foreach(path_in, headers: true) do |row|
          qif << Qif::Transaction.new(
            date: row['Date'],
            amount: row['Amount (EUR)'],
            memo: row['Reference'],
            payee: row['Counter Party']
          )
        end
      end
    end
  end
end
