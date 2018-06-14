Anthony Rey - iOS Proficiency Exercise
====

Hi Team,

Thank you for your time in looking at my iOS Proficiency Exercice (4h)

1. I have named the model `Feed` and `Story`. A feed is made of stories, the feed title may change and the stories within the feed may change as well.

2. I have created another json endpoint which I have put on dropbox - https://dl.dropboxusercontent.com/s/dfib8btbuw1lw40/double.json
   I have added more stories to the json to test the scrolling properly as indicated in the Test description. I have added heavy images on purpose to see how the app will react.
   You may switch to the original json in `CapgeminiApi`

3. Typically, I would have used CoreData here to save the feed locally to save multiple API calls and save unnecessary traffic to the backend. 
Because each row in the json file does not have an ID like a typical backend would, I did not. 

4. I have shown one way to do API calls with NSURLConnection (FeedDownloader) and NSURLSession (ImageDownloader).

5. I have noticed you use Latin-1 (ISO-8859-1) and not UTF-8

6. I have not used any libraries as I assumed you did not want me to (Networking Library, etc.). 

More work can be done on seperation of concern, for example, moving the logic inside `tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell` to the prototype cell `StoryTableViewCell`. 

7. Tests are not mentioned in the description and I don't know which framework you typically use. I have shown an example but based on the Overview of the test description, I am not sure if you will be looking at it, it sounds like you are more interested in the structure of the code. Let me know if you want me to add more testing.

8. Please keep in mind the programming time for this assessment, which I think is about 4 to 5 hours. You would have certain ways of organising code at Capgemini, happy to adapt and learn your prefered way of building strong iOS applications.

I look forward to hearing from you and having the opportunity to join the Capgemini Team.

If you have any questions, please feel free to let me know.

Anthony

## Final Result

![Capgemini](https://github.com/Sydney-o9/Capgemini/blob/master/Doc/Capgemini.gif)

[Watch High-Def. video](https://www.youtube.com/watch?v=sltt3zey9_I)
