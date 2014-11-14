class User < ActiveRecord::Base
    has_one :pass
    after_save      :save_pass
    before_save     :set_pass

    attr_accessor :password

    validates :email, 
    :presence=>{
        :message=>"Please enter email address"},
        :format=>{ with: /\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/ },
        :uniqueness=>{:message=>"Oops, Email Address alreadsy in use"
    }

    validates :password, 
    :presence=> {:message=>"No password entered"},
    :confirmation => true

    validates :password_confirmation,
    :presence=> {:message=>"Please confirm password"}

    def login_user password
        if self.pass.valid_password?(password)
            return true
        else
            return false                
        end
    end

    def set_pass
        @pass = Pass.new :email => self.email,
            :password => self.password,
            :password_confirmation => self.password_confirmation
        
    end

    private
    def save_pass
        @pass.user = self
        @pass.save
    end
end
