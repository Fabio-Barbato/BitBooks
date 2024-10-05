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
