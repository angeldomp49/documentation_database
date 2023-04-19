
### Tables ###

<br/>

Name: projects

- name __varchar 100 - (primary key)__

Name: dependecy_tags

- group_id __varchar 100__
- artifact_id __varchar 100__
- project_name __varchar 100__

Name: versions

- version_id __varchar 100__
- details __text__
- project_name __varchar 100__

<br/>
<br/>

### Procedures ###

<br/>

    all_projects()

Description: Show all project names.

<br/>

    dependency_tag_for_project(IN project_name_to_search VARCHAR(100))

Description: Returns a dependency tag for a project by name.

<br/>

    versions_for_project(IN project_name_to_search VARCHAR(100))

Description: Returns a list of versions for a project by name.

<br/>

    delete_project(IN project_name_to_search VARCHAR(100))

Description: Delete a project by name.

<br/>

    delete_dependency_tag(IN group_id VARCHAR(100), IN artifact_id VARCHAR(100))

Description: Delete a dependency tag by group_id and artifact_id.

<br/>

    delete_version(IN project_name VARCHAR(100), IN version_id VARCHAR(100))

Description: Delete a version by project name and version.

<br/>

    exists_project(IN project_name VARCHAR(100))

Description: Check if a project exists in the database.

<br/>

    exists_dependency_tag(IN group_id VARCHAR(100), IN artifact_id VARCHAR(100))

Description: Check if a dependency tag exists in the database.

<br/>

    exists_dependency_tag_in_project(IN project_name VARCHAR(100))

Description: Check if a dependency tag exists for a project by name.

<br/>

    exists_version(IN project_name VARCHAR(100), IN version_id VARCHAR(100))

Description: Check if a version exists for a project by name and version_id.

<br/>

    create_dependency_tag(IN project_name VARCHAR(100), IN group_id VARCHAR(100), IN artifact_id VARCHAR(100))

Description: Create a dependency tag for a project by name, group_id and artifact_id.

<br/>

    create_version(IN project_name VARCHAR(100), IN version_id VARCHAR(100), IN details TEXT)

Description: Create a version for a project by name, version_id and details.

<br/>
