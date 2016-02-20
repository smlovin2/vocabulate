require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#current_list' do
    it 'return the current word_list' do
      user = FactoryGirl.create(:user)
      word_list1 = FactoryGirl.create(:word_list, user: user, current_list: false)
      word_list2 = FactoryGirl.create(:word_list, user: user)

      expect(user.current_list).to eq(word_list2)
    end

    it 'returns nil if there is no current list' do
      user = FactoryGirl.create(:user)
      word_list1 = FactoryGirl.create(:word_list, user: user, current_list: false)
      word_list2 = FactoryGirl.create(:word_list, user: user, current_list: false)

      expect(user.current_list).to eq(nil)
    end
  end
end
