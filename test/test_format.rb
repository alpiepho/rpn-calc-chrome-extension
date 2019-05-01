#
# Copyright (C) 2017 ThatNameGroup, LLC. and Al Piepho
#               All Rights Reserved
#

###########################################################
# TEST - format button
###########################################################
def test_ToggleFormat
  puts "SUITE: test_ToggleFormat"
  puts "  TEST: (hex) check disabled buttons"
  # only . should be disabled
  $buttonAllIds.each do |id|
    disabledVal = getDisabled(id)
    puts "  DEBUG: id %s   result '%s'" % [id, disabledVal] if $options.debug
    if not id.eql?("buttonDot") and not disabledVal.nil?
      puts "ERROR: '%s' is disabled" % [id]
      forceHang
    end
    if id.eql?("buttonDot") and disabledVal.nil?
      puts "ERROR: '%s' is not disabled" % [id]
      forceHang
    end
  end

  puts "  TEST: toggle format to %d"
  $fmtHex = false
  click("buttonFormat")

  puts "  TEST: (dec) check disabled buttons"
  $buttonAllIds.each do |id|
    disabledVal = getDisabled(id)
    puts "  DEBUG: id %s   result '%s'" % [id, disabledVal] if $options.debug
    if not $buttonHexOnlyIds.include?(id) and not disabledVal.nil?
      puts "ERROR: '%s' is disabled" % [id]
      forceHang
    end
    if $buttonHexOnlyIds.include?(id) and disabledVal.nil?
      puts "ERROR: '%s' is not disabled" % [id]
      forceHang
    end
  end

  puts "  TEST: toggle format to %x"
  $fmtHex = true
  click("buttonFormat")
end
