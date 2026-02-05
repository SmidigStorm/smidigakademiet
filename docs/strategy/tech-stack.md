# Tech Stack

## Languages

- **TypeScript** (5.8.3) — Primary language, strict mode enabled
- **SQL** — PostgreSQL queries via Drizzle ORM

## Frameworks

- **Next.js** 15.6.0-canary.59 — App Router, React Server Components, Partial Pre-rendering (PPR), Turbopack in dev
- **React** 19.1.0 — Latest major version with Server Components
- **Tailwind CSS** 4.1.7 — Utility-first styling

## Infrastructure

- **Vercel** — Production hosting (optimized for Next.js)
- **Docker Compose** — Local development with PostgreSQL 16.4-alpine
- **mise** — Tool version manager (Node.js 22)
- **pnpm** — Package manager

## Data

- **PostgreSQL** 16.4 — Primary database
- **Drizzle ORM** 0.43.1 — Type-safe database access and migrations
- **Drizzle Kit** 0.31.1 — Schema generation and migration tooling

## Key Libraries

### UI
- **shadcn/ui** — Component library (New York style, zinc base color, RSC-enabled)
- **Radix UI** 1.4.2 — Headless accessible UI primitives (used by shadcn)
- **Lucide React** 0.511.0 — Icons
- **class-variance-authority** / **clsx** / **tailwind-merge** — Styling utilities

### Auth & Security
- **jose** 6.0.11 — JWT token handling
- **bcryptjs** 3.0.2 — Password hashing
- HTTP-only cookies for session storage

### Payments
- **Stripe** 18.1.0 — Payment processing, webhooks, checkout

### Email
- **Resend** — Transactional email delivery (confirmations, reminders) and newsletter/marketing emails
- **React Email** — Email templates as React components, consistent with the rest of the stack

### Documentation
- **Fumadocs** — Documentation framework for the knowledge base / content section

### Scheduling
- **Cal.com** — Embedded discovery call booking widget, syncs with calendar

### Video (future)
- **Vimeo** — Video hosting for online course content, embedded behind auth

### Data & Validation
- **Zod** 3.24.4 — Schema validation
- **SWR** 2.3.3 — Client-side data fetching

## Dev Tools

- **Turbopack** — Dev server bundler (via `next dev --turbopack`)
- **Biome** — Linting and formatting (single fast tool, replaces ESLint + Prettier)
- **Vitest** — Unit and integration testing
- **Playwright** — End-to-end browser testing
- **playwright-bdd** — BDD layer for Playwright using Gherkin `.feature` files. Requirements are written as `.feature` specs before implementation and run as automated E2E tests
- **PostCSS** 8.5.3 + **Autoprefixer** 10.4.21
- **dotenv** 16.5.0 — Environment variable loading

## Environment Variables

```
POSTGRES_URL           — PostgreSQL connection string
STRIPE_SECRET_KEY      — Stripe API key
STRIPE_WEBHOOK_SECRET  — Stripe webhook signing secret
RESEND_API_KEY         — Resend email API key
BASE_URL               — Application base URL
AUTH_SECRET            — JWT signing secret
```

## External Tools

- **Notion** — CRM (external, not part of the codebase)
- **Cal.com** — Hosted scheduling (embedded on site)
- **Vimeo** — Video hosting for course content (future)
