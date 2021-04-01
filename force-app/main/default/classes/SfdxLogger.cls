public with sharing class SfdxLogger {
    // in some future version this should be configurable
    private static LogWriter logWriter = new SystemDebugLogWriter();

    public static void debug(String message) {
        doLog(message, null, null, LoggingLevel.DEBUG);
    }

    public static void debug(String message, Object arg1) {
        doLog(message, new List<Object>{arg1}, null, LoggingLevel.DEBUG);
    }

    public static void debug(String message, Object arg1, Object arg2) {
        doLog(message, new List<Object>{arg1, arg2}, null, LoggingLevel.DEBUG);
    }

    public static void debug(String message, Exception e) {
        doLog(message, null, e, LoggingLevel.DEBUG);
    }

    public static void debug(String message, Object arg1, Exception e) {
        doLog(message, new List<Object>{arg1}, e, LoggingLevel.DEBUG);
    }

    public static void debug(String message, Object arg1, Object arg2, Exception e) {
        doLog(message, new List<Object>{arg1, arg2}, e, LoggingLevel.DEBUG);
    }

    public static void debug(String message, List<Object> arguments, Exception e
    ) {
        doLog(message, arguments, e, LoggingLevel.DEBUG);
    }

    public static void info(String message) {
        doLog(message, null, null, LoggingLevel.INFO);
    }

    public static void info(String message, Object arg1) {
        doLog(message, new List<Object>{arg1}, null, LoggingLevel.INFO);
    }

    public static void info(String message, Exception e) {
        doLog(message, null, e, LoggingLevel.INFO);
    }

    public static void info(String message, Object arg1, Exception e) {
        doLog(message, new List<Object>{arg1}, e, LoggingLevel.INFO);
    }

    public static void info(String message, Object arg1, Object arg2, Exception e) {
        doLog(message, new List<Object>{arg1, arg2}, e, LoggingLevel.INFO);
    }

    public static void info(String message, List<Object> arguments, Exception e) {
        doLog(message, arguments, e, LoggingLevel.INFO);
    }

    public static void warn(String message) {
        doLog(message, null, null, LoggingLevel.WARN);
    }

    public static void warn(String message, Object arg1) {
        doLog(message, new List<Object>{arg1}, null, LoggingLevel.WARN);
    }

    public static void warn(String message, Exception e) {
        doLog(message, null, e, LoggingLevel.WARN);
    }

    public static void warn(String message, Object arg1, Exception e) {
        doLog(message, new List<Object>{arg1}, e, LoggingLevel.WARN);
    }

    public static void warn(String message, Object arg1, Object arg2, Exception e) {
        doLog(message, new List<Object>{arg1, arg2}, e, LoggingLevel.WARN);
    }

    public static void warn(String message, List<Object> arguments, Exception e) {
        doLog(message, arguments, e, LoggingLevel.WARN);
    }

    public static void error(String message) {
        doLog(message, null, null, LoggingLevel.ERROR);
    }

    public static void error(String message, Object arg1) {
        doLog(message, new List<Object>{arg1}, null, LoggingLevel.ERROR);
    }

    public static void error(String message, Exception e) {
        doLog(message, null, e, LoggingLevel.ERROR);
    }

    public static void error(String message, Object arg1, Exception e) {
        doLog(message, new List<Object>{arg1}, e, LoggingLevel.ERROR);
    }

    public static void error(String message, Object arg1, Object arg2, Exception e) {
        doLog(message, new List<Object>{arg1, arg2}, e, LoggingLevel.ERROR);
    }

    public static void error(String message, List<Object> arguments, Exception e) {
        doLog(message, arguments, e, LoggingLevel.ERROR);
    }

    public static Timer logEntryWithTimer(String tag) {
        return logEntryWithTimer(LoggingLevel.DEBUG, tag);
    }

    public static void logExit(String tag, Timer timer) {
        logExit(LoggingLevel.DEBUG, tag, timer);
    }

    public static Timer logEntryWithTimer(LoggingLevel loggingLevel, String tag) {
        String message = 'E: {0}';
        doLog(message, new Object[] {tag}, null, loggingLevel);
        return Timer.startTimer();
    }

    public static void logExit(LoggingLevel loggingLevel, String tag, Timer timer) {
        String message = 'X: {0} - took {1}ms';
        doLog(message, new Object[] {tag, timer.getElapsedTime()}, null, loggingLevel);
    }

    public static Boolean isDebugEnabled() {
        return isEnabledForLevel(LoggingLevel.DEBUG);
    }

    public static Boolean isInfoEnabled() {
        return isEnabledForLevel(LoggingLevel.INFO);
    }

    public static Boolean isWarnEnabled() {
        return isEnabledForLevel(LoggingLevel.WARN);
    }

    public static Boolean isErrorEnabled() {
        return isEnabledForLevel(LoggingLevel.ERROR);
    }

    private static void doLog(String message, List<Object> arguments, Exception e, System.LoggingLevel loggingLevel) {
        String formattedMessage;

        if (!(arguments == null || arguments.isEmpty())) {
            formattedMessage = String.format(message, arguments);
        } else {
            formattedMessage = message;
        }

        logWriter.writeLog(loggingLevel, formattedMessage);
        if (e != null) {
            logWriter.writeLog(loggingLevel, e.getMessage());
            logWriter.writeLog(loggingLevel, e.getStackTraceString());
        }
    }

    private static Boolean isEnabledForLevel(LoggingLevel loggingLevel) {
        // TODO implement this for real!
        return true;
    }
}