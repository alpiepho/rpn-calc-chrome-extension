#
# Copyright (C) 2017 ThatNameGroup, LLC. and Al Piepho
#               All Rights Reserved
#

###########################################################
# TEST - random
###########################################################
def test_Random
  puts "SUITE: test_Random"

  puts "  INFO: using seed : %d" % $options.seed
  puts "  INFO: total count: %d" % $options.cnt

  max = $buttonAllIds.length - 1
  prng = Random.new($options.seed)

  for i in 0..$options.cnt
    id = $buttonAllIds[ prng.rand(0..max) ]
    disabledVal = getDisabled(id)
    if disabledVal.nil?
      puts "  DEBUG: id '%s'" % [id] if $options.debug
      click(id)
    end
  end

  puts "  INFO: assume if we got here the test passed"
end
