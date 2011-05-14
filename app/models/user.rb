class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  validates_presence_of :name

  has_many :albums, :dependent => :delete_all
  has_one :role, :dependent => :delete
  has_many :pictures
  after_create :create_default_role

  def role_symbols
    (roles || []).map {|r| r.title.to_sym}
  end

  def create_default_role
    if role.nil?
      create_role(:title => "user")
    end
  end

  def admin?
    return self.role.title == "admin"
  end
end
