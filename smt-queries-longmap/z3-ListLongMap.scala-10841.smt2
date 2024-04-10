; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126894 () Bool)

(assert start!126894)

(declare-fun b!1490950 () Bool)

(declare-fun res!1014177 () Bool)

(declare-fun e!835411 () Bool)

(assert (=> b!1490950 (=> (not res!1014177) (not e!835411))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1490950 (= res!1014177 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1490951 () Bool)

(declare-fun e!835415 () Bool)

(declare-datatypes ((array!99667 0))(
  ( (array!99668 (arr!48105 (Array (_ BitVec 32) (_ BitVec 64))) (size!48655 (_ BitVec 32))) )
))
(declare-fun lt!650118 () array!99667)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!650116 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12345 0))(
  ( (MissingZero!12345 (index!51772 (_ BitVec 32))) (Found!12345 (index!51773 (_ BitVec 32))) (Intermediate!12345 (undefined!13157 Bool) (index!51774 (_ BitVec 32)) (x!133361 (_ BitVec 32))) (Undefined!12345) (MissingVacant!12345 (index!51775 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99667 (_ BitVec 32)) SeekEntryResult!12345)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99667 (_ BitVec 32)) SeekEntryResult!12345)

(assert (=> b!1490951 (= e!835415 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650116 lt!650118 mask!2687) (seekEntryOrOpen!0 lt!650116 lt!650118 mask!2687)))))

(declare-fun b!1490952 () Bool)

(declare-fun res!1014172 () Bool)

(declare-fun e!835414 () Bool)

(assert (=> b!1490952 (=> (not res!1014172) (not e!835414))))

(declare-fun a!2862 () array!99667)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1490952 (= res!1014172 (validKeyInArray!0 (select (arr!48105 a!2862) i!1006)))))

(declare-fun b!1490953 () Bool)

(declare-fun res!1014175 () Bool)

(assert (=> b!1490953 (=> (not res!1014175) (not e!835414))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1490953 (= res!1014175 (validKeyInArray!0 (select (arr!48105 a!2862) j!93)))))

(declare-fun b!1490954 () Bool)

(declare-fun res!1014174 () Bool)

