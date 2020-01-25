# Building

## JAR

```
bundle exec warble

java -jar sorbet-jruby-example.jar
```

## JRuby

```
ruby --version
jruby 9.1.17.0 (2.3.3) 2018-04-20 d8b1ff9 OpenJDK 64-Bit Server VM 25.232-b09 on 1.8.0_232-b09 +jit [darwin-x86_64]

ruby bin/example.rb
```

# Expected Output

The expected output according to the Sorbet team should be:

```
2019-12-04 01:39:13.972 +0000 [ERROR|00b24|] :: RuntimeError : The declaration for `initialize` has extra parameter(s): dialect
   uri:classloader:/gems/sorbet-runtime-0.4.5045/lib/types/private/methods/signature.rb:68:in `initialize'
   uri:classloader:/gems/sorbet-runtime-0.4.5045/lib/types/private/methods/_methods.rb:295:in `build_sig'
   uri:classloader:/gems/sorbet-runtime-0.4.5045/lib/types/private/methods/_methods.rb:268:in `run_sig'
   uri:classloader:/gems/sorbet-runtime-0.4.5045/lib/types/private/methods/_methods.rb:200:in `block in _on_method_added'
   uri:classloader:/gems/sorbet-runtime-0.4.5045/lib/types/private/methods/_methods.rb:364:in `run_sig_block_for_key'
   uri:classloader:/gems/sorbet-runtime-0.4.5045/lib/types/private/methods/_methods.rb:348:in `run_sig_block_for_method'
   uri:classloader:/gems/sorbet-runtime-0.4.5045/lib/types/private/methods/_methods.rb:224:in `block in initialize'
```

This is because Sorbet can't understand `Class.new`


# Actual Output

```
Hello world
TypeError: Parameter 'a': Expected type Integer, got type String with value "s"
Caller: bin/example.rb:26
Definition: bin/example.rb:10
  call_validation_error_handler_default at /Users/faridzakaria/.rvm/gems/jruby-9.1.17.0@looker/gems/sorbet-runtime-0.4.5099/lib/types/configuration.rb:219
          call_validation_error_handler at /Users/faridzakaria/.rvm/gems/jruby-9.1.17.0@looker/gems/sorbet-runtime-0.4.5099/lib/types/configuration.rb:226
                           report_error at /Users/faridzakaria/.rvm/gems/jruby-9.1.17.0@looker/gems/sorbet-runtime-0.4.5099/lib/types/private/methods/call_validation.rb:1122
                    block in initialize at /Users/faridzakaria/.rvm/gems/jruby-9.1.17.0@looker/gems/sorbet-runtime-0.4.5099/lib/types/private/methods/call_validation.rb:815
                                 <main> at bin/example.rb:26
```

Seems to work ?