Summary
This free course teaches you how to search and navigate in Splunk, use fields, get statistics from your data, create reports, dashboards, lookups, and alerts. 
Scenario-based examples and hands-on challenges will enable you to create robust searches, reports, and charts. 
It will also introduce you to Splunk's datasets features and Pivot interface. 
Lab work for this course requires that you download and install Splunk Enterprise on a local system or server.

Duration
4 hours

Module 1 Quiz
1.) Machine data makes up for more than ___% of the data accumulated by organizations.
a.) 90%

2.) Machine data is only generated by web servers.
a.) False

3.) Machine data is always structured.
a.) False

Module 2 Notes
There are 5 main functions/components of Splunk Enterprise 
1. Index Data
At the heart of Splunk is the data indexer. It collects data from nearly any source. Think of the indexer as a factory, and your machine data as raw materials. 
As the data enters the factory, inspectors look at the data to determine how to process it. When they find a match [on a source type], the inspectors use that source
type to break the data into single events (e.g., 'user login at 10:01pm', 'item viewed at 6am', 'server error at 3pm', 'login error at 7:32am', etc.).
Those events are then indexed into the Splunk index, where they can be searched.
By entering a query into the Splunk search bar, you can find events that contain values across multiple data sources, allowing you to analyse and run statistics on the events, using the Splunk search language.
You can add Knowledge Objects to your data, allowing you to affect how your data is interpreted (e.g., give it classification, add enrichment, normalize it, and save reports for future use.
Splunk can proactively monitor all your infrastructure in real time, and you can create alerts for certain events and automatically respond with a variety of actions.
Splunk allows you to collect reports and visualizations into dashboards.
Splunk has 3 main processing components:
-Indexer: processes incoming machine data, storing them in indexes and events. 
As the indexer processes the data, it creates a number of files organized in sets of directories by age; this organization is important for search.
When you search your data, Splunk will only need to open the directories that match the timeframe of your search.
-Search Heads: allows the user to use the Splunk Search Language to search the indexed data. Search Heads handle search requests from users, and distribute the requests
to the Indexers (which perform the actual searches on the data). Search Heads then consolidate and enrich the results from the Indexers before returning them to the users.
The Search Head also provides the user with various tools (e.g., dashboards, reports, and visualizations)
-Forwarders: Splunk Enterprise instances that consume data and forwards the data to indexers for processing. Forwarders requie minimal resources and have little impact on performance. 
They usually reside on the machines where the data originates. 
Deploying and Scaling Splunk:
One instance of Splunk can handle all the functions, including Input, Parsing, Indexing and Searching of machine data.
A single instance deployment is the perfect environment for Proof of Concept, Personal Use, Learning, and might server the need of small, department-sized environments 
On your personal laptop, you will install a single instance environment of Splunk. As your usage scales, you would need to start splitting some of 
this functionality (e.g., Input, Parsing, Indexing, Searching) across multiple specialized instances of Splunk Enterprise.
Adding forwarders to send data to our indexers, and eventually adding multiple search heads and indexers to increase our indexing and search capacity.
Search heads and indexers can also be clustered, making sure that your data is always available and searchable. 
2. Search and Investigate
3. Add Knowledge
4. Monitor and Alert
5. Report and Analyze

Module 2 Quiz
1.) What is the main source of data to the Indexer?
a.) Forwarders

2.) Which of these is not a main component of Splunk?
a.) Compress and Archive

3.) What are the three main processing components of Splunk?
a.) Forwarders, Indexers and Search Heads

4.) A single-instance deployment of Splunk Enterprise handles:
a.) Input, Parsing, Indexing, and Searching

5.) Search requests are processed by the ___________.
a.) Indexer

Module 3: Installing Splunk
Using the command line, we can navigate to Applications/splunk/bin
From here, we can enter "./splunk start", "./splunk stop", "./splunk restart"
A full list of commands can be seen by entering "./splunk help"
When you sign in, you are directed to a dashboard of apps. 
Apps are preconfigured environments that sit on top of your Splunk Enterprise Instance; you can think of them as workspaces, each built to solve specific use cases.
The apps you see are defined by a user with a Splunk Administrator role.
There are 3 main Roles: 
-Adminstrator: can install apps, can ingest data, and can create knowledge objects for all users.
-Power: can create and share knowledge objects with all users of an app and do realtime searches. 
-User: will only see their own knowledge objects, and those that have been shared with them. 
Splunk Enterprise comes with 2 apps;
-The Home App: gives you a quick place to explore Splunk Enterprise. It allows you to launch and manage Splunk Apps, find documentation, and set a custom dashboard.
Adminstrators can also add apps and data from here. 
-The Search and Reporting App: For this training course, we will be doing most of our training here, under a Power User role

