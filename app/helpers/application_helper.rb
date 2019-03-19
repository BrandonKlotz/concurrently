module ApplicationHelper
  def flash_class_for(flash_type)
    {
      success: "success",
      error: "error",
      alert: "warning",
      notice: "info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end
end
