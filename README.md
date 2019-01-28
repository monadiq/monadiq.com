# monadiq.com

monadiq.com is hosted on github pages with a custom domain.

## Requirements

* [Hugo](https://gohugo.io/getting-started/installing/)

```sh

brew install hugo

```

## Development

Simple start the hugo server and hack away.

```sh
hugo server -D

```

### Theme 
To adjust most of the setting modify the values in `config.toml`.

Other specific page data is located in the `data` directory.

To modify the theme directly i.e. css, termplates, layouts, js modify the `themes/airspace-hugo` directory

## Deployment

The site uses the github pages deployment type with the special `gh-pages` branch. **Never commit to the gh-pages branch**

See [Hosting on GitHub](https://gohugo.io/hosting-and-deployment/hosting-on-github/)

```sh

publish_to_ghpages.sh

```