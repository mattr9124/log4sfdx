public interface LogWriter {
    /**
     * This should write the actual log message. Implementers can decide
     * where the log should be written to. It can be System.debug(...),
     * or can be a platform event, or write a line to the database
     * asynchronously.
     *
     * @param loggingLevel Log level
     * @param message Message to log
     */
    void writeLog(LoggingLevel loggingLevel, String message);
}