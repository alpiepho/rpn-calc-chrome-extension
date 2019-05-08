#
# Copyright (C) 2017 ThatNameGroup, LLC. and Al Piepho
#               All Rights Reserved
#

###########################################################
# TEST - simple not
###########################################################
def test_SimpleNot
  puts "SUITE: test_SimpleNot"

  puts "  TEST: (hex) CD enter, not"
  click("buttonC")
  click("buttonD")
  click("buttonEnter")
  click("buttonNot")
  assertResultVal("line0", (~0xCD))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: (hex) CD, not"
  click("buttonC")
  click("buttonD")
  click("buttonNot")
  assertResultVal("line0", (~0xCD))

  click("buttonClrAll")
  assertResultEmp("line0")
end
