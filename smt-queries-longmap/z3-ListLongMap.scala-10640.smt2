; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125196 () Bool)

(assert start!125196)

(declare-fun b!1454313 () Bool)

(declare-fun res!984559 () Bool)

(declare-fun e!818709 () Bool)

(assert (=> b!1454313 (=> (not res!984559) (not e!818709))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98539 0))(
  ( (array!98540 (arr!47554 (Array (_ BitVec 32) (_ BitVec 64))) (size!48105 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98539)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1454313 (= res!984559 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48105 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48105 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48105 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1454314 () Bool)

(declare-fun e!818705 () Bool)

(declare-fun e!818706 () Bool)

(assert (=> b!1454314 (= e!818705 e!818706)))

(declare-fun res!984549 () Bool)

(assert (=> b!1454314 (=> res!984549 e!818706)))

(declare-fun lt!637581 () (_ BitVec 64))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1454314 (= res!984549 (or (and (= (select (arr!47554 a!2862) index!646) lt!637581) (= (select (arr!47554 a!2862) index!646) (select (arr!47554 a!2862) j!93))) (= (select (arr!47554 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1454314 (= lt!637581 (select (store (arr!47554 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1454315 () Bool)

(declare-fun res!984551 () Bool)

(assert (=> b!1454315 (=> (not res!984551) (not e!818709))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1454315 (= res!984551 (validKeyInArray!0 (select (arr!47554 a!2862) i!1006)))))

(declare-fun b!1454316 () Bool)

(declare-fun e!818708 () Bool)

(assert (=> b!1454316 (= e!818706 e!818708)))

(declare-fun res!984556 () Bool)

(assert (=> b!1454316 (=> (not res!984556) (not e!818708))))

(assert (=> b!1454316 (= res!984556 (and (= index!646 intermediateAfterIndex!19) (= lt!637581 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!637585 () array!98539)

(declare-fun lt!637584 () (_ BitVec 64))

(declare-fun b!1454317 () Bool)

(declare-datatypes ((SeekEntryResult!11703 0))(
  ( (MissingZero!11703 (index!49204 (_ BitVec 32))) (Found!11703 (index!49205 (_ BitVec 32))) (Intermediate!11703 (undefined!12515 Bool) (index!49206 (_ BitVec 32)) (x!131024 (_ BitVec 32))) (Undefined!11703) (MissingVacant!11703 (index!49207 (_ BitVec 32))) )
))
(declare-fun lt!637580 () SeekEntryResult!11703)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!818704 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98539 (_ BitVec 32)) SeekEntryResult!11703)

(assert (=> b!1454317 (= e!818704 (= lt!637580 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637584 lt!637585 mask!2687)))))

(declare-fun b!1454318 () Bool)

(declare-fun res!984544 () Bool)

(assert (=> b!1454318 (=> (not res!984544) (not e!818705))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98539 (_ BitVec 32)) SeekEntryResult!11703)

(assert (=> b!1454318 (= res!984544 (= (seekEntryOrOpen!0 (select (arr!47554 a!2862) j!93) a!2862 mask!2687) (Found!11703 j!93)))))

(declare-fun b!1454319 () Bool)

(declare-fun res!984558 () Bool)

(declare-fun e!818712 () Bool)

(assert (=> b!1454319 (=> (not res!984558) (not e!818712))))

(assert (=> b!1454319 (= res!984558 e!818704)))

(declare-fun c!134404 () Bool)

(assert (=> b!1454319 (= c!134404 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1454320 () Bool)

(declare-fun e!818710 () Bool)

(assert (=> b!1454320 (= e!818709 e!818710)))

(declare-fun res!984547 () Bool)

(assert (=> b!1454320 (=> (not res!984547) (not e!818710))))

(assert (=> b!1454320 (= res!984547 (= (select (store (arr!47554 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1454320 (= lt!637585 (array!98540 (store (arr!47554 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48105 a!2862)))))

(declare-fun b!1454321 () Bool)

(declare-fun res!984552 () Bool)

(assert (=> b!1454321 (=> (not res!984552) (not e!818709))))

(declare-datatypes ((List!34042 0))(
  ( (Nil!34039) (Cons!34038 (h!35399 (_ BitVec 64)) (t!48728 List!34042)) )
))
(declare-fun arrayNoDuplicates!0 (array!98539 (_ BitVec 32) List!34042) Bool)

(assert (=> b!1454321 (= res!984552 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34039))))

(declare-fun res!984560 () Bool)

(assert (=> start!125196 (=> (not res!984560) (not e!818709))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125196 (= res!984560 (validMask!0 mask!2687))))

(assert (=> start!125196 e!818709))

(assert (=> start!125196 true))

(declare-fun array_inv!36835 (array!98539) Bool)

(assert (=> start!125196 (array_inv!36835 a!2862)))

(declare-fun b!1454322 () Bool)

(declare-fun res!984550 () Bool)

(assert (=> b!1454322 (=> (not res!984550) (not e!818709))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98539 (_ BitVec 32)) Bool)

(assert (=> b!1454322 (= res!984550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1454323 () Bool)

(declare-fun res!984543 () Bool)

(assert (=> b!1454323 (=> (not res!984543) (not e!818709))))

(assert (=> b!1454323 (= res!984543 (and (= (size!48105 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48105 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48105 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1454324 () Bool)

(declare-fun e!818707 () Bool)

(assert (=> b!1454324 (= e!818710 e!818707)))

(declare-fun res!984548 () Bool)

(assert (=> b!1454324 (=> (not res!984548) (not e!818707))))

(declare-fun lt!637583 () SeekEntryResult!11703)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454324 (= res!984548 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47554 a!2862) j!93) mask!2687) (select (arr!47554 a!2862) j!93) a!2862 mask!2687) lt!637583))))

(assert (=> b!1454324 (= lt!637583 (Intermediate!11703 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1454325 () Bool)

(declare-fun res!984545 () Bool)

(assert (=> b!1454325 (=> (not res!984545) (not e!818707))))

(assert (=> b!1454325 (= res!984545 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47554 a!2862) j!93) a!2862 mask!2687) lt!637583))))

(declare-fun b!1454326 () Bool)

(declare-fun res!984553 () Bool)

(assert (=> b!1454326 (=> (not res!984553) (not e!818705))))

(assert (=> b!1454326 (= res!984553 (or (= (select (arr!47554 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47554 a!2862) intermediateBeforeIndex!19) (select (arr!47554 a!2862) j!93))))))

(declare-fun b!1454327 () Bool)

(declare-fun res!984557 () Bool)

(assert (=> b!1454327 (=> (not res!984557) (not e!818709))))

(assert (=> b!1454327 (= res!984557 (validKeyInArray!0 (select (arr!47554 a!2862) j!93)))))

(declare-fun b!1454328 () Bool)

(assert (=> b!1454328 (= e!818712 (not true))))

(assert (=> b!1454328 e!818705))

(declare-fun res!984554 () Bool)

(assert (=> b!1454328 (=> (not res!984554) (not e!818705))))

(assert (=> b!1454328 (= res!984554 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48935 0))(
  ( (Unit!48936) )
))
(declare-fun lt!637582 () Unit!48935)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98539 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48935)

(assert (=> b!1454328 (= lt!637582 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1454329 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98539 (_ BitVec 32)) SeekEntryResult!11703)

(assert (=> b!1454329 (= e!818708 (= (seekEntryOrOpen!0 lt!637584 lt!637585 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637584 lt!637585 mask!2687)))))

(declare-fun b!1454330 () Bool)

(assert (=> b!1454330 (= e!818707 e!818712)))

(declare-fun res!984555 () Bool)

(assert (=> b!1454330 (=> (not res!984555) (not e!818712))))

(assert (=> b!1454330 (= res!984555 (= lt!637580 (Intermediate!11703 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1454330 (= lt!637580 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637584 mask!2687) lt!637584 lt!637585 mask!2687))))

(assert (=> b!1454330 (= lt!637584 (select (store (arr!47554 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1454331 () Bool)

(declare-fun res!984546 () Bool)

(assert (=> b!1454331 (=> (not res!984546) (not e!818712))))

(assert (=> b!1454331 (= res!984546 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1454332 () Bool)

(assert (=> b!1454332 (= e!818704 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637584 lt!637585 mask!2687) (seekEntryOrOpen!0 lt!637584 lt!637585 mask!2687)))))

(assert (= (and start!125196 res!984560) b!1454323))

(assert (= (and b!1454323 res!984543) b!1454315))

(assert (= (and b!1454315 res!984551) b!1454327))

(assert (= (and b!1454327 res!984557) b!1454322))

(assert (= (and b!1454322 res!984550) b!1454321))

(assert (= (and b!1454321 res!984552) b!1454313))

(assert (= (and b!1454313 res!984559) b!1454320))

(assert (= (and b!1454320 res!984547) b!1454324))

(assert (= (and b!1454324 res!984548) b!1454325))

(assert (= (and b!1454325 res!984545) b!1454330))

(assert (= (and b!1454330 res!984555) b!1454319))

(assert (= (and b!1454319 c!134404) b!1454317))

(assert (= (and b!1454319 (not c!134404)) b!1454332))

(assert (= (and b!1454319 res!984558) b!1454331))

(assert (= (and b!1454331 res!984546) b!1454328))

(assert (= (and b!1454328 res!984554) b!1454318))

(assert (= (and b!1454318 res!984544) b!1454326))

(assert (= (and b!1454326 res!984553) b!1454314))

(assert (= (and b!1454314 (not res!984549)) b!1454316))

(assert (= (and b!1454316 res!984556) b!1454329))

(declare-fun m!1342981 () Bool)

(assert (=> b!1454315 m!1342981))

(assert (=> b!1454315 m!1342981))

(declare-fun m!1342983 () Bool)

(assert (=> b!1454315 m!1342983))

(declare-fun m!1342985 () Bool)

(assert (=> b!1454326 m!1342985))

(declare-fun m!1342987 () Bool)

(assert (=> b!1454326 m!1342987))

(declare-fun m!1342989 () Bool)

(assert (=> b!1454329 m!1342989))

(declare-fun m!1342991 () Bool)

(assert (=> b!1454329 m!1342991))

(declare-fun m!1342993 () Bool)

(assert (=> b!1454330 m!1342993))

(assert (=> b!1454330 m!1342993))

(declare-fun m!1342995 () Bool)

(assert (=> b!1454330 m!1342995))

(declare-fun m!1342997 () Bool)

(assert (=> b!1454330 m!1342997))

(declare-fun m!1342999 () Bool)

(assert (=> b!1454330 m!1342999))

(assert (=> b!1454332 m!1342991))

(assert (=> b!1454332 m!1342989))

(declare-fun m!1343001 () Bool)

(assert (=> start!125196 m!1343001))

(declare-fun m!1343003 () Bool)

(assert (=> start!125196 m!1343003))

(assert (=> b!1454320 m!1342997))

(declare-fun m!1343005 () Bool)

(assert (=> b!1454320 m!1343005))

(declare-fun m!1343007 () Bool)

(assert (=> b!1454328 m!1343007))

(declare-fun m!1343009 () Bool)

(assert (=> b!1454328 m!1343009))

(assert (=> b!1454324 m!1342987))

(assert (=> b!1454324 m!1342987))

(declare-fun m!1343011 () Bool)

(assert (=> b!1454324 m!1343011))

(assert (=> b!1454324 m!1343011))

(assert (=> b!1454324 m!1342987))

(declare-fun m!1343013 () Bool)

(assert (=> b!1454324 m!1343013))

(declare-fun m!1343015 () Bool)

(assert (=> b!1454322 m!1343015))

(assert (=> b!1454318 m!1342987))

(assert (=> b!1454318 m!1342987))

(declare-fun m!1343017 () Bool)

(assert (=> b!1454318 m!1343017))

(assert (=> b!1454325 m!1342987))

(assert (=> b!1454325 m!1342987))

(declare-fun m!1343019 () Bool)

(assert (=> b!1454325 m!1343019))

(declare-fun m!1343021 () Bool)

(assert (=> b!1454317 m!1343021))

(declare-fun m!1343023 () Bool)

(assert (=> b!1454321 m!1343023))

(assert (=> b!1454327 m!1342987))

(assert (=> b!1454327 m!1342987))

(declare-fun m!1343025 () Bool)

(assert (=> b!1454327 m!1343025))

(declare-fun m!1343027 () Bool)

(assert (=> b!1454314 m!1343027))

(assert (=> b!1454314 m!1342987))

(assert (=> b!1454314 m!1342997))

(declare-fun m!1343029 () Bool)

(assert (=> b!1454314 m!1343029))

(check-sat (not b!1454318) (not b!1454325) (not b!1454321) (not b!1454332) (not b!1454328) (not b!1454327) (not b!1454317) (not start!125196) (not b!1454322) (not b!1454315) (not b!1454324) (not b!1454329) (not b!1454330))
(check-sat)
