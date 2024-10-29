package org.example.comp367;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class WelcomeController {
    @GetMapping("/welcome")
    public String welcome(@RequestParam(name = "name", defaultValue = "User") String name) {
        return "Welcome to COMP367, " + name + "!";
    }
}




