
CREATE TABLE projects(
    name VARCHAR(100) NOT NULL,
    primary key (name),
    UNIQUE KEY name (name)
)ENGINE=INNODB;

CREATE TABLE dependency_tags(
    group_id VARCHAR(100),
    artifact_id VARCHAR(100),
    project_name VARCHAR(100)
)ENGINE=INNODB;

CREATE TABLE versions(
    version_id VARCHAR(100),
    details TEXT,
    project_name VARCHAR(100)
)ENGINE=INNODB;

DELIMITER |

CREATE PROCEDURE all_projects()
BEGIN
    SELECT name FROM projects;
END|

CREATE PROCEDURE dependency_tag_for_project(IN project_name_to_search VARCHAR(100))
BEGIN

    SET @project_name_to_search = project_name_to_search;

    PREPARE statement FROM "SELECT * FROM dependency_tags WHERE project_name = ? LIMIT 1;";
    EXECUTE statement USING @project_name_to_search;
    DEALLOCATE PREPARE statement;
END|

CREATE PROCEDURE versions_for_project(IN project_name_to_search VARCHAR(100))
BEGIN

    SET @project_name_to_search = project_name_to_search;

    PREPARE statement FROM "SELECT * FROM versions WHERE project_name = ?;";
    EXECUTE statement USING @project_name_to_search;
    DEALLOCATE PREPARE statement;
END|

CREATE PROCEDURE delete_project(IN project_name_to_search VARCHAR(100))
BEGIN
    
    SET @project_name_to_search = project_name_to_search;

    PREPARE statement FROM "DELETE FROM projects WHERE name = ?";
    EXECUTE statement USING @project_name_to_search;
    DEALLOCATE PREPARE statement;

    PREPARE statement FROM "DELETE FROM dependency_tags WHERE project_name = ?";
    EXECUTE statement USING @project_name_to_search;
    DEALLOCATE PREPARE statement;

    PREPARE statement FROM "DELETE FROM versions WHERE project_name = ?";
    EXECUTE statement USING @project_name_to_search;
    DEALLOCATE PREPARE statement;
END|

CREATE PROCEDURE delete_dependency_tag(IN group_id VARCHAR(100), IN artifact_id VARCHAR(100))
BEGIN

    SET @group_id = group_id;
    SET @artifact_id = artifact_id;

    PREPARE statement FROM "DELETE FROM dependency_tags WHERE group_id = ? AND artifact_id = ?";
    EXECUTE statement USING @group_id, @artifact_id;
    DEALLOCATE PREPARE statement;
END|

CREATE PROCEDURE delete_version(IN project_name VARCHAR(100), IN version_id VARCHAR(100))
BEGIN

    SET @project_name = project_name;
    SET @version_id = version_id;

    PREPARE statement FROM "DELETE FROM versions WHERE project_name = ? AND version_id = ?";
    EXECUTE statement USING @project_name, @version_id;
    DEALLOCATE PREPARE statement;
END|

CREATE PROCEDURE exists_project(IN project_name VARCHAR(100))
BEGIN

    SET @project_name_to_search = project_name;

    PREPARE statement FROM "SELECT COUNT(*) FROM projects WHERE name = ?";
    EXECUTE statement USING @project_name;
    DEALLOCATE PREPARE statement;
END|

CREATE PROCEDURE exists_dependency_tag(IN group_id VARCHAR(100), IN artifact_id VARCHAR(100))
BEGIN

    SET @group_id = group_id;
    SET @artifact_id = artifact_id;

    PREPARE statement FROM "SELECT COUNT(*) FROM dependency_tags WHERE group_id = ? AND artifact_id = ?";
    EXECUTE statement USING @group_id, @artifact_id;
    DEALLOCATE PREPARE statement;
END|

CREATE PROCEDURE exists_dependency_tag_in_project(IN project_name VARCHAR(100))
BEGIN

    SET @project_name = project_name;

    PREPARE statement FROM "SELECT COUNT(*) FROM dependency_tags WHERE project_name = ?";
    EXECUTE statement USING @group_id, @artifact_id, @project_name;
    DEALLOCATE PREPARE statement;
END|

CREATE PROCEDURE exists_version(IN project_name VARCHAR(100), IN version_id VARCHAR(100))
BEGIN

    SET @project_name = project_name;
    SET @version_id = version_id;

    PREPARE statement FROM "SELECT COUNT(*) FROM versions WHERE project_name = ? AND version_id = ?";
    EXECUTE statement USING @project_name, @version_id;
    DEALLOCATE PREPARE statement;
END|

CREATE PROCEDURE create_dependency_tag(IN project_name VARCHAR(100), IN group_id VARCHAR(100), IN artifact_id VARCHAR(100))
BEGIN

    SET @project_name = project_name;
    SET @group_id = group_id;
    SET @artifact_id = artifact_id;

    PREPARE statement FROM "INSERT INTO dependency_tags (project_name, group_id, artifact_id) VALUES (?, ?, ?)";
    EXECUTE statement USING @project_name, @group_id, @artifact_id;
    DEALLOCATE PREPARE statement;
END|


CREATE PROCEDURE create_version(IN project_name VARCHAR(100), IN version_id VARCHAR(100), IN details TEXT)
BEGIN

    SET @project_name = project_name;
    SET @version_id = version_id;
    SET @details = details;

    PREPARE statement FROM "INSERT INTO versions (project_name, version_id, details) VALUES (?, ?, ?)";
    EXECUTE statement USING @project_name, @version_id;
    DEALLOCATE PREPARE statement;
END|