
# DB Schema

(This is prone to change):
* families(family_id, family_name)
* members(member_id, family_id, member_name, member_birthday, current_status)
* tasks(task_id, creator_id, assigned_id, task_name, task_description, task_deadline, is_preset)
* events(event_id, family_id, participant_id, event_name, event_description, event_start, event_end, event_color)
