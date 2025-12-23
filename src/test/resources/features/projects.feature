@tp
Feature: Gestión de proyectos


  @tp @happy @crear_proyecto
  Scenario: Crear proyecto exitosamente
    Given base url $(env.base_url_projects)
    And endpoint /products
    And header Content-Type = application/json
    And body jsons/bodies/create_project.json
    When execute method POST
    Then the status code should be 201
    And response should contain "Proyecto QA"
    * define projectId = $.id


  @tp @happy
  Scenario: Consultar proyecto existente
    * call read('projects.feature@crear_proyecto')
    Given base url $(env.base_url_projects)
    And endpoint /products/{{projectId}}
    And header Accept = application/json
    When execute method GET
    Then the status code should be 200
    And response should contain "Proyecto QA"


  @tp @happy
  Scenario: Editar proyecto existente
    * call read('projects.feature@crear_proyecto')
    Given base url $(env.base_url_projects)
    And endpoint /products/{{projectId}}
    And header Content-Type = application/json
    And body jsons/bodies/update_project.json
    When execute method PUT
    Then the status code should be 200
    And response should contain "Proyecto QA"


  @tp @unhappy
  Scenario: Consultar proyecto inexistente
    Given base url $(env.base_url_projects)
    And endpoint /products/999999
    When execute method GET
    Then the status code should be 404




