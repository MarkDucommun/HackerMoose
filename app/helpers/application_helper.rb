class AppHelper
  
  def self.new_comment(comment)
    thumbs_down = '<img class="thumbs_down" src="http://png-1.findicons.com/files/icons/2652/gentleface/48/hand_contra_icon.png" border="0" vspace="3" hspace="2" >'
    thumbs_up = '<img class="thumbs_up" src="http://png-5.findicons.com/files/icons/2232/wireframe_mono/48/hand_pro.png" border="0" vspace="3" hspace="2">'
    
    new_comment = '<div class="comment"><h4 class="votable" data-id="' + comment.id.to_s + ' data-differentiator="Comment">'
    new_comment += '<a href="/user/' + comment.user.id.to_s + '">' + comment.user.name + '</a>' + thumbs_up 
    new_comment += thumbs_down + '<span>' + comment.votes.to_s + '</span></h4><p>' + comment.text + '<p></div>'
  end
end
