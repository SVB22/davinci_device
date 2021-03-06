/*
 * Copyright (C) 2018 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.lineageos.settings.display;

import android.os.Bundle;
import android.view.MenuItem;

import androidx.preference.Preference;
import androidx.preference.Preference.OnPreferenceChangeListener;
import androidx.preference.PreferenceFragment;
import androidx.preference.SwitchPreference;
import org.lineageos.settings.utils.FileUtils;
import org.lineageos.settings.R;

public class DcDimmingSettingsFragment extends PreferenceFragment implements
        OnPreferenceChangeListener {

    private static final String DC_DIMMING_ENABLE_KEY = "dc_dimming_enable";
    private SwitchPreference mDcDimmingPreference;
    private static final String FILE_EA = "/sys/devices/platform/soc/soc:qcom,dsi-display/msm_fb_ea_enable";

     @Override
     public void onCreatePreferences(Bundle savedInstanceState, String rootKey) {
         addPreferencesFromResource(R.xml.dcdimming_settings);
         getActivity().getActionBar().setDisplayHomeAsUpEnabled(true);
         mDcDimmingPreference = (SwitchPreference) findPreference(DC_DIMMING_ENABLE_KEY);
         if (!isSupported()) {
             mDcDimmingPreference.setEnabled(false);
             return;
         }
         mDcDimmingPreference.setEnabled(true);
         mDcDimmingPreference.setOnPreferenceChangeListener(this);
     }

     public static boolean isSupported() {
         return FileUtils.fileExists(FILE_EA);
     }

     @Override
     public boolean onPreferenceChange(Preference preference, Object newValue) {
         if (DC_DIMMING_ENABLE_KEY.equals(preference.getKey())) {
             enableDcDimming();
         }
         return true;
     }

     @Override
     public boolean onOptionsItemSelected(MenuItem item) {
         if (item.getItemId() == android.R.id.home) {
             getActivity().onBackPressed();
             return true;
         }
         return false;
     }

     public void enableDcDimming() {
         if (!isSupported()) {
             return;
         }
         if (mDcDimmingPreference.isChecked()) FileUtils.writeLine(FILE_EA, "0");
         else FileUtils.writeLine(FILE_EA, "1");
     }
 }
