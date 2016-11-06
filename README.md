# docker-ghost
No bullshit Docker image for self-hosted Ghost blog

This image includes Ghost and all of its dependencies backed-in, so it just works. All you need to do is provide:

1) config.js file with the following production section:
```
production: {
        url: 'http://YOUR-BLOG-DOMAIN',
        mail: {},
        database: {
            client: 'sqlite3',
            connection: {
                filename: path.join(__dirname, '/content/data/ghost.db')
            },
            debug: false
        },
        server: {
            host: '0.0.0.0',
            port: '2368'
        }
    },
```

make sure you have **host: '0.0.0.0'** .

2) Content

To run:

```
docker run -d --restart always -p 2368:2368 -v /PATH_TO_YOUR_CONTENT/content:/var/www/ghost/content -v /PATH_TO_YOUR_CONFIG_JS/config.js:/var/www/ghost/config.js stefand/ghost
```
