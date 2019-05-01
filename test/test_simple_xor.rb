#
# Copyright (C) 2017 ThatNameGroup, LLC. and Al Piepho
#               All Rights Reserved
#

###########################################################
# TEST - simple xor
###########################################################
def test_SimpleXor
  puts "SUITE: test_SimpleXor"

  puts "  TEST: (hex) CD enter, AB enter, xor"
  click("buttonC")
  click("buttonD")
  click("buttonEnter")
  click("buttonA")
  click("buttonB")
  click("buttonEnter")
  click("buttonXor")
  assertResultVal("line0", (0xCD ^ 0xAB))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: (hex) CD enter, AB, xor"
  click("buttonC")
  click("buttonD")
  click("buttonEnter")
  click("buttonA")
  click("buttonB")
  click("buttonXor")
  assertResultVal("line0", (0xCD ^ 0xAB))

  click("buttonClrAll")
  assertResultEmp("line0")
end
