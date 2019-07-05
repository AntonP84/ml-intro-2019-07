FROM python:3.6.8-stretch

COPY requirements.txt ./
RUN pip install --no-cache-dir -q -r requirements.txt

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

# Jupyter
EXPOSE 8888

VOLUME /notebooks

# create jupyter notebook
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--allow-root", "--ip=0.0.0.0", "--notebook-dir=/notebooks"]