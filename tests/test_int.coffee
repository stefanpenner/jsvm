module("ints");

test "ok",1, ->
  ok Integer

test "read 32bit low", ->
  integer = new Integer(32,0xdeadbeef)
  equal integer.low.toI, 0xbeef

test "read 32bit high", ->
  integer = new Integer(32,0xdeadbeef)
  equal integer.high.toI, 0xdead

test "read 16bit high", ->
  integer = new Integer(16,0xbeef)
  equal integer.high.toI, 0xbe

test "read 16bit low", ->
  integer = new Integer(16,0xbeef)
  equal integer.low.toI, 0xef

test "read 8bit high", ->
  integer = new Integer(8,0xef)
  equal integer.high.toI, 0xe

test "read 8bit low", ->
  integer = new Integer(8,0xef)
  equal integer.low.toI, 0xf

test "set 32bit low", ->
  integer = new Integer(32,0xdeadbeef)
  integer.low = 0xdead

  equal integer.toI, 0xdeaddead

test "set 32bit high", ->
  integer = new Integer(32,0xdeadbeef)
  integer.high = 0xbeef

  equal integer.toI, 0xbeefbeef

test "set 16bit high", ->
  integer = new Integer(16,0xbeef)
  integer.high =  0xef

  equal integer.toI, 0xefef

test "set 16bit low", ->
  integer = new Integer(16,0xbeef)
  integer.low =  0xbe

  equal integer.toI, 0xbebe

test "set 8bit high", ->
  integer = new Integer(8,0xef)
  integer.high =  0xf

  equal integer.toI, 0xff

test "set 8bit low", ->
  integer = new Integer(8,0xef)
  integer.low = 0xe

  equal integer.toI, 0xee
