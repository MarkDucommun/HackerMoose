class CssHelper

  def self.nav_bar(title, links, pic)
    nav = "<nav class='left-bar'>
            <div class='margins'>
              <div class='site_name'>
                <img id='title_pic' src='#{pic}' alt="" />
                <h2 id='title_text'><a href='/'>#{title}</a></h2>
              </div>

              <ul>"
    
    links.each { |list| nav << "<li><a href='#{list[:link]}'>#{list[:display]}</a></li>" }
    
    nav += "</ul></div></nav>"
  end

  def self.authentication(user = nil)
    auth = "<div class='authentication'><ul>"
    
    unless user
    
      auth += "<form action='/sign_in' method='post'>
                 <li><input type='text' name='email' placeholder='Enter email'></li>
                 <li><input type='password' name='password' placeholder='Enter password'></li>
                 <li><input class='button' type='submit' value='Sign In'>
               </form>
               <form action='/sign_up' method='get'>
                 <li><input class='button' type='submit' value='Sign Up'></li>
               </form>"
    else
     
      auth += "<li>Moo, #{ user.name }.</li>
               <form action='/sign_out' method='get'>
                 <li><input class='button' type='submit' value='Sign Out'></li>
               </form>"
    end
    
    auth += "</ul></div>"
  end

  def self.paginator(num_elements, base_directory, current_page)
    paginator = "<div class='pagination'>' "
    paginator += "<a href='#{base_directory}/#{current_page}" if current_page ==  1
    paginator += "<a href='#{base_directory}/#{current_page - 1}" unless current_page == 1
    paginator += "'>Previous</a><ol>"

    num_elements.times do |i|
      paginator += "<li><a href='#{base_directory}/#{current_page + 1}'" 
      paginator += " class='active'" if current_page == i + 1
      paginator += "></a>#{current_page + 1}</li>"
    end

    paginator += "</ol><a href='#{base_directory}/#{current_page}" if current_page ==  num_elements
    paginator += "</ol><a href='#{base_directory}/#{current_page + 1}" unless current_page == num_elements
    paginator += "'>Next</a></div>"
  end

  def self.listinator(array, attribute, link, link_id)
    thumbs_down = '<img class="thumbs_down" src="http://png-1.findicons.com/files/icons/2652/gentleface/48/hand_contra_icon.png" border="0" vspace="3" hspace="2" >'
    thumbs_up = '<img class="thumbs_up" src="http://png-5.findicons.com/files/icons/2232/wireframe_mono/48/hand_pro.png" border="0" vspace="3" hspace="2">'
    type = array.first.class.to_s

    listinator = "<ul>"
    array.each do |element|
      listinator += '<li class="votable" data-differentiator="' + type +'" data-id="' + element.id.to_s + '">' + thumbs_up + thumbs_down + '<a href=/' 
      listinator += link + '/' + eval("element." + link_id).to_s
      listinator += '>' + eval("element." + attribute) + '</a>  <span>' + element.votes.to_s + '</span></li>'
    end
    listinator += '</ul>'
  end
end
