-- families(family_id, family_name)
DROP TABLE IF EXISTS families;
CREATE TABLE families(
    family_id SERIAL PRIMARY KEY,
    family_name VARCHAR(85) NOT NULL
);

-- members(member_id, family_id, member_name, member_birthday, current_status)
DROP TABLE IF EXISTS family_members;
CREATE TABLE members(
    member_id SERIAL PRIMARY KEY,
    family_id INT,
    member_name VARCHAR(85) NOT NULL,
    member_birthday TIMESTAMP,
    current_status VARCHAR(85),

    FOREIGN KEY(family_id) REFERENCES families(family_id) ON DELETE SET NULL
);

-- tasks(task_id, creator_id, assigned_id, task_name, task_description, task_deadline, is_preset)
DROP TABLE IF EXISTS tasks;
CREATE TABLE tasks(
    task_id SERIAL PRIMARY KEY,
    assigner_id INT NOT NULL,
    assigned_id INT ARRAY,
    task_name VARCHAR(85) NOT NULL DEFAULT 'New Task',
    task_description VARCHAR(85),
    task_deadline TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP + INTERVAL '1 day'),
    is_preset BOOLEAN NOT NULL DEFAULT false,

    FOREIGN KEY(assigner_id) REFERENCES members(member_id) ON DELETE CASCADE
);

-- events(event_id, family_id, participant_id, event_name, event_description, event_start, event_end, event_color)
DROP TABLE IF EXISTS events;
CREATE TABLE events(
    event_id SERIAL PRIMARY KEY,
    creator_id INT NOT NULL,
    family_id INT NOT NULL,
    participant_id INT ARRAY NOT NULL DEFAULT ARRAY[]::INT[],
    event_name VARCHAR(85) NOT NULL DEFAULT 'New Event',
    event_description VARCHAR(85),
    event_start TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    event_end TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP + INTERVAL '1 hour'),
    event_arriving INT ARRAY NOT NULL DEFAULT ARRAY[]::INT[],
    event_color CHAR(7) NOT NULL DEFAULT '#cccccc',

    FOREIGN KEY(creator_id) REFERENCES members(member_id) ON DELETE CASCADE,
    FOREIGN KEY(family_id) REFERENCES families(family_id) ON DELETE CASCADE
);
