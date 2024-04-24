; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125604 () Bool)

(assert start!125604)

(declare-fun b!1465939 () Bool)

(declare-fun res!993964 () Bool)

(declare-fun e!823946 () Bool)

(assert (=> b!1465939 (=> (not res!993964) (not e!823946))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11877 0))(
  ( (MissingZero!11877 (index!49900 (_ BitVec 32))) (Found!11877 (index!49901 (_ BitVec 32))) (Intermediate!11877 (undefined!12689 Bool) (index!49902 (_ BitVec 32)) (x!131671 (_ BitVec 32))) (Undefined!11877) (MissingVacant!11877 (index!49903 (_ BitVec 32))) )
))
(declare-fun lt!641659 () SeekEntryResult!11877)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98890 0))(
  ( (array!98891 (arr!47728 (Array (_ BitVec 32) (_ BitVec 64))) (size!48279 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98890)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98890 (_ BitVec 32)) SeekEntryResult!11877)

(assert (=> b!1465939 (= res!993964 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47728 a!2862) j!93) a!2862 mask!2687) lt!641659))))

(declare-fun b!1465940 () Bool)

(declare-fun res!993965 () Bool)

(declare-fun e!823944 () Bool)

(assert (=> b!1465940 (=> (not res!993965) (not e!823944))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1465940 (= res!993965 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48279 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48279 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48279 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1465941 () Bool)

(declare-fun e!823945 () Bool)

(assert (=> b!1465941 (= e!823945 e!823946)))

(declare-fun res!993961 () Bool)

(assert (=> b!1465941 (=> (not res!993961) (not e!823946))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465941 (= res!993961 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47728 a!2862) j!93) mask!2687) (select (arr!47728 a!2862) j!93) a!2862 mask!2687) lt!641659))))

