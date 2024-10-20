#Stage 1

FROM python:3.9-slim as build-stage

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

#Stage 2

FROM python:3.9-slim as final-stage

WORKDIR /app

COPY --from=build-stage /app /app

CMD ["python", "app.py"]