Module 3 Quiz
1.) The password for a newly installed Splunk instance is:
a.) Created when you install Splunk Enterprise.

2.) Which apps ship with Splunk Enterprise?
a.) Search & Reporting, and Home App

3.) What are the three main default roles in Splunk Enterprise?
a.) User, Power, and Admin

Module 4: Getting Data In to our Index
Adding data is done by the Admin user for the deployment 
From the Home App, click 'Add Data' icon on the main screen, or from the Settings dropdown. Clicking on it will take us to the Add Data menu.
From the Add Data menu, we are given 3 options for ingesting data:
-Upload files from my computer. This is for a single instance upload of unmonitored [for changes] data from a local file [found on our machine]. 
This data only gets indexed once, and is never updated.
-Monitor files and ports on this Splunk platform instance. This option allows us to monitor files, directories, http events, network ports, or data gathered on scripts located on Splunk Enterprise instances.
If we were in a Windows environment, we would also see options to monitor Windows-specific data (e.g., Event Logs, File System Changes, Active Directory, and Network Information on local and remote machines)
-Forward Data from a Splunk Forwarder. With this option, we can receive data from a remote Forwarder. As previously discussed, Forwarders are installed on remote machines.
In most production environments, Forwarders will be used as your main source of data input. 

Using the 'Upload Files from My Computer'
When selecting 'Upload Files from my computer,' you can upload a file from your local machine. 
Once the file is uploaded, Splunk will automatically detect the file type, determine its relevant fields, and automatically sort the data into their respective fields (displayed in rows and columns).
If you want to change the file type of the source, use the dropdown in the upper-left, and select the desired file type. 
If you select another file format, you will see the data reorganize into different fields (rows and columns will change)
We can save our source file if we made any changes, or if we want to give our source file a different name
When saving the changes, the 'App' field is important, as it will tell Splunk which app to apply this sourcetype to; you can tell it to apply system-wide, or to a specific app.
Once we've saved, we want to select a hostname ('Host Field Value'). The name should be the name of the machine from which the dataset originated. 
You can set the hostname using a constant value, regular expression (based on the filepath, or a segment of the filepath).
'Indexes' are directories where the data will be stored.
Initially, your dataset will be in just one index; the Main Index.
However, you will want to break up the Main Index into other indexes (e.g., Web Data Index, Security Index, Main Index, etc.)
Having separate indexes can make your searches more efficient (e.g, Search: index=web_data_index fail*). 
Separate indexes also allow you to filter search results access, according to user role, letting an Admin control who can see what data.
Also, different Indexes will have data that only needs to be kept for certain time intervals (e.g., Web Data Index = 6 months; Security Data Index = 1 year).
Keeping data in separate indexes will allow you to set retention policies by index. 

Using the Monitor Input Option
When the data [you want to index] is coming from files or ports on an Indexer, use the 'Monitor' option.
This option is similar to 'Upload Files from my Computer' option, with a few differences. 
When 'Monitor' option is selected, we are taken to a screen that gives us the option to monitor Files & Directories, http events, ports, or monitor data sources with a custom script you write.

Module 4 Quiz
1.) In most production environments, _______ will be used as the source of data input.
a.) Forwarders

2.) Splunk knows where to break the event, where the time stamp is located and how to automatically create field value pairs using these.
a.) Source types

3.) The monitor input option will allow you to continuously monitor files.
a.) True

4.) Files indexed using the upload input option get indexed _____.
a.) Once

5.) Splunk uses ________ to categorize the type of data being indexed.
a.) Sourcetypes

Module 5: Basic Searching
The Search and Reporting Interface provides an interface for searching and analyzing data.
It enables you to create Knowledge Objects, reports, dashboards, and more.
There are 7 main components of the Search and Reporting main interface:
-The Splunk Bar appears on every page in Splunk Enterprise. You can use it to switch between apps, edit your account, view system-level messages, manage and edit your Splunk configuration, monitor the progress of search jobs, and find help
-The App Bar allows you to navigate the application. 
-The Search Bar is used to run searches.
-The Time Range Picker is used to select a time frame for your search (in the Search Bar)
-The 'How to Search' panel gives you documentation on how to search, including a search tutorial.
-The 'What to Search' panel gives a summary of the data that is indexed on this server. By clicking on the 'Data Summary' button, you get a breakdown of the data indexed by host, source and sourcetypes.
While the 'sourcetype' is the classification of your data, the 'Source' is file or directory path, network port, or script from which the event originated.
The 'Host' is the host name, IP address, or fully qualified domain name of the machine from which the event originated
-The 'Search History' menu allows you to view and rerun past searches. 

