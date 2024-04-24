; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125118 () Bool)

(assert start!125118)

(declare-fun b!1452272 () Bool)

(declare-fun res!982736 () Bool)

(declare-fun e!817840 () Bool)

(assert (=> b!1452272 (=> (not res!982736) (not e!817840))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11664 0))(
  ( (MissingZero!11664 (index!49048 (_ BitVec 32))) (Found!11664 (index!49049 (_ BitVec 32))) (Intermediate!11664 (undefined!12476 Bool) (index!49050 (_ BitVec 32)) (x!130881 (_ BitVec 32))) (Undefined!11664) (MissingVacant!11664 (index!49051 (_ BitVec 32))) )
))
(declare-fun lt!636978 () SeekEntryResult!11664)

(declare-datatypes ((array!98461 0))(
  ( (array!98462 (arr!47515 (Array (_ BitVec 32) (_ BitVec 64))) (size!48066 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98461)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98461 (_ BitVec 32)) SeekEntryResult!11664)

(assert (=> b!1452272 (= res!982736 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47515 a!2862) j!93) a!2862 mask!2687) lt!636978))))

(declare-fun b!1452273 () Bool)

(declare-fun res!982738 () Bool)

(declare-fun e!817838 () Bool)

(assert (=> b!1452273 (=> (not res!982738) (not e!817838))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1452273 (= res!982738 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452274 () Bool)

(declare-fun res!982751 () Bool)

(declare-fun e!817842 () Bool)

(assert (=> b!1452274 (=> (not res!982751) (not e!817842))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1452274 (= res!982751 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48066 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48066 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48066 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun e!817843 () Bool)

(declare-fun b!1452275 () Bool)

(assert (=> b!1452275 (= e!817843 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1452276 () Bool)

(declare-fun res!982747 () Bool)

(assert (=> b!1452276 (=> (not res!982747) (not e!817842))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452276 (= res!982747 (validKeyInArray!0 (select (arr!47515 a!2862) i!1006)))))

(declare-fun b!1452277 () Bool)

(declare-fun e!817836 () Bool)

(assert (=> b!1452277 (= e!817838 (not e!817836))))

(declare-fun res!982741 () Bool)

(assert (=> b!1452277 (=> res!982741 e!817836)))

(assert (=> b!1452277 (= res!982741 (or (and (= (select (arr!47515 a!2862) index!646) (select (store (arr!47515 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47515 a!2862) index!646) (select (arr!47515 a!2862) j!93))) (not (= (select (arr!47515 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47515 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!817835 () Bool)

(assert (=> b!1452277 e!817835))

(declare-fun res!982742 () Bool)

(assert (=> b!1452277 (=> (not res!982742) (not e!817835))))

(declare-fun lt!636979 () SeekEntryResult!11664)

(declare-fun lt!636975 () SeekEntryResult!11664)

(assert (=> b!1452277 (= res!982742 (and (= lt!636975 lt!636979) (or (= (select (arr!47515 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47515 a!2862) intermediateBeforeIndex!19) (select (arr!47515 a!2862) j!93)))))))

(assert (=> b!1452277 (= lt!636979 (Found!11664 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98461 (_ BitVec 32)) SeekEntryResult!11664)

(assert (=> b!1452277 (= lt!636975 (seekEntryOrOpen!0 (select (arr!47515 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98461 (_ BitVec 32)) Bool)

(assert (=> b!1452277 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48857 0))(
  ( (Unit!48858) )
))
(declare-fun lt!636972 () Unit!48857)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98461 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48857)

(assert (=> b!1452277 (= lt!636972 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!982746 () Bool)

(assert (=> start!125118 (=> (not res!982746) (not e!817842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125118 (= res!982746 (validMask!0 mask!2687))))

(assert (=> start!125118 e!817842))

(assert (=> start!125118 true))

(declare-fun array_inv!36796 (array!98461) Bool)

(assert (=> start!125118 (array_inv!36796 a!2862)))

(declare-fun b!1452278 () Bool)

(declare-fun res!982752 () Bool)

(assert (=> b!1452278 (=> res!982752 e!817836)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98461 (_ BitVec 32)) SeekEntryResult!11664)

(assert (=> b!1452278 (= res!982752 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47515 a!2862) j!93) a!2862 mask!2687) lt!636979)))))

(declare-fun lt!636977 () (_ BitVec 64))

(declare-fun e!817845 () Bool)

(declare-fun lt!636976 () array!98461)

(declare-fun b!1452279 () Bool)

(assert (=> b!1452279 (= e!817845 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636977 lt!636976 mask!2687) (seekEntryOrOpen!0 lt!636977 lt!636976 mask!2687)))))

(declare-fun lt!636974 () SeekEntryResult!11664)

(declare-fun b!1452280 () Bool)

(assert (=> b!1452280 (= e!817845 (= lt!636974 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636977 lt!636976 mask!2687)))))

(declare-fun b!1452281 () Bool)

(assert (=> b!1452281 (= e!817840 e!817838)))

(declare-fun res!982740 () Bool)

(assert (=> b!1452281 (=> (not res!982740) (not e!817838))))

(assert (=> b!1452281 (= res!982740 (= lt!636974 (Intermediate!11664 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452281 (= lt!636974 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636977 mask!2687) lt!636977 lt!636976 mask!2687))))

(assert (=> b!1452281 (= lt!636977 (select (store (arr!47515 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452282 () Bool)

(declare-fun e!817839 () Bool)

(assert (=> b!1452282 (= e!817839 e!817840)))

(declare-fun res!982750 () Bool)

(assert (=> b!1452282 (=> (not res!982750) (not e!817840))))

(assert (=> b!1452282 (= res!982750 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47515 a!2862) j!93) mask!2687) (select (arr!47515 a!2862) j!93) a!2862 mask!2687) lt!636978))))

(assert (=> b!1452282 (= lt!636978 (Intermediate!11664 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1452283 () Bool)

(declare-fun res!982743 () Bool)

(assert (=> b!1452283 (=> (not res!982743) (not e!817842))))

(assert (=> b!1452283 (= res!982743 (validKeyInArray!0 (select (arr!47515 a!2862) j!93)))))

(declare-fun b!1452284 () Bool)

(declare-fun e!817841 () Bool)

(assert (=> b!1452284 (= e!817835 e!817841)))

(declare-fun res!982754 () Bool)

(assert (=> b!1452284 (=> res!982754 e!817841)))

(assert (=> b!1452284 (= res!982754 (or (and (= (select (arr!47515 a!2862) index!646) (select (store (arr!47515 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47515 a!2862) index!646) (select (arr!47515 a!2862) j!93))) (not (= (select (arr!47515 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1452285 () Bool)

(declare-fun e!817837 () Bool)

(assert (=> b!1452285 (= e!817836 e!817837)))

(declare-fun res!982748 () Bool)

(assert (=> b!1452285 (=> res!982748 e!817837)))

(assert (=> b!1452285 (= res!982748 (bvslt mask!2687 #b00000000000000000000000000000000))))

(assert (=> b!1452285 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636977 lt!636976 mask!2687) lt!636979)))

(declare-fun lt!636973 () Unit!48857)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98461 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48857)

(assert (=> b!1452285 (= lt!636973 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1452286 () Bool)

(assert (=> b!1452286 (= e!817837 (validKeyInArray!0 lt!636977))))

(declare-fun b!1452287 () Bool)

(assert (=> b!1452287 (= e!817842 e!817839)))

(declare-fun res!982744 () Bool)

(assert (=> b!1452287 (=> (not res!982744) (not e!817839))))

(assert (=> b!1452287 (= res!982744 (= (select (store (arr!47515 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1452287 (= lt!636976 (array!98462 (store (arr!47515 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48066 a!2862)))))

(declare-fun b!1452288 () Bool)

(declare-fun res!982749 () Bool)

(assert (=> b!1452288 (=> (not res!982749) (not e!817842))))

(assert (=> b!1452288 (= res!982749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1452289 () Bool)

(assert (=> b!1452289 (= e!817841 e!817843)))

(declare-fun res!982745 () Bool)

(assert (=> b!1452289 (=> (not res!982745) (not e!817843))))

(assert (=> b!1452289 (= res!982745 (= lt!636975 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47515 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1452290 () Bool)

(declare-fun res!982737 () Bool)

(assert (=> b!1452290 (=> (not res!982737) (not e!817842))))

(assert (=> b!1452290 (= res!982737 (and (= (size!48066 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48066 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48066 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452291 () Bool)

(declare-fun res!982753 () Bool)

(assert (=> b!1452291 (=> (not res!982753) (not e!817838))))

(assert (=> b!1452291 (= res!982753 e!817845)))

(declare-fun c!134287 () Bool)

(assert (=> b!1452291 (= c!134287 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1452292 () Bool)

(declare-fun res!982739 () Bool)

(assert (=> b!1452292 (=> (not res!982739) (not e!817842))))

(declare-datatypes ((List!34003 0))(
  ( (Nil!34000) (Cons!33999 (h!35360 (_ BitVec 64)) (t!48689 List!34003)) )
))
(declare-fun arrayNoDuplicates!0 (array!98461 (_ BitVec 32) List!34003) Bool)

(assert (=> b!1452292 (= res!982739 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34000))))

(assert (= (and start!125118 res!982746) b!1452290))

(assert (= (and b!1452290 res!982737) b!1452276))

(assert (= (and b!1452276 res!982747) b!1452283))

(assert (= (and b!1452283 res!982743) b!1452288))

(assert (= (and b!1452288 res!982749) b!1452292))

(assert (= (and b!1452292 res!982739) b!1452274))

(assert (= (and b!1452274 res!982751) b!1452287))

(assert (= (and b!1452287 res!982744) b!1452282))

(assert (= (and b!1452282 res!982750) b!1452272))

(assert (= (and b!1452272 res!982736) b!1452281))

(assert (= (and b!1452281 res!982740) b!1452291))

(assert (= (and b!1452291 c!134287) b!1452280))

(assert (= (and b!1452291 (not c!134287)) b!1452279))

(assert (= (and b!1452291 res!982753) b!1452273))

(assert (= (and b!1452273 res!982738) b!1452277))

(assert (= (and b!1452277 res!982742) b!1452284))

(assert (= (and b!1452284 (not res!982754)) b!1452289))

(assert (= (and b!1452289 res!982745) b!1452275))

(assert (= (and b!1452277 (not res!982741)) b!1452278))

(assert (= (and b!1452278 (not res!982752)) b!1452285))

(assert (= (and b!1452285 (not res!982748)) b!1452286))

(declare-fun m!1340995 () Bool)

(assert (=> b!1452288 m!1340995))

(declare-fun m!1340997 () Bool)

(assert (=> b!1452286 m!1340997))

(declare-fun m!1340999 () Bool)

(assert (=> b!1452289 m!1340999))

(assert (=> b!1452289 m!1340999))

(declare-fun m!1341001 () Bool)

(assert (=> b!1452289 m!1341001))

(assert (=> b!1452272 m!1340999))

(assert (=> b!1452272 m!1340999))

(declare-fun m!1341003 () Bool)

(assert (=> b!1452272 m!1341003))

(declare-fun m!1341005 () Bool)

(assert (=> b!1452280 m!1341005))

(assert (=> b!1452282 m!1340999))

(assert (=> b!1452282 m!1340999))

(declare-fun m!1341007 () Bool)

(assert (=> b!1452282 m!1341007))

(assert (=> b!1452282 m!1341007))

(assert (=> b!1452282 m!1340999))

(declare-fun m!1341009 () Bool)

(assert (=> b!1452282 m!1341009))

(declare-fun m!1341011 () Bool)

(assert (=> b!1452277 m!1341011))

(declare-fun m!1341013 () Bool)

(assert (=> b!1452277 m!1341013))

(declare-fun m!1341015 () Bool)

(assert (=> b!1452277 m!1341015))

(declare-fun m!1341017 () Bool)

(assert (=> b!1452277 m!1341017))

(declare-fun m!1341019 () Bool)

(assert (=> b!1452277 m!1341019))

(assert (=> b!1452277 m!1340999))

(declare-fun m!1341021 () Bool)

(assert (=> b!1452277 m!1341021))

(declare-fun m!1341023 () Bool)

(assert (=> b!1452277 m!1341023))

(assert (=> b!1452277 m!1340999))

(assert (=> b!1452284 m!1341019))

(assert (=> b!1452284 m!1341013))

(assert (=> b!1452284 m!1341017))

(assert (=> b!1452284 m!1340999))

(declare-fun m!1341025 () Bool)

(assert (=> b!1452281 m!1341025))

(assert (=> b!1452281 m!1341025))

(declare-fun m!1341027 () Bool)

(assert (=> b!1452281 m!1341027))

(assert (=> b!1452281 m!1341013))

(declare-fun m!1341029 () Bool)

(assert (=> b!1452281 m!1341029))

(declare-fun m!1341031 () Bool)

(assert (=> start!125118 m!1341031))

(declare-fun m!1341033 () Bool)

(assert (=> start!125118 m!1341033))

(assert (=> b!1452287 m!1341013))

(declare-fun m!1341035 () Bool)

(assert (=> b!1452287 m!1341035))

(declare-fun m!1341037 () Bool)

(assert (=> b!1452292 m!1341037))

(assert (=> b!1452278 m!1340999))

(assert (=> b!1452278 m!1340999))

(declare-fun m!1341039 () Bool)

(assert (=> b!1452278 m!1341039))

(assert (=> b!1452283 m!1340999))

(assert (=> b!1452283 m!1340999))

(declare-fun m!1341041 () Bool)

(assert (=> b!1452283 m!1341041))

(declare-fun m!1341043 () Bool)

(assert (=> b!1452279 m!1341043))

(declare-fun m!1341045 () Bool)

(assert (=> b!1452279 m!1341045))

(assert (=> b!1452285 m!1341043))

(declare-fun m!1341047 () Bool)

(assert (=> b!1452285 m!1341047))

(declare-fun m!1341049 () Bool)

(assert (=> b!1452276 m!1341049))

(assert (=> b!1452276 m!1341049))

(declare-fun m!1341051 () Bool)

(assert (=> b!1452276 m!1341051))

(check-sat (not b!1452277) (not b!1452286) (not b!1452285) (not b!1452278) (not b!1452283) (not b!1452276) (not b!1452292) (not b!1452280) (not b!1452279) (not b!1452288) (not b!1452289) (not b!1452282) (not start!125118) (not b!1452281) (not b!1452272))
(check-sat)
