# monadiq.com

monadiq.com is hosted on github pages with a custom domain.

## Requirements

* [Hugo](https://gohugo.io/getting-started/installing/)
* [ngrok](https://dashboard.ngrok.com/get-started)
* [jq](https://stedolan.github.io/jq/download/)

```sh

brew install hugo

```

## Development

Simple start the hugo server and hack away.

```sh
hugo server

```

### Share your local changes with others publicly
It's easy to automate, and here are the steps publicly
Use [ngrok](https://dashboard.ngrok.com/get-started) to expose your local environment to others.
Query ngrok tunnel and apply that url when starting the hugo dev server.
This starts the hugo server with the ngrok tunnel url as the base url.

```sh
# in first terminal
└─ $ ▶ngrok http 1313

# in another terminal 
└─ $ ▶NGROK_BASE_URL=$(curl --silent  http://localhost:4040/api/tunnels/command_line | jq '.public_url' -r | cut -f 3 -d)

# start hugo server
└─ $ ▶hugo server --baseURL $NGROK_BASE_URL --appendPort=false

```

or use a convenience script [hugo_ngrok.sh](./hugo_ngrok.sh)

```sh
└─ $ ▶ ./hugo_ngrok.sh
started ngrok 41798...
waiting for ngrok to start...
ngrok tunnel open at https://1749f01d.ngrok.io

                   | EN
+------------------+----+
  Pages            |  4
  Paginator pages  |  0
  Non-page files   |  0
  Static files     | 64
  Processed images |  0
  Aliases          |  0
  Sitemaps         |  1
  Cleaned          |  0

Total in 208 ms
Watching for changes in /Users/Dev/monadiq.com/{content,static,themes}
Watching for config changes in /Users/Dev/monadiq.com/config.toml
Environment: "development"
Serving pages from memory
Running in Fast Render Mode. For full rebuilds on change: hugo server --disableFastRender
Web Server is available at //1749f01d.ngrok.io/ (bind address 127.0.0.1)
Press Ctrl+C to stop

```

### Theme 
To adjust most of the setting modify the values in `config.toml`.

Other specific page data is located in the `data` directory.

To modify the theme directly i.e. css, termplates, layouts, js modify the `themes/airspace-hugo` directory

## Deployment

The site uses the github pages deployment type with the special `gh-pages` branch. **Never commit to the gh-pages branch**

See [Hosting on GitHub](https://gohugo.io/hosting-and-deployment/hosting-on-github/)

```sh

# publishes the 'public' dir to the special gh-pages branch
└─ $ ▶publish_to_ghpages.sh

```