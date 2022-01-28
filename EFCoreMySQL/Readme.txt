==================================TASK - How to set up entity framework with mysql connection in .NET CORE Web app.==================================
	
Use Entity Framework Core 5.0 In .NET Core 3.1 With MySQL Database By Code-First Migration On Visual Studio 2019 For RESTful API Application:

Code-First is mainly useful in Domain-Driven Design. In the Code-First approach, you focus on the domain of your application and start creating classes for 
your domain entity rather than design your database first and then create the classes which match your database design. 
 
Today, we will show you step by step how to use EF Core 5.0 in .NET Core 3.1 to implement Code-First approach to create/update MySQL database on 
Visual Studio 2019 for a RESTful API application.

Follow below steps to easily set up enity framework in .NET CORE.
I created this project against Mysql database name `test`, I attached test db script inside projet folder so you can import for test the my project.

Step 1 - Create .NET Core 3.1 project on Visual Studio 2019
Step 2 - Install dependency packages
 
In order to use Entity Framework Core to implement the Code-First approach to MySQL database, we need to install following packages of dependencies to the project:
a.Microsoft.EntityFrameworkCore (v5.0.0 – the latest stable version)
b.Microsoft.EntityFrameworkCore.Tools (v5.0.0 – the latest stable version)
c.Pomelo.EntityFrameworkCore.MySql (version 5.0.0-alpha.2)
Pomelo.EntityFrameworkCore.MySql is the most popular Entity Framework Core provider for MySQL compatible databases. It supports EF Core 3.1 (and lower) and 
uses MySqlConnector for high-performance database server communication.

Step 3 - if not then Install MySQL Workbench and MySQL Server 
Step 4 - Create model classes 
go inside project Model folder and see model classes(user.cs, usergroup.cs)
Step 5 - Create a database context
In VS 2019 Solution Explorer, create a folder at project root called “DBContexts” (whatever you like), and add a class called “MyDBContext” with the codefollowing 
content:
See "MyDBContext.cs" on code side.

Step 6: Configure and inject the database connection
 
Configure the database connection string
 
Add following database connection string codes in appsettings.json (you need to update the connection string with your server name, database name, port, user, 
or password)

See "MyDbConnection" string in appsetting.json.

Inject database connection
 
In Startup.cs, inside ConfigureServices method add following codes,

        public void ConfigureServices(IServiceCollection services)  
        {  
            string mySqlConnectionStr = Configuration.GetConnectionString("MyDbConnectionn");  
            services.AddDbContextPool<MyDBContext>(options => options.UseMySql(mySqlConnectionStr, ServerVersion.AutoDetect(mySqlConnectionStr)));  
        } 

Step 7: To access "MyDbContext" on controller first create a private variable and intialize "MyDbContext" scope using dependency injection.

private MyDBContext _myDbContext;

public HomeController(ILogger<HomeController> logger, MyDBContext context)
        {
            _logger = logger;
            _myDbContext = context;
        }

Step 8: To test create a "FetchUsers" Action in controller and get the result.

        [HttpGet]
        public IList<User> FetchUsers()
        {
            return (this._myDbContext.Users.ToList());
        }

for better understand see HomeController

Step 9: Run and Execute 

Step 10: To learn insert, update, delete operations with entity framework in .NET CORE see Action "CheckEFCoreOperations" in Home Controller.

==================================! ENJOY GUYS and mail me your experience if this project is helpful for you.==================================
Owner
Thanks
Ravi Choudhary
Full stack developer .net technologies
Email : ravichoudhary294@gmail.com

==========================================================================================================================================================================


