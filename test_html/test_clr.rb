#
# Copyright (C) 2017 ThatNameGroup, LLC. and Al Piepho
#               All Rights Reserved
#

###########################################################
# TEST - clr
###########################################################
def test_Clr
  puts "SUITE: test_Clr"

  puts "  TEST: (hex) ABC, clr, DE should be ABDE"
  click("buttonA")
  click("buttonB")
  click("buttonC")
  click("buttonClr")
  click("buttonD")
  click("buttonE")
  click("buttonEnter")
  assertResultVal("line0", 0xABDE)

  puts "  TEST: toggle format to %d"
  $fmtHex = false
  click("buttonFormat")

  puts "  TEST: (dropEachNumber) 123, clr, 45 should be 1245"
  click("button1")
  click("button2")
  click("button3")
  click("buttonClr")
  click("button4")
  click("button5")
  click("buttonEnter")
  assertResultVal("line0", 1245)

  click("buttonClrAll")
  assertResultEmp("line0") 

  puts "  TEST: (dropEachNumber) 123, +/-, clr, 45 should be -1245"
  click("button1")
  click("button2")
  click("button3")
  click("buttonChs")
  click("buttonClr")
  click("button4")
  click("button5")
  click("buttonEnter")
  assertResultVal("line0", -1245)

  puts "  TEST: toggle format to %x"
  $fmtHex = true
  click("buttonFormat")
end
