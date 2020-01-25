# typed: true

require 'rubygems'
require 'sorbet-runtime'

module Test
  class A
    extend T::Sig

    sig {params(a: T.untyped).void}
    def initialize(a)
      @a = a
    end

  end
end


def run
  c = Class.new(Test::A)
  a ||= c.new(self)
end

threads = []
(1..50).each do |i|
  threads << Thread.new { run }
end

threads.each {|thread| thread.join }

