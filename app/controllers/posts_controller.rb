class PostsController < ApplicationController
      before_action :authenticate
      def index
        if params[:category] || params[:title]
          @Post = search(params)
        else
          @Post = Post.select('id','title','image','date_creation','category_id','status').where(status: true).order("date_creation desc")
        end
        render json:{post: @Post, status: :ok}
      end
    
      def show
        @Post = Post.find(params[:id].to_i)
        render json:{post: @Post, status: :ok}
      end
    
      def create
        @Post = Post.new(title: params[:title],image: params[:image],content: params[:content],date_creation: params[:date_creation],user_id: params[:user_id],category_id: params[:category_id])
        if @Post.save
          render json: {msg: "success",status: :created}
        else
          render json: {msg: "failed"}
        end
        
      end
    
      def update
        @Post = Post.find(params[:id])
        if @Post.update(title: params[:title],image: params[:image],date_creation: params[:date_creation], content: params[:content],category_id: params[:category_id],user_id: params[:user_id],status: params[:status])
          
          render json: @Post, status: :accepted
        else
          render json: {msg: "error"}
        end

      end
    
      def destroy
        Post.find(params[:id])
        render json: {msg: "destruyed", status: :ok}
      end

      private
      def search(params)
        if params[:title] && params[:category]
          @post = Post.select('id','title','image','date_creation','category_id','status').where(status: true).where(["title LIKE ?","%#{params[:title]}%"]).where(category_id: params[:category].to_i).order("date_creation desc")
        elsif !params[:category]
          @post = Post.select('id','title','image','date_creation','category_id','status').where(status: true).where(["title LIKE ?","%#{params[:title]}%"]).order("date_creation desc")
        elsif !params[:title]
          @post = Post.select('id','title','image','date_creation','category_id','status').where(status: true).where(category_id: params[:category].to_i).order("date_creation desc")
        end                                                                                              #age: params[:age].to_i                     
     
      end

      #def post_params
      #  params.require(:post).permit(:title,:image,:content,:date_creation,:user_id,:category_id)
      #end
end