Using the Search Bar
To see if there is a user trying to log into our server, using bad credentials and failing, we can type 'failed' into the search bar. 
As we type, the Splunk Search Assistant will display matching terms, contextual matches, and syntax documentation for the search.
Selecting from the Time Range Picker, we can choose to perform this ['failed'] search for the last 7 days. Limiting your timeframe is a best practice, allowing you to get your results faster. 
Once the time range is selected, the search is sent to Splunk, where it becomes a new search job, and a 'New Search' page opens. 
The interface now includes a 'Save As' menu, 'Search Result' tabs, 'Search Action' buttons, a 'Search Mode' selector, and 'Timeline'.
The events [containing the text we searched for] show in the 'Events' list, and the fields [that were extracted] show up in the sidebar.
The 'Save As' menu allows us to save our search to Knowledge Objects. 
The results populate into the 'Search Results' tabs, depending on the type of search commands used in the search.
The Events tabs will display the events returned for your search, and the fields that were extracted from the events. 
The 'Patterns' tab will allow you to see patterns in your data, allowing you to get a better understanding of what is happening in your data. 
If your search is generating statistics or visuals, they can be observed in their respective 'Statistics', or 'Visuals' tabs. If not...
Links for 'Instant Pivot', 'Quick Reports', and 'Search Commands Documentation' will be displayed.
Commands that create Statistics and Visualizations are called 'transforming commands.' These are commands that transform event data into data tables.
Below the Search Bar, we can see how many events we found, along with a button that allows you to retrieve a random sampling of these events.
The Search action buttons allow us to edit our search job settings, such as 'Send Job to Background', 'Inspect Job', and 'Delete Search Jobs.'
There are icons to search, share, pause, stop, print or export a search job. The share icon will give you a link to share with other users.
By default, a search job will remain active for 10 minutes [after the search was initially run]. After 10 minutes, Splunk will need to run the job again to get the same results. 
A Shared Search job, however, will remain active for 7 days, and will be readable to everyone [that has the link]. 
The export icon will allow you to export events returned from the job in raw, .csv, .xml, or .json formats.
There are 3 search modes you can select from the Search Mode selector; Fast Mode, Smart Mode, and Verbose Mode.
Fast Mode cuts down on the field information that is returned. Field Discovery is disabled in Fast Mode, and only returns default fields and fields required to perform your search. 
Verbose Mode returns as much field and event data as possible, discovering all the fields it can. 
Smart Mode (which is the default mode) will toggle behavior based on the type of search you are running. 
The Timeline is a visual representation of events, segmented over time. The segments are dynamically decided by the time you choose in the Time Range picker. 
By clicking the cursor over a time range and dragging, we can select a specific time range to investigate
We can also use the Zoom links to zoom in and out of events we are investigating. Selecting or zooming into events uses your original search job. However, when you zoom out,
Splunk will run a new search job (using your original search job) to return newly selected events. 

Exploring the Events List
We can use returned events to expand our searches and interact with our data. 
In the Events list, the results are returned and the events are in a reversed chronological order. 
While time is normalized in your index to a consistent format, the time stamp you see in the events is based on the time zone set in your user account. 
Mousing over the fields, you will notice clickable options on the keywords of each search result, allowing you to add those terms to the current search, exclude them from a subsequent search, or create a new search
Selecting the '>' info button next to an event, we can see all the fields included in the selected event. 

Exploring Search Term Options in Splunk
If we want to cast a wider net on your search terms, we can include a wildcard ‘fail*’ 
This will return any event that starts with the word ‘fail.’
Uppercase booleans of AND, OR, and NOT can be used with multiple terms.
So, if we wanted to see search results for failed, but not password, we would enter ‘failed NOT password’  in the Search bar. If no boolean is used, ‘AND’ is implied. 
Boolean operations have an order of evaluation: 
NOT
OR
AND
Parentheses can be used to control the order of evaluation. By encapsulating search terms in parentheses, Splunk will first evaluate the terms within the innermost parentheses, working its way outward to global scope. 
Exact phrases can be included by encapsulating them in “quotes”.
If you wish to include quotes, you can use backslashes (escaping chars) in your search (e.g., info=”user\”chrisV4\” not in database”

