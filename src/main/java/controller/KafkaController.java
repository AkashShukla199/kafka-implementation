package controller;

import org.springframework.web.bind.annotation.*;
import service.KafkaProducerService;

@RestController
@RequestMapping("/kafka")
public class KafkaController {
    private final KafkaProducerService producerService;

    public KafkaController(KafkaProducerService producerService) {
        this.producerService = producerService;
    }

    @PostMapping("/send")
    public String sendMessage(@RequestParam String message) {
        producerService.sendMessage("test-topic", message);
        return "Message sent successfully!";
    }
}
