; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125146 () Bool)

(assert start!125146)

(declare-fun b!1458462 () Bool)

(declare-fun res!988585 () Bool)

(declare-fun e!820353 () Bool)

(assert (=> b!1458462 (=> (not res!988585) (not e!820353))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98594 0))(
  ( (array!98595 (arr!47585 (Array (_ BitVec 32) (_ BitVec 64))) (size!48135 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98594)

(assert (=> b!1458462 (= res!988585 (and (= (size!48135 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48135 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48135 a!2862)) (not (= i!1006 j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!639057 () array!98594)

(declare-fun e!820357 () Bool)

(declare-fun b!1458464 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!639056 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11837 0))(
  ( (MissingZero!11837 (index!49740 (_ BitVec 32))) (Found!11837 (index!49741 (_ BitVec 32))) (Intermediate!11837 (undefined!12649 Bool) (index!49742 (_ BitVec 32)) (x!131358 (_ BitVec 32))) (Undefined!11837) (MissingVacant!11837 (index!49743 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98594 (_ BitVec 32)) SeekEntryResult!11837)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98594 (_ BitVec 32)) SeekEntryResult!11837)

(assert (=> b!1458464 (= e!820357 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639056 lt!639057 mask!2687) (seekEntryOrOpen!0 lt!639056 lt!639057 mask!2687)))))

(declare-fun b!1458465 () Bool)

(declare-fun res!988580 () Bool)

(assert (=> b!1458465 (=> (not res!988580) (not e!820353))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98594 (_ BitVec 32)) Bool)

(assert (=> b!1458465 (= res!988580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun e!820359 () Bool)

(declare-fun lt!639054 () SeekEntryResult!11837)

(declare-fun b!1458466 () Bool)

(declare-fun lt!639055 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98594 (_ BitVec 32)) SeekEntryResult!11837)

(assert (=> b!1458466 (= e!820359 (not (= lt!639054 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639055 lt!639056 lt!639057 mask!2687))))))

(declare-fun b!1458467 () Bool)

(declare-fun res!988586 () Bool)

(assert (=> b!1458467 (=> (not res!988586) (not e!820353))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1458467 (= res!988586 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48135 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48135 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48135 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1458468 () Bool)

(declare-fun res!988577 () Bool)

(assert (=> b!1458468 (=> (not res!988577) (not e!820353))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1458468 (= res!988577 (validKeyInArray!0 (select (arr!47585 a!2862) j!93)))))

(declare-fun b!1458469 () Bool)

(declare-fun e!820352 () Bool)

(declare-fun e!820358 () Bool)

(assert (=> b!1458469 (= e!820352 e!820358)))

(declare-fun res!988579 () Bool)

(assert (=> b!1458469 (=> (not res!988579) (not e!820358))))

(assert (=> b!1458469 (= res!988579 (= lt!639054 (Intermediate!11837 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458469 (= lt!639054 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639056 mask!2687) lt!639056 lt!639057 mask!2687))))

(assert (=> b!1458469 (= lt!639056 (select (store (arr!47585 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1458470 () Bool)

(declare-fun res!988582 () Bool)

(assert (=> b!1458470 (=> (not res!988582) (not e!820358))))

(assert (=> b!1458470 (= res!988582 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1458471 () Bool)

(declare-fun res!988583 () Bool)

(declare-fun e!820355 () Bool)

(assert (=> b!1458471 (=> res!988583 e!820355)))

(declare-fun lt!639051 () SeekEntryResult!11837)

(assert (=> b!1458471 (= res!988583 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639055 (select (arr!47585 a!2862) j!93) a!2862 mask!2687) lt!639051)))))

(declare-fun b!1458472 () Bool)

(declare-fun e!820361 () Bool)

(assert (=> b!1458472 (= e!820361 e!820352)))

(declare-fun res!988591 () Bool)

(assert (=> b!1458472 (=> (not res!988591) (not e!820352))))

(assert (=> b!1458472 (= res!988591 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47585 a!2862) j!93) mask!2687) (select (arr!47585 a!2862) j!93) a!2862 mask!2687) lt!639051))))

(assert (=> b!1458472 (= lt!639051 (Intermediate!11837 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1458473 () Bool)

(declare-fun res!988578 () Bool)

(assert (=> b!1458473 (=> (not res!988578) (not e!820352))))

(assert (=> b!1458473 (= res!988578 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47585 a!2862) j!93) a!2862 mask!2687) lt!639051))))

(declare-fun b!1458474 () Bool)

(declare-fun e!820356 () Bool)

(assert (=> b!1458474 (= e!820356 e!820355)))

(declare-fun res!988588 () Bool)

(assert (=> b!1458474 (=> res!988588 e!820355)))

(assert (=> b!1458474 (= res!988588 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639055 #b00000000000000000000000000000000) (bvsge lt!639055 (size!48135 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1458474 (= lt!639055 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!639053 () SeekEntryResult!11837)

(assert (=> b!1458474 (= lt!639053 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639056 lt!639057 mask!2687))))

(assert (=> b!1458474 (= lt!639053 (seekEntryOrOpen!0 lt!639056 lt!639057 mask!2687))))

(declare-fun b!1458475 () Bool)

(declare-fun e!820354 () Bool)

(assert (=> b!1458475 (= e!820354 (and (or (= (select (arr!47585 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47585 a!2862) intermediateBeforeIndex!19) (select (arr!47585 a!2862) j!93))) (let ((bdg!53431 (select (store (arr!47585 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47585 a!2862) index!646) bdg!53431) (= (select (arr!47585 a!2862) index!646) (select (arr!47585 a!2862) j!93))) (= (select (arr!47585 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53431 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun res!988594 () Bool)

(assert (=> start!125146 (=> (not res!988594) (not e!820353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125146 (= res!988594 (validMask!0 mask!2687))))

(assert (=> start!125146 e!820353))

(assert (=> start!125146 true))

(declare-fun array_inv!36613 (array!98594) Bool)

(assert (=> start!125146 (array_inv!36613 a!2862)))

(declare-fun b!1458463 () Bool)

(assert (=> b!1458463 (= e!820359 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639055 intermediateAfterIndex!19 lt!639056 lt!639057 mask!2687) lt!639053)))))

(declare-fun b!1458476 () Bool)

(declare-fun res!988593 () Bool)

(assert (=> b!1458476 (=> (not res!988593) (not e!820354))))

(assert (=> b!1458476 (= res!988593 (= (seekEntryOrOpen!0 (select (arr!47585 a!2862) j!93) a!2862 mask!2687) (Found!11837 j!93)))))

(declare-fun b!1458477 () Bool)

(declare-fun res!988592 () Bool)

(assert (=> b!1458477 (=> (not res!988592) (not e!820353))))

(declare-datatypes ((List!34086 0))(
  ( (Nil!34083) (Cons!34082 (h!35432 (_ BitVec 64)) (t!48780 List!34086)) )
))
(declare-fun arrayNoDuplicates!0 (array!98594 (_ BitVec 32) List!34086) Bool)

(assert (=> b!1458477 (= res!988592 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34083))))

(declare-fun b!1458478 () Bool)

(assert (=> b!1458478 (= e!820355 true)))

(declare-fun lt!639050 () Bool)

(assert (=> b!1458478 (= lt!639050 e!820359)))

(declare-fun c!134454 () Bool)

(assert (=> b!1458478 (= c!134454 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1458479 () Bool)

(declare-fun res!988590 () Bool)

(assert (=> b!1458479 (=> (not res!988590) (not e!820358))))

(assert (=> b!1458479 (= res!988590 e!820357)))

(declare-fun c!134453 () Bool)

(assert (=> b!1458479 (= c!134453 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1458480 () Bool)

(assert (=> b!1458480 (= e!820353 e!820361)))

(declare-fun res!988587 () Bool)

(assert (=> b!1458480 (=> (not res!988587) (not e!820361))))

(assert (=> b!1458480 (= res!988587 (= (select (store (arr!47585 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1458480 (= lt!639057 (array!98595 (store (arr!47585 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48135 a!2862)))))

(declare-fun b!1458481 () Bool)

(assert (=> b!1458481 (= e!820358 (not e!820356))))

(declare-fun res!988589 () Bool)

(assert (=> b!1458481 (=> res!988589 e!820356)))

(assert (=> b!1458481 (= res!988589 (or (and (= (select (arr!47585 a!2862) index!646) (select (store (arr!47585 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47585 a!2862) index!646) (select (arr!47585 a!2862) j!93))) (= (select (arr!47585 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1458481 e!820354))

(declare-fun res!988584 () Bool)

(assert (=> b!1458481 (=> (not res!988584) (not e!820354))))

(assert (=> b!1458481 (= res!988584 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49170 0))(
  ( (Unit!49171) )
))
(declare-fun lt!639052 () Unit!49170)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98594 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49170)

(assert (=> b!1458481 (= lt!639052 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1458482 () Bool)

(assert (=> b!1458482 (= e!820357 (= lt!639054 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639056 lt!639057 mask!2687)))))

(declare-fun b!1458483 () Bool)

(declare-fun res!988581 () Bool)

(assert (=> b!1458483 (=> (not res!988581) (not e!820353))))

(assert (=> b!1458483 (= res!988581 (validKeyInArray!0 (select (arr!47585 a!2862) i!1006)))))

(assert (= (and start!125146 res!988594) b!1458462))

(assert (= (and b!1458462 res!988585) b!1458483))

(assert (= (and b!1458483 res!988581) b!1458468))

(assert (= (and b!1458468 res!988577) b!1458465))

(assert (= (and b!1458465 res!988580) b!1458477))

(assert (= (and b!1458477 res!988592) b!1458467))

(assert (= (and b!1458467 res!988586) b!1458480))

(assert (= (and b!1458480 res!988587) b!1458472))

(assert (= (and b!1458472 res!988591) b!1458473))

(assert (= (and b!1458473 res!988578) b!1458469))

(assert (= (and b!1458469 res!988579) b!1458479))

(assert (= (and b!1458479 c!134453) b!1458482))

(assert (= (and b!1458479 (not c!134453)) b!1458464))

(assert (= (and b!1458479 res!988590) b!1458470))

(assert (= (and b!1458470 res!988582) b!1458481))

(assert (= (and b!1458481 res!988584) b!1458476))

(assert (= (and b!1458476 res!988593) b!1458475))

(assert (= (and b!1458481 (not res!988589)) b!1458474))

(assert (= (and b!1458474 (not res!988588)) b!1458471))

(assert (= (and b!1458471 (not res!988583)) b!1458478))

(assert (= (and b!1458478 c!134454) b!1458466))

(assert (= (and b!1458478 (not c!134454)) b!1458463))

(declare-fun m!1346317 () Bool)

(assert (=> start!125146 m!1346317))

(declare-fun m!1346319 () Bool)

(assert (=> start!125146 m!1346319))

(declare-fun m!1346321 () Bool)

(assert (=> b!1458482 m!1346321))

(declare-fun m!1346323 () Bool)

(assert (=> b!1458476 m!1346323))

(assert (=> b!1458476 m!1346323))

(declare-fun m!1346325 () Bool)

(assert (=> b!1458476 m!1346325))

(declare-fun m!1346327 () Bool)

(assert (=> b!1458463 m!1346327))

(declare-fun m!1346329 () Bool)

(assert (=> b!1458469 m!1346329))

(assert (=> b!1458469 m!1346329))

(declare-fun m!1346331 () Bool)

(assert (=> b!1458469 m!1346331))

(declare-fun m!1346333 () Bool)

(assert (=> b!1458469 m!1346333))

(declare-fun m!1346335 () Bool)

(assert (=> b!1458469 m!1346335))

(declare-fun m!1346337 () Bool)

(assert (=> b!1458465 m!1346337))

(declare-fun m!1346339 () Bool)

(assert (=> b!1458474 m!1346339))

(declare-fun m!1346341 () Bool)

(assert (=> b!1458474 m!1346341))

(declare-fun m!1346343 () Bool)

(assert (=> b!1458474 m!1346343))

(declare-fun m!1346345 () Bool)

(assert (=> b!1458466 m!1346345))

(assert (=> b!1458475 m!1346333))

(declare-fun m!1346347 () Bool)

(assert (=> b!1458475 m!1346347))

(declare-fun m!1346349 () Bool)

(assert (=> b!1458475 m!1346349))

(declare-fun m!1346351 () Bool)

(assert (=> b!1458475 m!1346351))

(assert (=> b!1458475 m!1346323))

(declare-fun m!1346353 () Bool)

(assert (=> b!1458481 m!1346353))

(assert (=> b!1458481 m!1346333))

(assert (=> b!1458481 m!1346349))

(assert (=> b!1458481 m!1346351))

(declare-fun m!1346355 () Bool)

(assert (=> b!1458481 m!1346355))

(assert (=> b!1458481 m!1346323))

(assert (=> b!1458480 m!1346333))

(declare-fun m!1346357 () Bool)

(assert (=> b!1458480 m!1346357))

(declare-fun m!1346359 () Bool)

(assert (=> b!1458483 m!1346359))

(assert (=> b!1458483 m!1346359))

(declare-fun m!1346361 () Bool)

(assert (=> b!1458483 m!1346361))

(assert (=> b!1458473 m!1346323))

(assert (=> b!1458473 m!1346323))

(declare-fun m!1346363 () Bool)

(assert (=> b!1458473 m!1346363))

(assert (=> b!1458468 m!1346323))

(assert (=> b!1458468 m!1346323))

(declare-fun m!1346365 () Bool)

(assert (=> b!1458468 m!1346365))

(declare-fun m!1346367 () Bool)

(assert (=> b!1458477 m!1346367))

(assert (=> b!1458471 m!1346323))

(assert (=> b!1458471 m!1346323))

(declare-fun m!1346369 () Bool)

(assert (=> b!1458471 m!1346369))

(assert (=> b!1458464 m!1346341))

(assert (=> b!1458464 m!1346343))

(assert (=> b!1458472 m!1346323))

(assert (=> b!1458472 m!1346323))

(declare-fun m!1346371 () Bool)

(assert (=> b!1458472 m!1346371))

(assert (=> b!1458472 m!1346371))

(assert (=> b!1458472 m!1346323))

(declare-fun m!1346373 () Bool)

(assert (=> b!1458472 m!1346373))

(push 1)

