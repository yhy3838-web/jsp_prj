package day0612;

import java.time.LocalDate;
import java.time.YearMonth;

public class CalendarMain {

    public static void main(String[] args) {

        CalendarDTO dto = new CalendarDTO();

        dto.setYear(2026);
        dto.setMonth(6);

        YearMonth ym = YearMonth.of(dto.getYear(), dto.getMonth());

        System.out.println(dto.getYear() + "년 " + dto.getMonth() + "월");
        System.out.println("일 월 화 수 목 금 토");

        LocalDate firstDay = ym.atDay(1);

        int startDay = firstDay.getDayOfWeek().getValue() % 7;
        int lastDay = ym.lengthOfMonth();

        for (int i = 0; i < startDay; i++) {
            System.out.print("   ");
        }

        for (int day = 1; day <= lastDay; day++) {

            System.out.printf("%2d ", day);

            if ((startDay + day) % 7 == 0) {
                System.out.println();
            }
        }
    }
}