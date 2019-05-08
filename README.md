# rpn_hex_calc (v0.1) - Google Chrome Extension.

A simple reverse-polish-notation (RPN) hex/dec calculator.  This Chrome Extension allows quick access to a tool to do simple hex operations and/or see the decimal value.

## What Is Here

- This Extension consists of an html, JavaScript and css file...simple
- The JavaScript application uses jQuery to build and manipulate the DOM.
- To use jQuery in a Chrome Extension requires packing jQuery with the application.
- This tool can be run from the file popup.html directly in Chrome.
- Also included here, are several Ruby files to test the application.
- The test used Watir (a Ruby implementation of Selenium) and the Chrome driver to automate browser execution

<img src="/images/image3.png" width="200"> <img src="/images/image4.png" width="200">

## How To Use It

At this point, this Extension is not published on the Google Play Store.  It use it, you will need to clone this repository, and manually install into Chrome (in Developer Mode):

- navigate to chrome://extensions/
- enable "Developer Mode"
- select "Load unpacked extension..."
- then navigate to directory you cloned this repository into

## How To Test

- Install Ruby. (Mac use homebrew)
- Install watir (sudo gem install watir)
- Install chromedriver (download from http://chromedriver.chromium.org/, unpack, move to test directory)
- change PATH (export PATH=$PATH:.)
- cd test
- ruby rpn_hex_test.rb -u file:///<path to files>/popup.html

Then enjoy the rapid auto execution of the calculator.



## Next Steps

A few next steps and features:

- Fix keyboard input, getting flaky results so had to disable
- Want to implement "." decimal point input, and float mode


## About Me
I am a long time embedded systems software engineer in the middle of shifting gears, and exploring JavaScript and other web frameworks.  This is my first relatively complete public application.
