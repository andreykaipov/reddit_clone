class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  has_attached_file :picture, 
                    :styles => { :post_size => "300x300>" }

  validates(:user_id, {presence: true})


  validates_attachment  :picture,
                        :content_type => {
                          :content_type => ["image/jpg", "image/jpeg", 
                                           "image/png", "image/gif"]
                        }

  validate  :picture_size

  #validates(:content, {presence: true, length: {maximum: 140}})
  validates(:content, { presence: true, 
                        unless: Proc.new { |a| a.picture? } })
  
  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size && picture.size > 3.megabytes
        errors.add(:picture, "should be less than 3MB")
      end
    end

end