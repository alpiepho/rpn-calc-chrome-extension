#
# Copyright (C) 2017 ThatNameGroup, LLC. and Al Piepho
#               All Rights Reserved
#

###########################################################
# TEST - enter and drop
###########################################################
def test_EnterEachNumberThenDrop
  puts "SUITE: test_EnterEachNumberThenDrop"
  puts "  TEST: (hex) Each number with 'enter'"
  for i in 1..15 do
    click("button%X" % i)
    #puts inputValueStr()
    click("buttonEnter")
    assertResultVal("line0", i)
  end

  puts "  TEST: (hex) drop previous numbers from stack"
  for i in 0..14 do
    assertResultVal("line0", 15-i)
    click("buttonDrop")
    assertResultVal("line0", 15-i-1) if i  < 14
    assertResultEmp("line0")         if i == 14
  end

  puts "  TEST: toggle format to %d"
  $fmtHex = false
  click("buttonFormat")

  puts "  TEST: (dec) Each number with 'enter'"
  for i in 1..9 do
    click("button%X" % i)
    #puts inputValueStr()
    click("buttonEnter")
    assertResultVal("line0", i)
  end

  puts "  TEST: (dec) drop previous numbers from stack"
  for i in 0..8 do
    assertResultVal("line0", 9-i)
    click("buttonDrop")
    assertResultVal("line0", 9-i-1) if i  < 8
    assertResultEmp("line0")        if i == 8
  end

  puts "  TEST: toggle format to %x"
  $fmtHex = true
  click("buttonFormat")
end
