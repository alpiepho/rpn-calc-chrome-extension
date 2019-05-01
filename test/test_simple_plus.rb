#
# Copyright (C) 2017 ThatNameGroup, LLC. and Al Piepho
#               All Rights Reserved
#

###########################################################
# TEST - simple plus
###########################################################
def test_SimplePlus
  puts "SUITE: test_SimplePlus"

  puts "  TEST: (hex) AB enter, CD enter, plus"
  click("buttonA")
  click("buttonB")
  click("buttonEnter")
  click("buttonC")
  click("buttonD")
  click("buttonEnter")
  click("buttonPlus")
  assertResultVal("line0", (0xAB + 0xCD))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: (hex) AB enter, CD, plus"
  click("buttonA")
  click("buttonB")
  click("buttonEnter")
  click("buttonC")
  click("buttonD")
  click("buttonPlus")
  assertResultVal("line0", (0xAB + 0xCD))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: toggle format to %d"
  $fmtHex = false
  click("buttonFormat")

  puts "  TEST: (dec) 12 enter, 34 enter, plus"
  click("button1")
  click("button2")
  click("buttonEnter")
  click("button3")
  click("button4")
  click("buttonEnter")
  click("buttonPlus")
  assertResultVal("line0", (12 + 34))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: (dec) 12 enter, 34, plus"
  click("button1")
  click("button2")
  click("buttonEnter")
  click("button3")
  click("button4")
  click("buttonPlus")
  assertResultVal("line0", (12 + 34))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: (dec) 12, +/-, enter, 34 enter, plus"
  click("button1")
  click("button2")
  click("buttonChs")
  click("buttonEnter")
  click("button3")
  click("button4")
  click("buttonEnter")
  click("buttonPlus")
  assertResultVal("line0", (-12 + 34))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: (dec) 12, +/-, enter, 34, plus"
  click("button1")
  click("button2")
  click("buttonChs")
  click("buttonEnter")
  click("button3")
  click("button4")
  click("buttonPlus")
  assertResultVal("line0", (-12 + 34))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: toggle format to %x"
  $fmtHex = true
  click("buttonFormat")
end
