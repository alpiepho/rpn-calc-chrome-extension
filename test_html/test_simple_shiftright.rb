#
# Copyright (C) 2017 ThatNameGroup, LLC. and Al Piepho
#               All Rights Reserved
#

###########################################################
# TEST - simple shift right
###########################################################
def test_SimpleShiftRight
  puts "SUITE: test_SimpleShiftRight"

  puts "  TEST: (hex) CD enter, >>"
  click("buttonC")
  click("buttonD")
  click("buttonEnter")
  click("buttonShiftRight")
  assertResultVal("line0", (0xCD >> 1))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: (hex) CD, >>"
  click("buttonC")
  click("buttonD")
  click("buttonShiftRight")
  assertResultVal("line0", (0xCD >> 1))

  click("buttonClrAll")
  assertResultEmp("line0")
end
