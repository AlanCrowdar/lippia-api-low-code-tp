@tp @projects
Feature: Gestión de proyectos

  Scenario: Crear proyecto y consultar por ID
    Given base url $(env.base_url_projects)
    And endpoint /products
    And header Content-Type = application/json
    And body jsons/bodies/create_project.json
    When execute method POST
    Then the status code should be 201
    * define projectId = $.id

    Given base url $(env.base_url_projects)
    And endpoint /products/{{projectId}}
    And header Accept = application/json
    When execute method GET
    Then the status code should be 200

  Scenario: Editar proyecto existente
    Given base url $(env.base_url_projects)
    And endpoint /products/{{projectId}}
    And header Content-Type = application/json
    And body jsons/bodies/update_project.json
    When execute method PUT
    Then the status code should be 200



