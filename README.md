LumaJSON
========

An extremely simple and light-weight Swift wrapper for Objective-C JSON parser

### Usage

To use this in your project, just copy the file in to your project. Normally I'm a fan of Cocoapods and all that, but it just seems unneccessary given the simplicity of what is really being done here.

Given a JSON structure such as:

```json
{
    "user": {
        "name": "jquave",
        "id": 542,
        "url": "http://jamesonquave.com"
    },
    "friend_ids": [
        299,
        341,
        492
    ],
    "alert_message": "Please verify e-mail address to continue"
}
```

LumaJSON will recognize this as having a root NSDictionary node with three keys:
user, friend_ids, and alert_message

These can be accessed using a subscript, and will return either an Optional LumaJSONObject or an object of the expected type if cast.

Example:
```swift
if let parsed = LumaJSON.parse(jsonStr) {
    
    // Simple printing to the console to check JSON structure
    println(parsed)

    // Simple Key/Value retreival
    if let alertMessage = parsed["alert_message"] as? String {
        println("Alert: \(alertMessage)")
    }
    
    // Nested JSON
    if let userName = parsed["user"]?["name"] as? String {
        println("Username is \(userName)")
    }
    
    // Nested object casting works using Swift's built-in mechanisms
    if let friendIDs = parsed["friend_ids"] as? [Int] {
        for friendID in friendIDs {
            println("Friend ID: \(friendID)")
        }
    }
}
```

Output to console:
```swift
LumaJSONObject: Optional({
    "alert_message" = "Please verify e-mail address to continue";
    "friend_ids" =     (
        299,
        341,
        492
    );
    user =     {
        id = 542;
        name = jquave;
        url = "http://jamesonquave.com";
    };
})
Alert: Please verify e-mail address to continue
Username is jquave
Friend ID: 299
Friend ID: 341
Friend ID: 492
```

### Encoding Swift objects to JSON

Encoding objects as JSON requires creating an object that adheres to [String: AnyObject] at the root level.

```swift
var myData = [String: AnyObject]()
myData["friend_count"] = 4
myData["username"] = "jquave"

if let str = LumaJSON.jsonFromObject(myData) {
  println(str)
}
```

Outputs:
```
{"username":"jquave","friend_count":4}
```

Under MIT License
http://opensource.org/licenses/MIT
