# AGENTS.md

## Cursor Cloud specific instructions

This is a static **Jekyll** site (landing page for the Smarty Paints! mobile app). There is no backend, database, or API—just HTML/SCSS/Liquid templates served by Jekyll.

### Prerequisites (installed by VM snapshot)

- Ruby 3.2 with Bundler (system packages: `ruby-full`, `build-essential`, `zlib1g-dev`)
- Gems installed system-wide via `sudo bundle install`

### Key commands

| Task | Command |
|------|---------|
| Install/update gems | `sudo bundle install` |
| Build site | `bundle exec jekyll build` |
| Dev server | `bundle exec jekyll serve --host 0.0.0.0 --port 4000` |

### Gotchas

- **Do not use `bundle config set path vendor/bundle`** inside the workspace. Jekyll will try to parse gem template files from `vendor/` and fail with date-parsing errors. Install gems system-wide with `sudo bundle install` instead.
- There is no `Gemfile.lock` committed (it's in `.gitignore`). `bundle install` resolves versions fresh each time.
- There are no automated tests, linters, or CI pipelines in this repository. Validation is visual—build the site and check it in a browser.
- The `_drafts/` folder contains unpublished posts; use `--drafts` flag with Jekyll serve to preview them.
