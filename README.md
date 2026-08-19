<!-- foundation:identity -->
# probe-d9c337

A one-page guestbook where visitors type a short message and see the wall of messages, newest first.

- Site: https://probe-d9c337.api.holode.xyz
- Support: support@probe-d9c337.api.holode.xyz
<!-- /foundation:identity -->

## What this is

A one-page guestbook where visitors type a short message and see the wall of messages, newest first.

## Who it is for

- visitor

## Main features

- **View the wall** — visitor lands on the single page and sees all messages, newest first
- **Post a message** — visitor types a short message and submits it; it appears at the top of the wall

## Core entities

- Message

## Run locally

```bash
bundle install
bin/rails db:prepare
bin/dev
```

Requires Ruby, PostgreSQL, and the usual Rails toolchain. See `bin/setup` if present.

## Demo

A handful of friendly welcome messages with names and dates so the wall looks alive on first load.

## Deploy notes

Production `config.hosts` is derived from `domain` in `config/foundation.yml`. Keep that value aligned with the real host or every request will 403.
