_ = require("underscore")
global.jQuery = require("jquery")
$ = jQuery
FlipClock = require("flipclock")


class Countdown

  date_pat_out: (new Date(2016, 11, 8, 0, 0, 0, 0))

  start: ->
    @isHeOut()
    @countdown()
    @patfact()
    $('.another-patfact').click( =>
      @patfact()
    )

  isHeOut: ->
    if Date.now == @date_pat_out
      $('.answer').html("<img src='images/yes.png'/>")
    else
      $('.answer').html("<img src='images/no.png'/>")

  countdown: ->
    our_date = Date.now()
    time_till_pat_out = (@date_pat_out - our_date) / 1000

    clock = $('.flipclock').FlipClock( time_till_pat_out,
      clockFace: "DailyCounter"
      countdown: true
    )

  patfact: ->
    $('header h1').html(_.sample(@patfacts))

  patfacts:
    [
      "DAY'S 'TILL PAT HITS THE BRICKS",
      "DAY'S 'TILL PAT IS OUT",
      "PAT MCCRORY COUNTDOWN",
    ]

countdown = new Countdown
countdown.start()
