package com.memorize.memorize72verses.ui.dashboard;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseExpandableListAdapter;
import android.widget.TextView;

import com.memorize.memorize72verses.R;

import java.util.ArrayList;

public class CategoryListAdapter extends BaseExpandableListAdapter {
    private Context context;
    private int groupLayout = 0;
    private int chlidLayout = 0;
    private ArrayList<verseGroup> DataList;
    private LayoutInflater inflater = null;

    public CategoryListAdapter(Context context,int groupLay,int chlidLay,ArrayList<verseGroup> DataList){
        this.DataList = DataList;
        this.groupLayout = groupLay;
        this.chlidLayout = chlidLay;
        this.context = context;
        this.inflater = (LayoutInflater)context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
    }

    @Override
    public int getGroupCount() {
        return DataList.size();
    }

    @Override
    public int getChildrenCount(int groupPosition) {
        return DataList.get(groupPosition).arrVerseTitle.size();
    }

    @Override
    public Object getGroup(int groupPosition) {
        return DataList.get(groupPosition);
    }

    @Override
    public Object getChild(int groupPosition, int childPosition) {
        return DataList.get(groupPosition).arrVerseTitle.get(childPosition);
    }

    @Override
    public long getGroupId(int groupPosition) {
        return groupPosition;
    }

    @Override
    public long getChildId(int groupPosition, int childPosition) {
        return childPosition;
    }

    @Override
    public boolean hasStableIds() {
        return true;
    }

    @Override
    public View getGroupView(int groupPosition, boolean isExpanded, View convertView, ViewGroup parent) {
        if (convertView == null) {
            convertView = inflater.inflate(this.groupLayout, parent, false);
        }
        TextView text_category = (TextView)convertView.findViewById(R.id.text_category);
        TextView text_category_title = (TextView)convertView.findViewById(R.id.text_category_title);

        text_category.setText(DataList.get(groupPosition).strCategory);
        text_category_title.setText(DataList.get(groupPosition).strCategoryTitle);
        return convertView;
    }

    @Override
    public View getChildView(int groupPosition, int childPosition, boolean isLastChild, View convertView, ViewGroup parent) {
        // TODO Auto-generated method stub
        if(convertView == null){
            convertView = inflater.inflate(this.chlidLayout, parent, false);
        }
        TextView verse_title = (TextView)convertView.findViewById(R.id.text_verse_title);
        TextView verse_address = (TextView)convertView.findViewById(R.id.text_verse_address);
        TextView verse_content = (TextView)convertView.findViewById(R.id.text_verse_content);

        verse_title.setText(DataList.get(groupPosition).arrVerseTitle.get(childPosition));
        verse_address.setText(DataList.get(groupPosition).arrVerseAddress.get(childPosition));
        verse_content.setText(DataList.get(groupPosition).arrVerseContent.get(childPosition));
        return convertView;
    }

    @Override
    public boolean isChildSelectable(int groupPosition, int childPosition) {
        return false;
    }
}
