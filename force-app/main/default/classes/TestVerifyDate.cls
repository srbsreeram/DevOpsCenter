@isTest
private class TestVerifyDate {
    // Test method to verify the dates when they are within 30 days of each other
    @isTest static void testCheckDatesWithin30Days() {
        // Arrange: set up test data
        Date date1 = Date.today();
        Date date2 = date1.addDays(15);

        // Act: call method under test
        Date result = VerifyDate.CheckDates(date1, date2);

        // Assert: verify expected result
        System.assertEquals(date2, result, 'When dates are within 30 days, date2 should be returned');
    }

    // Test method to verify the dates when they are not within 30 days of each other
    @isTest static void testCheckDatesExceed30Days() {
        // Arrange: set up test data
        Date date1 = Date.today();
        Date date2 = date1.addDays(31);
        Integer totalDays = Date.daysInMonth(date1.year(), date1.month());
        Date expected = Date.newInstance(date1.year(), date1.month(), totalDays);

        // Act: call method under test
        Date result = VerifyDate.CheckDates(date1, date2);

        // Assert: verify expected result
        System.assertEquals(expected, result, 'When dates exceed 30 days, the last day of month 1 should be returned');
    }
}
