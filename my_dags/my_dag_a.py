from __future__ import annotations

from datetime import datetime
from pathlib import Path

from airflow import DAG
from airflow.operators.python import PythonOperator


def run_sql_file(sql_filename: str) -> None:
    sql_path = Path(__file__).with_name(sql_filename)
    sql_text = sql_path.read_text(encoding="utf-8")
    # Dummy execution: log the SQL content.
    print(f"Running {sql_filename}:\n{sql_text}")


with DAG(
    dag_id="my_dag_a",
    start_date=datetime(2025, 1, 1),
    schedule=None,
    catchup=False,
    tags=["dummy"],
) as dag:
    run_01 = PythonOperator(
        task_id="run_01_sql",
        python_callable=run_sql_file,
        op_args=["01_extract_recent_orders.sql"],
    )
    run_02 = PythonOperator(
        task_id="run_02_sql",
        python_callable=run_sql_file,
        op_args=["02_join_orders_customers.sql"],
    )
    run_03 = PythonOperator(
        task_id="run_03_sql",
        python_callable=run_sql_file,
        op_args=["03_aggregate_revenue_by_tier.sql"],
    )

    run_01 >> run_02 >> run_03

