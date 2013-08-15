$(document).ready(function() {
  $('.thumbs_down').click(function(){

    
    var diff = $(this).parent('.votable').data('differentiator')
    var id = $(this).parent('.votable').data('id')
    console.log(diff);
    console.log(id);
    var that = this
    $.post('/downvote/' + id, { differentiator: diff },function(votes){
      $(that).next('span').html(votes);
      // $(this).children('span').html(votes);
    });
  });

  $('.thumbs_up').click(function(){
    
    
    var diff = $(this).parent('.votable').data('differentiator')
    var id = $(this).parent('.votable').data('id')
    console.log(diff);
    console.log(id);
    
    $.post('/upvote/' + id, { differentiator: diff },function(votes){
      console.log(votes)
      console.log(this)
      $(this).next('span').hide();
    });
  });
});
