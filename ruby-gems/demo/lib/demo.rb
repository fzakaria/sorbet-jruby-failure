module Demo

  # It is recommended that a library should have one subclass of StandardError or RuntimeError and have specific
  # exception types inherit from it. This allows the user to rescue a generic exception type
  # to catch all exceptions the library may raise even if future versions of the library add new exception subclasses.
  # https://github.com/bundler/bundler/issues/6260
  class Error < StandardError; end

  def self.hello_world
    "hello world"
  end

end
