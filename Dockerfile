FROM python:3.10-slim-buster

WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install --require-hashes -r requirements.txt --no-deps
COPY google_ads_queries/ google_ads_queries/
COPY bq_queries/ bq_queries/
COPY scripts/ scripts/
COPY run-local.sh .
ENV GOOGLE_APPLICATION_CREDENTIALS service_account.json

ENTRYPOINT ["./run-local.sh", "--quiet"]
CMD ["--google-ads-config", "/google-ads.yaml", "--config", "/app_reporting_pack.yaml", "--legacy"]
