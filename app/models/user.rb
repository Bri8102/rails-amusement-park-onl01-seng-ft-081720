class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides
    validates :name, presence: true, uniqueness: true


    def mood
        if self.admin
            "happy"
        else
            if self.happiness < self.nausea
                "sad"
            else
                "happy"
            end
        end
    end

end
