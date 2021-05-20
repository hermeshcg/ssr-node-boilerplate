CREATE TABLE "accounts" (
  "id" serial NOT NULL,
  "email" varchar(60) NOT NULL,
  "user_name" varchar(60) NOT NULL,
  "account_name" varchar(60) NOT NULL,
  "password_hash" varchar(60) NOT NULL,
  "inserted_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  CONSTRAINT "pk_accounts" PRIMARY KEY ("id"),
  CONSTRAINT "email" UNIQUE ("email")
);

CREATE TABLE "projects" (
  "id" serial NOT NULL,
  "project_name" varchar(30) NOT NULL,
  "account_id" serial NOT NULL,
  "inserted_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  CONSTRAINT "pk_projects" PRIMARY KEY ("id"),
  CONSTRAINT "fk_accounts_projects" FOREIGN KEY ("account_id") REFERENCES "accounts" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "members" (
  "id" serial NOT NULL,
  "role" smallint NOT NULL,
  "project_id" serial NOT NULL,
  "account_id" serial NOT NULL,
  "inserted_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  CONSTRAINT "pk_members" PRIMARY KEY ("id"),
  CONSTRAINT "fk_projects_members" FOREIGN KEY ("project_id") REFERENCES "projects" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "fk_accounts_members" FOREIGN KEY ("account_id") REFERENCES "accounts" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "groups" (
  "id" serial NOT NULL,
  "group_name" varchar(30) NOT NULL,
  "leader_id" serial NOT NULL,
  "project_id" serial NOT NULL,
  "inserted_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  CONSTRAINT "pk_groups" PRIMARY KEY ("id"),
  CONSTRAINT "fk_group_members_groups" FOREIGN KEY ("leader_id") REFERENCES "members" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "fk_group_projects_groups" FOREIGN KEY ("project_id") REFERENCES "projects" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "member_groups" (
  "id" serial NOT NULL,
  "group_id" serial NOT NULL,
  "member_id" serial NOT NULL,
  "inserted_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  CONSTRAINT "pk_member_groups" PRIMARY KEY ("id"),
  CONSTRAINT "fk_groups_member_groups" FOREIGN KEY ("group_id") REFERENCES "groups" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "fk_members_member_groups" FOREIGN KEY ("member_id") REFERENCES "members" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "activities" (
  "id" serial NOT NULL,
  "title " varchar(45) NOT NULL,
  "status" smallint NOT NULL,
  "group_id" serial NOT NULL,
  "inserted_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  CONSTRAINT "pk_actvities" PRIMARY KEY ("id"),
  CONSTRAINT "fk_group_activities" FOREIGN KEY ("group_id") REFERENCES "groups" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "member_activities" (
  "id" serial NOT NULL,
  "activitie_id" serial NOT NULL,
  "member_id" serial NOT NULL,
  "inserted_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  "updated_at" TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  CONSTRAINT "pk_member_activities" PRIMARY KEY ("id"),
  CONSTRAINT "fk_members_member_activities" FOREIGN KEY ("member_id") REFERENCES "members" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "fk_activities_member_activities" FOREIGN KEY ("activitie_id") REFERENCES "activities" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);