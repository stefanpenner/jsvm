class window.Register
  constructor: (@parent, @high=false) ->
    Register.all.push @
    @bits  = @parent and @parent.bits/2 or 32

    Object.defineProperty this, "value",
      get: ->
        slots = @bits/4
        if @parent
          value = @parent.value

          if @high
            value = value >> @bits

          value & if slots is 2
          then 0x000000ff
          else 0x0000ffff
        else
          @_value  || 0x00000000

      set: (value) ->
        slots = @bits/4
        if @parent
          parentValue    = @parent.value
          parentHexValue = parentValue.toString(16)
          hexValue    = value.toString(16)

          front       = parentHexValue.substr(0,slots)
          back        = parentHexValue.substr(slots,slots)
          result      = []

          result.push front unless @high
          result.push hexValue
          result.push back  if @high

          hexResult = result.join('')

          @parent.value = parseInt(hexResult,16)
        else
          @_value = value

    Object.defineProperty this,"slots",
      get: ->
        this.value.length

Register.all = []
