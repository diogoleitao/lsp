# How does your system work?
A server with a single endpoint (`/lines/:index`) listens on port 9292. Upon request, it fetches the file and iteratively looks for the correct line to respond with. This enables the server to have a smaller memory load versus slurping the whole file into memory.

# How will your system perform with a 1 GB file? a 10 GB file? a 100 GB file?
Given that the server navigates the file line by line, the bigger the file is, the greater the response time. Ways to address this issue are discussed in the last two sections of this file.

# How will your system perform with 100 users? 10000 users? 1000000 users?
From the tests I did locally with the `curl` command, response time will increase with concurrent requests to the server, but it depends on the request made: if the line requested is further up the file, then response time is not affected; otherwise, the higher the line number, the more time it will take for the server to respond.

# What documentation, websites, papers, etc did you consult in doing this assignment?
- [Sinatra official documentation](http://sinatrarb.com/)
  - [Sinatra official GitHub repositoty](https://github.com/sinatra/sinatra)
- [Building a Slack App using Ruby and Sinatra @ Medium](https://revs.runtime-revolution.com/building-a-slack-app-using-ruby-and-sinatra-48c56ad1f051)
  - [Slack App GitHub repository](https://github.com/nunonamorado/slash_command_article)
- StackOverflow

# What third-party libraries or other tools does the system use? How did you choose each library or framework you used?
The libraries I want to point out are _sinatra_ and _rspec_. I chose _rspec_ to do the tests because of previous experience. It reduces the boiler plate (versus regular ruby tests) and it's a lot easier to read and understand what each test case is testing for.

Regarding _sinatra_, I'd seen a blogpost from a former colleague a long time ago (see previous question), liked how simplistic and straightforward the syntax was and wanted to give it a try. Although I have a lot of experience with _Rails_, it seemed like an overblown project setup for such a simple problem, and so I took the chance to learn a new framework. It proved to be a bit more challenging than I thought it would, probably due to updates on the gem regarding how it should be setup from the time the Medium article was wrote to when I started working on this.

Another (small) issue was setting up _rspec_ to run with a _sinatra_ server. Since most use cases are _Rails_ and _rspec_, it was a bit hard to figure out how to have the tests working with the _sinatra_ server setup.

# How long did you spend on this exercise? If you had unlimited more time to spend on this, how would you spend it and how would you prioritize each item?
I spent roughly 10 hours on the exercise, and most of that time was spent on getting the server up and running and getting the tests to run correctly (see previous question.)

If I could spend more time on this, I would tackle the response time and file parsing, and these issues could be solved in one go: when booting up the server (let's call it "master server"), a configuration could be used to create _X_ amount of "slave servers", and the file would be split into _X_ pieces, assigned to each one of these new servers. When a request comes in, the "master server" would know the line intervals between each server and ask that server to return the desired line.

Another separate way of improving the response time would be to cache the lines on the server for a given time.

# If you were to critique your code, what would you have to say about it?
My approach is too simplistic. I guess I followed _sinatra_'s "zero boilerplate" approach too close and ended up with a subpar solution.
