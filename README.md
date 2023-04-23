# Website Dockerfile

This repository simply holds the [Dockerfile](Dockerfile) to deploy a personal Node.js website.

You will need to set the following environment variables

```
GFB_JWT_SECRET // secret to encrypt tokens
GFB_MANAGER_SECRET // secret to allow manager access
GFB_SQL_HOST // MySQL/Maria DB host
GFB_SQL_USER // MySQL/Maria DB user
GFB_SQL_PASSWORD // MySQL/Maria DB password
```

_Note that these can change to what ever values desired for deployment._
