; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126188 () Bool)

(assert start!126188)

(declare-fun b!1478056 () Bool)

(declare-fun res!1004113 () Bool)

(declare-fun e!829157 () Bool)

(assert (=> b!1478056 (=> (not res!1004113) (not e!829157))))

(declare-datatypes ((array!99294 0))(
  ( (array!99295 (arr!47926 (Array (_ BitVec 32) (_ BitVec 64))) (size!48476 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99294)

(declare-datatypes ((List!34427 0))(
  ( (Nil!34424) (Cons!34423 (h!35791 (_ BitVec 64)) (t!49121 List!34427)) )
))
(declare-fun arrayNoDuplicates!0 (array!99294 (_ BitVec 32) List!34427) Bool)

(assert (=> b!1478056 (= res!1004113 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34424))))

(declare-fun b!1478057 () Bool)

(declare-fun res!1004117 () Bool)

(declare-fun e!829152 () Bool)

(assert (=> b!1478057 (=> (not res!1004117) (not e!829152))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12166 0))(
  ( (MissingZero!12166 (index!51056 (_ BitVec 32))) (Found!12166 (index!51057 (_ BitVec 32))) (Intermediate!12166 (undefined!12978 Bool) (index!51058 (_ BitVec 32)) (x!132645 (_ BitVec 32))) (Undefined!12166) (MissingVacant!12166 (index!51059 (_ BitVec 32))) )
))
(declare-fun lt!645555 () SeekEntryResult!12166)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99294 (_ BitVec 32)) SeekEntryResult!12166)

(assert (=> b!1478057 (= res!1004117 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47926 a!2862) j!93) a!2862 mask!2687) lt!645555))))

(declare-fun b!1478058 () Bool)

(declare-fun res!1004119 () Bool)

(declare-fun e!829154 () Bool)

