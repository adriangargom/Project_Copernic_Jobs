DROP DATABASE IF EXISTS abp_project_2;

CREATE DATABASE abp_project_2;

USE abp_project_2;


CREATE TABLE degree(
    degree_id                                   INT                  AUTO_INCREMENT,
    name                                        VARCHAR(50),
    PRIMARY KEY(degree_id)
);


CREATE TABLE user(
	user_id				                        INT				PRIMARY KEY		AUTO_INCREMENT,
    nif											VARCHAR(50)		NOT NULL		UNIQUE,
    name				                        VARCHAR(50)		NOT NULL,
    email		       		                    VARCHAR(50)		NOT NULL		UNIQUE,
    phone				                        VARCHAR(50)		,
    password			                        TEXT		NOT NULL,
    name_role                                   ENUM('STUDENT','COMPANY','ADMINISTRATOR'),
    last_login			                        DATE,
    is_enabled			                        BOOLEAN
);


CREATE TABLE student(
	user_id							            INT,
	surname							            VARCHAR(50)		NOT NULL,
    public_email								BOOLEAN			DEFAULT true,
    public_phone					            BOOLEAN			DEFAULT true,
    public_linkedin_url				            BOOLEAN			DEFAULT false,
    public_portfolio_url			            BOOLEAN			DEFAULT false,
    public_youtube_url				            BOOLEAN			DEFAULT	false,
    public_github_url				            BOOLEAN			DEFAULT false,
    new_offer_notification			            BOOLEAN			DEFAULT true,
    new_inscription_notification	            BOOLEAN			DEFAULT true,
    
    PRIMARY KEY(user_id),
	CONSTRAINT fk_student_user_user_id FOREIGN KEY(user_id) REFERENCES user(user_id) 	ON UPDATE CASCADE	ON DELETE CASCADE
);


CREATE TABLE student_professional_profile(
	student_professional_profile_id		        INT				PRIMARY KEY		AUTO_INCREMENT,
    curriculum_path						        TEXT,
    linkedin_url						        TEXT,
    portfolio_url						        TEXT,
    youtube_url							        TEXT,
    github_url							        TEXT,
    student_id							        INT             NOT NULL,
    degree_id                                   INT,
    CONSTRAINT fk_studentPP_degree_degree_id FOREIGN KEY(degree_id) REFERENCES degree(degree_id) ON UPDATE CASCADE	ON DELETE CASCADE,
	CONSTRAINT fk_student_professional_profile_student_student_id FOREIGN KEY(student_id) REFERENCES student(user_id)	ON UPDATE CASCADE	ON DELETE CASCADE
);


CREATE TABLE company(
	user_id									    INT,
    description									TEXT,
    icon_path									TEXT,
    web_page_url								TEXT,
    resolved_incidence_notification				boolean			DEFAULT true,
    PRIMARY KEY(user_id),
   	CONSTRAINT fk_company_user_user_id FOREIGN KEY(user_id) REFERENCES user(user_id)	ON UPDATE CASCADE	ON DELETE CASCADE
);


CREATE TABLE offer(
	offer_id							        INT											PRIMARY KEY		AUTO_INCREMENT,
    title								        VARCHAR(80)									NOT NULL,
    location							        TEXT,
    short_description					        VARCHAR(255)								NOT NULL,
    requirements_description			        TEXT										NOT NULL,
    functions_description				        TEXT,           
    technologies_description			        TEXT										NOT NULL,
    urgency								        ENUM('HIGH', 'MEDIUM', 'LOW')			    DEFAULT 'LOW',
    workday								        ENUM('FULL', 'HALF', 'FLEXIBLE', 'MORNING', 'AFTERNOON', 'NIGHT'),
    salary_interval						        VARCHAR(50),
    vacancies_number					        INT,
    publishment_date					        DATE,
    is_enabled							        boolean,
    creation_date						        DATE,
    degree_id									INT,
    user_id                                     INT,
	CONSTRAINT fk_offer_company_company_id FOREIGN KEY(user_id) REFERENCES user(user_id)	ON UPDATE CASCADE	ON DELETE CASCADE,
	CONSTRAINT fk_offer_degree_degree_id FOREIGN KEY(degree_id) REFERENCES degree(degree_id) ON UPDATE CASCADE	ON DELETE CASCADE
);


CREATE TABLE enrolled_students_offer(
    student_id						            INT,
    offer_id						            INT,
    enrollment_date					            DATE,

    PRIMARY KEY(student_id,offer_id),
	CONSTRAINT fk_enrolled_students_offer_student_student_id FOREIGN KEY(student_id) REFERENCES student(user_id)	ON UPDATE CASCADE	ON DELETE CASCADE,
	CONSTRAINT fk_enrolled_students_offer_offer_offer_id FOREIGN KEY(offer_id) REFERENCES offer(offer_id)		ON UPDATE CASCADE	ON DELETE CASCADE
); 


CREATE TABLE administrator(
    user_id									    INT,
    new_access_request_notification			    BOOLEAN		DEFAULT true,
    new_report_notification					    BOOLEAN		DEFAULT true,
    PRIMARY KEY(user_id),
	CONSTRAINT fk_administrator_user_user_id FOREIGN KEY(user_id) REFERENCES user(user_id)	ON UPDATE CASCADE	ON DELETE CASCADE
);


CREATE TABLE register_request(
	request_id				    				INT												PRIMARY KEY				AUTO_INCREMENT,
    company_name								VARCHAR(50)										NOT NULL,
	email									    VARCHAR(50)										NOT NULL,
	contact_phone	 						    VARCHAR(50)										NOT NULL,
    nif										    VARCHAR(50)										NOT NULL,
    password									TEXT											NOT NULL,
    status									    ENUM('VALIDATED', 'WAITING' ,'REJECTED')		DEFAULT 'WAITING'
);


CREATE TABLE user_password_reset_request(
	user_password_reset_request_id			    INT					PRIMARY KEY			AUTO_INCREMENT,
    email									    VARCHAR(50),
    code                                        VARCHAR(10),
    status									    ENUM('VALIDATED', 'WAITING'),
    request_date								DATE
);


CREATE TABLE permissions(
    permission_id 		                        INT						AUTO_INCREMENT,
    permission_name		                        VARCHAR(50),
    role_name			                        ENUM('STUDENT','COMPANY','ADMINISTRATOR'),
    is_enabled			                        BOOLEAN,
    
    PRIMARY KEY(permission_id)
);


CREATE TABLE incidence (
	incidence_id									INT						PRIMARY KEY			AUTO_INCREMENT,
    title										VARCHAR(50),
    description									TEXT,
    category									ENUM("ERROR", "USER", "SERVICE", "UI"),
    status                                      ENUM("PENDING","SOLVED"),
    creation_date                               DATE,
    user_id										INT,
    CONSTRAINT fk_user_incidence_user_id FOREIGN KEY(user_id) REFERENCES user(user_id)		ON UPDATE CASCADE 		ON DELETE CASCADE
)
