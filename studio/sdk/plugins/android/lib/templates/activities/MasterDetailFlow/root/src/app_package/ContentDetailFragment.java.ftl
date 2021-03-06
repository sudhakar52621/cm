package ${packageName};

<#if hasAppBar>
import android.app.Activity;
import ${getMaterialComponentName('android.support.design.widget.CollapsingToolbarLayout', useMaterial2)};
</#if>
import android.os.Bundle;
<#if useAndroidX>
import ${getMaterialComponentName('android.support.v4.app.Fragment', useAndroidX)};
<#else>
import android.<#if appCompat>support.v4.</#if>app.Fragment;
</#if>
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
<#if applicationPackage??>
import ${applicationPackage}.R;
</#if>
import ${packageName}.dummy.DummyContent;

/**
 * A fragment representing a single ${objectKind} detail screen.
 * This fragment is either contained in a {@link ${CollectionName}Activity}
 * in two-pane mode (on tablets) or a {@link ${DetailName}Activity}
 * on handsets.
 */
public class ${DetailName}Fragment extends Fragment {
    /**
     * The fragment argument representing the item ID that this fragment
     * represents.
     */
    public static final String ARG_ITEM_ID = "item_id";

    /**
     * The dummy content this fragment is presenting.
     */
    private DummyContent.DummyItem mItem;

    /**
     * Mandatory empty constructor for the fragment manager to instantiate the
     * fragment (e.g. upon screen orientation changes).
     */
    public ${DetailName}Fragment() {
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        if (getArguments().containsKey(ARG_ITEM_ID)) {
            // Load the dummy content specified by the fragment
            // arguments. In a real-world scenario, use a Loader
            // to load content from a content provider.
            mItem = DummyContent.ITEM_MAP.get(getArguments().getString(ARG_ITEM_ID));
<#if hasAppBar>

            Activity activity = this.getActivity();
            CollapsingToolbarLayout appBarLayout = (CollapsingToolbarLayout) activity.findViewById(R.id.toolbar_layout);
            if (appBarLayout != null) {
                appBarLayout.setTitle(mItem.content);
            }
</#if>
        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
            Bundle savedInstanceState) {
        View rootView = inflater.inflate(R.layout.${detail_name}, container, false);

        // Show the dummy content as text in a TextView.
        if (mItem != null) {
            ((TextView) rootView.findViewById(R.id.${detail_name})).setText(mItem.details);
        }

        return rootView;
    }
}
