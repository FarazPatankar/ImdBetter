// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  $('.add-actor-trigger').click(function(e) {
    $('#add-actor-modal').modal('open');
  })

  $('.add-actor-btn').click(function(e) {
    var actorId = Number($('select.add-actor-select').val());
    var movieId = $('.movie-title').data('id');

    $.ajax({
      url: '/movies/add-actor',
      method: 'POST',
      data: {actor_id: actorId, movie_id: movieId},
      success: function(res) {
        var actorName = res.name;
        $('.actor-list').append(
          '<li>' + actorName +'</li>'
        )

        $('#add-actor-modal').modal('close');
        Materialize.toast("" + actorName + " was successfully added", 3000, "rounded green");
      },
      error: function(err) {
        Materialize.toast("There was an issue addding the actor", 3000, "rounded red");
      }
    })
  })
});