# slides

To display slides for a lecture

* Disable browser cache (in case I've been editing slides)
  * Open dev tools
  * Select "network"
  * Check the box that says "disable cache"
* Put the latest markdown file here and rename it to "current.md"
* Run the local server, which displays the markdown using reveal.js, which is in `index.html`
```
make go
```
Browse to http://127.0.0.1:8000

Note...

* `python -m http.server` doesn't respond to `ctrl-C`, so use `ctrl-\`
* [Termination Signals](https://www.gnu.org/software/libc/manual/html_node/Termination-Signals.html) -- gnu.org
