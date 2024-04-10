; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124520 () Bool)

(assert start!124520)

(declare-fun b!1440911 () Bool)

(declare-fun res!973344 () Bool)

(declare-fun e!812328 () Bool)

(assert (=> b!1440911 (=> (not res!973344) (not e!812328))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97968 0))(
  ( (array!97969 (arr!47272 (Array (_ BitVec 32) (_ BitVec 64))) (size!47822 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97968)

(declare-datatypes ((SeekEntryResult!11524 0))(
  ( (MissingZero!11524 (index!48488 (_ BitVec 32))) (Found!11524 (index!48489 (_ BitVec 32))) (Intermediate!11524 (undefined!12336 Bool) (index!48490 (_ BitVec 32)) (x!130205 (_ BitVec 32))) (Undefined!11524) (MissingVacant!11524 (index!48491 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97968 (_ BitVec 32)) SeekEntryResult!11524)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440911 (= res!973344 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47272 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47272 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97969 (store (arr!47272 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47822 a!2862)) mask!2687) (Intermediate!11524 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1440912 () Bool)

(declare-fun res!973339 () Bool)

(declare-fun e!812330 () Bool)

(assert (=> b!1440912 (=> (not res!973339) (not e!812330))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97968 (_ BitVec 32)) Bool)

(assert (=> b!1440912 (= res!973339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440913 () Bool)

(declare-fun res!973341 () Bool)

(assert (=> b!1440913 (=> (not res!973341) (not e!812328))))

(declare-fun lt!633039 () SeekEntryResult!11524)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1440913 (= res!973341 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47272 a!2862) j!93) a!2862 mask!2687) lt!633039))))

(declare-fun b!1440914 () Bool)

(declare-fun res!973342 () Bool)

(assert (=> b!1440914 (=> (not res!973342) (not e!812330))))

(declare-datatypes ((List!33773 0))(
  ( (Nil!33770) (Cons!33769 (h!35119 (_ BitVec 64)) (t!48467 List!33773)) )
))
(declare-fun arrayNoDuplicates!0 (array!97968 (_ BitVec 32) List!33773) Bool)

(assert (=> b!1440914 (= res!973342 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33770))))

(declare-fun b!1440915 () Bool)

(declare-fun res!973340 () Bool)

(assert (=> b!1440915 (=> (not res!973340) (not e!812328))))

(assert (=> b!1440915 (= res!973340 (and (bvsgt x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1440916 () Bool)

(declare-fun res!973343 () Bool)

(assert (=> b!1440916 (=> (not res!973343) (not e!812330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440916 (= res!973343 (validKeyInArray!0 (select (arr!47272 a!2862) j!93)))))

(declare-fun b!1440917 () Bool)

(assert (=> b!1440917 (= e!812328 (not (validKeyInArray!0 (select (store (arr!47272 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))))

(declare-fun b!1440918 () Bool)

(assert (=> b!1440918 (= e!812330 e!812328)))

(declare-fun res!973348 () Bool)

(assert (=> b!1440918 (=> (not res!973348) (not e!812328))))

(assert (=> b!1440918 (= res!973348 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47272 a!2862) j!93) mask!2687) (select (arr!47272 a!2862) j!93) a!2862 mask!2687) lt!633039))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440918 (= lt!633039 (Intermediate!11524 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!973345 () Bool)

(assert (=> start!124520 (=> (not res!973345) (not e!812330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124520 (= res!973345 (validMask!0 mask!2687))))

(assert (=> start!124520 e!812330))

(assert (=> start!124520 true))

(declare-fun array_inv!36300 (array!97968) Bool)

(assert (=> start!124520 (array_inv!36300 a!2862)))

(declare-fun b!1440919 () Bool)

(declare-fun res!973338 () Bool)

(assert (=> b!1440919 (=> (not res!973338) (not e!812330))))

(assert (=> b!1440919 (= res!973338 (validKeyInArray!0 (select (arr!47272 a!2862) i!1006)))))

(declare-fun b!1440920 () Bool)

(declare-fun res!973346 () Bool)

(assert (=> b!1440920 (=> (not res!973346) (not e!812330))))

(assert (=> b!1440920 (= res!973346 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47822 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47822 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47822 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47272 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440921 () Bool)

(declare-fun res!973347 () Bool)

(assert (=> b!1440921 (=> (not res!973347) (not e!812330))))

(assert (=> b!1440921 (= res!973347 (and (= (size!47822 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47822 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47822 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124520 res!973345) b!1440921))

(assert (= (and b!1440921 res!973347) b!1440919))

(assert (= (and b!1440919 res!973338) b!1440916))

(assert (= (and b!1440916 res!973343) b!1440912))

(assert (= (and b!1440912 res!973339) b!1440914))

(assert (= (and b!1440914 res!973342) b!1440920))

(assert (= (and b!1440920 res!973346) b!1440918))

(assert (= (and b!1440918 res!973348) b!1440913))

(assert (= (and b!1440913 res!973341) b!1440911))

(assert (= (and b!1440911 res!973344) b!1440915))

(assert (= (and b!1440915 res!973340) b!1440917))

(declare-fun m!1330149 () Bool)

(assert (=> b!1440916 m!1330149))

(assert (=> b!1440916 m!1330149))

(declare-fun m!1330151 () Bool)

(assert (=> b!1440916 m!1330151))

(declare-fun m!1330153 () Bool)

(assert (=> b!1440917 m!1330153))

(declare-fun m!1330155 () Bool)

(assert (=> b!1440917 m!1330155))

(assert (=> b!1440917 m!1330155))

(declare-fun m!1330157 () Bool)

(assert (=> b!1440917 m!1330157))

(assert (=> b!1440918 m!1330149))

(assert (=> b!1440918 m!1330149))

(declare-fun m!1330159 () Bool)

(assert (=> b!1440918 m!1330159))

(assert (=> b!1440918 m!1330159))

(assert (=> b!1440918 m!1330149))

(declare-fun m!1330161 () Bool)

(assert (=> b!1440918 m!1330161))

(assert (=> b!1440911 m!1330153))

(assert (=> b!1440911 m!1330155))

(assert (=> b!1440911 m!1330155))

(declare-fun m!1330163 () Bool)

(assert (=> b!1440911 m!1330163))

(assert (=> b!1440911 m!1330163))

(assert (=> b!1440911 m!1330155))

(declare-fun m!1330165 () Bool)

(assert (=> b!1440911 m!1330165))

(declare-fun m!1330167 () Bool)

(assert (=> b!1440912 m!1330167))

(declare-fun m!1330169 () Bool)

(assert (=> b!1440914 m!1330169))

(declare-fun m!1330171 () Bool)

(assert (=> b!1440919 m!1330171))

(assert (=> b!1440919 m!1330171))

(declare-fun m!1330173 () Bool)

(assert (=> b!1440919 m!1330173))

(declare-fun m!1330175 () Bool)

(assert (=> start!124520 m!1330175))

(declare-fun m!1330177 () Bool)

(assert (=> start!124520 m!1330177))

(assert (=> b!1440920 m!1330153))

(declare-fun m!1330179 () Bool)

(assert (=> b!1440920 m!1330179))

(assert (=> b!1440913 m!1330149))

(assert (=> b!1440913 m!1330149))

(declare-fun m!1330181 () Bool)

(assert (=> b!1440913 m!1330181))

(push 1)

(assert (not b!1440918))

(assert (not b!1440913))

(assert (not b!1440917))

(assert (not b!1440916))

(assert (not start!124520))

(assert (not b!1440914))

(assert (not b!1440919))

(assert (not b!1440911))

