import psycopg2
import csv

# Database connection details
DB_CONFIG = {
    'dbname': 'environmental_monitoring',
    'user': 'your_username',
    'password': 'your_password',
    'host': 'localhost',
    'port': 5432
}

def connect_to_db():
    """Establishes a connection to the PostgreSQL database."""
    try:
        conn = psycopg2.connect(**DB_CONFIG)
        print("Database connection successful.")
        return conn
    except Exception as e:
        print(f"Error connecting to database: {e}")
        return None

def import_csv_to_table(csv_file, table_name, conn):
    """Imports data from a CSV file into a specified database table."""
    try:
        with conn.cursor() as cur:
            with open(csv_file, 'r') as f:
                reader = csv.reader(f)
                next(reader)  # Skip the header row
                for row in reader:
                    placeholders = ', '.join(['%s'] * len(row))
                    query = f"INSERT INTO {table_name} VALUES ({placeholders})"
                    cur.execute(query, row)
            conn.commit()
            print(f"Data imported successfully into {table_name}.")
    except Exception as e:
        print(f"Error importing data to {table_name}: {e}")
        conn.rollback()

def main():
    """Main function to handle data import."""
    conn = connect_to_db()
    if not conn:
        return

    # Example usage
    try:
        import_csv_to_table('data/locations.csv', 'Locations', conn)
        import_csv_to_table('data/sensors.csv', 'Sensors', conn)
        import_csv_to_table('data/environmental_data.csv', 'EnvironmentalData', conn)
    finally:
        conn.close()
        print("Database connection closed.")

if __name__ == '__main__':
    main()
