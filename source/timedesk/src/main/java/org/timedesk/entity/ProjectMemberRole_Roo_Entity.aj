// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.timedesk.entity;

import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;
import org.timedesk.entity.ProjectMemberRole;

privileged aspect ProjectMemberRole_Roo_Entity {
    
    declare @type: ProjectMemberRole: @Entity;
    
    @PersistenceContext
    transient EntityManager ProjectMemberRole.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long ProjectMemberRole.id;
    
    @Version
    @Column(name = "version")
    private Integer ProjectMemberRole.version;
    
    public Long ProjectMemberRole.getId() {
        return this.id;
    }
    
    public void ProjectMemberRole.setId(Long id) {
        this.id = id;
    }
    
    public Integer ProjectMemberRole.getVersion() {
        return this.version;
    }
    
    public void ProjectMemberRole.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void ProjectMemberRole.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ProjectMemberRole.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ProjectMemberRole attached = this.entityManager.find(this.getClass(), this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ProjectMemberRole.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public ProjectMemberRole ProjectMemberRole.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ProjectMemberRole merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager ProjectMemberRole.entityManager() {
        EntityManager em = new ProjectMemberRole().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ProjectMemberRole.countProjectMemberRoles() {
        return entityManager().createQuery("select count(o) from ProjectMemberRole o", Long.class).getSingleResult();
    }
    
    public static List<ProjectMemberRole> ProjectMemberRole.findAllProjectMemberRoles() {
        return entityManager().createQuery("select o from ProjectMemberRole o", ProjectMemberRole.class).getResultList();
    }
    
    public static List<ProjectMemberRole> ProjectMemberRole.findProjectMemberRoleEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("select o from ProjectMemberRole o", ProjectMemberRole.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}