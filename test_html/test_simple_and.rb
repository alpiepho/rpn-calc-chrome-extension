#
# Copyright (C) 2017 ThatNameGroup, LLC. and Al Piepho
#               All Rights Reserved
#

###########################################################
# TEST - simple and
###########################################################
def test_SimpleAnd
  puts "SUITE: test_SimpleAnd"

  puts "  TEST: (hex) CD enter, AB enter, and"
  click("buttonC")
  click("buttonD")
  click("buttonEnter")
  click("buttonA")
  click("buttonB")
  click("buttonEnter")
  click("buttonAnd")
  assertResultVal("line0", (0xCD & 0xAB))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: (hex) CD enter, AB, and"
  click("buttonC")
  click("buttonD")
  click("buttonEnter")
  click("buttonA")
  click("buttonB")
  click("buttonAnd")
  assertResultVal("line0", (0xCD & 0xAB))

  click("buttonClrAll")
  assertResultEmp("line0")
end
