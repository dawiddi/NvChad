local config = {
  show_jumps = true,
  min_jump = 30,
  popup = {
    delay_ms = 0, -- delay before popup displays
    inc_ms = 10, -- time increments used for fade/resize effects 
    blend = 100, -- starting blend, between 0-100 (fully transparent), see :h winblend
    width = 80,
    fader = require('specs').sinus_fader,
    resizer = require('specs').slide_resizer
  }
}
return config
