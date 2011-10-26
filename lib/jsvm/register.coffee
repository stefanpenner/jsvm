class window.Register
  constructor: (@parent, @high=false) ->
    Register.all.push @
    @bits  = @parent and @parent.bits/2 or 32
    unless @parent
      @root = new Integer(@bits)

    Object.defineProperty this, "value",
      get: ->
        if @parent
          if @high
            @parent.value.high
          else
            @parent.value.low
        else
          @root

      set: (value) ->
        # loop up parent, and build value, then assign to root
        if @parent
          if @high
            @parent.high = value
          else
            @parent.low  = value
        else
          @root.value = value

Register.all = []
