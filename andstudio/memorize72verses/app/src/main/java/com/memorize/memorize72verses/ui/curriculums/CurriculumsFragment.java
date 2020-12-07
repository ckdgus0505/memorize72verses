package com.memorize.memorize72verses.ui.curriculums;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.lifecycle.Observer;
import androidx.lifecycle.ViewModelProviders;

import com.memorize.memorize72verses.R;

public class CurriculumsFragment extends Fragment {

    private CurriculumsViewModel curriculumsViewModel;

    public View onCreateView(@NonNull LayoutInflater inflater,
                             ViewGroup container, Bundle savedInstanceState) {
        curriculumsViewModel =
                ViewModelProviders.of(this).get(CurriculumsViewModel.class);
        View root = inflater.inflate(R.layout.fragment_curriculum, container, false);
        final ImageView imageView = root.findViewById(R.id.image_curriculum);
        curriculumsViewModel.getText().observe(getViewLifecycleOwner(), new Observer<String>() {
            @Override
            public void onChanged(@Nullable String s) {
                // imageView.setImageDrawable(@drawable);
            }
        });
        return root;
    }
}
