public with sharing class Timer {

    private final Long startTime;
    private Long endTime;
    private Boolean isRunning;

    public static Timer startTimer() {
        return new Timer();
    }

    private Timer() {
        this.startTime = System.currentTimeMillis();
        this.isRunning = true;
    }

    public Long stopTimer() {
        this.endTime = System.currentTimeMillis();
        this.isRunning = false;
        return getElapsedTime();
    }

    public Long getElapsedTime() {
        if (isRunning) {
            return System.currentTimeMillis() - this.startTime;
        }
        return endTime - startTime;
    }
}