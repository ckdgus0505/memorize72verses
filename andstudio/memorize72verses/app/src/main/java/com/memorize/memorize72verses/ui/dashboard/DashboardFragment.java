package com.memorize.memorize72verses.ui.dashboard;

import android.content.res.Resources;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ExpandableListView;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.ViewModelProviders;

import com.memorize.memorize72verses.R;

import java.util.ArrayList;

public class DashboardFragment extends Fragment {

    private DashboardViewModel dashboardViewModel;
    private ExpandableListView listView = null;

    public View onCreateView(@NonNull LayoutInflater inflater,
                             ViewGroup container, Bundle savedInstanceState) {
        dashboardViewModel =
                ViewModelProviders.of(this).get(DashboardViewModel.class);
        View root = inflater.inflate(R.layout.fragment_dashboard, container, false);

        // 데이터 리스트 생성.
        Resources res = getResources();

        String[] cat = res.getStringArray(R.array.category);
        String[] cat_title = res.getStringArray(R.array.category_title);

        String[] A_title = res.getStringArray(R.array.A_title);
        String[] B_title = res.getStringArray(R.array.B_title);
        String[] C_title = res.getStringArray(R.array.C_title);
        String[] D_title = res.getStringArray(R.array.D_title);
        String[] E_title = res.getStringArray(R.array.E_title);
        String[] F_title = res.getStringArray(R.array.F_title);

        String[] A_address = res.getStringArray(R.array.A_address);
        String[] B_address = res.getStringArray(R.array.B_address);
        String[] C_address = res.getStringArray(R.array.C_address);
        String[] D_address = res.getStringArray(R.array.D_address);
        String[] E_address = res.getStringArray(R.array.E_address);
        String[] F_address = res.getStringArray(R.array.F_address);

        String[] A_content = res.getStringArray(R.array.A_content);
        String[] B_content = res.getStringArray(R.array.B_content);
        String[] C_content = res.getStringArray(R.array.C_content);
        String[] D_content = res.getStringArray(R.array.D_content);
        String[] E_content = res.getStringArray(R.array.E_content);
        String[] F_content = res.getStringArray(R.array.F_content);

        ArrayList<verseGroup> vData = new ArrayList<>();

        vData.add(new verseGroup(cat[0], cat_title[0], A_title, A_address, A_content));
        vData.add(new verseGroup(cat[1], cat_title[1], B_title, B_address, B_content));
        vData.add(new verseGroup(cat[2], cat_title[2], C_title, C_address, C_content));
        vData.add(new verseGroup(cat[3], cat_title[3], D_title, D_address, D_content));
        vData.add(new verseGroup(cat[4], cat_title[4], E_title, E_address, E_content));
        vData.add(new verseGroup(cat[5], cat_title[5], F_title, F_address, F_content));

        // ListView, Adapter 생성 및 연결
        DisplayMetrics metrics = getResources().getDisplayMetrics();
        int width = metrics.widthPixels;

        listView = (ExpandableListView) root.findViewById(R.id.AtoF);
        CategoryListAdapter adapter = new CategoryListAdapter(root.getContext(), R.layout.category_list_view, R.layout.verse_view, vData);
        listView.setIndicatorBounds(width-100, width);
        listView.setAdapter(adapter);

        return root;
    }
}
