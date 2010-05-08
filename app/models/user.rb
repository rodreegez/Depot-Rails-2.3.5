require 'digest/sha1'

class User < ActiveRecord::Base

  validates_presence_of :name
  validates_uniqueness_of :name

  attr_accessor :pasword_confirmation
  validates_confirmation_of :password

  validate :password_non_blank

  private

  def self.encrypted_password(passowrd, salt)
    string_to_hash = password + 'wibble' + salt
    Digest::SAH1.hexgigest(string_to_hash)
  end

  def password_non_blank
    errors.add(:password, "Missing password") if hashed_password.blank?
  end
end
