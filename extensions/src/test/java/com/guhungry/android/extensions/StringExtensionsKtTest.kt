package com.guhungry.android.extensions

import android.text.Html
import android.text.Spanned
import androidx.core.text.HtmlCompat
import org.hamcrest.CoreMatchers.*
import org.hamcrest.MatcherAssert.assertThat
import org.spekframework.spek2.Spek
import org.spekframework.spek2.style.specification.describe

object StringExtensionsKtTest : Spek({
    describe("toHtml()") {
        it("should not error") {
            "<i>Italic</i>".toHtml()
        }
    }

    describe("toHtml(options)") {
        it("should not error") {
            "<i>Italic</i>".toHtml(HtmlCompat.FROM_HTML_MODE_COMPACT)
        }
    }
})