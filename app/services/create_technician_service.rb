class CreateTechnicianService
  def call
    user = User.find_or_create_by!(email: 'technician@igniting.com') do |user|
      user.password = 'igniting'
      user.password_confirmation = 'igniting'
      user.confirm!
      user.technician!
    end
  end
end