(assert (=> b!1490954 (=> (not res!1014174) (not e!835414))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1490954 (= res!1014174 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48655 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48655 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48655 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1490955 () Bool)

(declare-fun e!835410 () Bool)

(assert (=> b!1490955 (= e!835410 true)))

(declare-fun lt!650114 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490955 (= lt!650114 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1490956 () Bool)

(declare-fun e!835409 () Bool)

(assert (=> b!1490956 (= e!835409 (or (= (select (arr!48105 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48105 a!2862) intermediateBeforeIndex!19) (select (arr!48105 a!2862) j!93))))))

(declare-fun b!1490957 () Bool)

(declare-fun res!1014183 () Bool)

(assert (=> b!1490957 (=> (not res!1014183) (not e!835414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99667 (_ BitVec 32)) Bool)

(assert (=> b!1490957 (= res!1014183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1490958 () Bool)

(declare-fun res!1014180 () Bool)

(assert (=> b!1490958 (=> (not res!1014180) (not e!835411))))

(assert (=> b!1490958 (= res!1014180 e!835415)))

(declare-fun c!137916 () Bool)

(assert (=> b!1490958 (= c!137916 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1490959 () Bool)

(declare-fun res!1014179 () Bool)

(declare-fun e!835408 () Bool)

(assert (=> b!1490959 (=> (not res!1014179) (not e!835408))))

(declare-fun lt!650117 () SeekEntryResult!12345)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99667 (_ BitVec 32)) SeekEntryResult!12345)

(assert (=> b!1490959 (= res!1014179 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48105 a!2862) j!93) a!2862 mask!2687) lt!650117))))

(declare-fun b!1490960 () Bool)

(declare-fun e!835413 () Bool)

(assert (=> b!1490960 (= e!835414 e!835413)))

(declare-fun res!1014184 () Bool)

(assert (=> b!1490960 (=> (not res!1014184) (not e!835413))))

(assert (=> b!1490960 (= res!1014184 (= (select (store (arr!48105 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490960 (= lt!650118 (array!99668 (store (arr!48105 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48655 a!2862)))))

(declare-fun res!1014182 () Bool)

(assert (=> start!126894 (=> (not res!1014182) (not e!835414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126894 (= res!1014182 (validMask!0 mask!2687))))

(assert (=> start!126894 e!835414))

(assert (=> start!126894 true))

(declare-fun array_inv!37133 (array!99667) Bool)

(assert (=> start!126894 (array_inv!37133 a!2862)))

(declare-fun b!1490961 () Bool)

(assert (=> b!1490961 (= e!835413 e!835408)))

(declare-fun res!1014176 () Bool)

(assert (=> b!1490961 (=> (not res!1014176) (not e!835408))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490961 (= res!1014176 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48105 a!2862) j!93) mask!2687) (select (arr!48105 a!2862) j!93) a!2862 mask!2687) lt!650117))))

(assert (=> b!1490961 (= lt!650117 (Intermediate!12345 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1490962 () Bool)

(assert (=> b!1490962 (= e!835408 e!835411)))

(declare-fun res!1014173 () Bool)

(assert (=> b!1490962 (=> (not res!1014173) (not e!835411))))

(declare-fun lt!650113 () SeekEntryResult!12345)

(assert (=> b!1490962 (= res!1014173 (= lt!650113 (Intermediate!12345 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1490962 (= lt!650113 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650116 mask!2687) lt!650116 lt!650118 mask!2687))))

(assert (=> b!1490962 (= lt!650116 (select (store (arr!48105 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1490963 () Bool)

(declare-fun res!1014185 () Bool)

(assert (=> b!1490963 (=> (not res!1014185) (not e!835414))))

(declare-datatypes ((List!34606 0))(
  ( (Nil!34603) (Cons!34602 (h!35985 (_ BitVec 64)) (t!49300 List!34606)) )
))
(declare-fun arrayNoDuplicates!0 (array!99667 (_ BitVec 32) List!34606) Bool)

(assert (=> b!1490963 (= res!1014185 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34603))))

(declare-fun b!1490964 () Bool)

(declare-fun res!1014178 () Bool)

(assert (=> b!1490964 (=> (not res!1014178) (not e!835414))))

(assert (=> b!1490964 (= res!1014178 (and (= (size!48655 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48655 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48655 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1490965 () Bool)

(declare-fun res!1014181 () Bool)

(assert (=> b!1490965 (=> (not res!1014181) (not e!835409))))

(assert (=> b!1490965 (= res!1014181 (= (seekEntryOrOpen!0 (select (arr!48105 a!2862) j!93) a!2862 mask!2687) (Found!12345 j!93)))))

(declare-fun b!1490966 () Bool)

(assert (=> b!1490966 (= e!835415 (= lt!650113 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650116 lt!650118 mask!2687)))))

(declare-fun b!1490967 () Bool)

(assert (=> b!1490967 (= e!835411 (not e!835410))))

(declare-fun res!1014186 () Bool)

(assert (=> b!1490967 (=> res!1014186 e!835410)))

(assert (=> b!1490967 (= res!1014186 (or (and (= (select (arr!48105 a!2862) index!646) (select (store (arr!48105 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48105 a!2862) index!646) (select (arr!48105 a!2862) j!93))) (= (select (arr!48105 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1490967 e!835409))

(declare-fun res!1014187 () Bool)

(assert (=> b!1490967 (=> (not res!1014187) (not e!835409))))

(assert (=> b!1490967 (= res!1014187 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50030 0))(
  ( (Unit!50031) )
))
(declare-fun lt!650115 () Unit!50030)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99667 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50030)

(assert (=> b!1490967 (= lt!650115 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!126894 res!1014182) b!1490964))

(assert (= (and b!1490964 res!1014178) b!1490952))

(assert (= (and b!1490952 res!1014172) b!1490953))

(assert (= (and b!1490953 res!1014175) b!1490957))

(assert (= (and b!1490957 res!1014183) b!1490963))

(assert (= (and b!1490963 res!1014185) b!1490954))

(assert (= (and b!1490954 res!1014174) b!1490960))

(assert (= (and b!1490960 res!1014184) b!1490961))

(assert (= (and b!1490961 res!1014176) b!1490959))

(assert (= (and b!1490959 res!1014179) b!1490962))

(assert (= (and b!1490962 res!1014173) b!1490958))

(assert (= (and b!1490958 c!137916) b!1490966))

(assert (= (and b!1490958 (not c!137916)) b!1490951))

(assert (= (and b!1490958 res!1014180) b!1490950))

(assert (= (and b!1490950 res!1014177) b!1490967))

(assert (= (and b!1490967 res!1014187) b!1490965))

(assert (= (and b!1490965 res!1014181) b!1490956))

(assert (= (and b!1490967 (not res!1014186)) b!1490955))

(declare-fun m!1375091 () Bool)

(assert (=> b!1490967 m!1375091))

(declare-fun m!1375093 () Bool)

(assert (=> b!1490967 m!1375093))

(declare-fun m!1375095 () Bool)

(assert (=> b!1490967 m!1375095))

(declare-fun m!1375097 () Bool)

(assert (=> b!1490967 m!1375097))

(declare-fun m!1375099 () Bool)

(assert (=> b!1490967 m!1375099))

(declare-fun m!1375101 () Bool)

(assert (=> b!1490967 m!1375101))

(declare-fun m!1375103 () Bool)

(assert (=> b!1490962 m!1375103))

(assert (=> b!1490962 m!1375103))

(declare-fun m!1375105 () Bool)

(assert (=> b!1490962 m!1375105))

(assert (=> b!1490962 m!1375093))

(declare-fun m!1375107 () Bool)

(assert (=> b!1490962 m!1375107))

(declare-fun m!1375109 () Bool)

(assert (=> start!126894 m!1375109))

(declare-fun m!1375111 () Bool)

(assert (=> start!126894 m!1375111))

(assert (=> b!1490960 m!1375093))

(declare-fun m!1375113 () Bool)

(assert (=> b!1490960 m!1375113))

(assert (=> b!1490965 m!1375101))

(assert (=> b!1490965 m!1375101))

(declare-fun m!1375115 () Bool)

(assert (=> b!1490965 m!1375115))

(declare-fun m!1375117 () Bool)

(assert (=> b!1490966 m!1375117))

(assert (=> b!1490959 m!1375101))

(assert (=> b!1490959 m!1375101))

(declare-fun m!1375119 () Bool)

(assert (=> b!1490959 m!1375119))

(declare-fun m!1375121 () Bool)

(assert (=> b!1490955 m!1375121))

(assert (=> b!1490953 m!1375101))

(assert (=> b!1490953 m!1375101))

(declare-fun m!1375123 () Bool)

(assert (=> b!1490953 m!1375123))

(declare-fun m!1375125 () Bool)

(assert (=> b!1490957 m!1375125))

(declare-fun m!1375127 () Bool)

(assert (=> b!1490952 m!1375127))

(assert (=> b!1490952 m!1375127))

(declare-fun m!1375129 () Bool)

(assert (=> b!1490952 m!1375129))

(declare-fun m!1375131 () Bool)

(assert (=> b!1490951 m!1375131))

(declare-fun m!1375133 () Bool)

(assert (=> b!1490951 m!1375133))

(assert (=> b!1490961 m!1375101))

(assert (=> b!1490961 m!1375101))

(declare-fun m!1375135 () Bool)

(assert (=> b!1490961 m!1375135))

(assert (=> b!1490961 m!1375135))

(assert (=> b!1490961 m!1375101))

(declare-fun m!1375137 () Bool)

(assert (=> b!1490961 m!1375137))

(declare-fun m!1375139 () Bool)

(assert (=> b!1490963 m!1375139))

(declare-fun m!1375141 () Bool)

(assert (=> b!1490956 m!1375141))

(assert (=> b!1490956 m!1375101))

(check-sat (not b!1490953) (not b!1490952) (not b!1490959) (not b!1490966) (not b!1490963) (not b!1490965) (not b!1490962) (not b!1490967) (not b!1490957) (not b!1490951) (not start!126894) (not b!1490955) (not b!1490961))
(check-sat)
