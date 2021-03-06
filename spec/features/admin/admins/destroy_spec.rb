# frozen_string_literal: true

require 'rails_helper'

describe 'Destroy admin' do
  before { create :admin }

  it 'should destroy admin' do
    visit '/admin'
    fill_in 'Email', with: 'admin@email.com'
    fill_in 'Пароль', with: '123456'
    click_on 'Войти', class: 'btn-success'

    admin = Tramway::User::User.last
    click_on_dropdown 'Администрирование'
    click_on 'Администраторы'
    click_on_delete_button admin
    admin.reload

    expect(admin.removed?).to be_truthy
  end
end
