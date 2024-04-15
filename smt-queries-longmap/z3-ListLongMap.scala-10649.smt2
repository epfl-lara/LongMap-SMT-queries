; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125002 () Bool)

(assert start!125002)

(declare-fun res!985431 () Bool)

(declare-fun e!818529 () Bool)

(assert (=> start!125002 (=> (not res!985431) (not e!818529))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125002 (= res!985431 (validMask!0 mask!2687))))

(assert (=> start!125002 e!818529))

(assert (=> start!125002 true))

(declare-datatypes ((array!98428 0))(
  ( (array!98429 (arr!47503 (Array (_ BitVec 32) (_ BitVec 64))) (size!48055 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98428)

(declare-fun array_inv!36736 (array!98428) Bool)

(assert (=> start!125002 (array_inv!36736 a!2862)))

(declare-fun b!1454505 () Bool)

(declare-fun e!818535 () Bool)

(declare-fun e!818527 () Bool)

(assert (=> b!1454505 (= e!818535 e!818527)))

(declare-fun res!985423 () Bool)

(assert (=> b!1454505 (=> res!985423 e!818527)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!637450 () (_ BitVec 32))

(assert (=> b!1454505 (= res!985423 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637450 #b00000000000000000000000000000000) (bvsge lt!637450 (size!48055 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454505 (= lt!637450 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!637448 () array!98428)

(declare-datatypes ((SeekEntryResult!11780 0))(
  ( (MissingZero!11780 (index!49512 (_ BitVec 32))) (Found!11780 (index!49513 (_ BitVec 32))) (Intermediate!11780 (undefined!12592 Bool) (index!49514 (_ BitVec 32)) (x!131144 (_ BitVec 32))) (Undefined!11780) (MissingVacant!11780 (index!49515 (_ BitVec 32))) )
))
(declare-fun lt!637453 () SeekEntryResult!11780)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!637454 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98428 (_ BitVec 32)) SeekEntryResult!11780)

(assert (=> b!1454505 (= lt!637453 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637454 lt!637448 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98428 (_ BitVec 32)) SeekEntryResult!11780)

(assert (=> b!1454505 (= lt!637453 (seekEntryOrOpen!0 lt!637454 lt!637448 mask!2687))))

(declare-fun e!818534 () Bool)

(declare-fun b!1454506 () Bool)

(declare-fun lt!637452 () SeekEntryResult!11780)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98428 (_ BitVec 32)) SeekEntryResult!11780)

(assert (=> b!1454506 (= e!818534 (not (= lt!637452 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637450 lt!637454 lt!637448 mask!2687))))))

(declare-fun b!1454507 () Bool)

(declare-fun res!985428 () Bool)

(assert (=> b!1454507 (=> (not res!985428) (not e!818529))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1454507 (= res!985428 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48055 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48055 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48055 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1454508 () Bool)

(declare-fun e!818528 () Bool)

(assert (=> b!1454508 (= e!818528 (= lt!637452 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637454 lt!637448 mask!2687)))))

(declare-fun b!1454509 () Bool)

(assert (=> b!1454509 (= e!818534 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637450 intermediateAfterIndex!19 lt!637454 lt!637448 mask!2687) lt!637453)))))

(declare-fun b!1454510 () Bool)

(declare-fun res!985436 () Bool)

(assert (=> b!1454510 (=> (not res!985436) (not e!818529))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98428 (_ BitVec 32)) Bool)

(assert (=> b!1454510 (= res!985436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1454511 () Bool)

(declare-fun res!985425 () Bool)

(declare-fun e!818533 () Bool)

(assert (=> b!1454511 (=> (not res!985425) (not e!818533))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1454511 (= res!985425 (= (seekEntryOrOpen!0 (select (arr!47503 a!2862) j!93) a!2862 mask!2687) (Found!11780 j!93)))))

(declare-fun b!1454512 () Bool)

(declare-fun e!818530 () Bool)

(declare-fun e!818531 () Bool)

(assert (=> b!1454512 (= e!818530 e!818531)))

(declare-fun res!985430 () Bool)

(assert (=> b!1454512 (=> (not res!985430) (not e!818531))))

(declare-fun lt!637449 () SeekEntryResult!11780)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454512 (= res!985430 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47503 a!2862) j!93) mask!2687) (select (arr!47503 a!2862) j!93) a!2862 mask!2687) lt!637449))))

