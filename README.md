# probe-d9c337

A one-page guestbook: visitors type a short message and see the wall of
messages, newest first. That's the whole product — no accounts, no pricing,
no sign-up wall. It opens straight onto the wall.

## What it does

- **Sign the wall** — a short form (optional name, message up to 500 chars)
  posts a note that appears at the top of the wall immediately.
- **Read the wall** — every note, newest first, with name and timestamp.
  Anonymous notes read "anonymous".
- Built on Vela's Rails production foundation with Material Design 3 chrome:
  accessible forms, light/dark theming, adaptive layout down to compact
  widths.

## Stack

- Ruby on Rails (the foundation's production template: PostgreSQL, Solid
  Queue, Propshaft + importmaps, no Node build)
- Material Design 3 semantic tokens for all chrome
- No accounts required for anything a visitor does

## Local development

```sh
bin/setup          # installs gems, sets up the database
bin/rails db:seed  # adds a few welcome notes to the wall
bin/dev            # boots the app (web + jobs)
```

Open http://localhost:3000 — the root is the guestbook.

## Test

```sh
bin/rails test
```

## Deployment

This app is deployed through the Holodex build flow. The demo deck wipes
daily at 3AM Mexico City; the repo is yours to keep and fork. See
`docs/DEPLOY.md` and `docs/HOSTED_RUNTIME.md` for self-hosting details.

## Legal

Terms of Service and Privacy Policy ship as versioned pages, linked from the
footer. Before a production launch, replace the demo operator contact values
(see `docs/` and the legal pages) with the real operator's details.
