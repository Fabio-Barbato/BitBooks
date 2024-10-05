# BitBooks
A client-server application implemented with sockets and TCP/IP connection, which simulates the behaviour of a library and in particular the lending of books.
Browse through the available books, read the description of a book and have a look at the preview and, if interested, add it to your cart and it will be yours for a period. At any time you can consult your profile to check which books have been borrowed and by when they must be returned, and just to be on the safe side, there is a notification system to alert you if the book has not been returned on time.
Of course, to enable all this there is user authentication and it is therefore necessary to register.
The whole thing is handled in multi-thread, so several clients are handled simultaneously, as well as the possible simultaneous request of several users for the same book.

## Functionality
- User authentication
- Book search
- Book loan request
- Profile section with loans made
- Notifications after return date
- Multi-client supported

## Implementation choices
### Client-server
The project has a client side and a server side.
The client was designed for iOS devices.
The logic was developed with Swift, while the UI was developed with SwiftUI.
The server was developed entirely in C.
Client and server communicate with each other remotely via sockets: 
1. The client sends a request to the server;
2. The server receives the request and processes it;
3. The server sends the client a string containing what it had requested;
4. The client processes the received response and displays it to the user;

In order to develop a concurrently-programmed server, client requests are handled via multi-threads, which are much simpler to implement and manage than a multi-process approach.
To avoid race conditions, mutexes were introduced at critical stages, such as:
- Registration;
- Checkout;

### Request Handling
The client sends requests to the server via sockets.
The server receives the string, reads it and, based on the received request, executes instructions. The result of these instructions will be a string that is sent via socket to the client.
The list of possible requests is as follows:
- **ADD_USER** *name* *surname* *username* *password*
Requests the server to add a user with these parameters. If the addition was possible, the server will send a positive result;
- **LOGIN** *username* *password*.
Requests the server to log in to the platform with the user data entered. If the user with these parameters exists, the user logs in;
- **LOAN** *username* *isbn1* *isbn2* *isbn3*...
Asks the server whether the user with the username can borrow a list of books. If lending is not possible, the user will receive an error message. Cases in which the user cannot make a loan are as follows:
There are no more copies available of a book on the list;
The user has already made five loans;
The number of books the user requests, added to the loans already made, is more than five;
The user requests a loan of more than five books;
- **GET_BOOKS**
Requests the entire catalogue of books from the server. The server converts the book json file into a string, so that it can be sent via socket. The client, once it receives the string, converts it back into json and then displays it on the screen to the user;
- **GET_BOOK** *isbn*
Requests a book's information from the server, used to check during the add-to-cart phase whether copies of that book are still available;
- **CHECK_NOTIFICATIONS** *username*
Requests the server to load a user's notifications;
- **GET_LOANS** *username*.
Requests the server to load a user's loans;

### Database (server side)
Due to the small amount of data to be managed, the database is a collection of json files.
Each json file is a table, containing data relating to a specific entity. The tables defined are as follows:
- User
  - First name: string
  - Surname: string
  - Username: string (primary key)
  - Password: string
- Book
  - Title: string
  - ISBN: string (primary key)
  - Author: string
  - Genre: string
  - Available copies: int
  - Copies dated: int
  - Cover: string (contains link to book cover)
- Notification
  - Username: string
  - Isbn: string
  - Message: string
  - Notified: boolean
- Loan (User and Book association class)
  - Username: string
  - ISBN: string
  - Loan date: string
  - Return date: string

The database is managed directly by the server, thanks to implemented libraries operating as CRUD classes for each entity.

### cJSON library (server side)
Since the server was written in C, json files are not recognised as such. For this, use was made of cJSON, an open source library included in the project that allows json files to be managed and parsed.

### Notifications (server side)
When the server is started, a thread is created to check which users have not yet returned their books on time.
For certain users, a notification will then be created with a message urging the user to return the requested book on loan, and the same notification will be saved in the Notifications table. 
When the user concerned logs in, the server will send the notification, which can be read in the dedicated section.
Once the server is started, the notification will be checked once a day.

### GoogleBooks API (client side)
Used to get the description of a book and (if available) its preview. 
It is richly documented and no API key is required to search for metadata.

## How to run
### Without Docker Compose (client Swift)
- Change your IP address [**here**](./clientSwift/Lso_Client/Lso_Client/ModelView/NetworkManager.swift);
- Open a terminal window and navigate to the project folder;
- Run ‘gcc -o server server.c Controller/cJSON.c’ (to compile the server);
- Execute ‘./server’ (to run the server);
- Open the .xcodeproj file in the clientSwift folder with Xcode, select the simulator or device on which to run the app and build the app;

### With Docker Compose (client C)
- Change your IP address [**here**](./client/client.c);
- Open Docker Desktop, open a terminal window and navigate to the project folder;
- Execute ‘docker compose up --build -d’;
- Execute ‘docker compose exec client ./client’;
