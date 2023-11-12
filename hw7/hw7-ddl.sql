# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    id int NOT NULL,
    name varchar(256) NOT NULL,
    description varchar(4096) NOT NULL,
    tag varchar(256) NOT NULL,
    url varchar(256),
    time_commitment int,
    PRIMARY KEY (id)
);


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

insert into skills (id, name, description, tag) values (1, "Leadership", "Worker shows good leadership skills", "Skill 1");
insert into skills (id, name, description, tag) values (2, "Problem solving", "Worker shows good problem solving skills", "Skill 2");
insert into skills (id, name, description, tag) values (3, "Efficiency", "Worker is efficient", "Skill 3");
insert into skills (id, name, description, tag) values (4, "On time", "Worker always comes on time", "Skill 4");
insert into skills (id, name, description, tag) values (5, "Kind", "Worker shows kindness in the workplace", "Skill 5");
insert into skills (id, name, description, tag) values (6, "Helper", "Worker helps their team mates often", "Skill 6");
insert into skills (id, name, description, tag) values (7, "Team Player", "Worker always plays for the team", "Skill 7");
insert into skills (id, name, description, tag) values (8, "Inventor", "Worker comes up with new ideas often", "Skill 8");


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    id INT NOT NULL,
    first_name varchar(256),
    last_name varchar(256) NOT NULL,
    email varchar(256),
    linkedin_url varchar(256),
    headshot_url varchar(256),
    discord_handle varchar(256),
    brief_bio varchar(4096),
    date_joined DATE NOT NULL,
    PRIMARY KEY (id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (id,last_name,date_joined) values (1,'Person 1',CURDATE());
insert into people (id,last_name,date_joined) values (2,'Person 2',CURDATE());
insert into people (id,last_name,date_joined) values (3,'Person 3',CURDATE());
insert into people (id,last_name,date_joined) values (4,'Person 4',CURDATE());
insert into people (id,last_name,date_joined) values (5,'Person 5',CURDATE());
insert into people (id,last_name,date_joined) values (6,'Person 6',CURDATE());
insert into people (id,last_name,date_joined) values (7,'Person 7',CURDATE());
insert into people (id,last_name,date_joined) values (8,'Person 8',CURDATE());
insert into people (id,last_name,date_joined) values (9,'Person 9',CURDATE());
insert into people (id,last_name,date_joined) values (10,'Person 10',CURDATE());

# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    skills_id int NOT NULL,
    people_id int NOT NULL,
    date_acquired DATE NOT NULL,
    id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id),
    FOREIGN KEY (people_id) REFERENCES people(id),
    FOREIGN KEY (skills_id) REFERENCES skills(id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

insert into peopleskills (people_id,skills_id,date_acquired) values (1,1,CURDATE());
insert into peopleskills (people_id,skills_id,date_acquired) values (1,3,CURDATE());
insert into peopleskills (people_id,skills_id,date_acquired) values (1,6,CURDATE());
insert into peopleskills (people_id,skills_id,date_acquired) values (2,3,CURDATE());
insert into peopleskills (people_id,skills_id,date_acquired) values (2,4,CURDATE());
insert into peopleskills (people_id,skills_id,date_acquired) values (2,5,CURDATE());
insert into peopleskills (people_id,skills_id,date_acquired) values (3,1,CURDATE());
insert into peopleskills (people_id,skills_id,date_acquired) values (3,5,CURDATE());
insert into peopleskills (people_id,skills_id,date_acquired) values (5,3,CURDATE());
insert into peopleskills (people_id,skills_id,date_acquired) values (5,6,CURDATE());
insert into peopleskills (people_id,skills_id,date_acquired) values (6,2,CURDATE());
insert into peopleskills (people_id,skills_id,date_acquired) values (6,3,CURDATE());
insert into peopleskills (people_id,skills_id,date_acquired) values (6,4,CURDATE());
insert into peopleskills (people_id,skills_id,date_acquired) values (7,3,CURDATE());
insert into peopleskills (people_id,skills_id,date_acquired) values (7,5,CURDATE());
insert into peopleskills (people_id,skills_id,date_acquired) values (7,6,CURDATE());
insert into peopleskills (people_id,skills_id,date_acquired) values (8,1,CURDATE());
insert into peopleskills (people_id,skills_id,date_acquired) values (8,3,CURDATE());
insert into peopleskills (people_id,skills_id,date_acquired) values (8,5,CURDATE());
insert into peopleskills (people_id,skills_id,date_acquired) values (8,6,CURDATE());
insert into peopleskills (people_id,skills_id,date_acquired) values (9,2,CURDATE());
insert into peopleskills (people_id,skills_id,date_acquired) values (9,5,CURDATE());
insert into peopleskills (people_id,skills_id,date_acquired) values (9,6,CURDATE());
insert into peopleskills (people_id,skills_id,date_acquired) values (10,1,CURDATE());
insert into peopleskills (people_id,skills_id,date_acquired) values (10,4,CURDATE());
insert into peopleskills (people_id,skills_id,date_acquired) values (10,5,CURDATE());

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    name varchar(256) NOT NULL,
    sort_priority INT NOT NULL,
    id INT NOT NULL,
    PRIMARY KEY (id)
);

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

insert into roles (id,name,sort_priority) values (1,"Designer", 10);
insert into roles (id,name,sort_priority) values (2,"Developer", 20);
insert into roles (id,name,sort_priority) values (3,"Recruit", 30);
insert into roles (id,name,sort_priority) values (4,"Team Lead", 40);
insert into roles (id,name,sort_priority) values (5,"Boss", 50);
insert into roles (id,name,sort_priority) values (6,"Mentor", 60);

# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    role_id int NOT NULL,
    people_id int NOT NULL,
    date_assigned DATE NOT NULL,
    id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id),
    FOREIGN KEY (people_id) REFERENCES people(id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
);

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

insert into peopleroles (people_id,role_id,date_assigned) values (1,2,CURDATE());
insert into peopleroles (people_id,role_id,date_assigned) values (2,5,CURDATE());
insert into peopleroles (people_id,role_id,date_assigned) values (2,6,CURDATE());
insert into peopleroles (people_id,role_id,date_assigned) values (3,2,CURDATE());
insert into peopleroles (people_id,role_id,date_assigned) values (3,4,CURDATE());
insert into peopleroles (people_id,role_id,date_assigned) values (4,3,CURDATE());
insert into peopleroles (people_id,role_id,date_assigned) values (5,3,CURDATE());
insert into peopleroles (people_id,role_id,date_assigned) values (6,2,CURDATE());
insert into peopleroles (people_id,role_id,date_assigned) values (6,1,CURDATE());
insert into peopleroles (people_id,role_id,date_assigned) values (7,1,CURDATE());
insert into peopleroles (people_id,role_id,date_assigned) values (8,1,CURDATE());
insert into peopleroles (people_id,role_id,date_assigned) values (8,4,CURDATE());
insert into peopleroles (people_id,role_id,date_assigned) values (9,2,CURDATE());
insert into peopleroles (people_id,role_id,date_assigned) values (10,2,CURDATE());
insert into peopleroles (people_id,role_id,date_assigned) values (10,1,CURDATE());