// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.leiv.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.leiv.domain.Project;
import org.leiv.domain.Work;
import org.leiv.web.WorkController;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect WorkController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String WorkController.create(@Valid Work work, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, work);
            return "works/create";
        }
        uiModel.asMap().clear();
        work.persist();
        return "redirect:/works/" + encodeUrlPathSegment(work.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String WorkController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Work());
        return "works/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String WorkController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("work", Work.findWork(id));
        uiModel.addAttribute("itemId", id);
        return "works/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String WorkController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("works", Work.findWorkEntries(firstResult, sizeNo));
            float nrOfPages = (float) Work.countWorks() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("works", Work.findAllWorks());
        }
        return "works/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String WorkController.update(@Valid Work work, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, work);
            return "works/update";
        }
        uiModel.asMap().clear();
        work.merge();
        return "redirect:/works/" + encodeUrlPathSegment(work.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String WorkController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, Work.findWork(id));
        return "works/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String WorkController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Work work = Work.findWork(id);
        work.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/works";
    }
    
    void WorkController.populateEditForm(Model uiModel, Work work) {
        uiModel.addAttribute("work", work);
        uiModel.addAttribute("projects", Project.findAllProjects());
    }
    
    String WorkController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
