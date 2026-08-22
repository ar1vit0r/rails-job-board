# Rails Job Board

A portfolio project built with Ruby on Rails, demonstrating modern Rails development practices.

## Features

- Job listings with search and filter
- Company profiles
- Job applications
- Admin dashboard with CRUD operations
- User authentication (Devise)
- Pagination (Pagy)
- Responsive design (Tailwind CSS)

## Tech Stack

- Ruby on Rails 7.2
- SQLite (development) / PostgreSQL (production)
- Tailwind CSS
- Devise (authentication)
- Pagy (pagination)

## Setup

```bash
# Clone the repository
git clone <repo-url>
cd rails-job-board

# Install dependencies
bundle install

# Setup database
bin/rails db:create db:migrate db:seed

# Start the server
bin/dev
```

## Admin Access

- Email: admin@example.com
- Password: password

## Deployment

This app is configured for deployment on Render:

1. Push to GitHub
2. Connect your Render account
3. Create a new Blueprint from `render.yaml`

## License

MIT
