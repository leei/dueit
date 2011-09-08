module HomeworkHelper
  def update_homework_state(homework, string, state)
    form_id = "state_#{state}_#{homework.id}"
    capture do
      form_for(homework, :html => {:id => form_id}) do |f|
        concat f.hidden_field(:state, :value => "done")
      end
    end + link_to_function(string, "$('##{form_id}').submit()")
  end
end
