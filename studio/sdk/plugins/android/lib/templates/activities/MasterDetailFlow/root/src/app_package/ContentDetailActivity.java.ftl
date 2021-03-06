package ${packageName};

import android.content.Intent;
import android.os.Bundle;
<#if hasAppBar>
import ${getMaterialComponentName('android.support.design.widget.FloatingActionButton', useMaterial2)};
import ${getMaterialComponentName('android.support.design.widget.Snackbar', useMaterial2)};
import ${getMaterialComponentName('android.support.v7.widget.Toolbar', useAndroidX)};
import android.view.View;
</#if>
import ${superClassFqcn};
import ${actionBarClassFqcn};
<#if minApiLevel lt 16>
import ${getMaterialComponentName('android.support.v4.app.NavUtils', useAndroidX)};
</#if>
import android.view.MenuItem;
<#if applicationPackage??>
import ${applicationPackage}.R;
</#if>

/**
 * An activity representing a single ${objectKind} detail screen. This
 * activity is only used on narrow width devices. On tablet-size devices,
 * item details are presented side-by-side with a list of items
 * in a {@link ${CollectionName}Activity}.
 */
public class ${DetailName}Activity extends ${superClass} {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_${detail_name});
<#if hasAppBar>
        Toolbar toolbar = (Toolbar) findViewById(R.id.detail_toolbar);
        setSupportActionBar(toolbar);

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "Replace with your own detail action", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });
</#if>

        // Show the Up button in the action bar.
        ActionBar actionBar = getSupportActionBar();
        if (actionBar != null) {
            actionBar.setDisplayHomeAsUpEnabled(true);
        }

        // savedInstanceState is non-null when there is fragment state
        // saved from previous configurations of this activity
        // (e.g. when rotating the screen from portrait to landscape).
        // In this case, the fragment will automatically be re-added
        // to its container so we don't need to manually add it.
        // For more information, see the Fragments API guide at:
        //
        // http://developer.android.com/guide/components/fragments.html
        //
        if (savedInstanceState == null) {
            // Create the detail fragment and add it to the activity
            // using a fragment transaction.
            Bundle arguments = new Bundle();
            arguments.putString(${DetailName}Fragment.ARG_ITEM_ID,
                    getIntent().getStringExtra(${DetailName}Fragment.ARG_ITEM_ID));
            ${DetailName}Fragment fragment = new ${DetailName}Fragment();
            fragment.setArguments(arguments);
            get${Support}FragmentManager().beginTransaction()
                    .add(R.id.${detail_name}_container, fragment)
                    .commit();
        }
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();
        if (id == android.R.id.home) {
<#if minApiLevel lt 16>
            // This ID represents the Home or Up button. In the case of this
            // activity, the Up button is shown. Use NavUtils to allow users
            // to navigate up one level in the application structure. For
            // more details, see the Navigation pattern on Android Design:
            //
            // http://developer.android.com/design/patterns/navigation.html#up-vs-back
            //
            NavUtils.navigateUpTo(this, new Intent(this, ${CollectionName}Activity.class));
<#else>
            // This ID represents the Home or Up button. In the case of this
            // activity, the Up button is shown. For
            // more details, see the Navigation pattern on Android Design:
            //
            // http://developer.android.com/design/patterns/navigation.html#up-vs-back
            //
            navigateUpTo(new Intent(this, ${CollectionName}Activity.class));
</#if>
            return true;
        }
        return super.onOptionsItemSelected(item);
    }
}
