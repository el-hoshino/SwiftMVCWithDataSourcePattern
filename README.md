# SwiftMVCWithDataSourcePattern

## What's this?
This is a design pattern demo that shows how a MVC-With-DataSource pattern works.
This design pattern was inspired by the UITableViewController in UIKit. In a UITableView instance, there's a UITableViewDataSource property used to retrieve the contents of each UITableViewCell. This is a very similar that the View class also contains a DataSource property to retrieve the content to display.

## What's it good for?
In a normal MVC pattern, the relationship between View and Model suffers lots of us. A usual way to do it was the Controller object contains both Model and View objects, and the Controller conforms the ModelDelegate protocol. If the Model object updated something it notifies the Controller object through ModelDelegate, and transfers the new data to it as well, then the Controller transfers the new data to the View object and the View object decides how to show the new data.

This is not a bad way to do it, but it also has a little problem that it makes the Controller so fat because it has to do not only the input output controlls but also data transfer work, which it shouldn't be considered as a Controller's duty. So there's also another way to solve this problem that is to use NSNotificationCenter object. All data transfer are done with NSNotification objects so the Controller could be kept slim. But the problem is that you have to do the notification register and deregister works for all kind of notifications that is possible to be sent, which is often forgotten during maintenance.

So some sais that the View object should contain the Model object so it retrieve the data whenever needed. But the problem is that usually the Model object needs to do deal with multipul View objects which means it contains many properties and methods for a single View object, which is not good for maintenance, so the View object should not be able to access the Model naively.

## Details
As you've read above, there're some problems with a normal typical MVC pattern, and this is right the solution to solve the problem.

In MVC-With-DataSource pattern, there's a new DataSource protocol. Just like Delegate protocol, it only needs to contain the required properties and methods that is just for a specific View object, and since it's a protocol it means that the Model can conform to multiple DataSource protocols that is only designed for the right View object. The View object retrieves data via this DataSource protocol so it won't be able to access the whole Model object that contains too many properties and methods for itself. And unlike NSNotification object, you don't need to worry about notification registrations either. Mostly, since the data transfer is through the DataSource protocol, your Controller object can focus on the controlling process and won't need to worry about the data transfer things.

## I've checked your code, but it seems so... crude?
This is just a demo and I've just added the very very basic things to the project. Actually I just finished the project within less than 30 minutes...

But anyway, I'll update this demo in the future, bring multi-view collaborations and other features to make this demo better... maybe... I hope so... Anyway, I think you can get the idea :)
