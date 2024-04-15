; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124990 () Bool)

(assert start!124990)

(declare-fun b!1454109 () Bool)

(declare-fun res!985100 () Bool)

(declare-fun e!818354 () Bool)

(assert (=> b!1454109 (=> (not res!985100) (not e!818354))))

(declare-datatypes ((SeekEntryResult!11774 0))(
  ( (MissingZero!11774 (index!49488 (_ BitVec 32))) (Found!11774 (index!49489 (_ BitVec 32))) (Intermediate!11774 (undefined!12586 Bool) (index!49490 (_ BitVec 32)) (x!131122 (_ BitVec 32))) (Undefined!11774) (MissingVacant!11774 (index!49491 (_ BitVec 32))) )
))
(declare-fun lt!637307 () SeekEntryResult!11774)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98416 0))(
  ( (array!98417 (arr!47497 (Array (_ BitVec 32) (_ BitVec 64))) (size!48049 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98416)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98416 (_ BitVec 32)) SeekEntryResult!11774)

(assert (=> b!1454109 (= res!985100 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47497 a!2862) j!93) a!2862 mask!2687) lt!637307))))

(declare-fun b!1454110 () Bool)

(declare-fun res!985113 () Bool)

(declare-fun e!818348 () Bool)

(assert (=> b!1454110 (=> (not res!985113) (not e!818348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1454110 (= res!985113 (validKeyInArray!0 (select (arr!47497 a!2862) j!93)))))

(declare-fun b!1454111 () Bool)

(declare-fun res!985112 () Bool)

(assert (=> b!1454111 (=> (not res!985112) (not e!818348))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1454111 (= res!985112 (and (= (size!48049 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48049 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48049 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1454112 () Bool)

(declare-fun res!985098 () Bool)

(declare-fun e!818352 () Bool)

(assert (=> b!1454112 (=> res!985098 e!818352)))

(declare-fun lt!637306 () (_ BitVec 32))

(assert (=> b!1454112 (= res!985098 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637306 (select (arr!47497 a!2862) j!93) a!2862 mask!2687) lt!637307)))))

(declare-fun b!1454113 () Bool)

(declare-fun res!985106 () Bool)

(declare-fun e!818351 () Bool)

(assert (=> b!1454113 (=> (not res!985106) (not e!818351))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98416 (_ BitVec 32)) SeekEntryResult!11774)

(assert (=> b!1454113 (= res!985106 (= (seekEntryOrOpen!0 (select (arr!47497 a!2862) j!93) a!2862 mask!2687) (Found!11774 j!93)))))

(declare-fun b!1454114 () Bool)

(declare-fun res!985105 () Bool)

(assert (=> b!1454114 (=> (not res!985105) (not e!818348))))

(declare-datatypes ((List!34076 0))(
  ( (Nil!34073) (Cons!34072 (h!35422 (_ BitVec 64)) (t!48762 List!34076)) )
))
(declare-fun arrayNoDuplicates!0 (array!98416 (_ BitVec 32) List!34076) Bool)

(assert (=> b!1454114 (= res!985105 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34073))))

(declare-fun lt!637305 () SeekEntryResult!11774)

(declare-fun lt!637310 () array!98416)

(declare-fun b!1454115 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun e!818350 () Bool)

(declare-fun lt!637311 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98416 (_ BitVec 32)) SeekEntryResult!11774)

(assert (=> b!1454115 (= e!818350 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637306 intermediateAfterIndex!19 lt!637311 lt!637310 mask!2687) lt!637305)))))

(declare-fun b!1454116 () Bool)

(declare-fun e!818353 () Bool)

(assert (=> b!1454116 (= e!818348 e!818353)))

(declare-fun res!985102 () Bool)

(assert (=> b!1454116 (=> (not res!985102) (not e!818353))))

