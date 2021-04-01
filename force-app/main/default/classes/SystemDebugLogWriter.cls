public with sharing class SystemDebugLogWriter implements LogWriter {
    public void writeLog(LoggingLevel loggingLevel, String message) {
        System.debug(loggingLevel, message);
    }
}