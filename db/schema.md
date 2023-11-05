## DB Schema
(This is prone to change):
* families(family_id, family_name)
* family_members(member_id, family_id, member_name, birthday, status)
* tasks(task_id, creator_id, assigned_ids, task_name, task_description, task_deadline, is_preset)
* events(family_id, participant_ids, event_name, event_description, event_start, event_end, event_color)