(assert (=> b!1478058 (=> (not res!1004119) (not e!829154))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1478058 (= res!1004119 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1478059 () Bool)

(declare-fun res!1004127 () Bool)

(assert (=> b!1478059 (=> (not res!1004127) (not e!829157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478059 (= res!1004127 (validKeyInArray!0 (select (arr!47926 a!2862) j!93)))))

(declare-fun b!1478060 () Bool)

(declare-fun e!829156 () Bool)

(assert (=> b!1478060 (= e!829157 e!829156)))

(declare-fun res!1004120 () Bool)

(assert (=> b!1478060 (=> (not res!1004120) (not e!829156))))

(assert (=> b!1478060 (= res!1004120 (= (select (store (arr!47926 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!645554 () array!99294)

(assert (=> b!1478060 (= lt!645554 (array!99295 (store (arr!47926 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48476 a!2862)))))

(declare-fun b!1478061 () Bool)

(assert (=> b!1478061 (= e!829156 e!829152)))

(declare-fun res!1004122 () Bool)

(assert (=> b!1478061 (=> (not res!1004122) (not e!829152))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478061 (= res!1004122 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47926 a!2862) j!93) mask!2687) (select (arr!47926 a!2862) j!93) a!2862 mask!2687) lt!645555))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1478061 (= lt!645555 (Intermediate!12166 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!829159 () Bool)

(declare-fun b!1478062 () Bool)

(declare-fun lt!645558 () (_ BitVec 64))

(declare-fun lt!645553 () SeekEntryResult!12166)

(assert (=> b!1478062 (= e!829159 (= lt!645553 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645558 lt!645554 mask!2687)))))

(declare-fun res!1004124 () Bool)

(assert (=> start!126188 (=> (not res!1004124) (not e!829157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126188 (= res!1004124 (validMask!0 mask!2687))))

(assert (=> start!126188 e!829157))

(assert (=> start!126188 true))

(declare-fun array_inv!36954 (array!99294) Bool)

(assert (=> start!126188 (array_inv!36954 a!2862)))

(declare-fun b!1478063 () Bool)

(assert (=> b!1478063 (= e!829154 (not true))))

(declare-fun e!829155 () Bool)

(assert (=> b!1478063 e!829155))

(declare-fun res!1004126 () Bool)

(assert (=> b!1478063 (=> (not res!1004126) (not e!829155))))

(declare-fun lt!645557 () SeekEntryResult!12166)

(assert (=> b!1478063 (= res!1004126 (and (= lt!645557 (Found!12166 j!93)) (or (= (select (arr!47926 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47926 a!2862) intermediateBeforeIndex!19) (select (arr!47926 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99294 (_ BitVec 32)) SeekEntryResult!12166)

(assert (=> b!1478063 (= lt!645557 (seekEntryOrOpen!0 (select (arr!47926 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99294 (_ BitVec 32)) Bool)

(assert (=> b!1478063 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49672 0))(
  ( (Unit!49673) )
))
(declare-fun lt!645556 () Unit!49672)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99294 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49672)

(assert (=> b!1478063 (= lt!645556 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1478064 () Bool)

(assert (=> b!1478064 (= e!829152 e!829154)))

(declare-fun res!1004116 () Bool)

(assert (=> b!1478064 (=> (not res!1004116) (not e!829154))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1478064 (= res!1004116 (= lt!645553 (Intermediate!12166 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1478064 (= lt!645553 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645558 mask!2687) lt!645558 lt!645554 mask!2687))))

(assert (=> b!1478064 (= lt!645558 (select (store (arr!47926 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1478065 () Bool)

(declare-fun e!829158 () Bool)

(assert (=> b!1478065 (= e!829158 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1478066 () Bool)

(declare-fun res!1004118 () Bool)

(assert (=> b!1478066 (=> (not res!1004118) (not e!829157))))

(assert (=> b!1478066 (= res!1004118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478067 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99294 (_ BitVec 32)) SeekEntryResult!12166)

(assert (=> b!1478067 (= e!829159 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645558 lt!645554 mask!2687) (seekEntryOrOpen!0 lt!645558 lt!645554 mask!2687)))))

(declare-fun b!1478068 () Bool)

(declare-fun res!1004115 () Bool)

(assert (=> b!1478068 (=> (not res!1004115) (not e!829157))))

(assert (=> b!1478068 (= res!1004115 (and (= (size!48476 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48476 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48476 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1478069 () Bool)

(declare-fun e!829153 () Bool)

(assert (=> b!1478069 (= e!829155 e!829153)))

(declare-fun res!1004121 () Bool)

(assert (=> b!1478069 (=> res!1004121 e!829153)))

(assert (=> b!1478069 (= res!1004121 (or (and (= (select (arr!47926 a!2862) index!646) (select (store (arr!47926 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47926 a!2862) index!646) (select (arr!47926 a!2862) j!93))) (not (= (select (arr!47926 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1478070 () Bool)

(declare-fun res!1004128 () Bool)

(assert (=> b!1478070 (=> (not res!1004128) (not e!829157))))

(assert (=> b!1478070 (= res!1004128 (validKeyInArray!0 (select (arr!47926 a!2862) i!1006)))))

(declare-fun b!1478071 () Bool)

(declare-fun res!1004114 () Bool)

(assert (=> b!1478071 (=> (not res!1004114) (not e!829157))))

(assert (=> b!1478071 (= res!1004114 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48476 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48476 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48476 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1478072 () Bool)

(assert (=> b!1478072 (= e!829153 e!829158)))

(declare-fun res!1004125 () Bool)

(assert (=> b!1478072 (=> (not res!1004125) (not e!829158))))

(assert (=> b!1478072 (= res!1004125 (= lt!645557 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47926 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478073 () Bool)

(declare-fun res!1004123 () Bool)

(assert (=> b!1478073 (=> (not res!1004123) (not e!829154))))

(assert (=> b!1478073 (= res!1004123 e!829159)))

(declare-fun c!136491 () Bool)

(assert (=> b!1478073 (= c!136491 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!126188 res!1004124) b!1478068))

(assert (= (and b!1478068 res!1004115) b!1478070))

(assert (= (and b!1478070 res!1004128) b!1478059))

(assert (= (and b!1478059 res!1004127) b!1478066))

(assert (= (and b!1478066 res!1004118) b!1478056))

(assert (= (and b!1478056 res!1004113) b!1478071))

(assert (= (and b!1478071 res!1004114) b!1478060))

(assert (= (and b!1478060 res!1004120) b!1478061))

(assert (= (and b!1478061 res!1004122) b!1478057))

(assert (= (and b!1478057 res!1004117) b!1478064))

(assert (= (and b!1478064 res!1004116) b!1478073))

(assert (= (and b!1478073 c!136491) b!1478062))

(assert (= (and b!1478073 (not c!136491)) b!1478067))

(assert (= (and b!1478073 res!1004123) b!1478058))

(assert (= (and b!1478058 res!1004119) b!1478063))

(assert (= (and b!1478063 res!1004126) b!1478069))

(assert (= (and b!1478069 (not res!1004121)) b!1478072))

(assert (= (and b!1478072 res!1004125) b!1478065))

(declare-fun m!1363983 () Bool)

(assert (=> b!1478061 m!1363983))

(assert (=> b!1478061 m!1363983))

(declare-fun m!1363985 () Bool)

(assert (=> b!1478061 m!1363985))

(assert (=> b!1478061 m!1363985))

(assert (=> b!1478061 m!1363983))

(declare-fun m!1363987 () Bool)

(assert (=> b!1478061 m!1363987))

(assert (=> b!1478059 m!1363983))

(assert (=> b!1478059 m!1363983))

(declare-fun m!1363989 () Bool)

(assert (=> b!1478059 m!1363989))

(assert (=> b!1478057 m!1363983))

(assert (=> b!1478057 m!1363983))

(declare-fun m!1363991 () Bool)

(assert (=> b!1478057 m!1363991))

(declare-fun m!1363993 () Bool)

(assert (=> b!1478056 m!1363993))

(declare-fun m!1363995 () Bool)

(assert (=> start!126188 m!1363995))

(declare-fun m!1363997 () Bool)

(assert (=> start!126188 m!1363997))

(declare-fun m!1363999 () Bool)

(assert (=> b!1478063 m!1363999))

(declare-fun m!1364001 () Bool)

(assert (=> b!1478063 m!1364001))

(assert (=> b!1478063 m!1363983))

(declare-fun m!1364003 () Bool)

(assert (=> b!1478063 m!1364003))

(declare-fun m!1364005 () Bool)

(assert (=> b!1478063 m!1364005))

(assert (=> b!1478063 m!1363983))

(declare-fun m!1364007 () Bool)

(assert (=> b!1478070 m!1364007))

(assert (=> b!1478070 m!1364007))

(declare-fun m!1364009 () Bool)

(assert (=> b!1478070 m!1364009))

(declare-fun m!1364011 () Bool)

(assert (=> b!1478060 m!1364011))

(declare-fun m!1364013 () Bool)

(assert (=> b!1478060 m!1364013))

(declare-fun m!1364015 () Bool)

(assert (=> b!1478069 m!1364015))

(assert (=> b!1478069 m!1364011))

(declare-fun m!1364017 () Bool)

(assert (=> b!1478069 m!1364017))

(assert (=> b!1478069 m!1363983))

(declare-fun m!1364019 () Bool)

(assert (=> b!1478064 m!1364019))

(assert (=> b!1478064 m!1364019))

(declare-fun m!1364021 () Bool)

(assert (=> b!1478064 m!1364021))

(assert (=> b!1478064 m!1364011))

(declare-fun m!1364023 () Bool)

(assert (=> b!1478064 m!1364023))

(assert (=> b!1478072 m!1363983))

(assert (=> b!1478072 m!1363983))

(declare-fun m!1364025 () Bool)

(assert (=> b!1478072 m!1364025))

(declare-fun m!1364027 () Bool)

(assert (=> b!1478062 m!1364027))

(declare-fun m!1364029 () Bool)

(assert (=> b!1478066 m!1364029))

(declare-fun m!1364031 () Bool)

(assert (=> b!1478067 m!1364031))

(declare-fun m!1364033 () Bool)

(assert (=> b!1478067 m!1364033))

(push 1)

