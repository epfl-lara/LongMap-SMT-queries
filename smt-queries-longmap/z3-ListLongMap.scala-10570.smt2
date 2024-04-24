; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124776 () Bool)

(assert start!124776)

(declare-fun b!1442999 () Bool)

(declare-fun res!974493 () Bool)

(declare-fun e!813510 () Bool)

(assert (=> b!1442999 (=> (not res!974493) (not e!813510))))

(declare-datatypes ((array!98119 0))(
  ( (array!98120 (arr!47344 (Array (_ BitVec 32) (_ BitVec 64))) (size!47895 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98119)

(declare-datatypes ((List!33832 0))(
  ( (Nil!33829) (Cons!33828 (h!35189 (_ BitVec 64)) (t!48518 List!33832)) )
))
(declare-fun arrayNoDuplicates!0 (array!98119 (_ BitVec 32) List!33832) Bool)

(assert (=> b!1442999 (= res!974493 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33829))))

(declare-fun b!1443000 () Bool)

(declare-fun res!974491 () Bool)

(assert (=> b!1443000 (=> (not res!974491) (not e!813510))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1443000 (= res!974491 (and (= (size!47895 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47895 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47895 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1443001 () Bool)

(declare-fun res!974494 () Bool)

(assert (=> b!1443001 (=> (not res!974494) (not e!813510))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443001 (= res!974494 (validKeyInArray!0 (select (arr!47344 a!2862) j!93)))))

(declare-fun res!974490 () Bool)

(assert (=> start!124776 (=> (not res!974490) (not e!813510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124776 (= res!974490 (validMask!0 mask!2687))))

(assert (=> start!124776 e!813510))

(assert (=> start!124776 true))

(declare-fun array_inv!36625 (array!98119) Bool)

(assert (=> start!124776 (array_inv!36625 a!2862)))

(declare-fun b!1443002 () Bool)

(declare-fun e!813506 () Bool)

(assert (=> b!1443002 (= e!813506 (not (bvsge mask!2687 #b00000000000000000000000000000000)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98119 (_ BitVec 32)) Bool)

(assert (=> b!1443002 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48515 0))(
  ( (Unit!48516) )
))
(declare-fun lt!633802 () Unit!48515)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98119 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48515)

(assert (=> b!1443002 (= lt!633802 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1443003 () Bool)

(declare-fun res!974496 () Bool)

(assert (=> b!1443003 (=> (not res!974496) (not e!813510))))

(assert (=> b!1443003 (= res!974496 (validKeyInArray!0 (select (arr!47344 a!2862) i!1006)))))

(declare-fun b!1443004 () Bool)

(declare-fun res!974495 () Bool)

(assert (=> b!1443004 (=> (not res!974495) (not e!813510))))

(assert (=> b!1443004 (= res!974495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!633799 () array!98119)

(declare-fun lt!633800 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!813507 () Bool)

(declare-fun b!1443005 () Bool)

(declare-datatypes ((SeekEntryResult!11493 0))(
  ( (MissingZero!11493 (index!48364 (_ BitVec 32))) (Found!11493 (index!48365 (_ BitVec 32))) (Intermediate!11493 (undefined!12305 Bool) (index!48366 (_ BitVec 32)) (x!130254 (_ BitVec 32))) (Undefined!11493) (MissingVacant!11493 (index!48367 (_ BitVec 32))) )
))
(declare-fun lt!633798 () SeekEntryResult!11493)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98119 (_ BitVec 32)) SeekEntryResult!11493)

(assert (=> b!1443005 (= e!813507 (= lt!633798 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633800 lt!633799 mask!2687)))))

(declare-fun b!1443006 () Bool)

(declare-fun res!974501 () Bool)

(assert (=> b!1443006 (=> (not res!974501) (not e!813510))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1443006 (= res!974501 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47895 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47895 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47895 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443007 () Bool)

(declare-fun e!813505 () Bool)

(declare-fun e!813508 () Bool)

(assert (=> b!1443007 (= e!813505 e!813508)))

(declare-fun res!974489 () Bool)

(assert (=> b!1443007 (=> (not res!974489) (not e!813508))))

(declare-fun lt!633801 () SeekEntryResult!11493)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443007 (= res!974489 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47344 a!2862) j!93) mask!2687) (select (arr!47344 a!2862) j!93) a!2862 mask!2687) lt!633801))))

(assert (=> b!1443007 (= lt!633801 (Intermediate!11493 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443008 () Bool)

(declare-fun res!974500 () Bool)

(assert (=> b!1443008 (=> (not res!974500) (not e!813506))))

(assert (=> b!1443008 (= res!974500 e!813507)))

(declare-fun c!133774 () Bool)

(assert (=> b!1443008 (= c!133774 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443009 () Bool)

(declare-fun res!974492 () Bool)

(assert (=> b!1443009 (=> (not res!974492) (not e!813508))))

(assert (=> b!1443009 (= res!974492 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47344 a!2862) j!93) a!2862 mask!2687) lt!633801))))

(declare-fun b!1443010 () Bool)

(declare-fun res!974499 () Bool)

(assert (=> b!1443010 (=> (not res!974499) (not e!813506))))

(assert (=> b!1443010 (= res!974499 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1443011 () Bool)

(assert (=> b!1443011 (= e!813510 e!813505)))

(declare-fun res!974497 () Bool)

(assert (=> b!1443011 (=> (not res!974497) (not e!813505))))

(assert (=> b!1443011 (= res!974497 (= (select (store (arr!47344 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1443011 (= lt!633799 (array!98120 (store (arr!47344 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47895 a!2862)))))

(declare-fun b!1443012 () Bool)

(assert (=> b!1443012 (= e!813508 e!813506)))

(declare-fun res!974498 () Bool)

(assert (=> b!1443012 (=> (not res!974498) (not e!813506))))

(assert (=> b!1443012 (= res!974498 (= lt!633798 (Intermediate!11493 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1443012 (= lt!633798 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633800 mask!2687) lt!633800 lt!633799 mask!2687))))

(assert (=> b!1443012 (= lt!633800 (select (store (arr!47344 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443013 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98119 (_ BitVec 32)) SeekEntryResult!11493)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98119 (_ BitVec 32)) SeekEntryResult!11493)

(assert (=> b!1443013 (= e!813507 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633800 lt!633799 mask!2687) (seekEntryOrOpen!0 lt!633800 lt!633799 mask!2687)))))

(assert (= (and start!124776 res!974490) b!1443000))

(assert (= (and b!1443000 res!974491) b!1443003))

(assert (= (and b!1443003 res!974496) b!1443001))

(assert (= (and b!1443001 res!974494) b!1443004))

(assert (= (and b!1443004 res!974495) b!1442999))

(assert (= (and b!1442999 res!974493) b!1443006))

(assert (= (and b!1443006 res!974501) b!1443011))

(assert (= (and b!1443011 res!974497) b!1443007))

(assert (= (and b!1443007 res!974489) b!1443009))

(assert (= (and b!1443009 res!974492) b!1443012))

(assert (= (and b!1443012 res!974498) b!1443008))

(assert (= (and b!1443008 c!133774) b!1443005))

(assert (= (and b!1443008 (not c!133774)) b!1443013))

(assert (= (and b!1443008 res!974500) b!1443010))

(assert (= (and b!1443010 res!974499) b!1443002))

(declare-fun m!1332319 () Bool)

(assert (=> b!1442999 m!1332319))

(declare-fun m!1332321 () Bool)

(assert (=> b!1443004 m!1332321))

(declare-fun m!1332323 () Bool)

(assert (=> b!1443007 m!1332323))

(assert (=> b!1443007 m!1332323))

(declare-fun m!1332325 () Bool)

(assert (=> b!1443007 m!1332325))

(assert (=> b!1443007 m!1332325))

(assert (=> b!1443007 m!1332323))

(declare-fun m!1332327 () Bool)

(assert (=> b!1443007 m!1332327))

(declare-fun m!1332329 () Bool)

(assert (=> b!1443005 m!1332329))

(assert (=> b!1443001 m!1332323))

(assert (=> b!1443001 m!1332323))

(declare-fun m!1332331 () Bool)

(assert (=> b!1443001 m!1332331))

(declare-fun m!1332333 () Bool)

(assert (=> b!1443011 m!1332333))

(declare-fun m!1332335 () Bool)

(assert (=> b!1443011 m!1332335))

(declare-fun m!1332337 () Bool)

(assert (=> b!1443012 m!1332337))

(assert (=> b!1443012 m!1332337))

(declare-fun m!1332339 () Bool)

(assert (=> b!1443012 m!1332339))

(assert (=> b!1443012 m!1332333))

(declare-fun m!1332341 () Bool)

(assert (=> b!1443012 m!1332341))

(declare-fun m!1332343 () Bool)

(assert (=> start!124776 m!1332343))

(declare-fun m!1332345 () Bool)

(assert (=> start!124776 m!1332345))

(declare-fun m!1332347 () Bool)

(assert (=> b!1443002 m!1332347))

(declare-fun m!1332349 () Bool)

(assert (=> b!1443002 m!1332349))

(declare-fun m!1332351 () Bool)

(assert (=> b!1443003 m!1332351))

(assert (=> b!1443003 m!1332351))

(declare-fun m!1332353 () Bool)

(assert (=> b!1443003 m!1332353))

(declare-fun m!1332355 () Bool)

(assert (=> b!1443013 m!1332355))

(declare-fun m!1332357 () Bool)

(assert (=> b!1443013 m!1332357))

(assert (=> b!1443009 m!1332323))

(assert (=> b!1443009 m!1332323))

(declare-fun m!1332359 () Bool)

(assert (=> b!1443009 m!1332359))

(check-sat (not b!1443013) (not b!1443003) (not b!1443007) (not b!1443002) (not b!1442999) (not b!1443012) (not b!1443004) (not start!124776) (not b!1443005) (not b!1443009) (not b!1443001))
(check-sat)
