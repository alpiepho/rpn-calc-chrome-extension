#
# Copyright (C) 2017 ThatNameGroup, LLC. and Al Piepho
#               All Rights Reserved
#

###########################################################
# TEST - simple shift left
###########################################################
def test_SimpleShiftLeft
  puts "SUITE: test_SimpleShiftLeft"

  puts "  TEST: (hex) CD enter, <<"
  click("buttonC")
  click("buttonD")
  click("buttonEnter")
  click("buttonShiftLeft")
  assertResultVal("line0", (0xCD << 1))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: (hex) CD, <<"
  click("buttonC")
  click("buttonD")
  click("buttonShiftLeft")
  assertResultVal("line0", (0xCD << 1))

  click("buttonClrAll")
  assertResultEmp("line0")
end
