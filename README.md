# RunCloud build image

Image for RunCloud git/atomic deployments on containerized servers. It is
RunCloud's own PHP image (`runcloud/phpXXrc`, with PHP, Composer and git) plus
Node.js, which RunCloud leaves out to keep their image small. Their
[Docker FAQ](https://runcloud.io/docs/docker-container-faqs) suggests
extending their image for this.

## Tags

| Tag | PHP | Node.js |
|---|---|---|
| `php8.3`, `php8.3-node24` | 8.3 | 24 LTS |
| `php8.4`, `php8.4-node24` | 8.4 | 24 LTS |
| `php8.5`, `php8.5-node24`, `latest` | 8.5 | 24 LTS |

Images are built for `linux/amd64` and `linux/arm64`, and rebuilt weekly to
pick up base image and Node.js security updates.

Use the tag whose PHP version matches the web app's PHP version in RunCloud,
so Composer resolves dependencies for the PHP that will run them.

## Building locally

```sh
docker build --build-arg PHP_VERSION=85 --build-arg NODE_VERSION=24 -t runcloud-build-image .
```

## Updating

- **Node.js:** change `NODE_VERSION` in `.github/workflows/build.yml` (and the
  default in the `Dockerfile`) when a new LTS line starts.
- **PHP:** add the version to the workflow matrix once RunCloud publishes
  `runcloud/phpXXrc`, and move the `latest` tag to it.
