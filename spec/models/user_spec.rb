require 'spec_helper'

describe User do
  it 'can be made into a new instance' do
    user = User.new(email: 'brandon@example.com', username: 'brandonk')

  end
end
