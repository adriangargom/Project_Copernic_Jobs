

# Copernic Jobs

The following project consists of a Spring Boot and React application for finding job offers, designed for the Nicolau Copernic Institute.

## Technologies

In this case the project was going to be developed using the Spring Boot framework for the backend and Thymeleaf templates for the frontend, but in our case we propose to do the project maintaining the Spring Boot backend but implementing it as a Rest API, and then user the React Library for the frontend of the project using a much modern architecture.

So finally, the implemented technologies are the following ones:

| Field             | Technology            |
|:------------------|:----------------------|
|Languages          |![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white) ![JavaSript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)|
|Backend            |![SpringBoot](https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white) ![SpringSecurity](https://img.shields.io/badge/Spring_Security-6DB33F?style=for-the-badge&logo=Spring-Security&logoColor=white) ![JWT](https://img.shields.io/badge/json%20web%20tokens-323330?style=for-the-badge&logo=json-web-tokens&logoColor=pink)|
|Frontend           |![NodeJS](https://img.shields.io/badge/Node.js-43853D?style=for-the-badge&logo=node.js&logoColor=white) ![React](https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB) ![Vite](https://img.shields.io/badge/vite-%23646CFF.svg?style=for-the-badge&logo=vite&logoColor=white) ![HTML](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white) ![CSS](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white) ![TailwindCSS](https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white)|
|Databases          |![MySQL](https://img.shields.io/badge/MySQL-00000F?style=for-the-badge&logo=mysql&logoColor=white)|
|DevOps             |![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white) ![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white) ![Jira](https://img.shields.io/badge/jira-%230A0FFF.svg?style=for-the-badge&logo=jira&logoColor=white) ![AWS](https://img.shields.io/badge/Amazon_AWS-232F3E?style=for-the-badge&logo=amazon-aws&logoColor=white) ![Figma](https://img.shields.io/badge/figma-%23F24E1E.svg?style=for-the-badge&logo=figma&logoColor=white)|


## Architecture

The application consists of a String Boot backend used as a REST API for allowing the frontend to communicate with it via HTTP requests using the Axios library.

Inside the backend, we have spring security with a custom JWT token authentication system that allows us to authenticate the user from the database via the provided credentials and generates a new access token with a specific lifetime that previously is stored in the client web browser local storage for easy access from the frontend.

Finally, in the frontend we can find a custom Axios instance that is in charged of verifying if exists a token, and if exists configuring it in the Authorization HTTP header of the request, this process is repeated in each request that is sent to the server to improve the security

## User Roles

The application contains tree principal roles "ADMINISTRATORS", "COMPANIES" and "STUDENTS" and each one of the roles can perform diverse actions over the application.

### Administrator

The administrator users can perform the following actions over the application:

 - Manage all the existing offers inside the application and create new offers
 - Manage the existing user accounts and create new users
 - Accept or deny company access requests to the platform
 - View reports and information about the application based in the user's traffic
 - Can manage or create new incidences related to the application
 - Manage actively the permissions over each module for each one of the user roles this allows absolute 
 control over enabling and disabling modules over each one of the roles.
 - And much more...


### Company

The company users can perform the following actions over the application: 

 - Create and manage new job offers
 - Post incidences related to the application
 - Manage their company profile
 - And much more...

### Student

The student users can perform the following actions over the application:

 - Manage their professional profile
 - Manage their personal profile
 - Enroll to existing offers and view their data
 - View and manage all the enrolled offers


## Resources and interest links

### Real Working repository

[![GitLab](https://img.shields.io/badge/GitLab-330F63?style=for-the-badge&logo=gitlab&logoColor=white)](https://gitlab.com/abp_proyect_copernicjobs)

### Project Mocks and Designs

[![Figma](https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white)](https://www.figma.com/file/wZxavDMvmwqt1oLiJMaj9k/Borsa-Cop%C3%A8rnic-ERP?type=design&node-id=0%3A1&mode=design&t=6Dm6yHqj0x0wKaBk-1)


### Other Resources

[Link to the presentation video](https://drive.google.com/file/d/1yFVNXISqde5zdfRtNNt_84OaFf16vfbh/view?usp=sharing)

[Link to the memory](https://docs.google.com/document/d/1pSUo712KVO-pkd-E9kiE9OLMdSEOf9X-L-bR7J5ozvQ/edit?usp=sharing)
