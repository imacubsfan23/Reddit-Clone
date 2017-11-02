class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts.each_with_index do |item, index|
      item.title = "SPAM" if index % 5 == 0
    end
  end

  def show
  end

  def new
  end

  def edit
  end
end
