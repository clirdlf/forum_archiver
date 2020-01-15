# forum_archiver
Script for archiving DLF Forums

## Usage

Create a repo on Github. Configure the publishing source for Github Pages to be the `doc` directory on the master branch. [See Documentation](https://help.github.com/en/github/working-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site).

Create a new Github repository for the project and clone locally. Add a README and GPL license.

On the terminal, clone the repository:

```bash
$ mkdir -p ~/projects/
$ git clone git@github.com:clirdlf/forum2017.diglib.org.git
```

Download the latest version of the `archive.sh` script in to the directory.

```bash
$ cd ~/projects/forum2017.diglib.org
$ wget https://raw.githubusercontent.com/clirdlf/forum_archiver/master/archive.sh
```

You should have three files in the directory at this point, `LICENSE`, `README.md`, AND `archive.sh`.

Run the archive script:

```bash
$ ./archive.sh https://forum2017.diglib.org
```

You should have the following layout with `docs` having the all the content from the website:

```
.
├── LICENSE
├── README.md
├── archive.sh
├── docs
│   ├── 2017
│   │   ├── 08
│   │   │   └── 21
│   │   │       └── fellowship-opportunity
│   │   │           ├── feed
│   │   │           │   └── index.html
├── forum2017.diglib.org.cdx
└── forum2017.diglib.org.warc.gz
```

Add, commit, and push the items to the repository.

```bash
$ git add .
$ git commit -am "Initial archive of forum2017.diglib.org"
$ git push origin master
```

After a few minutes, you should be able to access the site at <https://clirdlf.github.io/forum2017.diglib.org>.

# DNS
