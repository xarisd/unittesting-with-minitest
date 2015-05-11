title: Unit Testing with Minitest
author: Haris Dimitriou (xarisd)
description: An introduction to unit testing in Ruby using Minitest
date: <%= Date.today %>
% available themes: Default - Sky - Beige - Simple - Serif - Night - Moon - Solarized
theme: simple
% available transitions: // default/cube/page/concave/zoom/linear/fade/none
transition: linear
custom_css: presentation
% code-engine: coderay


!SLIDE
## Unit Testing with Minitest
<p>&nbsp;</p>
<p>&nbsp;</p>
<p class="fragment">Getting started with unit testing in Ruby using Minitest</p>

!SLIDE
## Who am I?
<p>&nbsp;</p>
<h3 class="fragment">
  Haris Dimitriou (<strong>xarisd</strong>)
</h3>
<p>&nbsp;</p>
<p class="fragment">
  Ruby developer<span class="fragment">...among other things</span>
</p>
<p>&nbsp;</p>
<p class="fragment">
  Free lance software engineer
</p>
<p>&nbsp;</p>
<p class="fragment">
  <a href="http://github.com/xarisd">github.com/xarisd</a>
  <br>
  <a href="http://twitter.com/xarisd">twitter.com/xarisd</a>
  <br>
  <a href="http://xarisd.io">xarisd.io</a>
</p>


!SLIDE
## Agenda

<p>&nbsp;</p>

* I DO NOT TEST
* Testing the poor man's way
* Testing with Minitest
* Testing with RSpec (mini version)
* Resources

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

!SLIDE down-open
!SLIDE
## I DO NOT TEST
<p>&nbsp;</p>
<h3 class="fragment">Because I am the best :-)</h3>
<p>&nbsp;</p>
<p class="fragment">and my code does not have bugs! </p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p class="fragment">LOL</p>

!SLIDE
## You think you do not test...

<p class="fragment">Let's see a simple example</p>

!SLIDE
### You have the following assignement

!SLIDE
* Create a class that will hold statistics
* Each instance of the class should hold the **value** and the **name** of a **single** statistic
* The instance should know how to return its name and value
* The instance should know how to **print** as a string

!SLIDE
### And then you write awesome code...

<pre class="fragment"><code class="ruby">
<%= include 'code/01-poormans-testing/stat.rb' %>
</code></pre>

!SLIDE
### And you are done!
<p>&nbsp;</p>
<p class="fragment">Right?</p>
<p>&nbsp;</p>
<p class="fragment">I do not think so...</p>
<p>&nbsp;</p>
<p class="fragment">How do you know it's working?</p>
<p>&nbsp;</p>
<p class="fragment">I mean...</p>
<p>&nbsp;</p>
<p class="fragment"> How do you <strong>REALLY</strong> know it is working?</p>

