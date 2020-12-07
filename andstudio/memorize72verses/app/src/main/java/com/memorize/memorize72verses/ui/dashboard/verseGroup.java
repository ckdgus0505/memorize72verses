package com.memorize.memorize72verses.ui.dashboard;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class verseGroup {
    public String strCategory;
    public String strCategoryTitle;
    public ArrayList<String> arrVerseTitle;
    public ArrayList<String> arrVerseAddress;
    public ArrayList<String> arrVerseContent;

    verseGroup(String cat, String cat_name, String[] verse_title, String[] verse_address, String[] verse_content){
        strCategory = cat;
        strCategoryTitle = cat_name;

        List<String> t = Arrays.<String>asList(verse_title);
        List<String> a = Arrays.<String>asList(verse_address);
        List<String> c = Arrays.<String>asList(verse_content);
        arrVerseTitle = new ArrayList<String>(t);
        arrVerseAddress = new ArrayList<String>(a);
        arrVerseContent = new ArrayList<String>(c);
    }

}