(assert (=> b!1465941 (= lt!641659 (Intermediate!11877 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1465942 () Bool)

(declare-fun e!823947 () Bool)

(assert (=> b!1465942 (= e!823946 e!823947)))

(declare-fun res!993952 () Bool)

(assert (=> b!1465942 (=> (not res!993952) (not e!823947))))

(declare-fun lt!641657 () SeekEntryResult!11877)

(assert (=> b!1465942 (= res!993952 (= lt!641657 (Intermediate!11877 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!641662 () (_ BitVec 64))

(declare-fun lt!641660 () array!98890)

(assert (=> b!1465942 (= lt!641657 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641662 mask!2687) lt!641662 lt!641660 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1465942 (= lt!641662 (select (store (arr!47728 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1465943 () Bool)

(declare-fun res!993958 () Bool)

(assert (=> b!1465943 (=> (not res!993958) (not e!823944))))

(declare-datatypes ((List!34216 0))(
  ( (Nil!34213) (Cons!34212 (h!35576 (_ BitVec 64)) (t!48902 List!34216)) )
))
(declare-fun arrayNoDuplicates!0 (array!98890 (_ BitVec 32) List!34216) Bool)

(assert (=> b!1465943 (= res!993958 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34213))))

(declare-fun b!1465944 () Bool)

(declare-fun e!823953 () Bool)

(assert (=> b!1465944 (= e!823947 (not e!823953))))

(declare-fun res!993963 () Bool)

(assert (=> b!1465944 (=> res!993963 e!823953)))

(assert (=> b!1465944 (= res!993963 (or (and (= (select (arr!47728 a!2862) index!646) (select (store (arr!47728 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47728 a!2862) index!646) (select (arr!47728 a!2862) j!93))) (= (select (arr!47728 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!823951 () Bool)

(assert (=> b!1465944 e!823951))

(declare-fun res!993951 () Bool)

(assert (=> b!1465944 (=> (not res!993951) (not e!823951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98890 (_ BitVec 32)) Bool)

(assert (=> b!1465944 (= res!993951 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49283 0))(
  ( (Unit!49284) )
))
(declare-fun lt!641656 () Unit!49283)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98890 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49283)

(assert (=> b!1465944 (= lt!641656 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!993959 () Bool)

(assert (=> start!125604 (=> (not res!993959) (not e!823944))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125604 (= res!993959 (validMask!0 mask!2687))))

(assert (=> start!125604 e!823944))

(assert (=> start!125604 true))

(declare-fun array_inv!37009 (array!98890) Bool)

(assert (=> start!125604 (array_inv!37009 a!2862)))

(declare-fun b!1465945 () Bool)

(declare-fun res!993962 () Bool)

(assert (=> b!1465945 (=> (not res!993962) (not e!823944))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1465945 (= res!993962 (validKeyInArray!0 (select (arr!47728 a!2862) i!1006)))))

(declare-fun b!1465946 () Bool)

(declare-fun res!993955 () Bool)

(assert (=> b!1465946 (=> (not res!993955) (not e!823944))))

(assert (=> b!1465946 (= res!993955 (and (= (size!48279 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48279 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48279 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1465947 () Bool)

(declare-fun res!993954 () Bool)

(declare-fun e!823950 () Bool)

(assert (=> b!1465947 (=> res!993954 e!823950)))

(declare-fun lt!641658 () (_ BitVec 32))

(assert (=> b!1465947 (= res!993954 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641658 (select (arr!47728 a!2862) j!93) a!2862 mask!2687) lt!641659)))))

(declare-fun b!1465948 () Bool)

(declare-fun res!993949 () Bool)

(assert (=> b!1465948 (=> (not res!993949) (not e!823951))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98890 (_ BitVec 32)) SeekEntryResult!11877)

(assert (=> b!1465948 (= res!993949 (= (seekEntryOrOpen!0 (select (arr!47728 a!2862) j!93) a!2862 mask!2687) (Found!11877 j!93)))))

(declare-fun e!823952 () Bool)

(declare-fun b!1465949 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98890 (_ BitVec 32)) SeekEntryResult!11877)

(assert (=> b!1465949 (= e!823952 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641658 intermediateAfterIndex!19 lt!641662 lt!641660 mask!2687) (seekEntryOrOpen!0 lt!641662 lt!641660 mask!2687))))))

(declare-fun b!1465950 () Bool)

(assert (=> b!1465950 (= e!823950 true)))

(declare-fun lt!641661 () Bool)

(assert (=> b!1465950 (= lt!641661 e!823952)))

(declare-fun c!135516 () Bool)

(assert (=> b!1465950 (= c!135516 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1465951 () Bool)

(declare-fun res!993956 () Bool)

(assert (=> b!1465951 (=> (not res!993956) (not e!823947))))

(assert (=> b!1465951 (= res!993956 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1465952 () Bool)

(assert (=> b!1465952 (= e!823953 e!823950)))

(declare-fun res!993948 () Bool)

(assert (=> b!1465952 (=> res!993948 e!823950)))

(assert (=> b!1465952 (= res!993948 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641658 #b00000000000000000000000000000000) (bvsge lt!641658 (size!48279 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465952 (= lt!641658 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1465953 () Bool)

(declare-fun e!823948 () Bool)

(assert (=> b!1465953 (= e!823948 (= lt!641657 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641662 lt!641660 mask!2687)))))

(declare-fun b!1465954 () Bool)

(declare-fun res!993957 () Bool)

(assert (=> b!1465954 (=> (not res!993957) (not e!823944))))

(assert (=> b!1465954 (= res!993957 (validKeyInArray!0 (select (arr!47728 a!2862) j!93)))))

(declare-fun b!1465955 () Bool)

(assert (=> b!1465955 (= e!823944 e!823945)))

(declare-fun res!993953 () Bool)

(assert (=> b!1465955 (=> (not res!993953) (not e!823945))))

(assert (=> b!1465955 (= res!993953 (= (select (store (arr!47728 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1465955 (= lt!641660 (array!98891 (store (arr!47728 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48279 a!2862)))))

(declare-fun b!1465956 () Bool)

(declare-fun res!993960 () Bool)

(assert (=> b!1465956 (=> (not res!993960) (not e!823947))))

(assert (=> b!1465956 (= res!993960 e!823948)))

(declare-fun c!135517 () Bool)

(assert (=> b!1465956 (= c!135517 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1465957 () Bool)

(assert (=> b!1465957 (= e!823952 (not (= lt!641657 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641658 lt!641662 lt!641660 mask!2687))))))

(declare-fun b!1465958 () Bool)

(assert (=> b!1465958 (= e!823948 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641662 lt!641660 mask!2687) (seekEntryOrOpen!0 lt!641662 lt!641660 mask!2687)))))

(declare-fun b!1465959 () Bool)

(declare-fun res!993950 () Bool)

(assert (=> b!1465959 (=> (not res!993950) (not e!823944))))

(assert (=> b!1465959 (= res!993950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1465960 () Bool)

(assert (=> b!1465960 (= e!823951 (or (= (select (arr!47728 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47728 a!2862) intermediateBeforeIndex!19) (select (arr!47728 a!2862) j!93))))))

(assert (= (and start!125604 res!993959) b!1465946))

(assert (= (and b!1465946 res!993955) b!1465945))

(assert (= (and b!1465945 res!993962) b!1465954))

(assert (= (and b!1465954 res!993957) b!1465959))

(assert (= (and b!1465959 res!993950) b!1465943))

(assert (= (and b!1465943 res!993958) b!1465940))

(assert (= (and b!1465940 res!993965) b!1465955))

(assert (= (and b!1465955 res!993953) b!1465941))

(assert (= (and b!1465941 res!993961) b!1465939))

(assert (= (and b!1465939 res!993964) b!1465942))

(assert (= (and b!1465942 res!993952) b!1465956))

(assert (= (and b!1465956 c!135517) b!1465953))

(assert (= (and b!1465956 (not c!135517)) b!1465958))

(assert (= (and b!1465956 res!993960) b!1465951))

(assert (= (and b!1465951 res!993956) b!1465944))

(assert (= (and b!1465944 res!993951) b!1465948))

(assert (= (and b!1465948 res!993949) b!1465960))

(assert (= (and b!1465944 (not res!993963)) b!1465952))

(assert (= (and b!1465952 (not res!993948)) b!1465947))

(assert (= (and b!1465947 (not res!993954)) b!1465950))

(assert (= (and b!1465950 c!135516) b!1465957))

(assert (= (and b!1465950 (not c!135516)) b!1465949))

(declare-fun m!1353157 () Bool)

(assert (=> b!1465957 m!1353157))

(declare-fun m!1353159 () Bool)

(assert (=> b!1465943 m!1353159))

(declare-fun m!1353161 () Bool)

(assert (=> start!125604 m!1353161))

(declare-fun m!1353163 () Bool)

(assert (=> start!125604 m!1353163))

(declare-fun m!1353165 () Bool)

(assert (=> b!1465952 m!1353165))

(declare-fun m!1353167 () Bool)

(assert (=> b!1465942 m!1353167))

(assert (=> b!1465942 m!1353167))

(declare-fun m!1353169 () Bool)

(assert (=> b!1465942 m!1353169))

(declare-fun m!1353171 () Bool)

(assert (=> b!1465942 m!1353171))

(declare-fun m!1353173 () Bool)

(assert (=> b!1465942 m!1353173))

(declare-fun m!1353175 () Bool)

(assert (=> b!1465959 m!1353175))

(declare-fun m!1353177 () Bool)

(assert (=> b!1465949 m!1353177))

(declare-fun m!1353179 () Bool)

(assert (=> b!1465949 m!1353179))

(declare-fun m!1353181 () Bool)

(assert (=> b!1465960 m!1353181))

(declare-fun m!1353183 () Bool)

(assert (=> b!1465960 m!1353183))

(declare-fun m!1353185 () Bool)

(assert (=> b!1465945 m!1353185))

(assert (=> b!1465945 m!1353185))

(declare-fun m!1353187 () Bool)

(assert (=> b!1465945 m!1353187))

(declare-fun m!1353189 () Bool)

(assert (=> b!1465944 m!1353189))

(assert (=> b!1465944 m!1353171))

(declare-fun m!1353191 () Bool)

(assert (=> b!1465944 m!1353191))

(declare-fun m!1353193 () Bool)

(assert (=> b!1465944 m!1353193))

(declare-fun m!1353195 () Bool)

(assert (=> b!1465944 m!1353195))

(assert (=> b!1465944 m!1353183))

(assert (=> b!1465954 m!1353183))

(assert (=> b!1465954 m!1353183))

(declare-fun m!1353197 () Bool)

(assert (=> b!1465954 m!1353197))

(declare-fun m!1353199 () Bool)

(assert (=> b!1465958 m!1353199))

(assert (=> b!1465958 m!1353179))

(assert (=> b!1465947 m!1353183))

(assert (=> b!1465947 m!1353183))

(declare-fun m!1353201 () Bool)

(assert (=> b!1465947 m!1353201))

(assert (=> b!1465955 m!1353171))

(declare-fun m!1353203 () Bool)

(assert (=> b!1465955 m!1353203))

(declare-fun m!1353205 () Bool)

(assert (=> b!1465953 m!1353205))

(assert (=> b!1465939 m!1353183))

(assert (=> b!1465939 m!1353183))

(declare-fun m!1353207 () Bool)

(assert (=> b!1465939 m!1353207))

(assert (=> b!1465948 m!1353183))

(assert (=> b!1465948 m!1353183))

(declare-fun m!1353209 () Bool)

(assert (=> b!1465948 m!1353209))

(assert (=> b!1465941 m!1353183))

(assert (=> b!1465941 m!1353183))

(declare-fun m!1353211 () Bool)

(assert (=> b!1465941 m!1353211))

(assert (=> b!1465941 m!1353211))

(assert (=> b!1465941 m!1353183))

(declare-fun m!1353213 () Bool)

(assert (=> b!1465941 m!1353213))

(check-sat (not b!1465943) (not b!1465948) (not b!1465945) (not start!125604) (not b!1465949) (not b!1465958) (not b!1465953) (not b!1465959) (not b!1465944) (not b!1465939) (not b!1465954) (not b!1465942) (not b!1465957) (not b!1465947) (not b!1465952) (not b!1465941))
(check-sat)
