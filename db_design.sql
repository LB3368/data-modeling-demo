CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username varchar(25) UNIQUE NOT NULL,
    first_name varchar(25) NOT NULL,
    last_name varchar(25) NOT NULL
);

CREATE TABLE category (
    "id" serial PRIMARY KEY NOT NULL,
    "name" VARCHAR(50) NOT NULL
);


CREATE TABLE recipe (
    "id" serial PRIMARY KEY NOT NULL,
    "recipe_name" VARCHAR(50) NOT NULL,
    "category_id" integer NOT NULL REFERENCES category(id),
    "recipe_detail" VARCHAR(50) NOT NULL,
    "user_id" integer NOT NULL REFERENCES users(id)
);


CREATE TABLE ingredients_list (
    "recipe_id" integer NOT NULL,
    "ingredients_id" integer NOT NULL,
    "qty" integer NOT NULL
);


CREATE TABLE ingredients (
    "id" serial PRIMARY KEY NOT NULL,
    "name" VARCHAR(50) NOT NULL
);



CREATE TABLE privacy (
    "recipe_id" integer NOT NULL REFERENCES recipe(id),
    "visibility" BOOLEAN NOT NULL
);



CREATE TABLE grocery_list (
    "user_id" INTEGER NOT NULL REFERENCES users(id),
    "ingredient_id" integer NOT NULL REFERENCES ingredients(id),
    "recipe_id" integer NOT NULL REFERENCES recipe(id)
);



/*


CREATE TABLE "recipe_ingredients" (
	"recipe_id" INT NOT NULL,
	"ingredient_id" INT NOT NULL,
	"qty" INT NOT NULL);



CREATE TABLE "recipes" (
	"recipe_id" INT NOT NULL,
	"recipe_name" VARCHAR2(25) NOT NULL,
	"description" VARCHAR2(25) NOT NULL,
	"user_id" INT NOT NULL,
	"instructions" VARCHAR2(255) NOT NULL,
	constraint RECIPES_PK PRIMARY KEY ("recipe_id"));

CREATE sequence "RECIPES_RECIPE_ID_SEQ";

CREATE trigger "BI_RECIPES_RECIPE_ID"
  before insert on "recipes"
  for each row
begin
  select "RECIPES_RECIPE_ID_SEQ".nextval into :NEW."recipe_id" from dual;
end;


CREATE TABLE "user" (
	"username" VARCHAR2(25) NOT NULL,
	"username" VARCHAR2(25) NOT NULL,
	"password" VARCHAR2(25) NOT NULL,
	"id" SERIAL PRIMARY KEY,
	constraint USER_PK PRIMARY KEY ("id"));

CREATE sequence "USER_ID_SEQ";

CREATE trigger "BI_USER_ID"
  before insert on "user"
  for each row
begin
  select "USER_ID_SEQ".nextval into :NEW."id" from dual;
end;


CREATE TABLE "Privacy" (
	"recipe_id" INT NOT NULL,
	"visibility" CHAR(1) CHECK ("visibility" IN ('N','Y')) NOT NULL);



CREATE TABLE "ingredients" (
	"id" INT NOT NULL,
	"ingredient_name" VARCHAR2(255) NOT NULL,
	constraint INGREDIENTS_PK PRIMARY KEY ("id"));

CREATE sequence "INGREDIENTS_ID_SEQ";

CREATE trigger "BI_INGREDIENTS_ID"
  before insert on "ingredients"
  for each row
begin
  select "INGREDIENTS_ID_SEQ".nextval into :NEW."id" from dual;
end;


CREATE TABLE "grocery_list" (
	"user_id" BLOB NOT NULL,
	"list_id" BLOB NOT NULL,
	"list_name" VARCHAR2(25) NOT NULL,
	constraint GROCERY_LIST_PK PRIMARY KEY ("list_id"));



CREATE TABLE "grocery_list_items" (
	"list_id" BLOB NOT NULL,
	"ingredient_id" INT NOT NULL,
	"quantity" INT NOT NULL);
*/


/*ALTER TABLE "recipe_ingredients" ADD CONSTRAINT "recipe_ingredients_fk0" FOREIGN KEY ("recipe_id") REFERENCES "recipes"("recipe_id");
ALTER TABLE "recipe_ingredients" ADD CONSTRAINT "recipe_ingredients_fk1" FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("id");
ALTER TABLE "recipe_ingredients" ADD CONSTRAINT "recipe_ingredients_fk2" FOREIGN KEY ("qty") REFERENCES "ingredients"("");

ALTER TABLE "recipes" ADD CONSTRAINT "recipes_fk0" FOREIGN KEY ("recipe_name") REFERENCES "category"("category_id");
ALTER TABLE "recipes" ADD CONSTRAINT "recipes_fk1" FOREIGN KEY ("user_id") REFERENCES "user"("id");


ALTER TABLE "Privacy" ADD CONSTRAINT "Privacy_fk0" FOREIGN KEY ("recipe_id") REFERENCES "recipes"("recipe_id");


ALTER TABLE "grocery_list" ADD CONSTRAINT "grocery_list_fk0" FOREIGN KEY ("user_id") REFERENCES "user"("id");

ALTER TABLE "grocery_list_items" ADD CONSTRAINT "grocery_list_items_fk0" FOREIGN KEY ("list_id") REFERENCES "grocery_list"("list_id");
ALTER TABLE "grocery_list_items" ADD CONSTRAINT "grocery_list_items_fk1" FOREIGN KEY ("ingredient_id") REFERENCES "ingredients"("id");
*/