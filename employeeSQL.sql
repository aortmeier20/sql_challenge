DROP TABLE IF EXISTS titles


CREATE TABLE "titles" (
	"title_id" VARCHAR(10) NOT NULL,
	"title" VARCHAR(30) NOT NULL,
	CONSTRAINT "pk_titles" PRIMARY KEY (
		"title_id"))

SELECT * FROM titles

