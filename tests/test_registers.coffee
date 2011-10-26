module("registers")

test "register with no parent has 32 bits",1, ->
  equal (new Register).bits, 32

test "register with parent has half its parents bits", 1, ->
  parent = new Register
  child  = new Register(parent)

  equal child.bits, parent.bits/2

test "setting register", 2,  ->
  register = new Register
  register.value = 0xdeadbeef

  equal register.value.toI,  0xdeadbeef
  equal register.value.toI, 3735928559

test "setting a register on parent, reading from child", 1, ->
  parent = new Register
  child  = new Register(parent)
  parent.value = 0xdeadbeef

  equal child.value.toI, 0xbeef

test "setting a register on child, reading from parent", 1, ->
  parent = new Register
  child  = new Register(parent)
  parent.value = 0xdeadbeef
  child.value  = 0xdead

  equal parent.value.toI, 0xdeaddead

test "setting a register on parent, reading from low child", 1, ->
  parent = new Register
  child  = new Register(parent,false)
  parent.value = 0xdeadbeef

  equal child.value.toI, 0xbeef

test "setting a register on low child, reading from parent", 1, ->
  parent = new Register
  child  = new Register(parent,false)
  parent.value = 0xdeadbeef
  child.value  = 0xdead

  equal parent.value.toI, 0xdeaddead

test "setting a register on grandparent, reading from low child", 2, ->
  grandParent = new Register
  parent      = new Register(grandParent)
  child       = new Register(parent,false)

  grandParent.value = 0xdeadbeef

  equal parent.value.toI, 0xbeef
  equal child.value.toI,  0xef

test "setting a register on grandparent, reading from high child", 2, ->
  grandParent = new Register
  parent      = new Register(grandParent)
  child       = new Register(parent,true)

  grandParent.value = 0xdeadbeef

  equal parent.value.toI, 0xbeef
  equal child.value.toI,  0xbe

test "setting a register on grandparent, setting from high child", 2, ->
  grandParent = new Register
  parent      = new Register(grandParent)
  child       = new Register(parent,true)

  grandParent.value = 0xdeadbeef

  child.value =   0xff

  equal grandParent.value, 0xdeadffef

test "existence of empty registars", 8, ->
  cpu = new CPU
  same cpu.eax, new Integer(32,0x00000000)
  same cpu.ebx, new Integer(32,0x00000000)
  same cpu.ecx, new Integer(32,0x00000000)
  same cpu.edx, new Integer(32,0x00000000)
  same cpu.esi, new Integer(32,0x00000000)
  same cpu.edi, new Integer(32,0x00000000)
  same cpu.ebp, new Integer(32,0x00000000)
  same cpu.esp, new Integer(32,0x00000000)

