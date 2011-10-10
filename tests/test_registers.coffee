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

  equal register.value, 0xdeadbeef
  equal register.value, 3735928559

test "setting a register on parent, reading from child", 1, ->
  parent = new Register
  child  = new Register(parent)
  parent.value = 0xdeadbeef

  equal child.value, 0xbeef

test "setting a register on child, reading from parent", 1, ->
  parent = new Register
  child  = new Register(parent)
  parent.value = 0xdeadbeef
  child.value  = 0xdead

  equal parent.value, 0xdeaddead

test "setting a register on parent, reading from low child", 1, ->
  parent = new Register
  child  = new Register(parent,false)
  parent.value = 0xdeadbeef

  equal child.value, 0xbeef

test "setting a register on low child, reading from parent", 1, ->
  parent = new Register
  child  = new Register(parent,false)
  parent.value = 0xdeadbeef
  child.value  = 0xdead

  equal parent.value, 0xdeaddead

test "setting a register on grandparent, reading from low child", 2, ->
  grandParent = new Register
  parent      = new Register(grandParent)
  child       = new Register(parent,false)

  grandParent.value = 0xdeadbeef

  equal parent.value, 0xbeef
  equal child.value,  0xef

test "setting a register on grandparent, reading from high child", 2, ->
  grandParent = new Register
  parent      = new Register(grandParent)
  child       = new Register(parent,true)

  grandParent.value = 0xdeadbeef

  equal parent.value, 0xbeef
  equal child.value,  0xbe

test "existence of empty registars", 8, ->
  cpu = new CPU
  equal cpu.eax, 0
  equal cpu.ebx, 0
  equal cpu.ecx, 0
  equal cpu.edx, 0
  equal cpu.esi, 0
  equal cpu.edi, 0
  equal cpu.ebp, 0
  equal cpu.esp, 0

