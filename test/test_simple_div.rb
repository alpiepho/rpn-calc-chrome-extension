#
# Copyright (C) 2017 ThatNameGroup, LLC. and Al Piepho
#               All Rights Reserved
#

###########################################################
# TEST - simple div
###########################################################
def test_SimpleDiv
  puts "SUITE: test_SimpleDiv"
  puts "  TEST: (hex) 1CD enter, AB enter, div"
  click("button1")
  click("buttonC")
  click("buttonD")
  click("buttonEnter")
  click("buttonA")
  click("buttonB")
  click("buttonEnter")
  click("buttonDiv")
  assertResultVal("line0", (0x1CD / 0xAB))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: (hex) 1CD enter, AB, div"
  click("button1")
  click("buttonC")
  click("buttonD")
  click("buttonEnter")
  click("buttonA")
  click("buttonB")
  click("buttonDiv")
  assertResultVal("line0", (0x1CD / 0xAB))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: toggle format to %d"
  $fmtHex = false
  click("buttonFormat")

  puts "  TEST: (dec) 112 enter, 34 enter, div"
  click("button1")
  click("button1")
  click("button2")
  click("buttonEnter")
  click("button3")
  click("button4")
  click("buttonEnter")
  click("buttonDiv")
  assertResultVal("line0", (112 / 34))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: (dec) 112 enter, 34, div"
  click("button1")
  click("button1")
  click("button2")
  click("buttonEnter")
  click("button3")
  click("button4")
  click("buttonDiv")
  assertResultVal("line0", (112 / 34))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: (dec) 112, +/-, enter, 34 enter, div"
  click("button1")
  click("button1")
  click("button2")
  click("buttonChs")
  click("buttonEnter")
  click("button3")
  click("button4")
  click("buttonEnter")
  click("buttonDiv")
  assertResultVal("line0", (-112 / 34))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: (dec) 112, +/-, enter, 34, div"
  click("button1")
  click("button1")
  click("button2")
  click("buttonChs")
  click("buttonEnter")
  click("button3")
  click("button4")
  click("buttonDiv")
  assertResultVal("line0", (-112 / 34))

  click("buttonClrAll")
  assertResultEmp("line0")

  puts "  TEST: toggle format to %x"
  $fmtHex = true
  click("buttonFormat")
end
