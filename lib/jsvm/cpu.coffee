class window.CPU
  constructor: ->
    @_ebx = new Register
    @_esi = new Register
    @_edi = new Register
    @_ebp = new Register
    @_ecx = new Register
    @_eax = new Register
    @_esp = new Register
    @_edx = new Register

    Object.defineProperties this,

      # ** General **
      #
      # 32bit
      # Often set to a commonly used value,
      # such as 0, as an optimization
      ebx:
        get:         -> @_ebx.value
        set: (value) -> @_ebx.value = value

      # 32bit
      # Sometimes used as a
      #  - pointer (source)
      #  - location of function data which does not change
      esi:
        get:         -> @_esi.value
        set: (value) -> @_esi.value = value

      # 32bit
      # Somtimes used as a
      #  - pointer (destination)
      edi:
        get:         -> @_edi.value
        set: (value) -> @_edi.value = value

      # 32bit
      # Either
      #  - frame pointer  (un-optimized, or by hand)
      #  - general purpose
      ebp:
        get:         -> @_ebp.value
        set: (value) -> @_ebp.value = value

      # ** Volatile **
      #
      # 32bit
      # Sometimes used as a
      #  - loop counter
      #  - accumulator
      #  - function paramater
      ecx:
        get:         -> @_ecx.value
        set: (value) -> @_ecx.value = value

      # 32bit
      # Sometimes used as a
      #  - function parameter
      #  - short term variables within functions
      edx:
        get:         -> @_edx.value
        set: (value) -> @_edx.value = value


      # ** special **
      #
      # 32bit
      # return value
      # *
      # /
      eax:
        get:         -> @_eax.value
        set: (value) -> @_eax.value = value


      # 32bit
      # - pointer Bottom of the stack
      # - must be the same at the start/end of each function
      esp:
        get:         -> @_esp.value
        set: (value) -> @_esp.value = value

