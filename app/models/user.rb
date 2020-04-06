class User < ApplicationRecord
    has_secure_password
    enum role: [:regular, :admin]
end
