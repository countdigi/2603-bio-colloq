# 2603-bio-colloq

## slide-deck

- [countdigi.github.io/talks/2603-bio-colloq](https://countdigi.github.io/talks/2603-bio-colloq)

## apptainer

To build examples:
```bash
mkdir -p tmp/img/{debian,rocker,samtools}

apptainer build \
  --build-arg="version=13.3" \
  tmp/img/debian/13.3.sif \
  spec/debian.def

apptainer build \
  --build-arg="base=tmp/img/debian/13.3.sif" \
  --build-arg="version=1.23" \
  tmp/img/samtools/1.23.sif \
  spec/samtools.def

apptainer build \
  --build-arg="version=4.5.2" \
  tmp/img/rocker/4.5.2.sif \
  spec/rocker.def
```

To run:
```bash
apptainer exec tmp/img/debian/13.3.sif cat /etc/debian_version
apptainer exec tmp/img/samtools/1.23.sif samtools
apptainer exec tmp/img/rocker/4.5.2.sif R
```

---

documentation
- [apptainer docs](https://apptainer.org/docs/user/main/index.html)
- [apptainer quickstart](https://apptainer.org/docs/user/main/quick_start.html)

videos
- [HPC Apptainer Container Basics](https://www.youtube.com/watch?v=_LPyJRehPao)
- [Apptainer containers](https://www.youtube.com/watch?v=azmexBhgP3k)


## snakemake

To install:
```bash
bash bin/install-snakemake

# add to $HOME/.bashrc
export PATH=$HOME/opt/snake/<version>/envs/main/bin:$PATH

snakemake --help
```

---

### resources

documentation
- [snakemake docs](https://snakemake.readthedocs.io/en/stable/)
- [snakemake docs | tutorial](https://snakemake.readthedocs.io/en/stable/tutorial/basics.html)
- [snakemake docs | slurm executor](https://snakemake.github.io/snakemake-plugin-catalog/plugins/executor/slurm.html)

videos
- [snakemake tips and tricks playlist](https://www.youtube.com/watch?v=Gg0SsEs16Jc&list=PLWhvkMKn3k1zefj7ELcxlukO6AbuP8YCL&index=1)

## stampede

- head-node: `alpha1.epi.usf.edu`
  - `${HOME}` is set to `${HPC_HOME}`
  - `${HPC_HOME} ==  /stampede1/user/<user>` (e.g. `/stampede1/user/countskm`)
  - `${NET_HOME} == /home/<user>` (e.g.: `/home/countskm`)
