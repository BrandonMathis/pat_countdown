_ = require("underscore")
global.jQuery = require("jquery")
$ = jQuery
FlipClock = require("flipclock")


class Countdown

  date_pat_out: (new Date("Jan 1, 2017"))

  start: ->
    @isHeOut()
    @countdown()
    @patfact()
    @patimage()
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
    time_till_pat_out = 0
    if new Date(@date_pat_out) > Date.now()
      time_till_pat_out = (@date_pat_out - our_date) / 1000

    clock = $('.flipclock').FlipClock( time_till_pat_out,
      clockFace: "DailyCounter"
      countdown: false
    )

  patfact: ->
    $('header h1').html(_.sample(@patfacts))

  patimage: ->
    $('.is_pat_out .img').html("<img src='#{_.sample(@patimages)}'/>")

  patimages:
    [
      "images/pat1.png",
      "images/pat2.jpg",
      "images/pat3.jpg"
    ]

  patfacts:
    [
      "DAYS 'TILL PAT HITS THE BRICKS",
      "DAYS 'TILL PAT IS OUT",
      "PAT MCCRORY COUNTDOWN",
    ]

countdown = new Countdown
countdown.start()
