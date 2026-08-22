# Rails Job Board

A full-stack job board application built with Rails 8, demonstrating authentication, role-based access, search/filter, and production deployment.

**[Live Demo](https://rails-job-board-zss5.onrender.com)**

## Highlights

- **Authentication** — Devise with email/password, remember-me, and password reset
- **Role-based access** — Admin dashboard restricted to admin users; regular users can browse and apply
- **Job listings** — Full CRUD with search by title, remote filter, and company association
- **Company profiles** — Each company owns its listings; admin can manage all
- **Pagination** — Server-side pagination via Pagy (never loads all records)
- **Responsive UI** — Tailwind CSS, mobile-first layout

## Tech Stack

| Layer | Technology |
|-------|------------|
| Framework | Ruby on Rails 8.1 |
| Language | Ruby 3.4 |
| Database | SQLite (dev) / PostgreSQL (prod) |
| Auth | Devise 5.0 |
| Pagination | Pagy |
| Frontend | Tailwind CSS, Importmap |
| Testing | RSpec, FactoryBot, Shoulda Matchers |
| CI | GitHub Actions |
| Deploy | Docker + Render |

## Quick Start

```bash
git clone https://github.com/ar1vit0r/rails-job-board.git
cd rails-job-board
bundle install
bin/rails db:create db:migrate db:seed
bin/dev
```

Open [http://localhost:3000](http://localhost:3000).

**Admin login:** `admin@example.com` / `password`

## Testing

```bash
bundle exec rspec
```

28 examples across 4 spec types:

| Type | What it covers |
|------|----------------|
| Model (4) | Validations, associations, scopes |
| Request (3) | Routing, auth gates, response codes |
| System (1) | End-to-end user flow |
| Support | Factories, shared helpers |

## Deployment

Configured via `render.yaml` (Blueprints):

1. Push to GitHub
2. Connect Render → New Blueprint
3. Auto-deploys on `main` branch push

## Skills Demonstrated

MVC architecture, RESTful routing, ActiveRecord associations, Devise authentication, role-based authorization, server-side search/filter, pagination, database migrations, Docker containerization, CI/CD pipelines, security hardening (Brakeman, XSS fixes), and production deployment.

## License

MIT
