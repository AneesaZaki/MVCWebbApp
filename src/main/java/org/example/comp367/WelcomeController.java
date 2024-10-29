package org.example.comp367;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalTime;

@RestController
public class WelcomeController {
    @GetMapping("/welcome")
    public String welcome(@RequestParam(name = "name", defaultValue = "User") String name) {
        LocalTime currentTime = LocalTime.now();
        String greeting;

        // Determine the appropriate greeting based on the current hour
        if (currentTime.getHour() < 12) {
            greeting = "Good morning, " + name + ", Welcome to COMP367!";
        } else {
            greeting = "Good afternoon, " + name + ", Welcome to COMP367!";
        }

        return greeting;
    }
}



