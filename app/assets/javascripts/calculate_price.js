$(document).ready(function() {
  $('#booking_start_date').change(function() {
    calculateUpdate()
  })
  $('#booking_end_date').change(function() {
    calculateUpdate()
  })
});

function calculateDiff(startDate, endDate) {
  return Math.max(Math.ceil((Date.parse(endDate) - Date.parse(startDate))/1000/60/60/24), 0)
}

function calculateTotalPrice(price, days) {
  return price * days
}

function calculateUpdate() {
  var difference = calculateDiff($('#booking_start_date').val(), $('#booking_end_date').val())
  var totalPrice = calculateTotalPrice(parseInt($('#price-per-day').text()), difference)
  $('#number-of-days').text(difference)
  $('#total-price').text(totalPrice)
}
