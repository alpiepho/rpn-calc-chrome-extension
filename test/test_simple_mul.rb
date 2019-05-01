#
# Copyright (C) 2017 ThatNameGroup, LLC. and Al Piepho
#               All Rights Reserved
#

###########################################################
# TEST - simple mul
###########################################################
def test_SimpleMul
  puts "SUITE: test_SimpleMul"

  puts "  TEST: (hex) CD enter, AB enter, mul"
  click("buttonC")
  click("buttonD")
  click("buttonEnter")
  click("buttonA")
  click("buttonB")
  click("buttonEnter")
  click("buttonMul")
  assertResultVal("line0", (0xCD * 0xAB))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: (hex) CD enter, AB, mul"
  click("buttonC")
  click("buttonD")
  click("buttonEnter")
  click("buttonA")
  click("buttonB")
  click("buttonMul")
  assertResultVal("line0", (0xCD * 0xAB))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: toggle format to %d"
  $fmtHex = false
  click("buttonFormat")

  puts "  TEST: (dec) 12 enter, 34 enter, mul"
  click("button1")
  click("button2")
  click("buttonEnter")
  click("button3")
  click("button4")
  click("buttonEnter")
  click("buttonMul")
  assertResultVal("line0", (12 * 34))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: (dec) 12 enter, 34, mul"
  click("button1")
  click("button2")
  click("buttonEnter")
  click("button3")
  click("button4")
  click("buttonMul")
  assertResultVal("line0", (12 * 34))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: (dec) 12, +/-, enter, 34 enter, mul"
  click("button1")
  click("button2")
  click("buttonChs")
  click("buttonEnter")
  click("button3")
  click("button4")
  click("buttonEnter")
  click("buttonMul")
  assertResultVal("line0", (-12 * 34))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: (dec) 12, +/-, enter, 34, mul"
  click("button1")
  click("button2")
  click("buttonChs")
  click("buttonEnter")
  click("button3")
  click("button4")
  click("buttonMul")
  assertResultVal("line0", (-12 * 34))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: toggle format to %x"
  $fmtHex = true
  click("buttonFormat")
end
