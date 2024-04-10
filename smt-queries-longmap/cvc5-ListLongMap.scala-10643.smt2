; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124996 () Bool)

(assert start!124996)

(declare-fun b!1453526 () Bool)

(declare-fun res!984529 () Bool)

(declare-fun e!818113 () Bool)

(assert (=> b!1453526 (=> (not res!984529) (not e!818113))))

(declare-datatypes ((array!98444 0))(
  ( (array!98445 (arr!47510 (Array (_ BitVec 32) (_ BitVec 64))) (size!48060 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98444)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11762 0))(
  ( (MissingZero!11762 (index!49440 (_ BitVec 32))) (Found!11762 (index!49441 (_ BitVec 32))) (Intermediate!11762 (undefined!12574 Bool) (index!49442 (_ BitVec 32)) (x!131083 (_ BitVec 32))) (Undefined!11762) (MissingVacant!11762 (index!49443 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98444 (_ BitVec 32)) SeekEntryResult!11762)

(assert (=> b!1453526 (= res!984529 (= (seekEntryOrOpen!0 (select (arr!47510 a!2862) j!93) a!2862 mask!2687) (Found!11762 j!93)))))

(declare-fun b!1453527 () Bool)

(declare-fun e!818112 () Bool)

(assert (=> b!1453527 (= e!818113 e!818112)))

(declare-fun res!984535 () Bool)

(assert (=> b!1453527 (=> res!984535 e!818112)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!637268 () (_ BitVec 64))

(assert (=> b!1453527 (= res!984535 (or (and (= (select (arr!47510 a!2862) index!646) lt!637268) (= (select (arr!47510 a!2862) index!646) (select (arr!47510 a!2862) j!93))) (= (select (arr!47510 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1453527 (= lt!637268 (select (store (arr!47510 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1453528 () Bool)

(declare-fun lt!637269 () array!98444)

(declare-fun lt!637266 () (_ BitVec 64))

(declare-fun e!818114 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98444 (_ BitVec 32)) SeekEntryResult!11762)

(assert (=> b!1453528 (= e!818114 (= (seekEntryOrOpen!0 lt!637266 lt!637269 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637266 lt!637269 mask!2687)))))

(declare-fun b!1453529 () Bool)

(declare-fun res!984541 () Bool)

(declare-fun e!818110 () Bool)

(assert (=> b!1453529 (=> (not res!984541) (not e!818110))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1453529 (= res!984541 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48060 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48060 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48060 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1453530 () Bool)

(declare-fun e!818115 () Bool)

(declare-fun e!818109 () Bool)

(assert (=> b!1453530 (= e!818115 e!818109)))

(declare-fun res!984532 () Bool)

(assert (=> b!1453530 (=> (not res!984532) (not e!818109))))

(declare-fun lt!637267 () SeekEntryResult!11762)

(assert (=> b!1453530 (= res!984532 (= lt!637267 (Intermediate!11762 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98444 (_ BitVec 32)) SeekEntryResult!11762)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453530 (= lt!637267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637266 mask!2687) lt!637266 lt!637269 mask!2687))))

(assert (=> b!1453530 (= lt!637266 (select (store (arr!47510 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1453531 () Bool)

(declare-fun res!984527 () Bool)

(assert (=> b!1453531 (=> (not res!984527) (not e!818109))))

(declare-fun e!818111 () Bool)

(assert (=> b!1453531 (= res!984527 e!818111)))

(declare-fun c!134010 () Bool)

(assert (=> b!1453531 (= c!134010 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1453532 () Bool)

(declare-fun res!984534 () Bool)

(assert (=> b!1453532 (=> (not res!984534) (not e!818110))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98444 (_ BitVec 32)) Bool)

(assert (=> b!1453532 (= res!984534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1453533 () Bool)

(assert (=> b!1453533 (= e!818111 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637266 lt!637269 mask!2687) (seekEntryOrOpen!0 lt!637266 lt!637269 mask!2687)))))

(declare-fun res!984536 () Bool)

(assert (=> start!124996 (=> (not res!984536) (not e!818110))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124996 (= res!984536 (validMask!0 mask!2687))))

(assert (=> start!124996 e!818110))

(assert (=> start!124996 true))

(declare-fun array_inv!36538 (array!98444) Bool)

(assert (=> start!124996 (array_inv!36538 a!2862)))

(declare-fun b!1453534 () Bool)

(declare-fun res!984544 () Bool)

(assert (=> b!1453534 (=> (not res!984544) (not e!818110))))

(declare-datatypes ((List!34011 0))(
  ( (Nil!34008) (Cons!34007 (h!35357 (_ BitVec 64)) (t!48705 List!34011)) )
))
(declare-fun arrayNoDuplicates!0 (array!98444 (_ BitVec 32) List!34011) Bool)

(assert (=> b!1453534 (= res!984544 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34008))))

(declare-fun b!1453535 () Bool)

(assert (=> b!1453535 (= e!818112 e!818114)))

(declare-fun res!984528 () Bool)

(assert (=> b!1453535 (=> (not res!984528) (not e!818114))))

(assert (=> b!1453535 (= res!984528 (and (= index!646 intermediateAfterIndex!19) (= lt!637268 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1453536 () Bool)

(declare-fun res!984543 () Bool)

(assert (=> b!1453536 (=> (not res!984543) (not e!818110))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453536 (= res!984543 (validKeyInArray!0 (select (arr!47510 a!2862) j!93)))))

(declare-fun b!1453537 () Bool)

(declare-fun e!818116 () Bool)

(assert (=> b!1453537 (= e!818110 e!818116)))

(declare-fun res!984537 () Bool)

(assert (=> b!1453537 (=> (not res!984537) (not e!818116))))

(assert (=> b!1453537 (= res!984537 (= (select (store (arr!47510 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1453537 (= lt!637269 (array!98445 (store (arr!47510 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48060 a!2862)))))

(declare-fun b!1453538 () Bool)

(declare-fun res!984530 () Bool)

(assert (=> b!1453538 (=> (not res!984530) (not e!818115))))

(declare-fun lt!637265 () SeekEntryResult!11762)

(assert (=> b!1453538 (= res!984530 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47510 a!2862) j!93) a!2862 mask!2687) lt!637265))))

(declare-fun b!1453539 () Bool)

(declare-fun res!984539 () Bool)

(assert (=> b!1453539 (=> (not res!984539) (not e!818109))))

(assert (=> b!1453539 (= res!984539 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1453540 () Bool)

(declare-fun res!984538 () Bool)

(assert (=> b!1453540 (=> (not res!984538) (not e!818110))))

(assert (=> b!1453540 (= res!984538 (validKeyInArray!0 (select (arr!47510 a!2862) i!1006)))))

(declare-fun b!1453541 () Bool)

(assert (=> b!1453541 (= e!818109 (not true))))

(assert (=> b!1453541 e!818113))

(declare-fun res!984531 () Bool)

(assert (=> b!1453541 (=> (not res!984531) (not e!818113))))

(assert (=> b!1453541 (= res!984531 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49020 0))(
  ( (Unit!49021) )
))
(declare-fun lt!637264 () Unit!49020)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98444 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49020)

(assert (=> b!1453541 (= lt!637264 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1453542 () Bool)

(declare-fun res!984542 () Bool)

(assert (=> b!1453542 (=> (not res!984542) (not e!818113))))

(assert (=> b!1453542 (= res!984542 (or (= (select (arr!47510 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47510 a!2862) intermediateBeforeIndex!19) (select (arr!47510 a!2862) j!93))))))

(declare-fun b!1453543 () Bool)

(assert (=> b!1453543 (= e!818111 (= lt!637267 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637266 lt!637269 mask!2687)))))

(declare-fun b!1453544 () Bool)

(assert (=> b!1453544 (= e!818116 e!818115)))

(declare-fun res!984533 () Bool)

(assert (=> b!1453544 (=> (not res!984533) (not e!818115))))

(assert (=> b!1453544 (= res!984533 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47510 a!2862) j!93) mask!2687) (select (arr!47510 a!2862) j!93) a!2862 mask!2687) lt!637265))))

(assert (=> b!1453544 (= lt!637265 (Intermediate!11762 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1453545 () Bool)

(declare-fun res!984540 () Bool)

(assert (=> b!1453545 (=> (not res!984540) (not e!818110))))

(assert (=> b!1453545 (= res!984540 (and (= (size!48060 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48060 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48060 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124996 res!984536) b!1453545))

(assert (= (and b!1453545 res!984540) b!1453540))

(assert (= (and b!1453540 res!984538) b!1453536))

(assert (= (and b!1453536 res!984543) b!1453532))

(assert (= (and b!1453532 res!984534) b!1453534))

(assert (= (and b!1453534 res!984544) b!1453529))

(assert (= (and b!1453529 res!984541) b!1453537))

(assert (= (and b!1453537 res!984537) b!1453544))

(assert (= (and b!1453544 res!984533) b!1453538))

(assert (= (and b!1453538 res!984530) b!1453530))

(assert (= (and b!1453530 res!984532) b!1453531))

(assert (= (and b!1453531 c!134010) b!1453543))

(assert (= (and b!1453531 (not c!134010)) b!1453533))

(assert (= (and b!1453531 res!984527) b!1453539))

(assert (= (and b!1453539 res!984539) b!1453541))

(assert (= (and b!1453541 res!984531) b!1453526))

(assert (= (and b!1453526 res!984529) b!1453542))

(assert (= (and b!1453542 res!984542) b!1453527))

(assert (= (and b!1453527 (not res!984535)) b!1453535))

(assert (= (and b!1453535 res!984528) b!1453528))

(declare-fun m!1341991 () Bool)

(assert (=> b!1453528 m!1341991))

(declare-fun m!1341993 () Bool)

(assert (=> b!1453528 m!1341993))

(declare-fun m!1341995 () Bool)

(assert (=> start!124996 m!1341995))

(declare-fun m!1341997 () Bool)

(assert (=> start!124996 m!1341997))

(declare-fun m!1341999 () Bool)

(assert (=> b!1453544 m!1341999))

(assert (=> b!1453544 m!1341999))

(declare-fun m!1342001 () Bool)

(assert (=> b!1453544 m!1342001))

(assert (=> b!1453544 m!1342001))

(assert (=> b!1453544 m!1341999))

(declare-fun m!1342003 () Bool)

(assert (=> b!1453544 m!1342003))

(declare-fun m!1342005 () Bool)

(assert (=> b!1453540 m!1342005))

(assert (=> b!1453540 m!1342005))

(declare-fun m!1342007 () Bool)

(assert (=> b!1453540 m!1342007))

(declare-fun m!1342009 () Bool)

(assert (=> b!1453537 m!1342009))

(declare-fun m!1342011 () Bool)

(assert (=> b!1453537 m!1342011))

(declare-fun m!1342013 () Bool)

(assert (=> b!1453530 m!1342013))

(assert (=> b!1453530 m!1342013))

(declare-fun m!1342015 () Bool)

(assert (=> b!1453530 m!1342015))

(assert (=> b!1453530 m!1342009))

(declare-fun m!1342017 () Bool)

(assert (=> b!1453530 m!1342017))

(declare-fun m!1342019 () Bool)

(assert (=> b!1453543 m!1342019))

(assert (=> b!1453538 m!1341999))

(assert (=> b!1453538 m!1341999))

(declare-fun m!1342021 () Bool)

(assert (=> b!1453538 m!1342021))

(assert (=> b!1453533 m!1341993))

(assert (=> b!1453533 m!1341991))

(declare-fun m!1342023 () Bool)

(assert (=> b!1453534 m!1342023))

(assert (=> b!1453526 m!1341999))

(assert (=> b!1453526 m!1341999))

(declare-fun m!1342025 () Bool)

(assert (=> b!1453526 m!1342025))

(declare-fun m!1342027 () Bool)

(assert (=> b!1453542 m!1342027))

(assert (=> b!1453542 m!1341999))

(declare-fun m!1342029 () Bool)

(assert (=> b!1453541 m!1342029))

(declare-fun m!1342031 () Bool)

(assert (=> b!1453541 m!1342031))

(declare-fun m!1342033 () Bool)

(assert (=> b!1453532 m!1342033))

(assert (=> b!1453536 m!1341999))

(assert (=> b!1453536 m!1341999))

(declare-fun m!1342035 () Bool)

(assert (=> b!1453536 m!1342035))

(declare-fun m!1342037 () Bool)

(assert (=> b!1453527 m!1342037))

(assert (=> b!1453527 m!1341999))

(assert (=> b!1453527 m!1342009))

(declare-fun m!1342039 () Bool)

(assert (=> b!1453527 m!1342039))

(push 1)

