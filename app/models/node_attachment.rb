# == Schema Information
#
# Table name: node_attachments
#
#  id            :integer          not null, primary key
#  attachment_id :integer
#  nodeable_id   :integer
#  nodeable_type :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class NodeAttachment < ActiveRecord::Base
	belongs_to :nodeable, :polymorphic => true
	belongs_to :attachment
end
