# A docker-based Python develop environment supporting PyPBC library

## How to work with it?

First, you need to make sure that you have [Docker](https://www.docker.com/products/docker-desktop/) and [Makefile](https://linuxhint.com/install-make-ubuntu/) installed on your windows or linux machine.

After that:

- Easily write your python codes within the `dev` folder.
- Open cmd and execute this command to run your codes:
  ```shell
  make br
  ```
> This command builds the docker image and runs a docker container. The first time you execute this command on your system, it takes longer to finish.


## How to customize it?

- if you need another linux library installed in your environment, just add it to the `Dockerfile`:

```Dockerfile
RUN apt-get install -y libgmp-dev build-essential flex bison git curl python3-pip ... <ADD_IT_HERE>
```

- If you need some python libraries installed uncomment this line of code (if it is commented out) and add the `pip install` command there (in `Dockerfile`):
```Dockerfile
# RUN pip3 install ... <YOUR_PACKAGE_NAME_GOES_HERE>
```

- Entry-point of your python code is `dev/index.py` by default. You can change it by changing the last line of code in the `Dockerfile`:


```Dockerfile
# CMD python3 index.py
CMD python3 myPreferredName.py
```

