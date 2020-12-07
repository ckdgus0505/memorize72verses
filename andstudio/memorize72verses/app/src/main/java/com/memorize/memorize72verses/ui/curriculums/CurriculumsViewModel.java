package com.memorize.memorize72verses.ui.curriculums;

import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

public class CurriculumsViewModel extends ViewModel {

    private MutableLiveData<String> mText;

    public CurriculumsViewModel() {
        mText = new MutableLiveData<>();
        mText.setValue("This is notifications fragment");
    }

    public LiveData<String> getText() {
        return mText;
    }
}