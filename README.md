# Jupyter Scientific Notebook

This container makes it easy to start-up a ipython notebook server including a bundle of the most used python packages for scientific data processing and statistics. At this point the following packages are included by default:

- astropy
- biopython
- matplotlib
- numpy
- pandas
- pylab
- scikit-image
- scikit-learn
- scipy

To start the server, simply run the following command. To access your Jupyter-server, type in the ip of your docker-host followed by the port 443. If you run docker on your local linux maschine, open `https://127.0.0.1:443` in your webbrowser. On Mac or Windows, use the link provided by kitematic.

```
docker pull mstrehse/scientific-jupyter-notebook
docker run mstrehse/scientific-jupyter-notebook -p 443:443
```

You can specify the port of the notebook-server by changing environmental variable `JUPYTER_PORT`. By default it uses the standard https port 443. The container includes a volume `/notebooks`, which you can map to your host to upload notebooks to the container or to a busybox if you want to persist them.

Have fun :)
