package com.guhungry.android.extensions

import androidx.core.text.HtmlCompat

@JvmOverloads
fun String.toHtml(flags: Int = HtmlCompat.FROM_HTML_MODE_LEGACY) = HtmlCompat.fromHtml(this, flags)