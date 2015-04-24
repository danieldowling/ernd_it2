module ApplicationHelper
	def can_edit(post)
		if (logged_in? && post.user_id == current_user.id)
			return true
		else
			return false
		end
	end
end
