# eko-tf-dast-tools

## Demo by Rossana Suarez #RoxsRoss

Construir una API CRUD (Create, read, update, delete) muy simple. 

Usando Terraform + Gitlab-ci

### Crear DynamoDB
- Table name:
``` 
http-crud-tutorial-items
```
- Primary key:
```
id
```

### Crear a Lambda function
- Function name:
```
http-crud-tutorial-function
```
- Runtime Node.js 14.x
- Crear role from AWS policy templates
- Role name:
```
http-crud-tutorial-role
```
- For Policy templates, choose *Simple microservice permissions* . This policy grants the Lambda function permission to interact with DynamoDB.

### CREAR AN HTTP API

- Create API 
- For HTTP API choose Build
- API name: 
```
http-crud-tutorial-api
```
- Configure reglas de ruteo
- Por Ejemplo, GET /items. 
- Para esta demo API, se debe crear 4 reglas:

```
GET /items/{id}
GET /items
PUT /items
DELETE /items/{id}

```

### Create an integration
- Ir a la API (http-crud-tutorial-api)
- Ubicar Integrations
- Manage integrations
- Para Integration type, Escoger Lambda function
- Para Lambda function, 
```
http-crud-tutorial-function
```

### DONE

