require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation Users' do
    it 'ensures email presence' do #testeando que no se puedan registrar los usuarios faltando parametros
        user = User.new(password: "randoms").save
        expect(user).to eq(false)
    end
    it 'ensures email presence' do
        user = User.new(email: "randoms@gmail.com").save
        expect(user).to eq(false)
    end

    it 'email and password presence' do
      user = User.new(email: "randoms@gmail.com",password: "randomsCOntraseña").save
      expect(user).to eq(true)
    end
    it 'email and password presence but blank' do
      user = User.new(email: "",password: "").save
      expect(user).to eq(false)
    end

  end
end

