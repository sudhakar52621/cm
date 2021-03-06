<?xml version="1.0" encoding="utf-8"?>

<${getMaterialComponentName('android.support.wearable.view.BoxInsetLayout', useAndroidX)}
    xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:background="@color/dark_grey"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context="${packageName}.${activityClass}"
    tools:deviceIds="wear"
    android:padding="@dimen/box_inset_layout_padding">

    <FrameLayout
        android:layout_width="match_parent"
        android:layout_height="match_parent"
        android:padding="@dimen/inner_frame_layout_padding"
        app:layout_box="all">

        <TextView
            android:id="@+id/text"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="@string/hello_world" />

    </FrameLayout>
</${getMaterialComponentName('android.support.wearable.view.BoxInsetLayout', useAndroidX)}>
