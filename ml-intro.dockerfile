FROM python:3.6.8-stretch

COPY requirements.txt ./
RUN pip install --no-cache-dir -q -r requirements.txt

# install Anacoda, required by MLFlow
RUN curl -O https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh && \
    bash Anaconda3-2019.03-Linux-x86_64.sh -b

# enable Jupyter extensions
ENV JUPYTER_TOKEN=123
RUN jupyter contrib nbextension install --system --InstallContribNbextensionsApp.log_level=WARN && \
    jupyter nbextensions_configurator enable --system && \
    jupyter nbextension enable --py --sys-prefix widgetsnbextension && \
    jupyter nbextension enable toc2/main && \
    jupyter nbextension enable codefolding/main && \
    jupyter nbextension enable codefolding/edit && \
    jupyter nbextension enable collapsible_headings/main

COPY *.ipynb /notebooks/

# Jupyter, MLFLow
EXPOSE 8888 5000

VOLUME /notebooks

# create jupyter notebook
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--allow-root", "--ip=0.0.0.0", "--notebook-dir=/notebooks"]