module ApplicationHelper
  def resource_name
  :account
  end

  def resource
  @resource ||= Account.new
  end

  def devise_mapping
  @devise_mapping ||= Devise.mappings[:account]
  end

  def deletion_modal_id(item)
    "deletion-modal-bug-#{item.id}"
  end
end
