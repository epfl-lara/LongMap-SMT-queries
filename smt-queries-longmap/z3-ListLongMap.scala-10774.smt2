; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126420 () Bool)

(assert start!126420)

(declare-fun b!1478522 () Bool)

(declare-fun e!829594 () Bool)

(declare-fun e!829598 () Bool)

(assert (=> b!1478522 (= e!829594 e!829598)))

(declare-fun res!1003624 () Bool)

(assert (=> b!1478522 (=> res!1003624 e!829598)))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99364 0))(
  ( (array!99365 (arr!47956 (Array (_ BitVec 32) (_ BitVec 64))) (size!48507 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99364)

(assert (=> b!1478522 (= res!1003624 (or (and (= (select (arr!47956 a!2862) index!646) (select (store (arr!47956 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47956 a!2862) index!646) (select (arr!47956 a!2862) j!93))) (not (= (select (arr!47956 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1478523 () Bool)

(declare-fun res!1003631 () Bool)

(declare-fun e!829595 () Bool)

(assert (=> b!1478523 (=> (not res!1003631) (not e!829595))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1478523 (= res!1003631 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48507 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48507 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48507 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1478524 () Bool)

(declare-fun res!1003628 () Bool)

(declare-fun e!829599 () Bool)

(assert (=> b!1478524 (=> (not res!1003628) (not e!829599))))

(assert (=> b!1478524 (= res!1003628 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1478525 () Bool)

(declare-fun e!829600 () Bool)

(assert (=> b!1478525 (= e!829595 e!829600)))

(declare-fun res!1003627 () Bool)

(assert (=> b!1478525 (=> (not res!1003627) (not e!829600))))

(assert (=> b!1478525 (= res!1003627 (= (select (store (arr!47956 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!645780 () array!99364)

(assert (=> b!1478525 (= lt!645780 (array!99365 (store (arr!47956 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48507 a!2862)))))

(declare-fun b!1478526 () Bool)

(declare-fun res!1003633 () Bool)

(assert (=> b!1478526 (=> (not res!1003633) (not e!829595))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478526 (= res!1003633 (validKeyInArray!0 (select (arr!47956 a!2862) j!93)))))

(declare-fun b!1478527 () Bool)

(declare-fun res!1003626 () Bool)

(declare-fun e!829601 () Bool)

(assert (=> b!1478527 (=> (not res!1003626) (not e!829601))))

(declare-datatypes ((SeekEntryResult!12093 0))(
  ( (MissingZero!12093 (index!50764 (_ BitVec 32))) (Found!12093 (index!50765 (_ BitVec 32))) (Intermediate!12093 (undefined!12905 Bool) (index!50766 (_ BitVec 32)) (x!132549 (_ BitVec 32))) (Undefined!12093) (MissingVacant!12093 (index!50767 (_ BitVec 32))) )
))
(declare-fun lt!645781 () SeekEntryResult!12093)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99364 (_ BitVec 32)) SeekEntryResult!12093)

(assert (=> b!1478527 (= res!1003626 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47956 a!2862) j!93) a!2862 mask!2687) lt!645781))))

(declare-fun b!1478528 () Bool)

(assert (=> b!1478528 (= e!829599 (not true))))

(assert (=> b!1478528 e!829594))

(declare-fun res!1003621 () Bool)

(assert (=> b!1478528 (=> (not res!1003621) (not e!829594))))

(declare-fun lt!645776 () SeekEntryResult!12093)

(assert (=> b!1478528 (= res!1003621 (and (= lt!645776 (Found!12093 j!93)) (or (= (select (arr!47956 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47956 a!2862) intermediateBeforeIndex!19) (select (arr!47956 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99364 (_ BitVec 32)) SeekEntryResult!12093)

(assert (=> b!1478528 (= lt!645776 (seekEntryOrOpen!0 (select (arr!47956 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99364 (_ BitVec 32)) Bool)

(assert (=> b!1478528 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49559 0))(
  ( (Unit!49560) )
))
(declare-fun lt!645777 () Unit!49559)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99364 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49559)

(assert (=> b!1478528 (= lt!645777 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1003620 () Bool)

(assert (=> start!126420 (=> (not res!1003620) (not e!829595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126420 (= res!1003620 (validMask!0 mask!2687))))

(assert (=> start!126420 e!829595))

(assert (=> start!126420 true))

(declare-fun array_inv!37237 (array!99364) Bool)

(assert (=> start!126420 (array_inv!37237 a!2862)))

(declare-fun b!1478529 () Bool)

(declare-fun res!1003625 () Bool)

(assert (=> b!1478529 (=> (not res!1003625) (not e!829595))))

(assert (=> b!1478529 (= res!1003625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478530 () Bool)

(declare-fun e!829596 () Bool)

(assert (=> b!1478530 (= e!829598 e!829596)))

(declare-fun res!1003632 () Bool)

(assert (=> b!1478530 (=> (not res!1003632) (not e!829596))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99364 (_ BitVec 32)) SeekEntryResult!12093)

(assert (=> b!1478530 (= res!1003632 (= lt!645776 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47956 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478531 () Bool)

(assert (=> b!1478531 (= e!829600 e!829601)))

(declare-fun res!1003623 () Bool)

(assert (=> b!1478531 (=> (not res!1003623) (not e!829601))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478531 (= res!1003623 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47956 a!2862) j!93) mask!2687) (select (arr!47956 a!2862) j!93) a!2862 mask!2687) lt!645781))))

(assert (=> b!1478531 (= lt!645781 (Intermediate!12093 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478532 () Bool)

(declare-fun lt!645778 () (_ BitVec 64))

(declare-fun e!829597 () Bool)

(assert (=> b!1478532 (= e!829597 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645778 lt!645780 mask!2687) (seekEntryOrOpen!0 lt!645778 lt!645780 mask!2687)))))

(declare-fun b!1478533 () Bool)

(declare-fun res!1003630 () Bool)

(assert (=> b!1478533 (=> (not res!1003630) (not e!829599))))

(assert (=> b!1478533 (= res!1003630 e!829597)))

(declare-fun c!136981 () Bool)

(assert (=> b!1478533 (= c!136981 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1478534 () Bool)

(assert (=> b!1478534 (= e!829596 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1478535 () Bool)

(declare-fun res!1003619 () Bool)

(assert (=> b!1478535 (=> (not res!1003619) (not e!829595))))

(assert (=> b!1478535 (= res!1003619 (and (= (size!48507 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48507 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48507 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1478536 () Bool)

(declare-fun res!1003629 () Bool)

(assert (=> b!1478536 (=> (not res!1003629) (not e!829595))))

(assert (=> b!1478536 (= res!1003629 (validKeyInArray!0 (select (arr!47956 a!2862) i!1006)))))

(declare-fun b!1478537 () Bool)

(assert (=> b!1478537 (= e!829601 e!829599)))

(declare-fun res!1003634 () Bool)

(assert (=> b!1478537 (=> (not res!1003634) (not e!829599))))

(declare-fun lt!645779 () SeekEntryResult!12093)

(assert (=> b!1478537 (= res!1003634 (= lt!645779 (Intermediate!12093 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1478537 (= lt!645779 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645778 mask!2687) lt!645778 lt!645780 mask!2687))))

(assert (=> b!1478537 (= lt!645778 (select (store (arr!47956 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1478538 () Bool)

(declare-fun res!1003622 () Bool)

(assert (=> b!1478538 (=> (not res!1003622) (not e!829595))))

(declare-datatypes ((List!34444 0))(
  ( (Nil!34441) (Cons!34440 (h!35822 (_ BitVec 64)) (t!49130 List!34444)) )
))
(declare-fun arrayNoDuplicates!0 (array!99364 (_ BitVec 32) List!34444) Bool)

(assert (=> b!1478538 (= res!1003622 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34441))))

(declare-fun b!1478539 () Bool)

(assert (=> b!1478539 (= e!829597 (= lt!645779 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645778 lt!645780 mask!2687)))))

(assert (= (and start!126420 res!1003620) b!1478535))

(assert (= (and b!1478535 res!1003619) b!1478536))

(assert (= (and b!1478536 res!1003629) b!1478526))

(assert (= (and b!1478526 res!1003633) b!1478529))

(assert (= (and b!1478529 res!1003625) b!1478538))

(assert (= (and b!1478538 res!1003622) b!1478523))

(assert (= (and b!1478523 res!1003631) b!1478525))

(assert (= (and b!1478525 res!1003627) b!1478531))

(assert (= (and b!1478531 res!1003623) b!1478527))

(assert (= (and b!1478527 res!1003626) b!1478537))

(assert (= (and b!1478537 res!1003634) b!1478533))

(assert (= (and b!1478533 c!136981) b!1478539))

(assert (= (and b!1478533 (not c!136981)) b!1478532))

(assert (= (and b!1478533 res!1003630) b!1478524))

(assert (= (and b!1478524 res!1003628) b!1478528))

(assert (= (and b!1478528 res!1003621) b!1478522))

(assert (= (and b!1478522 (not res!1003624)) b!1478530))

(assert (= (and b!1478530 res!1003632) b!1478534))

(declare-fun m!1364473 () Bool)

(assert (=> b!1478526 m!1364473))

(assert (=> b!1478526 m!1364473))

(declare-fun m!1364475 () Bool)

(assert (=> b!1478526 m!1364475))

(declare-fun m!1364477 () Bool)

(assert (=> b!1478538 m!1364477))

(declare-fun m!1364479 () Bool)

(assert (=> b!1478528 m!1364479))

(declare-fun m!1364481 () Bool)

(assert (=> b!1478528 m!1364481))

(assert (=> b!1478528 m!1364473))

(declare-fun m!1364483 () Bool)

(assert (=> b!1478528 m!1364483))

(declare-fun m!1364485 () Bool)

(assert (=> b!1478528 m!1364485))

(assert (=> b!1478528 m!1364473))

(declare-fun m!1364487 () Bool)

(assert (=> start!126420 m!1364487))

(declare-fun m!1364489 () Bool)

(assert (=> start!126420 m!1364489))

(declare-fun m!1364491 () Bool)

(assert (=> b!1478537 m!1364491))

(assert (=> b!1478537 m!1364491))

(declare-fun m!1364493 () Bool)

(assert (=> b!1478537 m!1364493))

(declare-fun m!1364495 () Bool)

(assert (=> b!1478537 m!1364495))

(declare-fun m!1364497 () Bool)

(assert (=> b!1478537 m!1364497))

(declare-fun m!1364499 () Bool)

(assert (=> b!1478532 m!1364499))

(declare-fun m!1364501 () Bool)

(assert (=> b!1478532 m!1364501))

(assert (=> b!1478527 m!1364473))

(assert (=> b!1478527 m!1364473))

(declare-fun m!1364503 () Bool)

(assert (=> b!1478527 m!1364503))

(declare-fun m!1364505 () Bool)

(assert (=> b!1478529 m!1364505))

(declare-fun m!1364507 () Bool)

(assert (=> b!1478522 m!1364507))

(assert (=> b!1478522 m!1364495))

(declare-fun m!1364509 () Bool)

(assert (=> b!1478522 m!1364509))

(assert (=> b!1478522 m!1364473))

(assert (=> b!1478530 m!1364473))

(assert (=> b!1478530 m!1364473))

(declare-fun m!1364511 () Bool)

(assert (=> b!1478530 m!1364511))

(declare-fun m!1364513 () Bool)

(assert (=> b!1478539 m!1364513))

(assert (=> b!1478531 m!1364473))

(assert (=> b!1478531 m!1364473))

(declare-fun m!1364515 () Bool)

(assert (=> b!1478531 m!1364515))

(assert (=> b!1478531 m!1364515))

(assert (=> b!1478531 m!1364473))

(declare-fun m!1364517 () Bool)

(assert (=> b!1478531 m!1364517))

(assert (=> b!1478525 m!1364495))

(declare-fun m!1364519 () Bool)

(assert (=> b!1478525 m!1364519))

(declare-fun m!1364521 () Bool)

(assert (=> b!1478536 m!1364521))

(assert (=> b!1478536 m!1364521))

(declare-fun m!1364523 () Bool)

(assert (=> b!1478536 m!1364523))

(check-sat (not b!1478530) (not b!1478528) (not b!1478536) (not b!1478527) (not b!1478531) (not b!1478532) (not b!1478529) (not b!1478539) (not start!126420) (not b!1478537) (not b!1478526) (not b!1478538))
(check-sat)
