package com.guhungry.android.extensions

import android.view.View
import androidx.annotation.ColorRes
import androidx.annotation.StringRes
import androidx.core.content.ContextCompat

fun View.getString(@StringRes resId: Int) = resources.getString(resId)
fun View.getString(@StringRes resId: Int, vararg formatArgs: Any) = resources.getString(resId, formatArgs)
fun View.getColor(@ColorRes resId: Int) = ContextCompat.getColor(context, resId)