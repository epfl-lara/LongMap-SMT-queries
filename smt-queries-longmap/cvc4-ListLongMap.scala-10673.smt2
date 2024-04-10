; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125180 () Bool)

(assert start!125180)

(declare-fun b!1459584 () Bool)

(declare-fun res!989512 () Bool)

(declare-fun e!820821 () Bool)

(assert (=> b!1459584 (=> (not res!989512) (not e!820821))))

(declare-datatypes ((SeekEntryResult!11854 0))(
  ( (MissingZero!11854 (index!49808 (_ BitVec 32))) (Found!11854 (index!49809 (_ BitVec 32))) (Intermediate!11854 (undefined!12666 Bool) (index!49810 (_ BitVec 32)) (x!131415 (_ BitVec 32))) (Undefined!11854) (MissingVacant!11854 (index!49811 (_ BitVec 32))) )
))
(declare-fun lt!639507 () SeekEntryResult!11854)

(declare-datatypes ((array!98628 0))(
  ( (array!98629 (arr!47602 (Array (_ BitVec 32) (_ BitVec 64))) (size!48152 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98628)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98628 (_ BitVec 32)) SeekEntryResult!11854)

(assert (=> b!1459584 (= res!989512 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47602 a!2862) j!93) a!2862 mask!2687) lt!639507))))

(declare-fun res!989498 () Bool)

(declare-fun e!820822 () Bool)

(assert (=> start!125180 (=> (not res!989498) (not e!820822))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125180 (= res!989498 (validMask!0 mask!2687))))

(assert (=> start!125180 e!820822))

(assert (=> start!125180 true))

(declare-fun array_inv!36630 (array!98628) Bool)

(assert (=> start!125180 (array_inv!36630 a!2862)))

(declare-fun b!1459585 () Bool)

(declare-fun res!989509 () Bool)

(declare-fun e!820826 () Bool)

(assert (=> b!1459585 (=> res!989509 e!820826)))

(declare-fun e!820818 () Bool)

(assert (=> b!1459585 (= res!989509 e!820818)))

(declare-fun c!134556 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1459585 (= c!134556 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1459586 () Bool)

(declare-fun lt!639509 () (_ BitVec 64))

(declare-fun lt!639503 () SeekEntryResult!11854)

(declare-fun lt!639510 () array!98628)

(declare-fun lt!639508 () (_ BitVec 32))

(assert (=> b!1459586 (= e!820818 (not (= lt!639503 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639508 lt!639509 lt!639510 mask!2687))))))

(declare-fun b!1459587 () Bool)

(declare-fun res!989508 () Bool)

(assert (=> b!1459587 (=> (not res!989508) (not e!820822))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1459587 (= res!989508 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48152 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48152 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48152 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1459588 () Bool)

(declare-fun e!820824 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98628 (_ BitVec 32)) SeekEntryResult!11854)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98628 (_ BitVec 32)) SeekEntryResult!11854)

(assert (=> b!1459588 (= e!820824 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639509 lt!639510 mask!2687) (seekEntryOrOpen!0 lt!639509 lt!639510 mask!2687)))))

(declare-fun b!1459589 () Bool)

(declare-fun res!989505 () Bool)

(assert (=> b!1459589 (=> (not res!989505) (not e!820822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98628 (_ BitVec 32)) Bool)

(assert (=> b!1459589 (= res!989505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1459590 () Bool)

(declare-fun e!820820 () Bool)

(assert (=> b!1459590 (= e!820820 e!820826)))

(declare-fun res!989506 () Bool)

(assert (=> b!1459590 (=> res!989506 e!820826)))

(assert (=> b!1459590 (= res!989506 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639508 #b00000000000000000000000000000000) (bvsge lt!639508 (size!48152 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459590 (= lt!639508 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!639506 () SeekEntryResult!11854)

(assert (=> b!1459590 (= lt!639506 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639509 lt!639510 mask!2687))))

(assert (=> b!1459590 (= lt!639506 (seekEntryOrOpen!0 lt!639509 lt!639510 mask!2687))))

(declare-fun b!1459591 () Bool)

(assert (=> b!1459591 (= e!820818 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639508 intermediateAfterIndex!19 lt!639509 lt!639510 mask!2687) lt!639506)))))

(declare-fun b!1459592 () Bool)

(declare-fun e!820819 () Bool)

(assert (=> b!1459592 (= e!820819 e!820821)))

(declare-fun res!989511 () Bool)

(assert (=> b!1459592 (=> (not res!989511) (not e!820821))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459592 (= res!989511 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47602 a!2862) j!93) mask!2687) (select (arr!47602 a!2862) j!93) a!2862 mask!2687) lt!639507))))

