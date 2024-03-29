class window.Integer
  constructor: (@bits,@value=0) ->
    Object.defineProperties this,
      toI:
        get: -> @value
      high:
        get: ->
          return new Integer(16,(@value >>> 16)) if @bits is 32
          return new Integer(8 ,(@value >>>  8)) if @bits is 16
          return new Integer(4 ,(@value >>>  4)) if @bits is  8

        set: (value) ->
          @value = (@value & 0x0000000f) + (value<<4)  if @bits is  8
          @value = (@value & 0x000000ff) + (value<<8)  if @bits is 16
          if @bits is 32
            #silly js, signed ints
            high = value.toString(16)
            low   = @value.toString(16).substring(4,8)
            @value = parseInt(high+low,16)
      low:
        get: ->
          return new Integer(16,(@value & 0x0000ffff)) if @bits is 32
          return new Integer(8 ,(@value & 0x000000ff)) if @bits is 16
          return new Integer(4 ,(@value & 0x0000000f)) if @bits is  8
        set: (value) ->
          @value = (@value & 0x000000f0) + value  if @bits is  8
          @value = (@value & 0x0000ff00) + value  if @bits is 16
          if @bits is 32
            #silly js, signed ints
            high   = @value.toString(16).substring(0,4)
            low   = value.toString(16)
            @value = parseInt(high+low,16)

