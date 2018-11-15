# SWAPI book
Let's play around with table views! This is an introduction to delegation in swift, and some of the more complex view controllers in Cocoa Touch.

We're going to be using `swapi.co` as an API. If you don't know swapi, it's an API set up to return trivia about Star Wars. It has a bunch of routes for people, planets, etc. If you want to play around with the API, [check it out here](https://swapi.co).

## What is already bootstrapped for me?
* A Table View Controller and View Controller are already included for you in the storyboard and corresponding swift files have been connected.
* A segue is a connection from one view controller to the next. It can perform this segue in different ways, but we have one set up to *push* a new viewcontroller onto the stack. You'll notice this segue between the tableview controller and view controller in the storyboard. Nothing else is happening in this segue right now other than pushing.
* The table view controller, in the `viewDidLoad` function, does an API call using `URLSession` to swapi.co, and pulls a set of people and some metadata about them. The values are printed on the debugger. What you do with that information is up to you.
* Tableview cells can be static, or can be prototype cells that are dynamic, reusable, and templated. The table view is already set up with a prototype cell, and is being called in the Swift file.

## Where to start
This, compared to the Magic 8 Ball project, is going to be even more freeform. 

The results from the API call are currently parsed into an array of dictionaries. Each dictionary will have information about an individual in the Star Wars movies. Create a struct and initialize objects that represent this data. Parse information you want from it. Suggestion: start with name, hair color, eye color, and height because it doesn't require another API request.

## TableViews
Table views use a datasource to determine attributes of the table view itself. A data source is a way for a class to ask for information that it can use to determine it's own attributes. 

Let's look at 2 functions in the datasource:
```swift
override func numberOfSections(in tableView: UITableView -> Int)

override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
```

These two functions' return values will let the table view know how many sections and rows to display.

1. Try providing it a number of sections, and a number of rows per section. 

2. Now try to adjust that to something related to the array of results from the API.

There's one more function that's in the datasource that's uncommented.

```swift
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
```

Here, as mentioned at the top of this readme, we already connect it to a prototype cell in the storyboard's table view controller. Note it's using a reuseIdentifier `starWarsCharacterCell`.

This cell, as you can see in the storyboard, has a label. To access this property, use `cell.textLabel`. 

3. Change this text label to anything

Notice in this function that it also has an argument `indexPath` of type `IndexPath`. Cells have an IndexPath that has properties `section` and `row` which will both return integers that represent it's section and row position. 

4. How can you use this to present a different item per row? Use your data that you parsed in `viewDidLoad` and the indexpath to show each character's name in each row.

## Navigation

At the bottom of the table view controller, you'll find a function 
```swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?)
```

If you remember, I've set up a segue for you between the table view and the view controller. If you tap on a cell, it will navigate to the view controller. But if you try now, it will always show the same information (the default values.)

Now check out ViewController.swift. Note that there are three properties in it (name, hairColor, eyeColor) and three outlets for the labels that are in there. They are just temporary, and you don't have to keep them. But to start, we can use this to demonstrate how to pass information between viewcontrollers when navigating.

In `prepare(for segue:, sender:)`, check that the destination for the segue is in fact a ViewController, and that there is a selected index path. For this I introduce your first `guard let` statement to properly unwrap optionals.

```swift
guard let vc = segue.destination as? ViewController, 
      let selectedIndexPath = self.tableView.indexPathForSelectedRow 
else { return }
```

This guards to make sure these values are not nil, otherwise, it skips the rest of the function's implementation. 

After checking these values, use the `selectedIndexPath` to find the right object in your array, and assign the right values to those ViewController properties (name, hairColor, eyeColor). __DO NOT ASSIGN THEM DIRECTLY TO THE LABELS__.

After you've done this, Build and Run and see if this information has been passed.

## What else can you do?
* There's tons of different API calls you can make! Try them out.
* Put in images, build in constraints for your view controller. 
* Play around with the attributes of your prototype cells. 