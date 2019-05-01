#
# Copyright (C) 2017 ThatNameGroup, LLC. and Al Piepho
#               All Rights Reserved
#

###########################################################
# TEST - clr all
###########################################################
def test_ClrAll
  puts "SUITE: test_ClrAll"

  puts "  TEST: (hex) AB enter, CD enter, ac, should be empty"
  click("buttonA")
  click("buttonB")
  click("buttonEnter")
  click("buttonC")
  click("buttonD")
  click("buttonEnter")
  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: toggle format to %d"
  $fmtHex = false
  click("buttonFormat")

  puts "  TEST: (hex) 12 enter, 34 enter, ac, should be empty"
  click("button1")
  click("button2")
  click("buttonEnter")
  click("button3")
  click("button4")
  click("buttonEnter")
  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: toggle format to %x"
  $fmtHex = true
  click("buttonFormat")
end
