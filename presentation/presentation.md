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

* Testing in general (?)
* I DO NOT TEST
* Testing the poor man's way
* Unit Testing with Minitest
  * Hello Minitest
* Digging Deeper with Minitest
    * Hooks (setup/teardown)
    * Isolating dependencies with Test doubles (mocks & stubs)
    * ...
* Test automation
* Resources

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

!SLIDE down-open
!SLIDE
## 1. Testing in General

TODO...


!SLIDE down-close
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


!SLIDE down-close
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

!SLIDE down-open
!SLIDE
## Digging Deeper with Minitest

!SLIDE down-close
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

!SLIDE down-open
!SLIDE
## Test Automation

!SLIDE down-close
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

!SLIDE down-open
!SLIDE
## Resources

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
