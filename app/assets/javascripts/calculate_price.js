$(document).ready(function() {

  var initialButtonVal = $('#booking_submit').val()

  $('#booking_start_date').change(function() {
    calculateUpdate(initialButtonVal)
  })
  $('#booking_end_date').change(function() {
    calculateUpdate(initialButtonVal)
  })
});

function calculateDiff(startDate, endDate) {
  return Math.max(Math.ceil((Date.parse(endDate) - Date.parse(startDate))/1000/60/60/24), 0)
}

function calculateTotalPrice(price, days) {
  return price * days
}

function calculateUpdate(initialButtonVal) {
  var difference = calculateDiff($('#booking_start_date').val(), $('#booking_end_date').val())
  var totalPrice = calculateTotalPrice(parseInt($('#price-per-day').text()), difference)
  $('#number-of-days').text(difference)
  $('#total-price').text(totalPrice)
  totalPrice > 0 ? (
    $('#booking_submit').val(initialButtonVal + " for €" + totalPrice)
    ) : (
    $('#booking_submit').val(initialButtonVal)
    );
}
