# ML Intro

## Colab

- go to <https://colab.research.google.com>
- GitHub tab
- open the notebook from *AntonP84/ml-intro-2019-07* repo

## Docker

- build image

```bash
docker image build \
    -t ml-intro \
    -f ml-intro.dockerfile \
    .
```

- run container

```bash
docker container run -d --rm \
    -e JUPYTER_TOKEN=123 \
    -p 8888:8888 -p 5000:5000 -p 1234:1234 \
    ml-intro
```

- open <https://localhost:8888> in your browser
