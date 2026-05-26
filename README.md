<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

## About Laravel

Laravel is a web application framework with expressive, elegant syntax. We believe development must be an enjoyable and creative experience to be truly fulfilling. Laravel takes the pain out of development by easing common tasks used in many web projects, such as:

- [Simple, fast routing engine](https://laravel.com/docs/routing).
- [Powerful dependency injection container](https://laravel.com/docs/container).
- Multiple back-ends for [session](https://laravel.com/docs/session) and [cache](https://laravel.com/docs/cache) storage.
- Expressive, intuitive [database ORM](https://laravel.com/docs/eloquent).
- Database agnostic [schema migrations](https://laravel.com/docs/migrations).
- [Robust background job processing](https://laravel.com/docs/queues).
- [Real-time event broadcasting](https://laravel.com/docs/broadcasting).

Laravel is accessible, powerful, and provides tools required for large, robust applications.

## Learning Laravel

Laravel has the most extensive and thorough [documentation](https://laravel.com/docs) and video tutorial library of all modern web application frameworks, making it a breeze to get started with the framework. You can also check out [Laravel Learn](https://laravel.com/learn), where you will be guided through building a modern Laravel application.

If you don't feel like reading, [Laracasts](https://laracasts.com) can help. Laracasts contains thousands of video tutorials on a range of topics including Laravel, modern PHP, unit testing, and JavaScript. Boost your skills by digging into our comprehensive video library.

## Laravel Sponsors

We would like to extend our thanks to the following sponsors for funding Laravel development. If you are interested in becoming a sponsor, please visit the [Laravel Partners program](https://partners.laravel.com).

### Premium Partners

- **[Vehikl](https://vehikl.com)**
- **[Tighten Co.](https://tighten.co)**
- **[Kirschbaum Development Group](https://kirschbaumdevelopment.com)**
- **[64 Robots](https://64robots.com)**
- **[Curotec](https://www.curotec.com/services/technologies/laravel)**
- **[DevSquad](https://devsquad.com/hire-laravel-developers)**
- **[Redberry](https://redberry.international/laravel-development)**
- **[Active Logic](https://activelogic.com)**

## Contributing

Thank you for considering contributing to the Laravel framework! The contribution guide can be found in the [Laravel documentation](https://laravel.com/docs/contributions).

## Code of Conduct

In order to ensure that the Laravel community is welcoming to all, please review and abide by the [Code of Conduct](https://laravel.com/docs/contributions#code-of-conduct).

## Security Vulnerabilities

If you discover a security vulnerability within Laravel, please send an e-mail to Taylor Otwell via [taylor@laravel.com](mailto:taylor@laravel.com). All security vulnerabilities will be promptly addressed.

## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).


# Laravel 12 + Docker Setup Guide

Complete setup guide for running Laravel 12 with Docker Compose.

---

# Prerequisites

Make sure the following are installed on your system:

- Docker
- Docker Compose

Verify installation:

```bash
docker --version
docker compose version
```

---

# Start Docker Containers

Build and start all containers:

```bash
docker compose up -d --build
```

## What This Command Does

- Builds Docker images
- Starts containers in detached mode
- Applies latest Dockerfile changes
- Runs services in background

---

# Install Laravel 12

## Option 1 — Recommended (Empty Project Directory)

Run:

```bash
docker compose exec app composer create-project laravel/laravel:^12 .
```

This installs Laravel directly into the current project directory.

---

## Option 2 — If Directory Already Contains Files

Install Laravel inside a temporary folder:

```bash
docker compose exec app composer create-project laravel/laravel:^12 temp
```

Then move all files from `temp` into the project root.

---

# Move Laravel Files

## Linux / macOS / Git Bash

```bash
mv temp/* temp/.* . 2>/dev/null
rm -rf temp
```

---

## Windows PowerShell

```powershell
Move-Item temp\* . -Force
Move-Item temp\.* . -Force -ErrorAction SilentlyContinue
Remove-Item temp -Recurse -Force
```

---

# Access Application

After containers are running:

| Service | URL |
|---|---|
| Laravel Application | http://localhost |
| phpMyAdmin | http://localhost:8080 |

---

# Running Laravel Artisan Commands

## Open Bash Inside App Container

```bash
docker compose exec app bash
```

Then run artisan commands normally:

```bash
php artisan migrate
```

Example:

```bash
php artisan make:controller UserController
```

---

# Common Docker Compose Commands

## 1. Start Containers

```bash
docker compose up -d
```

### Details

- Starts containers
- Uses existing images
- Faster startup
- Does NOT rebuild images

### Use When

- No Dockerfile changes
- Normal daily development

---

## 2. Rebuild and Start Containers

```bash
docker compose up -d --build
```

### Details

- Rebuilds images
- Starts containers
- Includes latest Docker changes

### Use When

- Dockerfile changed
- Dependencies changed
- PHP extensions changed
- Build configuration updated

---

# Development Pro Tip

Use:

```bash
docker compose up -d --build --remove-orphans
```

## Benefits

- Rebuilds updated services
- Removes unused/orphan containers
- Keeps Docker environment clean

---

# Useful Laravel Commands

## Generate Application Key

```bash
docker compose exec app php artisan key:generate
```

---

## Run Database Migrations

```bash
docker compose exec app php artisan migrate --force
```

---

## Cache Configuration

```bash
docker compose exec app php artisan config:cache
```

---

## Cache Routes

```bash
docker compose exec app php artisan route:cache
```

---

## Cache Blade Views

```bash
docker compose exec app php artisan view:cache
```

---

# Stop Containers

```bash
docker compose down
```

---

# Stop and Remove Volumes

```bash
docker compose down -v
```

Use this if you want a completely fresh setup.

---

# Rebuild From Scratch

```bash
docker compose down -v
docker compose up -d --build
```

---

# View Running Containers

```bash
docker ps
```

---

# View Container Logs

## All Containers

```bash
docker compose logs
```

## Specific Service

```bash
docker compose logs app
```

## Live Logs

```bash
docker compose logs -f
```

---

# Enter Container Shell

```bash
docker compose exec app bash
```

---

# Run Composer Commands

```bash
docker compose exec app composer install
```

Example:

```bash
docker compose exec app composer update
```

---

# Run NPM Commands

```bash
docker compose exec app npm install
```

Example:

```bash
docker compose exec app npm run dev
```

---

# File Permissions (Linux/macOS)

If storage permission issues occur:

```bash
docker compose exec app chmod -R 775 storage bootstrap/cache
```

---

# Clear Laravel Cache

```bash
docker compose exec app php artisan optimize:clear
```

---

# Restart Containers

```bash
docker compose restart
```

---

# Remove Unused Docker Resources

```bash
docker system prune -a
```

> Warning: This removes unused Docker images, containers, and networks.

---

# Recommended Development Workflow

## First Time Setup

```bash
docker compose up -d --build
docker compose exec app composer install
docker compose exec app php artisan key:generate
docker compose exec app php artisan migrate
```

---

## Daily Development

```bash
docker compose up -d
```

---

## After Dockerfile Changes

```bash
docker compose up -d --build
```

---

# Troubleshooting

## Port Already in Use

Check running services using:

```bash
netstat -ano
```

Or stop conflicting containers:

```bash
docker compose down
```

---

## Permission Issues

Run:

```bash
docker compose exec app chmod -R 775 storage bootstrap/cache
```

---

## Composer Memory Issues

```bash
docker compose exec app composer install --ignore-platform-reqs
```

---

# Project Structure Example

```text
project-root/
│
├── app/
├── bootstrap/
├── config/
├── database/
├── public/
├── resources/
├── routes/
├── storage/
├── docker/
├── docker-compose.yml
├── Dockerfile
└── .env
```

---

# Done

Your Laravel 12 Docker environment is now ready for development.