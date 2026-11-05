# Soulseek.NET example web client

Use Node.js 22.12 or newer and Yarn Classic. The Vite build replaces the retired
Create React App toolchain while retaining React 16, the existing routes, and
relative production API URLs.

```sh
yarn install --frozen-lockfile
yarn start
yarn build
```

The development server listens on loopback port 3000 and uses the API at
`http://localhost:5000/api/v1`. Production output remains in `build/`, with
relative asset paths for the existing API-hosted deployment. `yarn preview`
serves a local preview. No automated application tests are defined.