(assert (=> b!1454512 (= lt!637449 (Intermediate!11780 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1454513 () Bool)

(declare-fun e!818532 () Bool)

(assert (=> b!1454513 (= e!818531 e!818532)))

(declare-fun res!985438 () Bool)

(assert (=> b!1454513 (=> (not res!985438) (not e!818532))))

(assert (=> b!1454513 (= res!985438 (= lt!637452 (Intermediate!11780 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1454513 (= lt!637452 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637454 mask!2687) lt!637454 lt!637448 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1454513 (= lt!637454 (select (store (arr!47503 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1454514 () Bool)

(declare-fun res!985427 () Bool)

(assert (=> b!1454514 (=> (not res!985427) (not e!818529))))

(declare-datatypes ((List!34082 0))(
  ( (Nil!34079) (Cons!34078 (h!35428 (_ BitVec 64)) (t!48768 List!34082)) )
))
(declare-fun arrayNoDuplicates!0 (array!98428 (_ BitVec 32) List!34082) Bool)

(assert (=> b!1454514 (= res!985427 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34079))))

(declare-fun b!1454515 () Bool)

(declare-fun res!985422 () Bool)

(assert (=> b!1454515 (=> res!985422 e!818527)))

(assert (=> b!1454515 (= res!985422 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637450 (select (arr!47503 a!2862) j!93) a!2862 mask!2687) lt!637449)))))

(declare-fun b!1454516 () Bool)

(declare-fun res!985429 () Bool)

(assert (=> b!1454516 (=> (not res!985429) (not e!818532))))

(assert (=> b!1454516 (= res!985429 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1454517 () Bool)

(declare-fun res!985421 () Bool)

(assert (=> b!1454517 (=> (not res!985421) (not e!818532))))

(assert (=> b!1454517 (= res!985421 e!818528)))

(declare-fun c!134056 () Bool)

(assert (=> b!1454517 (= c!134056 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1454518 () Bool)

(declare-fun res!985435 () Bool)

(assert (=> b!1454518 (=> (not res!985435) (not e!818529))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1454518 (= res!985435 (validKeyInArray!0 (select (arr!47503 a!2862) i!1006)))))

(declare-fun b!1454519 () Bool)

(assert (=> b!1454519 (= e!818527 true)))

(declare-fun lt!637451 () Bool)

(assert (=> b!1454519 (= lt!637451 e!818534)))

(declare-fun c!134055 () Bool)

(assert (=> b!1454519 (= c!134055 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1454520 () Bool)

(declare-fun res!985424 () Bool)

(assert (=> b!1454520 (=> (not res!985424) (not e!818531))))

(assert (=> b!1454520 (= res!985424 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47503 a!2862) j!93) a!2862 mask!2687) lt!637449))))

(declare-fun b!1454521 () Bool)

(assert (=> b!1454521 (= e!818528 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637454 lt!637448 mask!2687) (seekEntryOrOpen!0 lt!637454 lt!637448 mask!2687)))))

(declare-fun b!1454522 () Bool)

(assert (=> b!1454522 (= e!818529 e!818530)))

(declare-fun res!985433 () Bool)

(assert (=> b!1454522 (=> (not res!985433) (not e!818530))))

(assert (=> b!1454522 (= res!985433 (= (select (store (arr!47503 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1454522 (= lt!637448 (array!98429 (store (arr!47503 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48055 a!2862)))))

(declare-fun b!1454523 () Bool)

(declare-fun res!985432 () Bool)

(assert (=> b!1454523 (=> (not res!985432) (not e!818529))))

(assert (=> b!1454523 (= res!985432 (validKeyInArray!0 (select (arr!47503 a!2862) j!93)))))

(declare-fun b!1454524 () Bool)

(assert (=> b!1454524 (= e!818533 (and (or (= (select (arr!47503 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47503 a!2862) intermediateBeforeIndex!19) (select (arr!47503 a!2862) j!93))) (let ((bdg!53089 (select (store (arr!47503 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47503 a!2862) index!646) bdg!53089) (= (select (arr!47503 a!2862) index!646) (select (arr!47503 a!2862) j!93))) (= (select (arr!47503 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53089 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1454525 () Bool)

(declare-fun res!985434 () Bool)

(assert (=> b!1454525 (=> (not res!985434) (not e!818529))))

(assert (=> b!1454525 (= res!985434 (and (= (size!48055 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48055 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48055 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1454526 () Bool)

(assert (=> b!1454526 (= e!818532 (not e!818535))))

(declare-fun res!985426 () Bool)

(assert (=> b!1454526 (=> res!985426 e!818535)))

(assert (=> b!1454526 (= res!985426 (or (and (= (select (arr!47503 a!2862) index!646) (select (store (arr!47503 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47503 a!2862) index!646) (select (arr!47503 a!2862) j!93))) (= (select (arr!47503 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1454526 e!818533))

(declare-fun res!985437 () Bool)

(assert (=> b!1454526 (=> (not res!985437) (not e!818533))))

(assert (=> b!1454526 (= res!985437 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48897 0))(
  ( (Unit!48898) )
))
(declare-fun lt!637455 () Unit!48897)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98428 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48897)

(assert (=> b!1454526 (= lt!637455 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125002 res!985431) b!1454525))

(assert (= (and b!1454525 res!985434) b!1454518))

(assert (= (and b!1454518 res!985435) b!1454523))

(assert (= (and b!1454523 res!985432) b!1454510))

(assert (= (and b!1454510 res!985436) b!1454514))

(assert (= (and b!1454514 res!985427) b!1454507))

(assert (= (and b!1454507 res!985428) b!1454522))

(assert (= (and b!1454522 res!985433) b!1454512))

(assert (= (and b!1454512 res!985430) b!1454520))

(assert (= (and b!1454520 res!985424) b!1454513))

(assert (= (and b!1454513 res!985438) b!1454517))

(assert (= (and b!1454517 c!134056) b!1454508))

(assert (= (and b!1454517 (not c!134056)) b!1454521))

(assert (= (and b!1454517 res!985421) b!1454516))

(assert (= (and b!1454516 res!985429) b!1454526))

(assert (= (and b!1454526 res!985437) b!1454511))

(assert (= (and b!1454511 res!985425) b!1454524))

(assert (= (and b!1454526 (not res!985426)) b!1454505))

(assert (= (and b!1454505 (not res!985423)) b!1454515))

(assert (= (and b!1454515 (not res!985422)) b!1454519))

(assert (= (and b!1454519 c!134055) b!1454506))

(assert (= (and b!1454519 (not c!134055)) b!1454509))

(declare-fun m!1342335 () Bool)

(assert (=> b!1454505 m!1342335))

(declare-fun m!1342337 () Bool)

(assert (=> b!1454505 m!1342337))

(declare-fun m!1342339 () Bool)

(assert (=> b!1454505 m!1342339))

(declare-fun m!1342341 () Bool)

(assert (=> b!1454506 m!1342341))

(declare-fun m!1342343 () Bool)

(assert (=> b!1454518 m!1342343))

(assert (=> b!1454518 m!1342343))

(declare-fun m!1342345 () Bool)

(assert (=> b!1454518 m!1342345))

(declare-fun m!1342347 () Bool)

(assert (=> b!1454522 m!1342347))

(declare-fun m!1342349 () Bool)

(assert (=> b!1454522 m!1342349))

(assert (=> b!1454524 m!1342347))

(declare-fun m!1342351 () Bool)

(assert (=> b!1454524 m!1342351))

(declare-fun m!1342353 () Bool)

(assert (=> b!1454524 m!1342353))

(declare-fun m!1342355 () Bool)

(assert (=> b!1454524 m!1342355))

(declare-fun m!1342357 () Bool)

(assert (=> b!1454524 m!1342357))

(declare-fun m!1342359 () Bool)

(assert (=> b!1454509 m!1342359))

(declare-fun m!1342361 () Bool)

(assert (=> b!1454510 m!1342361))

(declare-fun m!1342363 () Bool)

(assert (=> b!1454514 m!1342363))

(assert (=> b!1454515 m!1342357))

(assert (=> b!1454515 m!1342357))

(declare-fun m!1342365 () Bool)

(assert (=> b!1454515 m!1342365))

(assert (=> b!1454521 m!1342337))

(assert (=> b!1454521 m!1342339))

(assert (=> b!1454511 m!1342357))

(assert (=> b!1454511 m!1342357))

(declare-fun m!1342367 () Bool)

(assert (=> b!1454511 m!1342367))

(assert (=> b!1454512 m!1342357))

(assert (=> b!1454512 m!1342357))

(declare-fun m!1342369 () Bool)

(assert (=> b!1454512 m!1342369))

(assert (=> b!1454512 m!1342369))

(assert (=> b!1454512 m!1342357))

(declare-fun m!1342371 () Bool)

(assert (=> b!1454512 m!1342371))

(assert (=> b!1454523 m!1342357))

(assert (=> b!1454523 m!1342357))

(declare-fun m!1342373 () Bool)

(assert (=> b!1454523 m!1342373))

(declare-fun m!1342375 () Bool)

(assert (=> start!125002 m!1342375))

(declare-fun m!1342377 () Bool)

(assert (=> start!125002 m!1342377))

(declare-fun m!1342379 () Bool)

(assert (=> b!1454526 m!1342379))

(assert (=> b!1454526 m!1342347))

(assert (=> b!1454526 m!1342353))

(assert (=> b!1454526 m!1342355))

(declare-fun m!1342381 () Bool)

(assert (=> b!1454526 m!1342381))

(assert (=> b!1454526 m!1342357))

(declare-fun m!1342383 () Bool)

(assert (=> b!1454508 m!1342383))

(assert (=> b!1454520 m!1342357))

(assert (=> b!1454520 m!1342357))

(declare-fun m!1342385 () Bool)

(assert (=> b!1454520 m!1342385))

(declare-fun m!1342387 () Bool)

(assert (=> b!1454513 m!1342387))

(assert (=> b!1454513 m!1342387))

(declare-fun m!1342389 () Bool)

(assert (=> b!1454513 m!1342389))

(assert (=> b!1454513 m!1342347))

(declare-fun m!1342391 () Bool)

(assert (=> b!1454513 m!1342391))

(check-sat (not b!1454511) (not b!1454506) (not b!1454509) (not b!1454508) (not b!1454523) (not b!1454505) (not start!125002) (not b!1454512) (not b!1454521) (not b!1454518) (not b!1454520) (not b!1454513) (not b!1454514) (not b!1454526) (not b!1454510) (not b!1454515))
(check-sat)
