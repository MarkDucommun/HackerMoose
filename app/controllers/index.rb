get '/' do
  # let user create new short URL, display a list of shortened URLs
  @posts = Post.all.order(:votes).reverse_order
  @display = "_front_page"
  erb :index
end

get '/new_post' do
  @display = "_create_post"
  erb :index
end

get '/post/:id' do
  @display = "_post"
  @post = Post.find(params[:id])
  erb :index
end

get '/user/:id' do
  @display = "_user"
  @user = User.find(params[:id])
  erb :index
end

post '/post/:id/comment' do
  if session[:user_id]
    Post.find(params[:id]).comments.create(
      user: User.find(session[:user_id]),
      text: params[:text])
    redirect("/post/#{params[:id]}")
  else
    redirect('/sign_up')
  end
end

post '/post/new' do
  if session[:user_id]
    post = User.find(session[:user_id]).posts.create(
      title: params[:title],
      url: params[:url])
    redirect("/post/#{post.id}")
  else
    redirect('/sign_up')
  end
end

post '/upvote/:id' do
  if params[:differentiator] == "Post"
    post = Post.find(params[:id].to_i)
    post.toggle_vote(1)    
    return post.votes.to_s 
  else
    comment = Comment.find(params[:id].to_i)
    comment.toggle_vote(1)
    return comment.votes.to_s
  end
end

post '/downvote/:id' do
  puts params
  if params[:differentiator] == "Post"
    post = Post.find(params[:id].to_i)
    post.toggle_vote(-1)    
    return post.votes.to_s 
  else
    comment = Comment.find(params[:id].to_i)
    comment.toggle_vote(-1)
    return comment.votes.to_s
  end
end