(assert (=> b!1459592 (= lt!639507 (Intermediate!11854 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1459593 () Bool)

(declare-fun res!989500 () Bool)

(assert (=> b!1459593 (=> (not res!989500) (not e!820822))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1459593 (= res!989500 (and (= (size!48152 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48152 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48152 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1459594 () Bool)

(declare-fun res!989501 () Bool)

(assert (=> b!1459594 (=> res!989501 e!820826)))

(assert (=> b!1459594 (= res!989501 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639508 (select (arr!47602 a!2862) j!93) a!2862 mask!2687) lt!639507)))))

(declare-fun b!1459595 () Bool)

(declare-fun res!989510 () Bool)

(declare-fun e!820823 () Bool)

(assert (=> b!1459595 (=> (not res!989510) (not e!820823))))

(assert (=> b!1459595 (= res!989510 e!820824)))

(declare-fun c!134555 () Bool)

(assert (=> b!1459595 (= c!134555 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1459596 () Bool)

(declare-fun res!989496 () Bool)

(assert (=> b!1459596 (=> (not res!989496) (not e!820822))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1459596 (= res!989496 (validKeyInArray!0 (select (arr!47602 a!2862) j!93)))))

(declare-fun b!1459597 () Bool)

(declare-fun res!989503 () Bool)

(assert (=> b!1459597 (=> (not res!989503) (not e!820822))))

(assert (=> b!1459597 (= res!989503 (validKeyInArray!0 (select (arr!47602 a!2862) i!1006)))))

(declare-fun b!1459598 () Bool)

(assert (=> b!1459598 (= e!820821 e!820823)))

(declare-fun res!989507 () Bool)

(assert (=> b!1459598 (=> (not res!989507) (not e!820823))))

(assert (=> b!1459598 (= res!989507 (= lt!639503 (Intermediate!11854 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1459598 (= lt!639503 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639509 mask!2687) lt!639509 lt!639510 mask!2687))))

(assert (=> b!1459598 (= lt!639509 (select (store (arr!47602 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1459599 () Bool)

(declare-fun res!989502 () Bool)

(assert (=> b!1459599 (=> res!989502 e!820826)))

(assert (=> b!1459599 (= res!989502 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1459600 () Bool)

(assert (=> b!1459600 (= e!820822 e!820819)))

(declare-fun res!989504 () Bool)

(assert (=> b!1459600 (=> (not res!989504) (not e!820819))))

(assert (=> b!1459600 (= res!989504 (= (select (store (arr!47602 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1459600 (= lt!639510 (array!98629 (store (arr!47602 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48152 a!2862)))))

(declare-fun b!1459601 () Bool)

(assert (=> b!1459601 (= e!820824 (= lt!639503 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639509 lt!639510 mask!2687)))))

(declare-fun b!1459602 () Bool)

(declare-fun res!989499 () Bool)

(assert (=> b!1459602 (=> (not res!989499) (not e!820823))))

(assert (=> b!1459602 (= res!989499 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1459603 () Bool)

(assert (=> b!1459603 (= e!820826 true)))

(declare-fun lt!639504 () SeekEntryResult!11854)

(assert (=> b!1459603 (= lt!639504 lt!639506)))

(declare-datatypes ((Unit!49204 0))(
  ( (Unit!49205) )
))
(declare-fun lt!639505 () Unit!49204)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98628 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49204)

(assert (=> b!1459603 (= lt!639505 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639508 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1459604 () Bool)

(assert (=> b!1459604 (= e!820823 (not e!820820))))

(declare-fun res!989495 () Bool)

(assert (=> b!1459604 (=> res!989495 e!820820)))

(assert (=> b!1459604 (= res!989495 (or (and (= (select (arr!47602 a!2862) index!646) (select (store (arr!47602 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47602 a!2862) index!646) (select (arr!47602 a!2862) j!93))) (= (select (arr!47602 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1459604 (and (= lt!639504 (Found!11854 j!93)) (or (= (select (arr!47602 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47602 a!2862) intermediateBeforeIndex!19) (select (arr!47602 a!2862) j!93))) (let ((bdg!53517 (select (store (arr!47602 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47602 a!2862) index!646) bdg!53517) (= (select (arr!47602 a!2862) index!646) (select (arr!47602 a!2862) j!93))) (= (select (arr!47602 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53517 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1459604 (= lt!639504 (seekEntryOrOpen!0 (select (arr!47602 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1459604 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!639502 () Unit!49204)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98628 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49204)

(assert (=> b!1459604 (= lt!639502 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1459605 () Bool)

(declare-fun res!989497 () Bool)

(assert (=> b!1459605 (=> (not res!989497) (not e!820822))))

(declare-datatypes ((List!34103 0))(
  ( (Nil!34100) (Cons!34099 (h!35449 (_ BitVec 64)) (t!48797 List!34103)) )
))
(declare-fun arrayNoDuplicates!0 (array!98628 (_ BitVec 32) List!34103) Bool)

(assert (=> b!1459605 (= res!989497 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34100))))

(assert (= (and start!125180 res!989498) b!1459593))

(assert (= (and b!1459593 res!989500) b!1459597))

(assert (= (and b!1459597 res!989503) b!1459596))

(assert (= (and b!1459596 res!989496) b!1459589))

(assert (= (and b!1459589 res!989505) b!1459605))

(assert (= (and b!1459605 res!989497) b!1459587))

(assert (= (and b!1459587 res!989508) b!1459600))

(assert (= (and b!1459600 res!989504) b!1459592))

(assert (= (and b!1459592 res!989511) b!1459584))

(assert (= (and b!1459584 res!989512) b!1459598))

(assert (= (and b!1459598 res!989507) b!1459595))

(assert (= (and b!1459595 c!134555) b!1459601))

(assert (= (and b!1459595 (not c!134555)) b!1459588))

(assert (= (and b!1459595 res!989510) b!1459602))

(assert (= (and b!1459602 res!989499) b!1459604))

(assert (= (and b!1459604 (not res!989495)) b!1459590))

(assert (= (and b!1459590 (not res!989506)) b!1459594))

(assert (= (and b!1459594 (not res!989501)) b!1459585))

(assert (= (and b!1459585 c!134556) b!1459586))

(assert (= (and b!1459585 (not c!134556)) b!1459591))

(assert (= (and b!1459585 (not res!989509)) b!1459599))

(assert (= (and b!1459599 (not res!989502)) b!1459603))

(declare-fun m!1347331 () Bool)

(assert (=> b!1459605 m!1347331))

(declare-fun m!1347333 () Bool)

(assert (=> b!1459588 m!1347333))

(declare-fun m!1347335 () Bool)

(assert (=> b!1459588 m!1347335))

(declare-fun m!1347337 () Bool)

(assert (=> b!1459596 m!1347337))

(assert (=> b!1459596 m!1347337))

(declare-fun m!1347339 () Bool)

(assert (=> b!1459596 m!1347339))

(declare-fun m!1347341 () Bool)

(assert (=> b!1459589 m!1347341))

(declare-fun m!1347343 () Bool)

(assert (=> b!1459600 m!1347343))

(declare-fun m!1347345 () Bool)

(assert (=> b!1459600 m!1347345))

(declare-fun m!1347347 () Bool)

(assert (=> b!1459597 m!1347347))

(assert (=> b!1459597 m!1347347))

(declare-fun m!1347349 () Bool)

(assert (=> b!1459597 m!1347349))

(assert (=> b!1459592 m!1347337))

(assert (=> b!1459592 m!1347337))

(declare-fun m!1347351 () Bool)

(assert (=> b!1459592 m!1347351))

(assert (=> b!1459592 m!1347351))

(assert (=> b!1459592 m!1347337))

(declare-fun m!1347353 () Bool)

(assert (=> b!1459592 m!1347353))

(declare-fun m!1347355 () Bool)

(assert (=> b!1459598 m!1347355))

(assert (=> b!1459598 m!1347355))

(declare-fun m!1347357 () Bool)

(assert (=> b!1459598 m!1347357))

(assert (=> b!1459598 m!1347343))

(declare-fun m!1347359 () Bool)

(assert (=> b!1459598 m!1347359))

(declare-fun m!1347361 () Bool)

(assert (=> b!1459604 m!1347361))

(assert (=> b!1459604 m!1347343))

(declare-fun m!1347363 () Bool)

(assert (=> b!1459604 m!1347363))

(declare-fun m!1347365 () Bool)

(assert (=> b!1459604 m!1347365))

(declare-fun m!1347367 () Bool)

(assert (=> b!1459604 m!1347367))

(assert (=> b!1459604 m!1347337))

(declare-fun m!1347369 () Bool)

(assert (=> b!1459604 m!1347369))

(declare-fun m!1347371 () Bool)

(assert (=> b!1459604 m!1347371))

(assert (=> b!1459604 m!1347337))

(declare-fun m!1347373 () Bool)

(assert (=> start!125180 m!1347373))

(declare-fun m!1347375 () Bool)

(assert (=> start!125180 m!1347375))

(declare-fun m!1347377 () Bool)

(assert (=> b!1459586 m!1347377))

(declare-fun m!1347379 () Bool)

(assert (=> b!1459590 m!1347379))

(assert (=> b!1459590 m!1347333))

(assert (=> b!1459590 m!1347335))

(assert (=> b!1459584 m!1347337))

(assert (=> b!1459584 m!1347337))

(declare-fun m!1347381 () Bool)

(assert (=> b!1459584 m!1347381))

(declare-fun m!1347383 () Bool)

(assert (=> b!1459603 m!1347383))

(declare-fun m!1347385 () Bool)

(assert (=> b!1459591 m!1347385))

(declare-fun m!1347387 () Bool)

(assert (=> b!1459601 m!1347387))

(assert (=> b!1459594 m!1347337))

(assert (=> b!1459594 m!1347337))

(declare-fun m!1347389 () Bool)

(assert (=> b!1459594 m!1347389))

(push 1)

