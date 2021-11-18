# heroku-buildpack-lerna

Buildpack allowing us to deploy an application using [lerna](https://github.com/lerna/lerna) on heroku.
This buildpack is based on these two buildpacks: [heroku-buildpack-nodejs](https://github.com/heroku/heroku-buildpack-nodejs) and [heroku-buildpack-monorepo](https://github.com/lstoll/heroku-buildpack-monorepo).

## Usage

To deploy your application, you need to:

- Set the Config Var APP_BASE in Heroku to your application path (i.e packages/client).
- Set the Config Var YARN_PRODUCTION to false.

This buildpack will just run two commands thanks to lerna to compile your application.
To start your application, a file named `Procfile` is required in your application.

```
lerna bootstrap --scope="${APP_BASE}" --include-dependencies

lerna run build --scope="${APP_BASE}" --include-dependencies --stream
```

## Troubleshooting

If lerna is not found, make sure to have lerna as a dev dependency in your package.json at the root of you repository.
Also, you'll need to set YARN_PRODUCTION to false so lerna won't be prunned.
