require 'rubygems'
require "bundler/setup"

def self.running_from_jar?
	File.expand_path(__FILE__)[0] != "/"
end

puts "Starting the JAR: #{running_from_jar?}"

puts "Revert: " + Java::JavaLang::Thread.currentThread.getContextClassLoader.getURLs.first.getPath

cl = Java::JavaNet::URLClassLoader.new([].to_java(java.net.URL), Java::JavaLang::Thread.currentThread.getContextClassLoader)
cl_url = cl.getURLs.first
puts "Original: " + (cl_url&.getPath || "nil")
