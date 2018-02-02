package Com.configuration;

import Com.configuration.beans.WebMvcConfigurerImpl;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.data.web.config.EnableSpringDataWebSupport;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"Com.controllers", "Com.exceptions"}, basePackageClasses = WebMvcConfigurerImpl.class)
@EnableGlobalMethodSecurity(securedEnabled = true)
@EnableSpringDataWebSupport
@Import(RepositoriesInitializer.class)
public class MvcConfig implements WebMvcConfigurer {

    @Bean(name = "messageSource")
    public MessageSource reloadableResourceBundleMessageSource() {
        //Tworzenie, konfiguracja i zwracanie beana
        ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
        messageSource.setBasenames("classpath:errorsmessages");
        messageSource.setDefaultEncoding("UTF-8");
        return messageSource;
    }

//    @Bean(name = "viewResolver")
//    public ViewResolver internalResouViewResolver() {
//        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
//        viewResolver.setViewClass(JstlView.class);
//        viewResolver.setPrefix("/WEB-INF/Views/");
//        viewResolver.setSuffix(".jsp");
//
//        return viewResolver;
//    }

    @Bean
    public InternalResourceViewResolver getInternalResourceViewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/Views/");
        resolver.setSuffix(".jsp");
        return resolver;
    }


    @Bean(name = "simpleMappingExceptionResolver")
    public SimpleMappingExceptionResolver
    createSimpleMappingExceptionResolver() {
        SimpleMappingExceptionResolver r =
                new SimpleMappingExceptionResolver();

//        Properties mappings = new Properties();
//        mappings.setProperty(AccessDeniedException.class.getSimpleName(), "databaseError");
//        mappings.setProperty(Exception.class.getSimpleName(), "defaultErrorView");
//
//        r.setExceptionMappings(mappings);  // Domyślnie brak
        r.setDefaultErrorView("errors/defaultErrorView");    // Domyślnie brak
        r.setExceptionAttribute("exception");     // Domyślna nazwa to "exception"
        r.setWarnLogCategory("example.MvcLogger");     // Domyślnie brak
        return r;
    }

}
