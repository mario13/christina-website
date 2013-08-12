// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.leiv.domain;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import org.leiv.domain.Project;
import org.leiv.domain.Work;

privileged aspect Work_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "projectId", referencedColumnName = "id", nullable = false)
    private Project Work.projectId;
    
    @Column(name = "link", length = 100)
    @NotNull
    private String Work.link;
    
    @Column(name = "thumbnail", length = 100)
    private String Work.thumbnail;
    
    @Column(name = "description", length = 450)
    private String Work.description;
    
    @Column(name = "title", length = 100)
    private String Work.title;
    
    @Column(name = "type", length = 5)
    @NotNull
    private String Work.type;
    
    @Column(name = "highres", length = 100)
    private String Work.highres;
    
    @Column(name = "sort_order")
    @NotNull
    private Integer Work.sortOrder;
    
    public Project Work.getProjectId() {
        return projectId;
    }
    
    public void Work.setProjectId(Project projectId) {
        this.projectId = projectId;
    }
    
    public String Work.getLink() {
        return link;
    }
    
    public void Work.setLink(String link) {
        this.link = link;
    }
    
    public String Work.getThumbnail() {
        return thumbnail;
    }
    
    public void Work.setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }
    
    public String Work.getDescription() {
        return description;
    }
    
    public void Work.setDescription(String description) {
        this.description = description;
    }
    
    public String Work.getTitle() {
        return title;
    }
    
    public void Work.setTitle(String title) {
        this.title = title;
    }
    
    public String Work.getType() {
        return type;
    }
    
    public void Work.setType(String type) {
        this.type = type;
    }
    
    public String Work.getHighres() {
        return highres;
    }
    
    public void Work.setHighres(String highres) {
        this.highres = highres;
    }
    
    public Integer Work.getSortOrder() {
        return sortOrder;
    }
    
    public void Work.setSortOrder(Integer sortOrder) {
        this.sortOrder = sortOrder;
    }
    
}
