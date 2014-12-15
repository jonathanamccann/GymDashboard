class CreateManagerService
  def call
    user = User.find_or_create_by!(email: 'linemanager@igniting.com') do |user|
      user.password = 'igniting'
      user.password_confirmation = 'igniting'
      user.confirm!
      user.manager!
    end
  end
end
