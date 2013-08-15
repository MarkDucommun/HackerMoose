$(document).ready(function() {
  $('.thumbs_down').click(function(){
    var diff = $(this).parent('.votable').data('differentiator')
    var id = $(this).parent('.votable').data('id')
    var that = this
    $.post('/downvote/' + id, { differentiator: diff },function(votes){
      $(that).next('span').html(votes);
      // $(this).children('span').html(votes);
    });
  });

  $('.thumbs_up').click(function(){
    var diff = $(this).parent('.votable').data('differentiator')
    var id = $(this).parent('.votable').data('id')
    var that = this
    $.post('/upvote/' + id, { differentiator: diff },function(votes){
      $(that).next().next().html(votes);
    });
  });

  $('.add_comment').click(function(event){
    event.preventDefault();
    $.post('/post/' + $('.votable').data('id') + '/comment', $('.add_comment').serialize(), function(new_comment){
      $('.container').append(new_comment)
    })
  });
});
