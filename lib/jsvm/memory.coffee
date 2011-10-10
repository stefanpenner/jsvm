class window.Memory
  constructor: (@size = 1024)->
    @memory = new Int32Array(@size)
