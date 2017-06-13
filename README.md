# mini/aws-cli

Alpine-powered container for [Amazon Web Services CLI](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)

## Usage

You can simply run this container using `docker run`:

```
docker run -it --rm mini/aws-cli help
```

This container will not have access to your credentials, but you can expose
them using AWS supported environment variables (`AWS_ACCESS_KEY_ID`,
`AWS_SECRET_ACCESS_KEY`):

```
docker run -it -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY --rm mini/aws-cli help
```

Above example will pass your current environment variables into the container.

You can also use `--env-file` instead.

Another approach will be sharing your `~/.aws` directory instead, mounting
the volume against `/home/aws/.aws` of the container:

```
docker run -it -v $HOME/.aws:/home/aws/.aws --rm mini/aws-cli help
```

### Wrappers

As convenience to reduce typing, two convenience scripts are provided within
[wrappers](wrappers) directory:

- [`aws-cli-user`](wrapper/aws-cli-user)
- [`aws-cli-relative`](wrapper/aws-cli-relative)

You can copy those and place them either your project's `bin` directory or
somewhere along the `$PATH` for easy invocation.

### Volumes

This container also exposes `/data` as bind mount volume and can be used when
copying local content to a target (S3 bucket) might be required:

```
docker run -it -v $PWD:/data --env-file creds mini/aws-cli s3 sync s3://my-bucket my-copy
```

## Sponsor

Work on this was made possible thanks to [AREA 17](http://www.area17.com).

## License

All code contained in this repository, unless explicitly stated, is
licensed under MIT license.

A copy of the license can be found inside the [LICENSE](LICENSE) file.