!SLIDE
### You could run the program
<p>&nbsp;</p>
<ul>
  <li class="fragment">Open the command line and run the application (if it's a CLI)</li>
  <li class="fragment">Run the web server and open the application in the browser (if it's a Web Application)</li>
  <li class="fragment">Run the web server and open Postman or <em>curl</em> or any HTTP client to send requests (if it's a Web API)</li>
  <li class="fragment">You get the point...</li>
</ul>

!SLIDE
### In our case
<p>&nbsp;</p>
<p class="fragment">Open <em>IRB</em> and play with the class</p>
<pre class="fragment"><code class="bash">
## in the shell
cd path/to/dir
irb
</code></pre>

<pre class="fragment"><code class="ruby">
<%= include 'code/01-poormans-testing/irb_stat.rb' %>
</code></pre>

!SLIDE
### Wait a minute...
<p>&nbsp;</p>
<p class="fragment">What did we just do?</p>
<p>&nbsp;</p>
<p class="fragment">We <strong>TESTED</strong> our code</p>
<p>&nbsp;</p>
<p class="fragment">by hand :-)</p>

!SLIDE
So...
<p>&nbsp;</p>
<p class="fragment">there is no:</p>
<p>&nbsp;</p>
<p class="fragment">"I DO NOT TEST"</p>
<p>&nbsp;</p>
<p class="fragment">There is: </p>
<p class="fragment">"I do not test <span class="fragment"><strong>AUTOMATICALLY</strong> and <strong>REPEATEDLY</strong>"</span></p>

!SLIDE
### OK let's be cool...
<p>&nbsp;</p>
<p class="fragment">and test this thing</p>
<p>&nbsp;</p>
<p class="fragment">BUT...</p>
<p>&nbsp;</p>
<p class="fragment">How?</p>


!SLIDE down-close
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

!SLIDE down-open
!SLIDE
## Testing the poor man's way

!SLIDE
### One way to do it
<p>&nbsp;</p>
<p class="fragment">Manually</p>

!SLIDE
### Remember the <em>irb</em> session?
<p>&nbsp;</p>

<pre class="fragment"><code class="ruby">
<%= include 'code/01-poormans-testing/irb_stat.rb' %>
</code></pre>

<p>&nbsp;</p>
<p class="fragment">Let's use that as a skeleton</p>

!SLIDE
### What do we need?
<p>&nbsp;</p>
<ul>
  <li class="fragment">A way to make "assertions"</li>
  <li class="fragment">A way to run the "tests"</li>
  <li class="fragment">A way to seperate the "tests" from the class it self</li>
</ul>

!SLIDE
### Round 1: Same file
<p>&nbsp;</p>
<p class="fragment">stat.rb</p>
<pre class="fragment"><code class="ruby">
<%= include 'code/01-poormans-testing/01-same-file/stat.rb' %>
</code></pre>

!SLIDE
Note: You can still use the file as a "library" with "require" and "require_relative"
<p>&nbsp;</p>
<p class="fragment">This way the tests won't run</p>
<p>&nbsp;</p>
<p class="fragment">But it is...ugly</p>

!SLIDE
### Round 2: Separate files
<p>&nbsp;</p>
<div class="fragment">
  <p>stat.rb</p>
  <pre><code class="ruby">
  <%= include 'code/01-poormans-testing/02-separate-files/stat.rb' %>
  </code></pre>
</div>

!SLIDE
<p>test_stat.rb</p>
<pre><code class="ruby">
<%= include 'code/01-poormans-testing/02-separate-files/test_stat.rb' %>
</code></pre>


!SLIDE
### Round 3: Separate files with helper
<p>&nbsp;</p>
<div class="fragment">
  <p>stat.rb</p>
  <pre><code class="ruby">
  <%= include 'code/01-poormans-testing/02-separate-files-with-helper/stat.rb' %>
  </code></pre>
</div>

!SLIDE
<p>test_helper.rb</p>
<pre><code class="ruby">
<%= include 'code/01-poormans-testing/02-separate-files-with-helper/test_helper.rb' %>
</code></pre>

!SLIDE
<p>test_stat.rb</p>
<pre><code class="ruby">
<%= include 'code/01-poormans-testing/02-separate-files-with-helper/test_stat.rb' %>
</code></pre>

!SLIDE
### Round 4
<p>&nbsp;</p>
<p class="fragment">STOP!</p>
<p>&nbsp;</p>
<p class="fragment">Use a test framework!</p>

!SLIDE down-close
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

!SLIDE down-open
!SLIDE
## Testing with Minitest

!SLIDE
## Testing with Minitest : Agenda
<p>&nbsp;</p>
* Intro to Minitest
* Example using Minitest
* (Some) Best Practices
* More on Minitest and Resources

!SLIDE
## What is Minitest?
<p>&nbsp;</p>
<quote class="fragment">"Minitest provides a complete suite of testing facilities supporting TDD, BDD, mocking, and benchmarking."</quote>
<p>&nbsp;</p>
<p class="fragment">It comes pre-bundled with Ruby itself! (>= 1.9)</p>
<p class="fragment">For Ruby < 1.9 just <code>gem install minitest</code></p>


!SLIDE
## Using Minitest with our example
<p>&nbsp;</p>
<div class="fragment">
  <p>stat.rb</p>
  <pre><code class="ruby">
  <%= include 'code/02-minitest/01-simple/stat.rb' %>
  </code></pre>
</div>

!SLIDE
<p>test_stat.rb</p>
<pre><code class="ruby">
<%= include 'code/02-minitest/01-simple/test_stat.rb' %>
</code></pre>
<ul>
  <li class="fragment"><code>require "minitest/autorun"</code> enables automatic run of the tests from command line with <code>ruby test_stat</code></li>
  <li class="fragment">You must create a subclass of <code>Minitest::Test</code></li>
  <li class="fragment">All your test methods must start with <code>test_</code></li>
  <li class="fragment">Minitest offers <a href="http://docs.seattlerb.org/minitest/Minitest/Assertions.html" target="_blank">a lot of assertions</a></li>
</ul>


!SLIDE
## (Some) Best Practices

!SLIDE
### BP1. Use as few assertions as possible per test method
<p>&nbsp;</p>
<div class="fragment">
  <pre><code class="ruby">
  <%= include 'code/02-minitest/01-simple/test_stat_single_assertions.rb' %>
  </code></pre>
</div>


!SLIDE
### BP2. Avoid repetition using `setup` and `teardown`
<p>&nbsp;</p>
<div class="fragment">
  <pre><code class="ruby">
  <%= include 'code/02-minitest/01-simple/test_stat_avoid_repetition.rb' %>
  </code></pre>
</div>


!SLIDE
### BP3. When **unit** testing use **test doubles** to isolate external dependencies
<p>&nbsp;</p>
<h4 class="fragment">Some examples:</h4>
<ul>
  <li class="fragment">3rd party systems (i.e. external APIs)</li>
  <li class="fragment">Database/storage access</li>
  <li class="fragment">Sending email</li>
  <li class="fragment">Setting Time!</li>
</ul>
<p>&nbsp;</p>
<p class="fragment">This will make your tests <strong>QUICK</strong> too!</p>

!SLIDE
#### (Test doubles)

### Mocks vs Stubs

<p>&nbsp;</p>
<p class="fragment">
<strong>Stub</strong> : For replacing a method with code
that returns a specified result.
</p>

<p>&nbsp;</p>
<p class="fragment">
<strong>Mock</strong> : A stub with an assertion that the
method gets called.
</p>

<p>&nbsp;</p>
<p class="fragment">
See Martin Fowler's <a href="http://www.martinfowler.com/bliki/TestDouble.html">"TestDouble"</a>
</p>

<p>&nbsp;</p>
<p class="fragment">Minitest specific</p>
<ul>
  <li class="fragment"><a href="http://docs.seattlerb.org/minitest/Minitest/Mock.html">Mock API</a></li>
  <li class="fragment"><a href="http://docs.seattlerb.org/minitest/Object.html#method-i-stub">Object.stub API</a></li>
</ul>
!SLIDE
#### (Test doubles)

### Mocks - example
<p>&nbsp;</p>
<div class="fragment">
  <pre><code class="ruby">
  <%= include 'code/02-minitest/02-testdoubles/test_mock.rb' %>
  </code></pre>
</div>

!SLIDE
#### (Test doubles)

### Stubs - example
<p>&nbsp;</p>
<div class="fragment">
  <pre><code class="ruby">
  <%= include 'code/02-minitest/02-testdoubles/test_stub.rb' %>
  </code></pre>
</div>

!SLIDE
#### (Test doubles)

### Usually they are used together
<p>&nbsp;</p>
<div class="fragment">
  <pre><code class="ruby">
  <%= include 'code/02-minitest/02-testdoubles/test_stat.rb' %>
  </code></pre>
</div>


!SLIDE
### BP4. Separate your tests so that you can run them separately
<p>&nbsp;</p>
<ul>
  <li class="fragment">Smoke tests</li>
  <li class="fragment">Unit tests</li>
  <li class="fragment">Integration tests</li>
  <li class="fragment">Acceptance tests</li>
  <li class="fragment">Benchmarks</li>
</ul>
<p>&nbsp;</p>
<p class="fragment">* With Minitest you are on your own here...</p>
<p class="fragment">Your best bet is to use the <code>-n, --name PATTERN</code> option</p>
<p class="fragment">See <a href="https://github.com/seattlerb/minitest#running-your-tests">Running Your Tests</a></p>



!SLIDE
### BP5. Automate, automate, automate!
<p>&nbsp;</p>
<p class="fragment">Do your self a favor</p>
<p>&nbsp;</p>
<p class="fragment">Use <code>rake</code> awesomeness</p>
<p>&nbsp;</p>
<p class="fragment">or something similar</p>

!SLIDE
## More on Minitest
<p>&nbsp;</p>
<ul>
  <li class="fragment"><a href="https://github.com/seattlerb/minitest#specs" target="_blank"><code>minitest/spec</code></a> : a very fast, simple, and clean spec system.</li>
  <li class="fragment"><a href="https://github.com/seattlerb/minitest#benchmarks" target="_blank"><code>minitest/benchmark</code></a> : an awesome way to assert your algorithm's performance.</li>
  <li class="fragment">a way to <a href="https://github.com/seattlerb/minitest#writing-extensions" target="_blank">write your own extensions</a></li>
  <li class="fragment">And a lot of <a href="https://github.com/seattlerb/minitest#known-extensions" target="_blank">ready to use extensions</a></li>
</ul>

!SLIDE
## Minitest Resources
<p>&nbsp;</p>

* Minitest home: [https://github.com/seattlerb/minitest](https://github.com/seattlerb/minitest)
* Articles
  * [How to Use MiniTest](http://blog.teamtreehouse.com/short-introduction-minitest)
  * [Minitest Quick Reference](http://www.mattsears.com/articles/2011/12/10/minitest-quick-reference)
  * [How do I test my code with Minitest?](http://rubylearning.com/blog/2011/07/28/how-do-i-test-my-code-with-minitest/)
  * [Minimalicious testing in Ruby 1.9 with MiniTest](http://blog.arvidandersson.se/2012/03/28/minimalicous-testing-in-ruby-1-9)
  * [A MiniTest::Spec Tutorial: Elegant Spec-Style Testing That Comes With Ruby](http://www.rubyinside.com/a-minitestspec-tutorial-elegant-spec-style-testing-that-comes-with-ruby-5354.html)
  * [A Guide to Testing Rails Applications](http://guides.rubyonrails.org/testing.html)
  * [Using MiniTest::Spec With Rails](http://metaskills.net/2011/03/26/using-minitest-spec-with-rails/)

!SLIDE
## Testing with Minitest : Wrap-up
<p>&nbsp;</p>
* Intro to Minitest
* Example using Minitest
* (Some) Best Practices
* More on Minitest and Resources


!SLIDE down-close
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

!SLIDE down-open
!SLIDE
## Testing with RSpec
<p>&nbsp;</p>
<h3 class="fragment">mini version</h3>

!SLIDE
## Testing with RSpec : Agenda
<p>&nbsp;</p>
* Intro to RSpec
* Example using RSpec
* Configuration, Running and Filters
* Avoid repetition with RSpec
* Mocking & Stubbing with RSpec
* More on RSpec and Resources

!SLIDE
## What is RSpec?
<p>&nbsp;</p>
<quote class="fragment">"Behaviour Driven Development for Ruby.<br/>
Making TDD Productive and Fun."</quote>
<p>&nbsp;</p>
<ul>
  <li class="fragment">It is a very popular testing framework with a large community.</li>
  <li class="fragment">It offers well-formatted output</li>
  <li class="fragment">It offers fine grained control for running your tests</li>
  <li class="fragment">It encourages BDD (but it does not require it)</li>
</ul>

!SLIDE
## Using RSpec with our example
<p>&nbsp;</p>
<ol>
  <li class="fragment">
    <p>Install it</p>
    <code class="bash">
    gem install rspec
    </code>
  </li>
  <li class="fragment">
    <p>Create the needed files</p>
    <code class="bash">
    rspec --init
    </code>
  </li>
  <li class="fragment">
    <p>This creates the following</p>
    <ul>
      <li><code>.rspec</code> file</li>
      <li>
        <code>spec</code> folder
        <ul>
          <li>spec/<code>spec_helper.rb</code> file</li>
        </ul>
      </li>
    </ul>
  </li>
  <li class="fragment">
    <p>Create the <em>specification</em> file ending in <code>_spec.rb</code> containing your <em>examples</em></p>
    <ul>
      <li>spec/<code>stat_spec.rb</code> file</li>
    </ul>
  </li>
  <li class="fragment">
    <p>Run the specs</p>
    <code class="bash">
    rspec
    </code>
  </li>
</ol>

!SLIDE
#### RSpec syntax

## `describe` and `it`
<p>&nbsp;</p>
<pre class="fragment"><code class="ruby">
<%= include 'code/03-rspec/01-simple/spec/stat_spec_01_pending.rb' %>
</code></pre>


!SLIDE
#### RSpec syntax

### `describe class`
<p>&nbsp;</p>
<pre class="fragment"><code class="ruby">
<%= include 'code/03-rspec/01-simple/spec/stat_spec_02_describe_class.rb' %>
</code></pre>


!SLIDE
#### RSpec syntax

### `describe class` (OK)
<p>&nbsp;</p>
<pre><code class="ruby">
<%= include 'code/03-rspec/01-simple/spec/stat_spec_02_describe_class_ok.rb' %>
</code></pre>


!SLIDE
#### RSpec syntax

### Expectations (Old style)
<p>&nbsp;</p>
<pre class="fragment"><code class="ruby">
<%= include 'code/03-rspec/01-simple/spec/stat_spec_03_old_style.rb' %>
</code></pre>


!SLIDE
#### RSpec syntax

### Expectations (New style)
<p>&nbsp;</p>
<pre class="fragment"><code class="ruby">
<%= include 'code/03-rspec/01-simple/spec/stat_spec_04_new_style.rb' %>
</code></pre>


!SLIDE
## RSpec Expectations and Matchers
<p>&nbsp;</p>
<ul>
  <li class="fragment">RSpec expectations <a href="http://rspec.info/documentation/3.2/rspec-expectations/#Basic_usage">are super easy to use</a></li>
  <li class="fragment">RSpec has many <a href="http://rspec.info/documentation/3.2/rspec-expectations/#Built-in_matchers">built-in matchers</a></li>
  <li class="fragment">You can write your own matchers</li>
  <li class="fragment">You can <code>require 'rspec/expectations'</code> and include <code>RSpec::Matchers</code> in any class outside RSpec (i.e. in Minitest)</li>
</ul>

!SLIDE
## Avoid repetition with RSpec


!SLIDE
#### Avoid repetition with RSpec

### Using hooks: `before` , `after`
<p>&nbsp;</p>
<pre><code class="ruby">
<%= include 'code/03-rspec/01-simple/spec/stat_spec_05_hooks.rb' %>
</code></pre>

!SLIDE
#### Avoid repetition with RSpec

### Using `subject` explicitly
<p>&nbsp;</p>
<pre><code class="ruby">
<%= include 'code/03-rspec/01-simple/spec/stat_spec_06_subject_explicitly.rb' %>
</code></pre>

!SLIDE
#### Avoid repetition with RSpec

### Using `subject` implicitly
<p>&nbsp;</p>
<pre><code class="ruby">
<%= include 'code/03-rspec/01-simple/spec/stat_spec_07_subject_implicitly.rb' %>
</code></pre>


!SLIDE
#### Avoid repetition with RSpec

### Naming `subject`
<p>&nbsp;</p>
<pre><code class="ruby">
<%= include 'code/03-rspec/01-simple/spec/stat_spec_08_naming_subject_explicitly.rb' %>
</code></pre>


!SLIDE
#### Avoid repetition with RSpec

### Using `let` and `let!`
<p>&nbsp;</p>
<pre><code class="ruby">
<%= include 'code/03-rspec/01-simple/spec/stat_spec_09_let.rb' %>
</code></pre>



!SLIDE
#### Avoid repetition with RSpec

### Using nested groups ( `describe`, `context`) and `it` with no name
<p>&nbsp;</p>
<pre><code class="ruby">
<%= include 'code/03-rspec/01-simple/spec/stat_spec_10_nested_groups.rb' %>
</code></pre>




!SLIDE
#### Avoid repetition with RSpec

### Using shared examples (with `shared_examples` and `include_examples`)
<p>&nbsp;</p>
<pre><code class="ruby">
<%= include 'code/03-rspec/01-simple/spec/shared_examples_spec.rb' %>
</code></pre>


!SLIDE
## Testing with RSpec : Wrap-up
<p>&nbsp;</p>
* Intro to RSpec
* Example using RSpec
* Configuration, Running and Filters
* Avoid repetition with RSpec
* Mocking & Stubbing with RSpec
* More on RSpec and Resources

!SLIDE down-close
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

!SLIDE down-open
!SLIDE
## Thank you!
<p>&nbsp;</p>
<h3 class="fragment">Liked the presentation?</h3>
<p>&nbsp;</p>
<p class="fragment">
  Source: <a href="http://github.com/xarisd/unittesting-with-minitest"> github.com/xarisd/unittesting-with-minitest</a>
</p>
<p>&nbsp;</p>
<p>
<p class="fragment">
  View it online: <a href="http://xarisd.io/presentations/unittesting-with-minitest">xarisd.io/presentations/unittesting-with-minitest</a>
</p>
<p>&nbsp;</p>
<p class="fragment">
  Have something to say?
</p>
<p class="fragment">
  Send me a tweet or direct message: <a href="http://twitter.com/xarisd">@xarisd</a>
</p>
<p>&nbsp;</p>
<p class="fragment">Questions?</p>
