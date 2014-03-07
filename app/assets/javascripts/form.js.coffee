$ ->
  console.log "HEREE"
  recalculate = ->
    console.log "calculating"
    $('.speed_cost').val $('.mhash_s').val() / $('.cost').val()
    $('.power_mh_s').val $('.power').val() / $('.mhash_s').val()
  $('.cost').on 'keyup', recalculate
  $('.power').on 'keyup', recalculate
  $('.mhash_s').on 'keyup', recalculate
  console.log "done"
