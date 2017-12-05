package com.fuzhu.entity;

public class Category {
    private Long id;

    private String description;

    private Long firstLevelId;

    private String name;

    private Long secondLevelId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Long getFirstLevelId() {
        return firstLevelId;
    }

    public void setFirstLevelId(Long firstLevelId) {
        this.firstLevelId = firstLevelId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Long getSecondLevelId() {
        return secondLevelId;
    }

    public void setSecondLevelId(Long secondLevelId) {
        this.secondLevelId = secondLevelId;
    }
}