class BankAccount
    def initialize(email, account_no, pin_no)
        @email = email
        @account_no = account_no
        @pin_no = pin_no
    end

    def create_pin_no
        @password
    end

    def reset_pin_no
    end
end

class Client < BankAccount
    def get_account(client)
    end

    def reset_pin_no
        puts "Reset Your Pin Number"
    end
end

client_no_1 = BankAccount.new("client@email.com", rand(99999), 1234)