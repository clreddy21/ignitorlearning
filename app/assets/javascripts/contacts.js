$(document).ready(function() {

    $("#keypad").keypad({
            width: 300,
            height: 300
        }

    );

    $(".add_contact").on('click', function() {
      $(".form").toggle()
    })

    document.body.addEventListener('ajax:success', function(event) {
        var detail = event.detail;
        var data = detail[0], status = detail[1],  xhr = detail[2];
        $(".response").append(data)
        $(".response").siblings([1])[0].reset()
        $(".response").siblings([1]).toggle()
    })

    $("#google_results").dataTable();

});