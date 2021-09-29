package com.metro.model.service.logger;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.kafka.KafkaProperties;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

@Service
public class TransactionLogProducer {

    private static final Logger logger = LoggerFactory.getLogger(KafkaProperties.Producer.class);
    private static final String TOPIC = "transaction-log";
    private KafkaTemplate<String, String> kafkaTemplate;

    @Autowired
    public void setKafkaTemplate(KafkaTemplate<String, String> kafkaTemplate) {
        this.kafkaTemplate = kafkaTemplate;
    }

    public void sendMessage(String message) {
        logger.info(String.format("Transaction Log -> %s", message));
        this.kafkaTemplate.send(TOPIC, "Transaction Log ->" +  message);
    }
}
