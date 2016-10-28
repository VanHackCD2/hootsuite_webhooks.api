# README

The application was developed in Ruby on Rails, using the API system. There is a server project without graphical interface, which is the API, which can be registered a new hook, listed the hooks, delete and display data from a hook. So, the user can be choose between the service via command line or via interface web. For each hook it is possible to register several messages that will be sent to this hook through a POST. Even in relation to the hook, they are listed all sent messages, and each message can query the data.

For test the send message via POST, we developed a client for receive the messages. This client only show, list and delete the messages received. In this following link I demonstrate the application operation.

https://www.youtube.com/watch?v=bjTMvnEMEwk

# This steps is for the three projects
This is the steps for running and test the applications. The tests will be in development environment and we consider the Rails 5 is installed: 
1 - run commands bundle install 
2 - run commands rails db:drop rails db:create rails db:migrate (add for hootsuite_webhooks.api => rails db:seed )

Now, we need to run the "hootsuite_webhooks.api" first. This can be made by command 
 rails server -p 3001 
If you don't have a curb installed you can run this instruction: 
sudo apt-get install libcurl3 libcurl3-gnutls libcurl4-openssl-dev 

After that, the project "hootsuite_webhooks" can be run (don't forget to run step 1 and 2). But, is needed to create a file named ".env" in the root path of this project, and the content of ".env" file looks like this HOOTSUITE_WEBHOOKS_SERVER_API=http://localhost:3001/api/v1/ With this, we can running the server of this project using the command rails server 
PS: There is a file named .env.example in root path, you can rename it and use.

And for running the client project, just running rails server -p 3002

And the client test, open browser in http://localhost:3002

Now, in the web browser, open the page of interface of service in http://localhost:3000

In the interface of service, for create a hook to client test, go to "Hooks" tab, new Hook, and create a Hook with the URL http://localhost:3002/received_posts

With this steps done, the webhook is read to test

All the projects use the restful standard. And for the database we choose the MySQL
