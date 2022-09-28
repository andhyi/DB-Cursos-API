CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" int,
  "id_role" int NOT NULL
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" varchar NOT NULL,
  "level" int NOT NULL,
  "teacher" varchar,
  "id_categorie" int NOT NULL,
  "course_video" int NOT NULL
);

CREATE TABLE "course_videos" (
  "id" int PRIMARY KEY,
  "title" varchar NOT NULL,
  "url" varchar(512) NOT NULL
);

CREATE TABLE "categories" (
  "id" int PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "roles" (
  "id" int PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "level" (
  "id" int PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "inscription" (
  "id" uuid PRIMARY KEY,
  "advance_course" varchar NOT NULL DEFAULT 0,
  "generation" varchar,
  "id_user" uuid NOT NULL,
  "id_course" uuid NOT NULL,
  "course_finalyzed" uuid
);

ALTER TABLE "users" ADD FOREIGN KEY ("id_role") REFERENCES "roles" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("id_categorie") REFERENCES "categories" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("level") REFERENCES "level" ("id");

ALTER TABLE "inscription" ADD FOREIGN KEY ("id_user") REFERENCES "users" ("id");

ALTER TABLE "inscription" ADD FOREIGN KEY ("id_course") REFERENCES "courses" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("course_video") REFERENCES "course_videos" ("id");

ALTER TABLE "inscription" ADD FOREIGN KEY ("course_finalyzed") REFERENCES "inscription" ("id");

-- Insertando entidades:

insert into roles (id, name) values (1, 'student'), (2, 'teacher'), (3, 'admin');

insert into level (id, name) values (1, 'beginner'), (2, 'medium'), (3, 'advanced');

insert into course_videos  (id, title, url) values (1, 'Dragon Ball', 'www.dragon.com'), (2, 'pokemon 2022', 'www.pokemon.com');

insert into users  (id, name, email, password, age, id_role) values ('42b1d7d5-6d74-427f-b993-cfaf3e69b7f1', 'Cesar', 'andhyiwill@hotmail.com', 'amooos', 25, 3), ('98e3c0df-42a0-44ef-a4ad-350701a69ae2', 'Willy', 'andhyi@hotmail.com', '123456', 34, 1);

insert into courses  (id, title, description , level, teacher, id_categorie, course_video) values 
('97937f50-1836-4a78-8491-9932acbd1d23', 'React js', 'Desarrollo de aplicaciones con React', 1, 'jesus fundam', 2, 1), 
('98e3c0df-42a0-44ef-a4ad-358701a69ae2', 'Node JS', 'Desarrollo de backend en base de datos, auteentificaciones, etc.',1, 'benjamin flores', 1, 2);

insert into inscription  (id, advance_course , generation , id_user , id_course  ) values 
('98937f50-1836-4a78-8491-9932acbd1d23', '50%', 'Gen 16', '42b1d7d5-6d74-427f-b993-cfaf3e69b7f1', '98e3c0df-42a0-44ef-a4ad-358701a69ae2'), 
('90e3c0df-42a0-44ef-a4ad-358701a69ae2', '80%', 'Gen 20', '98e3c0df-42a0-44ef-a4ad-350701a69ae2', '97937f50-1836-4a78-8491-9932acbd1d23');