(assert (=> b!1454116 (= res!985102 (= (select (store (arr!47497 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1454116 (= lt!637310 (array!98417 (store (arr!47497 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48049 a!2862)))))

(declare-fun lt!637308 () SeekEntryResult!11774)

(declare-fun b!1454117 () Bool)

(declare-fun e!818349 () Bool)

(assert (=> b!1454117 (= e!818349 (= lt!637308 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637311 lt!637310 mask!2687)))))

(declare-fun b!1454118 () Bool)

(declare-fun res!985107 () Bool)

(declare-fun e!818347 () Bool)

(assert (=> b!1454118 (=> (not res!985107) (not e!818347))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1454118 (= res!985107 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1454119 () Bool)

(declare-fun e!818355 () Bool)

(assert (=> b!1454119 (= e!818347 (not e!818355))))

(declare-fun res!985101 () Bool)

(assert (=> b!1454119 (=> res!985101 e!818355)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1454119 (= res!985101 (or (and (= (select (arr!47497 a!2862) index!646) (select (store (arr!47497 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47497 a!2862) index!646) (select (arr!47497 a!2862) j!93))) (= (select (arr!47497 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1454119 e!818351))

(declare-fun res!985104 () Bool)

(assert (=> b!1454119 (=> (not res!985104) (not e!818351))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98416 (_ BitVec 32)) Bool)

(assert (=> b!1454119 (= res!985104 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48885 0))(
  ( (Unit!48886) )
))
(declare-fun lt!637304 () Unit!48885)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98416 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48885)

(assert (=> b!1454119 (= lt!637304 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1454120 () Bool)

(assert (=> b!1454120 (= e!818354 e!818347)))

(declare-fun res!985103 () Bool)

(assert (=> b!1454120 (=> (not res!985103) (not e!818347))))

(assert (=> b!1454120 (= res!985103 (= lt!637308 (Intermediate!11774 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454120 (= lt!637308 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637311 mask!2687) lt!637311 lt!637310 mask!2687))))

(assert (=> b!1454120 (= lt!637311 (select (store (arr!47497 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1454122 () Bool)

(assert (=> b!1454122 (= e!818350 (not (= lt!637308 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637306 lt!637311 lt!637310 mask!2687))))))

(declare-fun b!1454123 () Bool)

(assert (=> b!1454123 (= e!818355 e!818352)))

(declare-fun res!985111 () Bool)

(assert (=> b!1454123 (=> res!985111 e!818352)))

(assert (=> b!1454123 (= res!985111 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637306 #b00000000000000000000000000000000) (bvsge lt!637306 (size!48049 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454123 (= lt!637306 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1454123 (= lt!637305 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637311 lt!637310 mask!2687))))

(assert (=> b!1454123 (= lt!637305 (seekEntryOrOpen!0 lt!637311 lt!637310 mask!2687))))

(declare-fun b!1454124 () Bool)

(assert (=> b!1454124 (= e!818352 true)))

(declare-fun lt!637309 () Bool)

(assert (=> b!1454124 (= lt!637309 e!818350)))

(declare-fun c!134019 () Bool)

(assert (=> b!1454124 (= c!134019 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1454125 () Bool)

(declare-fun res!985114 () Bool)

(assert (=> b!1454125 (=> (not res!985114) (not e!818348))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1454125 (= res!985114 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48049 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48049 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48049 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1454126 () Bool)

(assert (=> b!1454126 (= e!818349 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637311 lt!637310 mask!2687) (seekEntryOrOpen!0 lt!637311 lt!637310 mask!2687)))))

(declare-fun b!1454127 () Bool)

(assert (=> b!1454127 (= e!818353 e!818354)))

(declare-fun res!985099 () Bool)

(assert (=> b!1454127 (=> (not res!985099) (not e!818354))))

(assert (=> b!1454127 (= res!985099 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47497 a!2862) j!93) mask!2687) (select (arr!47497 a!2862) j!93) a!2862 mask!2687) lt!637307))))

(assert (=> b!1454127 (= lt!637307 (Intermediate!11774 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1454128 () Bool)

(assert (=> b!1454128 (= e!818351 (and (or (= (select (arr!47497 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47497 a!2862) intermediateBeforeIndex!19) (select (arr!47497 a!2862) j!93))) (let ((bdg!53053 (select (store (arr!47497 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47497 a!2862) index!646) bdg!53053) (= (select (arr!47497 a!2862) index!646) (select (arr!47497 a!2862) j!93))) (= (select (arr!47497 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53053 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1454129 () Bool)

(declare-fun res!985110 () Bool)

(assert (=> b!1454129 (=> (not res!985110) (not e!818347))))

(assert (=> b!1454129 (= res!985110 e!818349)))

(declare-fun c!134020 () Bool)

(assert (=> b!1454129 (= c!134020 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1454130 () Bool)

(declare-fun res!985108 () Bool)

(assert (=> b!1454130 (=> (not res!985108) (not e!818348))))

(assert (=> b!1454130 (= res!985108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1454121 () Bool)

(declare-fun res!985097 () Bool)

(assert (=> b!1454121 (=> (not res!985097) (not e!818348))))

(assert (=> b!1454121 (= res!985097 (validKeyInArray!0 (select (arr!47497 a!2862) i!1006)))))

(declare-fun res!985109 () Bool)

(assert (=> start!124990 (=> (not res!985109) (not e!818348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124990 (= res!985109 (validMask!0 mask!2687))))

(assert (=> start!124990 e!818348))

(assert (=> start!124990 true))

(declare-fun array_inv!36730 (array!98416) Bool)

(assert (=> start!124990 (array_inv!36730 a!2862)))

(assert (= (and start!124990 res!985109) b!1454111))

(assert (= (and b!1454111 res!985112) b!1454121))

(assert (= (and b!1454121 res!985097) b!1454110))

(assert (= (and b!1454110 res!985113) b!1454130))

(assert (= (and b!1454130 res!985108) b!1454114))

(assert (= (and b!1454114 res!985105) b!1454125))

(assert (= (and b!1454125 res!985114) b!1454116))

(assert (= (and b!1454116 res!985102) b!1454127))

(assert (= (and b!1454127 res!985099) b!1454109))

(assert (= (and b!1454109 res!985100) b!1454120))

(assert (= (and b!1454120 res!985103) b!1454129))

(assert (= (and b!1454129 c!134020) b!1454117))

(assert (= (and b!1454129 (not c!134020)) b!1454126))

(assert (= (and b!1454129 res!985110) b!1454118))

(assert (= (and b!1454118 res!985107) b!1454119))

(assert (= (and b!1454119 res!985104) b!1454113))

(assert (= (and b!1454113 res!985106) b!1454128))

(assert (= (and b!1454119 (not res!985101)) b!1454123))

(assert (= (and b!1454123 (not res!985111)) b!1454112))

(assert (= (and b!1454112 (not res!985098)) b!1454124))

(assert (= (and b!1454124 c!134019) b!1454122))

(assert (= (and b!1454124 (not c!134019)) b!1454115))

(declare-fun m!1341987 () Bool)

(assert (=> b!1454122 m!1341987))

(declare-fun m!1341989 () Bool)

(assert (=> b!1454115 m!1341989))

(declare-fun m!1341991 () Bool)

(assert (=> b!1454128 m!1341991))

(declare-fun m!1341993 () Bool)

(assert (=> b!1454128 m!1341993))

(declare-fun m!1341995 () Bool)

(assert (=> b!1454128 m!1341995))

(declare-fun m!1341997 () Bool)

(assert (=> b!1454128 m!1341997))

(declare-fun m!1341999 () Bool)

(assert (=> b!1454128 m!1341999))

(assert (=> b!1454110 m!1341999))

(assert (=> b!1454110 m!1341999))

(declare-fun m!1342001 () Bool)

(assert (=> b!1454110 m!1342001))

(assert (=> b!1454116 m!1341991))

(declare-fun m!1342003 () Bool)

(assert (=> b!1454116 m!1342003))

(declare-fun m!1342005 () Bool)

(assert (=> b!1454130 m!1342005))

(assert (=> b!1454112 m!1341999))

(assert (=> b!1454112 m!1341999))

(declare-fun m!1342007 () Bool)

(assert (=> b!1454112 m!1342007))

(declare-fun m!1342009 () Bool)

(assert (=> b!1454117 m!1342009))

(declare-fun m!1342011 () Bool)

(assert (=> b!1454120 m!1342011))

(assert (=> b!1454120 m!1342011))

(declare-fun m!1342013 () Bool)

(assert (=> b!1454120 m!1342013))

(assert (=> b!1454120 m!1341991))

(declare-fun m!1342015 () Bool)

(assert (=> b!1454120 m!1342015))

(assert (=> b!1454127 m!1341999))

(assert (=> b!1454127 m!1341999))

(declare-fun m!1342017 () Bool)

(assert (=> b!1454127 m!1342017))

(assert (=> b!1454127 m!1342017))

(assert (=> b!1454127 m!1341999))

(declare-fun m!1342019 () Bool)

(assert (=> b!1454127 m!1342019))

(assert (=> b!1454113 m!1341999))

(assert (=> b!1454113 m!1341999))

(declare-fun m!1342021 () Bool)

(assert (=> b!1454113 m!1342021))

(declare-fun m!1342023 () Bool)

(assert (=> start!124990 m!1342023))

(declare-fun m!1342025 () Bool)

(assert (=> start!124990 m!1342025))

(declare-fun m!1342027 () Bool)

(assert (=> b!1454119 m!1342027))

(assert (=> b!1454119 m!1341991))

(assert (=> b!1454119 m!1341995))

(assert (=> b!1454119 m!1341997))

(declare-fun m!1342029 () Bool)

(assert (=> b!1454119 m!1342029))

(assert (=> b!1454119 m!1341999))

(assert (=> b!1454109 m!1341999))

(assert (=> b!1454109 m!1341999))

(declare-fun m!1342031 () Bool)

(assert (=> b!1454109 m!1342031))

(declare-fun m!1342033 () Bool)

(assert (=> b!1454126 m!1342033))

(declare-fun m!1342035 () Bool)

(assert (=> b!1454126 m!1342035))

(declare-fun m!1342037 () Bool)

(assert (=> b!1454121 m!1342037))

(assert (=> b!1454121 m!1342037))

(declare-fun m!1342039 () Bool)

(assert (=> b!1454121 m!1342039))

(declare-fun m!1342041 () Bool)

(assert (=> b!1454123 m!1342041))

(assert (=> b!1454123 m!1342033))

(assert (=> b!1454123 m!1342035))

(declare-fun m!1342043 () Bool)

(assert (=> b!1454114 m!1342043))

(check-sat (not b!1454115) (not b!1454123) (not b!1454120) (not b!1454112) (not b!1454117) (not b!1454119) (not b!1454127) (not b!1454122) (not b!1454113) (not b!1454121) (not start!124990) (not b!1454110) (not b!1454130) (not b!1454109) (not b!1454126) (not b!1454114))
(check-sat)
