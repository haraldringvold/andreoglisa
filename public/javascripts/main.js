$(function() {
  $('#submit_button').click(function(e) {
    e.preventDefault();
    sendForm();
  });
  $('#name_input, #attending_input, #not_attending_input').blur(function(event) {
    event.target.checkValidity();
  });
});


function sendForm() {
  var data = {
    'event_id': 3,
    'reply[17]': $('#name_input').val(),
    'reply[18]': $('input[name="reply[18]"]:checked').val()
  }

  var result = $.ajax({
    type: 'POST',
    url: "http://ravenform.herokuapp.com/replies/remote_create.json?callback=?",
    data: data,
    dataType: "jsonp"
  });

   result.done(function(data){
    // callback for success
    // example code:
    console.log(data);
    var feedback = $('.feedback');

    if (data.success) {
      console.log("SUCCESS");
      feedback.removeClass('error');
      feedback.addClass('success')
      feedback.text('Svaret er sendt. :)')
    }
    else {
      console.log("FAIL");
      feedback.removeClass('success');
      feedback.addClass('error')
      feedback.text('Noe gikk galt. :(')
    }

  });
}