package com.memorize.memorize72verses.ui.home;

import android.content.SharedPreferences;
import android.graphics.Color;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.Observer;
import androidx.lifecycle.ViewModelProviders;

import com.memorize.memorize72verses.R;
import com.prolificinteractive.materialcalendarview.CalendarDay;
import com.prolificinteractive.materialcalendarview.MaterialCalendarView;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.GregorianCalendar;
import java.util.List;

import static android.content.Context.MODE_PRIVATE;

public class HomeFragment extends Fragment {

    private HomeViewModel homeViewModel;
    MaterialCalendarView materialCalendarView;
    SharedPreferences pref_days;
    SharedPreferences pref_check;

    public View onCreateView(@NonNull LayoutInflater inflater,
                             ViewGroup container, Bundle savedInstanceState) {

        final ArrayList <Calendar> calendars = new ArrayList<Calendar>(); // shared preferences로 날짜 저장하는 list
        final ArrayList <CalendarDay> days = new ArrayList<CalendarDay>(); // calendars로 calendarday로 변환하여 달력에 달 list
        pref_days = getActivity().getSharedPreferences("pref_days", 0);
        pref_check = getActivity().getSharedPreferences("pref_check", 0);


        homeViewModel =
                ViewModelProviders.of(this).get(HomeViewModel.class);
        View root = inflater.inflate(R.layout.fragment_home, container, false);
        materialCalendarView = (MaterialCalendarView) root.findViewById(R.id.calendarView);

//        SharedPreferences.Editor prefEditor = pref_days.edit();
//        for(int i = 0; i<calendars.size();i++){
//            long millis = calendars.get(i).getTimeInMillis();
//            prefEditor.putLong("calendar"+i,millis);
//            prefEditor.commit();
//        }

        int i =0;
        while(pref_days.getLong("calendar"+i,0)!=0){
            Calendar cal = new GregorianCalendar();
            cal.setTimeInMillis(pref_days.getLong("calendar"+i,0));
            calendars.add(cal);
            i++;
        }

        for(int l = 0; l < calendars.size(); l++) {
            days.add(CalendarDay.from(calendars.get(l).getTime()));
        }
        materialCalendarView.addDecorator(new EventDecorator(days, getActivity() ));

        final CheckBox cb1 = (CheckBox)root.findViewById(R.id.checkBox1);
        final CheckBox cb2 = (CheckBox)root.findViewById(R.id.checkBox2);
        final CheckBox cb3 = (CheckBox)root.findViewById(R.id.checkBox3);

        if (pref_check.getInt("lastyear", 9999) == Calendar.getInstance().get(Calendar.YEAR) &&
                pref_check.getInt("lastmonth", 9999) == Calendar.getInstance().get(Calendar.MONDAY) &&
                pref_check.getInt("lastday", 9999) == Calendar.getInstance().get(Calendar.DATE) ) {

            if (pref_check.getInt("cb1",0) == 1) {cb1.setChecked(true);}
            if (pref_check.getInt("cb2",0) == 1) {cb2.setChecked(true);}
            if (pref_check.getInt("cb3",0) == 1) {cb3.setChecked(true);}
        }
        else {
            SharedPreferences.Editor check_editor = pref_check.edit();
            check_editor.putInt("cb1",0);
            check_editor.putInt("cb2",0);
            check_editor.putInt("cb3",0);
            check_editor.apply();
        }

        cb1.setOnClickListener(new CheckBox.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (((CheckBox)v).isChecked()) {
                    SharedPreferences.Editor check_editor = pref_check.edit();
                    check_editor.putInt("cb1",1);
                    check_editor.putInt("lastyear",Calendar.getInstance().get(Calendar.YEAR));
                    check_editor.putInt("lastmonth",Calendar.getInstance().get(Calendar.MONTH));
                    check_editor.putInt("lastday",Calendar.getInstance().get(Calendar.DATE));
                    check_editor.apply();

                    if (cb2.isChecked() && cb3.isChecked()) {
                        Calendar today  = Calendar.getInstance();
                        calendars.add(today);

                        SharedPreferences.Editor prefEditor = pref_days.edit();
                        for(int i = 0; i<calendars.size();i++){
                            long millis = calendars.get(i).getTimeInMillis();
                            prefEditor.putLong("calendar"+i,millis);
                            prefEditor.commit();
                        }

                        for (int i = 0; i < calendars.size(); i++) {
                            days.add(CalendarDay.from(calendars.get(i).getTime()));
                        }

                        materialCalendarView.addDecorator(new EventDecorator(days, getActivity() ));
                    }
                } else {
                    SharedPreferences.Editor check_editor = pref_check.edit();
                    check_editor.putInt("cb1",0);
                    check_editor.putInt("lastyear",Calendar.getInstance().get(Calendar.YEAR));
                    check_editor.putInt("lastmonth",Calendar.getInstance().get(Calendar.MONTH));
                    check_editor.putInt("lastday",Calendar.getInstance().get(Calendar.DATE));
                    check_editor.apply();
                }
            }
        }) ;

        cb2.setOnClickListener(new CheckBox.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (((CheckBox)v).isChecked()) {
                    SharedPreferences.Editor check_editor = pref_check.edit();
                    check_editor.putInt("cb2",1);
                    check_editor.putInt("lastyear",Calendar.getInstance().get(Calendar.YEAR));
                    check_editor.putInt("lastmonth",Calendar.getInstance().get(Calendar.MONTH));
                    check_editor.putInt("lastday",Calendar.getInstance().get(Calendar.DATE));
                    check_editor.apply();

                    if (cb1.isChecked() && cb3.isChecked()) {
                        Calendar today  = Calendar.getInstance();
                        calendars.add(today);

                        SharedPreferences.Editor prefEditor = pref_days.edit();
                        for(int i = 0; i<calendars.size();i++){
                            long millis = calendars.get(i).getTimeInMillis();
                            prefEditor.putLong("calendar"+i,millis);
                            prefEditor.commit();
                        }

                        for (int i = 0; i < calendars.size(); i++) {
                            days.add(CalendarDay.from(calendars.get(i).getTime()));
                        }
                        materialCalendarView.addDecorator(new EventDecorator(days, getActivity() ));
                    }
                } else {
                    SharedPreferences.Editor check_editor = pref_check.edit();
                    check_editor.putInt("cb2",0);
                    check_editor.putInt("lastyear",Calendar.getInstance().get(Calendar.YEAR));
                    check_editor.putInt("lastmonth",Calendar.getInstance().get(Calendar.MONTH));
                    check_editor.putInt("lastday",Calendar.getInstance().get(Calendar.DATE));
                    check_editor.apply();
                }
            }
        }) ;

        cb3.setOnClickListener(new CheckBox.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (((CheckBox)v).isChecked()) {
                    SharedPreferences.Editor check_editor = pref_check.edit();
                    check_editor.putInt("cb3",1);
                    check_editor.putInt("lastyear",Calendar.getInstance().get(Calendar.YEAR));
                    check_editor.putInt("lastmonth",Calendar.getInstance().get(Calendar.MONTH));
                    check_editor.putInt("lastday",Calendar.getInstance().get(Calendar.DATE));
                    check_editor.apply();

                    if (cb1.isChecked() && cb2.isChecked()) {
                        Calendar today  = Calendar.getInstance();
                        calendars.add(today);

                        SharedPreferences.Editor prefEditor = pref_days.edit();
                        for(int i = 0; i<calendars.size();i++){
                            long millis = calendars.get(i).getTimeInMillis();
                            prefEditor.putLong("calendar"+i,millis);
                            prefEditor.commit();
                        }

                        for (int i = 0; i < calendars.size(); i++) {
                            days.add(CalendarDay.from(calendars.get(i).getTime()));
                        }
                        materialCalendarView.addDecorator(new EventDecorator(days, getActivity() ));
                    }
                } else {
                    SharedPreferences.Editor check_editor = pref_check.edit();
                    check_editor.putInt("cb3",0);
                    check_editor.putInt("lastyear",Calendar.getInstance().get(Calendar.YEAR));
                    check_editor.putInt("lastmonth",Calendar.getInstance().get(Calendar.MONTH));
                    check_editor.putInt("lastday",Calendar.getInstance().get(Calendar.DATE));
                    check_editor.apply();
                }
            }
        }) ;


        return root;
    }
}
