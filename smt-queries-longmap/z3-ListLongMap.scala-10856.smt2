; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127116 () Bool)

(assert start!127116)

(declare-fun b!1494142 () Bool)

(declare-fun res!1016553 () Bool)

(declare-fun e!836941 () Bool)

(assert (=> b!1494142 (=> (not res!1016553) (not e!836941))))

(declare-datatypes ((array!99763 0))(
  ( (array!99764 (arr!48150 (Array (_ BitVec 32) (_ BitVec 64))) (size!48700 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99763)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99763 (_ BitVec 32)) Bool)

(assert (=> b!1494142 (= res!1016553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1494143 () Bool)

(declare-fun e!836939 () Bool)

(assert (=> b!1494143 (= e!836939 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!651262 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494143 (= lt!651262 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun e!836944 () Bool)

(declare-fun b!1494145 () Bool)

(declare-fun lt!651260 () array!99763)

(declare-fun lt!651263 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12390 0))(
  ( (MissingZero!12390 (index!51952 (_ BitVec 32))) (Found!12390 (index!51953 (_ BitVec 32))) (Intermediate!12390 (undefined!13202 Bool) (index!51954 (_ BitVec 32)) (x!133550 (_ BitVec 32))) (Undefined!12390) (MissingVacant!12390 (index!51955 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99763 (_ BitVec 32)) SeekEntryResult!12390)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99763 (_ BitVec 32)) SeekEntryResult!12390)

(assert (=> b!1494145 (= e!836944 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651263 lt!651260 mask!2687) (seekEntryOrOpen!0 lt!651263 lt!651260 mask!2687)))))

(declare-fun b!1494146 () Bool)

(declare-fun res!1016561 () Bool)

(assert (=> b!1494146 (=> (not res!1016561) (not e!836941))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1494146 (= res!1016561 (and (= (size!48700 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48700 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48700 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1494147 () Bool)

(declare-fun res!1016563 () Bool)

(declare-fun e!836942 () Bool)

(assert (=> b!1494147 (=> (not res!1016563) (not e!836942))))

(assert (=> b!1494147 (= res!1016563 (= (seekEntryOrOpen!0 (select (arr!48150 a!2862) j!93) a!2862 mask!2687) (Found!12390 j!93)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1494148 () Bool)

(assert (=> b!1494148 (= e!836942 (or (= (select (arr!48150 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48150 a!2862) intermediateBeforeIndex!19) (select (arr!48150 a!2862) j!93))))))

(declare-fun b!1494149 () Bool)

(declare-fun res!1016551 () Bool)

(declare-fun e!836938 () Bool)

(assert (=> b!1494149 (=> (not res!1016551) (not e!836938))))

(assert (=> b!1494149 (= res!1016551 e!836944)))

(declare-fun c!138327 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1494149 (= c!138327 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1494150 () Bool)

(assert (=> b!1494150 (= e!836938 (not e!836939))))

(declare-fun res!1016554 () Bool)

(assert (=> b!1494150 (=> res!1016554 e!836939)))

(assert (=> b!1494150 (= res!1016554 (or (and (= (select (arr!48150 a!2862) index!646) (select (store (arr!48150 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48150 a!2862) index!646) (select (arr!48150 a!2862) j!93))) (= (select (arr!48150 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1494150 e!836942))

(declare-fun res!1016558 () Bool)

(assert (=> b!1494150 (=> (not res!1016558) (not e!836942))))

(assert (=> b!1494150 (= res!1016558 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50120 0))(
  ( (Unit!50121) )
))
(declare-fun lt!651259 () Unit!50120)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99763 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50120)

(assert (=> b!1494150 (= lt!651259 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1494151 () Bool)

(declare-fun e!836940 () Bool)

(assert (=> b!1494151 (= e!836940 e!836938)))

(declare-fun res!1016549 () Bool)

(assert (=> b!1494151 (=> (not res!1016549) (not e!836938))))

(declare-fun lt!651264 () SeekEntryResult!12390)

(assert (=> b!1494151 (= res!1016549 (= lt!651264 (Intermediate!12390 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99763 (_ BitVec 32)) SeekEntryResult!12390)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494151 (= lt!651264 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651263 mask!2687) lt!651263 lt!651260 mask!2687))))

(assert (=> b!1494151 (= lt!651263 (select (store (arr!48150 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1494152 () Bool)

(declare-fun res!1016556 () Bool)

(assert (=> b!1494152 (=> (not res!1016556) (not e!836941))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1494152 (= res!1016556 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48700 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48700 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48700 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1494144 () Bool)

(declare-fun e!836943 () Bool)

(assert (=> b!1494144 (= e!836943 e!836940)))

(declare-fun res!1016555 () Bool)

(assert (=> b!1494144 (=> (not res!1016555) (not e!836940))))

(declare-fun lt!651261 () SeekEntryResult!12390)

(assert (=> b!1494144 (= res!1016555 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48150 a!2862) j!93) mask!2687) (select (arr!48150 a!2862) j!93) a!2862 mask!2687) lt!651261))))

(assert (=> b!1494144 (= lt!651261 (Intermediate!12390 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!1016562 () Bool)

(assert (=> start!127116 (=> (not res!1016562) (not e!836941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127116 (= res!1016562 (validMask!0 mask!2687))))

(assert (=> start!127116 e!836941))

(assert (=> start!127116 true))

(declare-fun array_inv!37178 (array!99763) Bool)

(assert (=> start!127116 (array_inv!37178 a!2862)))

(declare-fun b!1494153 () Bool)

(declare-fun res!1016557 () Bool)

(assert (=> b!1494153 (=> (not res!1016557) (not e!836938))))

(assert (=> b!1494153 (= res!1016557 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1494154 () Bool)

(declare-fun res!1016550 () Bool)

(assert (=> b!1494154 (=> (not res!1016550) (not e!836941))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1494154 (= res!1016550 (validKeyInArray!0 (select (arr!48150 a!2862) j!93)))))

(declare-fun b!1494155 () Bool)

(declare-fun res!1016560 () Bool)

(assert (=> b!1494155 (=> (not res!1016560) (not e!836941))))

(assert (=> b!1494155 (= res!1016560 (validKeyInArray!0 (select (arr!48150 a!2862) i!1006)))))

(declare-fun b!1494156 () Bool)

(assert (=> b!1494156 (= e!836941 e!836943)))

(declare-fun res!1016552 () Bool)

(assert (=> b!1494156 (=> (not res!1016552) (not e!836943))))

(assert (=> b!1494156 (= res!1016552 (= (select (store (arr!48150 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1494156 (= lt!651260 (array!99764 (store (arr!48150 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48700 a!2862)))))

(declare-fun b!1494157 () Bool)

(declare-fun res!1016548 () Bool)

(assert (=> b!1494157 (=> (not res!1016548) (not e!836940))))

(assert (=> b!1494157 (= res!1016548 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48150 a!2862) j!93) a!2862 mask!2687) lt!651261))))

(declare-fun b!1494158 () Bool)

(assert (=> b!1494158 (= e!836944 (= lt!651264 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651263 lt!651260 mask!2687)))))

(declare-fun b!1494159 () Bool)

(declare-fun res!1016559 () Bool)

(assert (=> b!1494159 (=> (not res!1016559) (not e!836941))))

(declare-datatypes ((List!34651 0))(
  ( (Nil!34648) (Cons!34647 (h!36036 (_ BitVec 64)) (t!49345 List!34651)) )
))
(declare-fun arrayNoDuplicates!0 (array!99763 (_ BitVec 32) List!34651) Bool)

(assert (=> b!1494159 (= res!1016559 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34648))))

(assert (= (and start!127116 res!1016562) b!1494146))

(assert (= (and b!1494146 res!1016561) b!1494155))

(assert (= (and b!1494155 res!1016560) b!1494154))

(assert (= (and b!1494154 res!1016550) b!1494142))

(assert (= (and b!1494142 res!1016553) b!1494159))

(assert (= (and b!1494159 res!1016559) b!1494152))

(assert (= (and b!1494152 res!1016556) b!1494156))

(assert (= (and b!1494156 res!1016552) b!1494144))

(assert (= (and b!1494144 res!1016555) b!1494157))

(assert (= (and b!1494157 res!1016548) b!1494151))

(assert (= (and b!1494151 res!1016549) b!1494149))

(assert (= (and b!1494149 c!138327) b!1494158))

(assert (= (and b!1494149 (not c!138327)) b!1494145))

(assert (= (and b!1494149 res!1016551) b!1494153))

(assert (= (and b!1494153 res!1016557) b!1494150))

(assert (= (and b!1494150 res!1016558) b!1494147))

(assert (= (and b!1494147 res!1016563) b!1494148))

(assert (= (and b!1494150 (not res!1016554)) b!1494143))

(declare-fun m!1377899 () Bool)

(assert (=> b!1494143 m!1377899))

(declare-fun m!1377901 () Bool)

(assert (=> b!1494144 m!1377901))

(assert (=> b!1494144 m!1377901))

(declare-fun m!1377903 () Bool)

(assert (=> b!1494144 m!1377903))

(assert (=> b!1494144 m!1377903))

(assert (=> b!1494144 m!1377901))

(declare-fun m!1377905 () Bool)

(assert (=> b!1494144 m!1377905))

(declare-fun m!1377907 () Bool)

(assert (=> b!1494142 m!1377907))

(assert (=> b!1494157 m!1377901))

(assert (=> b!1494157 m!1377901))

(declare-fun m!1377909 () Bool)

(assert (=> b!1494157 m!1377909))

(declare-fun m!1377911 () Bool)

(assert (=> start!127116 m!1377911))

(declare-fun m!1377913 () Bool)

(assert (=> start!127116 m!1377913))

(declare-fun m!1377915 () Bool)

(assert (=> b!1494156 m!1377915))

(declare-fun m!1377917 () Bool)

(assert (=> b!1494156 m!1377917))

(declare-fun m!1377919 () Bool)

(assert (=> b!1494145 m!1377919))

(declare-fun m!1377921 () Bool)

(assert (=> b!1494145 m!1377921))

(declare-fun m!1377923 () Bool)

(assert (=> b!1494158 m!1377923))

(assert (=> b!1494147 m!1377901))

(assert (=> b!1494147 m!1377901))

(declare-fun m!1377925 () Bool)

(assert (=> b!1494147 m!1377925))

(declare-fun m!1377927 () Bool)

(assert (=> b!1494151 m!1377927))

(assert (=> b!1494151 m!1377927))

(declare-fun m!1377929 () Bool)

(assert (=> b!1494151 m!1377929))

(assert (=> b!1494151 m!1377915))

(declare-fun m!1377931 () Bool)

(assert (=> b!1494151 m!1377931))

(declare-fun m!1377933 () Bool)

(assert (=> b!1494150 m!1377933))

(assert (=> b!1494150 m!1377915))

(declare-fun m!1377935 () Bool)

(assert (=> b!1494150 m!1377935))

(declare-fun m!1377937 () Bool)

(assert (=> b!1494150 m!1377937))

(declare-fun m!1377939 () Bool)

(assert (=> b!1494150 m!1377939))

(assert (=> b!1494150 m!1377901))

(declare-fun m!1377941 () Bool)

(assert (=> b!1494155 m!1377941))

(assert (=> b!1494155 m!1377941))

(declare-fun m!1377943 () Bool)

(assert (=> b!1494155 m!1377943))

(assert (=> b!1494154 m!1377901))

(assert (=> b!1494154 m!1377901))

(declare-fun m!1377945 () Bool)

(assert (=> b!1494154 m!1377945))

(declare-fun m!1377947 () Bool)

(assert (=> b!1494159 m!1377947))

(declare-fun m!1377949 () Bool)

(assert (=> b!1494148 m!1377949))

(assert (=> b!1494148 m!1377901))

(check-sat (not b!1494154) (not b!1494147) (not b!1494157) (not b!1494145) (not b!1494158) (not b!1494150) (not start!127116) (not b!1494142) (not b!1494143) (not b!1494155) (not b!1494151) (not b!1494144) (not b!1494159))
