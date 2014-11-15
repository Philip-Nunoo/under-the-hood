# User Class to be used with the model
# user model
class User < ActiveRecord::Base
  has_one :pass
  after_save :save_pass
  before_save :set_pass

  attr_accessor :password

  validates :email,
            presence: { message: 'Please enter email address' },
            format: { with: /\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/ },
            uniqueness: { message: 'Oops, Email Address alreadsy in use' }

  validates :password,
            presence: { message: 'No password entered' },
            confirmation: true,
            length: { minimum: 5, maximum: 120 }, on: :create

  validates :password_confirmation,
            presence: { message: 'Please confirm password' },
            on: :create

  def update_without_password(params, *options)
    params.delete :password
    params.delete :password_confirmation

    # Update User attributes
    update_attributes params, *options
    # Remove fields in params
    sanitize_for_pass params

    pass = Pass.find_by user: self
    pass.update_without_password params
  end

  def update(params, *options)
    if params[:password].eql? params[:password_confirmation]
      super
      sanitize_for_pass params
      pass = Pass.find_by user: self
      pass.update_attributes params
    else
      false
    end
  end

  def login_user(password)
    if pass.valid_password?(password)
      return true
    else
      return false
    end
  end

  def set_pass
    @pass = Pass.new email: email,
                     password: password,
                     password_confirmation: password_confirmation
  end

  private

  def save_pass
    @pass.user = self
    @pass.save
  end

  # Remove fields in params
  def sanitize_for_pass(params)
    params.delete :username
  end
end