# Family Hub Design

## DB
Database schema:
* families(family_id, family_name)
* family_members(member_id, family_id, member_name, birthday, status)
* pets(pet_id, family_id, pet_name, pet_age)
* tasks(task_id, creator_id, assigned_ids, task_name, task_description, task_deadline, is_preset)
* events(family_id, participant_ids, event_name, event_description, event_start, event_end, event_color)

## features
Each family will have:
* events
* pets
* tasks
* dashboard (who is busy (status), status on tasks)