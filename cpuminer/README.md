# cpuminer

Crypto mining tool. Intended for use on Raspberry Pi just for fun.

## Configuration

Modify `docker-compose.yml` and supply values for the environment variables.

- `ALGO` - e.g. scrypt
- `URL` - Mining pool URL
- `EMAIL` - Username to log into mining pool
- `PASSWORD` - Password to log into mining pool
- `THREADS` - Number of mining threads to run. Don't exceed the number of cores
  your device has.
