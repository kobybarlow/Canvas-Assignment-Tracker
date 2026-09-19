# Canvas Assignment Tracker

- This system manages all of your classes in canvas and gives you an option to view all assignments upcoming and in the past.



# Setup Instructions

1. Clone the Repository
2. Install Ruby
3. Install Bundler
4. Install Project Dependencies
5. Create a Canvas API Token
6. Create the .env File
7. Start the Rails Server
8. Open the Application
9. Stop the Application

# API Endpoints Used

- The API endpoints from the Canvas REST API were both GET methods the first one being `/api/v1/courses` and the second 
  being `/api/v1/courses/:id/assignments`. The information that the first endpoint gathers retrieves the courses associated with the user's Canvas account. The results are used to populate the course selection dropdown. The second endpoint retrieves the assignments for the course selected by the user. The application displays the assignment name and due date. 


# What I learned
  This assignment was super helpful to my understanding of the functionality of endpoints. Building an actual web application that communicates with the Canvas REST API gave me an entirely new perspective on how systems communicate with one another. I learned that when information is sent it is not instantly ready for a finished webpage the JSON that is sent needs to be parsed into understandable parcels of information for a user to understand. 

  Token Authentication was another topic that I was not familar with too well. I learned that Canvas doesn't let any random program access your courses. Your application sends your token in an HTTP header to prove its authentication. And the last thing I learned about was creating error handling. Instead of allowing Rails to crash and display a huge error page, your code catches expected API problems and displays a human-readable message.