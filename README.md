# CLCU - Common Lisp Common Utilities

## Install

```bash
git clone https://github.com/jaypmorgan/clcu.git
cd clcu
```

```lisp
(push (merge-pathnames #p".") asdf:*central-registry*)
(ql:quickload :clcu)
```
