#
# Copyright (C) 2017 ThatNameGroup, LLC. and Al Piepho
#               All Rights Reserved
#

###########################################################
# TEST - simple or
###########################################################
def test_SimpleOr
  puts "SUITE: test_SimpleOr"

  puts "  TEST: (hex) CD enter, AB enter, or"
  click("buttonC")
  click("buttonD")
  click("buttonEnter")
  click("buttonA")
  click("buttonB")
  click("buttonEnter")
  click("buttonOr")
  assertResultVal("line0", (0xCD | 0xAB))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: (hex) CD enter, AB, or"
  click("buttonC")
  click("buttonD")
  click("buttonEnter")
  click("buttonA")
  click("buttonB")
  click("buttonOr")
  assertResultVal("line0", (0xCD | 0xAB))

  click("buttonClrAll")
  assertResultEmp("line0")
end
