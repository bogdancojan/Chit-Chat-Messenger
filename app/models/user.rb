class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :sent_conversations, foreign_key: :sender_id, class_name: 'Conversation'
  has_many :received_conversations, foreign_key: :receiver_id, class_name: 'Conversation'
  has_many :messages
end
