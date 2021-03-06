// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.timedesk.web;

import java.io.UnsupportedEncodingException;
import java.lang.Long;
import java.lang.String;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.core.convert.support.GenericConversionService;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;
import org.timedesk.entity.Company;
import org.timedesk.entity.CompanySite;
import org.timedesk.entity.Employee;

privileged aspect CompanySiteController_Roo_Controller {
    
    @Autowired
    private GenericConversionService CompanySiteController.conversionService;
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String CompanySiteController.createForm(Model model) {
        model.addAttribute("companySite", new CompanySite());
        List dependencies = new ArrayList();
        if (Company.countCompanys() == 0) {
            dependencies.add(new String[]{"company", "companys"});
        }
        model.addAttribute("dependencies", dependencies);
        return "companysites/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String CompanySiteController.show(@PathVariable("id") Long id, Model model) {
        model.addAttribute("companysite", CompanySite.findCompanySite(id));
        model.addAttribute("itemId", id);
        return "companysites/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String CompanySiteController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            model.addAttribute("companysites", CompanySite.findCompanySiteEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) CompanySite.countCompanySites() / sizeNo;
            model.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            model.addAttribute("companysites", CompanySite.findAllCompanySites());
        }
        return "companysites/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String CompanySiteController.update(@Valid CompanySite companySite, BindingResult result, Model model, HttpServletRequest request) {
        if (result.hasErrors()) {
            model.addAttribute("companySite", companySite);
            return "companysites/update";
        }
        companySite.merge();
        return "redirect:/companysites/" + encodeUrlPathSegment(companySite.getId().toString(), request);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String CompanySiteController.updateForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("companySite", CompanySite.findCompanySite(id));
        return "companysites/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String CompanySiteController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model model) {
        CompanySite.findCompanySite(id).remove();
        model.addAttribute("page", (page == null) ? "1" : page.toString());
        model.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/companysites?page=" + ((page == null) ? "1" : page.toString()) + "&size=" + ((size == null) ? "10" : size.toString());
    }
    
    @ModelAttribute("companys")
    public Collection<Company> CompanySiteController.populateCompanys() {
        return Company.findAllCompanys();
    }
    
    @ModelAttribute("employees")
    public Collection<Employee> CompanySiteController.populateEmployees() {
        return Employee.findAllEmployees();
    }
    
    Converter<Company, String> CompanySiteController.getCompanyConverter() {
        return new Converter<Company, String>() {
            public String convert(Company company) {
                return new StringBuilder().append(company.getCompanyId()).append(" ").append(company.getName()).toString();
            }
        };
    }
    
    Converter<CompanySite, String> CompanySiteController.getCompanySiteConverter() {
        return new Converter<CompanySite, String>() {
            public String convert(CompanySite companySite) {
                return new StringBuilder().append(companySite.getSiteId()).append(" ").append(companySite.getLocation()).append(" ").append(companySite.getCity()).toString();
            }
        };
    }
    
    Converter<Employee, String> CompanySiteController.getEmployeeConverter() {
        return new Converter<Employee, String>() {
            public String convert(Employee employee) {
                return new StringBuilder().append(employee.getEmployeeId()).append(" ").append(employee.getFirstName()).append(" ").append(employee.getLastName()).toString();
            }
        };
    }
    
    @PostConstruct
    void CompanySiteController.registerConverters() {
        conversionService.addConverter(getCompanyConverter());
        conversionService.addConverter(getCompanySiteConverter());
        conversionService.addConverter(getEmployeeConverter());
    }
    
    private String CompanySiteController.encodeUrlPathSegment(String pathSegment, HttpServletRequest request) {
        String enc = request.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
