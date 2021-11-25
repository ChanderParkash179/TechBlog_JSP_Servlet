
package com.tech.blog.entities;

public class Category {

    private int cid; 
    private String cname;
    private String cdescription;

    public Category(int cid, String cname, String cdescription) {
        this.cid = cid;
        this.cname = cname;
        this.cdescription = cdescription;
    }

    public Category() {
    }

    public Category(String cname, String cdescription) {
        this.cname = cname;
        this.cdescription = cdescription;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCdescription() {
        return cdescription;
    }

    public void setCdescription(String cdescription) {
        this.cdescription = cdescription;
    }
    
    
}
