#
# Copyright (C) 2017 ThatNameGroup, LLC. and Al Piepho
#               All Rights Reserved
#

###########################################################
# TEST - simple minus
###########################################################
def test_SimpleMinus
  puts "SUITE: test_SimpleMinus"

  puts "  TEST: (hex) CD enter, AB enter, minus"
  click("buttonC")
  click("buttonD")
  click("buttonEnter")
  click("buttonA")
  click("buttonB")
  click("buttonEnter")
  click("buttonMinus")
  assertResultVal("line0", (0xCD - 0xAB))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: (hex) CD enter, AB, minus"
  click("buttonC")
  click("buttonD")
  click("buttonEnter")
  click("buttonA")
  click("buttonB")
  click("buttonMinus")
  assertResultVal("line0", (0xCD - 0xAB))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: toggle format to %d"
  $fmtHex = false
  click("buttonFormat")

  puts "  TEST: (dec) 12 enter, 34 enter, minus"
  click("button1")
  click("button2")
  click("buttonEnter")
  click("button3")
  click("button4")
  click("buttonEnter")
  click("buttonMinus")
  assertResultVal("line0", (12 - 34))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: (dec) 12 enter, 34, minus"
  click("button1")
  click("button2")
  click("buttonEnter")
  click("button3")
  click("button4")
  click("buttonMinus")
  assertResultVal("line0", (12 - 34))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: (dec) 12, +/-, enter, 34 enter, minus"
  click("button1")
  click("button2")
  click("buttonChs")
  click("buttonEnter")
  click("button3")
  click("button4")
  click("buttonEnter")
  click("buttonMinus")
  assertResultVal("line0", (-12 - 34))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: (dec) 12, +/-, enter, 34, minus"
  click("button1")
  click("button2")
  click("buttonChs")
  click("buttonEnter")
  click("button3")
  click("button4")
  click("buttonMinus")
  assertResultVal("line0", (-12 - 34))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: toggle format to %x"
  $fmtHex = true
  click("buttonFormat")
end
