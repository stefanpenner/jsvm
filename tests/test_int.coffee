module("ints");

test "ok",1, ->
  ok Integer

test "read 32bit low", ->
  integer = new Integer(32,0xdeadbeef)
  equal integer.low, 0xbeef

test "read 32bit high", ->
  integer = new Integer(32,0xdeadbeef)
  equal integer.high, 0xdead

test "read 16bit high", ->
  integer = new Integer(16,0xbeef)
  equal integer.high, 0xbe

test "read 16bit low", ->
  integer = new Integer(16,0xbeef)
  equal integer.low, 0xef

test "read 8bit high", ->
  integer = new Integer(8,0xef)
  equal integer.high, 0xe

test "read 8bit low", ->
  integer = new Integer(8,0xef)
  equal integer.low, 0xf

test "set 32bit low", ->
  integer = new Integer(32,0xdeadbeef)
  integer.low = 0xdead

  equal integer.value, 0xdeaddead

test "set 32bit high", ->
  integer = new Integer(32,0xdeadbeef)
  integer.high = 0xbeef

  equal integer.high, 0xbeefbeef

test "set 16bit high", ->
  integer = new Integer(16,0xbeef)
  integer.high  =  0xef

  equal integer.value, 0xefef

test "set 16bit low", ->
  integer = new Integer(16,0xbeef)
  integer.low  =  0xbe

  equal integer.value, 0xbebe

test "set 8bit high", ->
  integer = new Integer(8,0xef)
  integer.high =  0xf

  equal integer.value, 0xff

test "set 8bit low", ->
  integer = new Integer(8,0xef)
  integer.low = 0xe

  equal integer.value, 0xee
