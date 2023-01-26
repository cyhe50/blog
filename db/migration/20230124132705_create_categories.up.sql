CREATE TABLE "categories" (
  "id" int PRIMARY KEY,
  "name" varchar,
  "description" text,
  "created_at" timestamptz DEFAULT (now()),
  "updated_at" timestamptz DEFAULT (now())
);
