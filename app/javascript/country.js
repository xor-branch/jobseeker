$(document).ready(function(){
  var states;

  $('#compagny_state_id').parent().hide();

  states = $('#compagny_state_id').html();

  $('#compagny_country_id').change(function() {
    var country, escaped_country, options;
    country = $('#compagny_country_id :selected').text();
    escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(states).filter("optgroup[label='" + escaped_country + "']").html();
    if (options) {
      $('#compagny_state_id').html(options);
      return $('#compagny_state_id').parent().show();
    } else {
      $('#compagny_state_id').empty();
      return $('#compagny_state_id').parent().hide();
    }
  });
})
