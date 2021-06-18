require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validations of Posts' do
    it 'normal create' do #testeando que no se puedan registrar los post faltando parametros
      @post = Post.new(title:"titulo",content:"bla bla bla",image:"url.png",date_creation:"20 julio",user_id: 1,category_id: 1).save
      expect(@post).to eq(true)
    end
    it 'without title' do #testeando que no se puedan registrar los post faltando parametros
      @post = Post.new(content:"bla bla bla",image:"url.png",date_creation:"20 julio",user_id: 1,category_id: 1).save
      expect(@post).to eq(false)
    end
    it 'without content' do #testeando que no se puedan registrar los post faltando parametros
      @post = Post.new(title:"titulo",image:"url.png",date_creation:"20 julio",user_id: 1,category_id: 1).save
      expect(@post).to eq(false)
    end
    it 'without image' do #testeando que no se puedan registrar los post faltando parametros
      @post = Post.new(title:"titulo",content:"bla bla bla",date_creation:"20 julio",user_id: 1,category_id: 1).save
      expect(@post).to eq(false)
    end
  end

end

