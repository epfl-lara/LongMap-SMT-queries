; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124668 () Bool)

(assert start!124668)

(declare-fun b!1444486 () Bool)

(declare-fun e!813855 () Bool)

(declare-fun e!813854 () Bool)

(assert (=> b!1444486 (= e!813855 e!813854)))

(declare-fun res!976485 () Bool)

(assert (=> b!1444486 (=> (not res!976485) (not e!813854))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98116 0))(
  ( (array!98117 (arr!47346 (Array (_ BitVec 32) (_ BitVec 64))) (size!47896 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98116)

(assert (=> b!1444486 (= res!976485 (= (select (store (arr!47346 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!634213 () array!98116)

(assert (=> b!1444486 (= lt!634213 (array!98117 (store (arr!47346 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47896 a!2862)))))

(declare-fun res!976471 () Bool)

(assert (=> start!124668 (=> (not res!976471) (not e!813855))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124668 (= res!976471 (validMask!0 mask!2687))))

(assert (=> start!124668 e!813855))

(assert (=> start!124668 true))

(declare-fun array_inv!36374 (array!98116) Bool)

(assert (=> start!124668 (array_inv!36374 a!2862)))

(declare-fun b!1444487 () Bool)

(declare-fun res!976484 () Bool)

(assert (=> b!1444487 (=> (not res!976484) (not e!813855))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444487 (= res!976484 (validKeyInArray!0 (select (arr!47346 a!2862) i!1006)))))

(declare-fun b!1444488 () Bool)

(declare-fun res!976481 () Bool)

(declare-fun e!813856 () Bool)

(assert (=> b!1444488 (=> res!976481 e!813856)))

(assert (=> b!1444488 (= res!976481 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun b!1444489 () Bool)

(declare-fun e!813851 () Bool)

(assert (=> b!1444489 (= e!813854 e!813851)))

(declare-fun res!976477 () Bool)

(assert (=> b!1444489 (=> (not res!976477) (not e!813851))))

(declare-datatypes ((SeekEntryResult!11598 0))(
  ( (MissingZero!11598 (index!48784 (_ BitVec 32))) (Found!11598 (index!48785 (_ BitVec 32))) (Intermediate!11598 (undefined!12410 Bool) (index!48786 (_ BitVec 32)) (x!130479 (_ BitVec 32))) (Undefined!11598) (MissingVacant!11598 (index!48787 (_ BitVec 32))) )
))
(declare-fun lt!634218 () SeekEntryResult!11598)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98116 (_ BitVec 32)) SeekEntryResult!11598)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444489 (= res!976477 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47346 a!2862) j!93) mask!2687) (select (arr!47346 a!2862) j!93) a!2862 mask!2687) lt!634218))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1444489 (= lt!634218 (Intermediate!11598 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1444490 () Bool)

(declare-fun res!976483 () Bool)

(declare-fun e!813857 () Bool)

(assert (=> b!1444490 (=> (not res!976483) (not e!813857))))

(declare-fun e!813853 () Bool)

(assert (=> b!1444490 (= res!976483 e!813853)))

(declare-fun c!133518 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1444490 (= c!133518 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444491 () Bool)

(declare-fun res!976474 () Bool)

(assert (=> b!1444491 (=> res!976474 e!813856)))

(declare-fun lt!634214 () SeekEntryResult!11598)

(declare-fun lt!634216 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98116 (_ BitVec 32)) SeekEntryResult!11598)

(assert (=> b!1444491 (= res!976474 (not (= lt!634214 (seekEntryOrOpen!0 lt!634216 lt!634213 mask!2687))))))

(declare-fun b!1444492 () Bool)

(declare-fun res!976486 () Bool)

(assert (=> b!1444492 (=> (not res!976486) (not e!813855))))

(assert (=> b!1444492 (= res!976486 (and (= (size!47896 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47896 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47896 a!2862)) (not (= i!1006 j!93))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1444493 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98116 (_ BitVec 32)) SeekEntryResult!11598)

(assert (=> b!1444493 (= e!813853 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634216 lt!634213 mask!2687) (seekEntryOrOpen!0 lt!634216 lt!634213 mask!2687)))))

(declare-fun b!1444494 () Bool)

(declare-fun res!976480 () Bool)

(assert (=> b!1444494 (=> (not res!976480) (not e!813851))))

(assert (=> b!1444494 (= res!976480 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47346 a!2862) j!93) a!2862 mask!2687) lt!634218))))

(declare-fun b!1444495 () Bool)

(declare-fun res!976476 () Bool)

(assert (=> b!1444495 (=> (not res!976476) (not e!813855))))

(assert (=> b!1444495 (= res!976476 (validKeyInArray!0 (select (arr!47346 a!2862) j!93)))))

(declare-fun b!1444496 () Bool)

(assert (=> b!1444496 (= e!813856 (validKeyInArray!0 lt!634216))))

(declare-fun b!1444497 () Bool)

(declare-fun res!976472 () Bool)

(assert (=> b!1444497 (=> (not res!976472) (not e!813855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98116 (_ BitVec 32)) Bool)

(assert (=> b!1444497 (= res!976472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444498 () Bool)

(declare-fun res!976482 () Bool)

(assert (=> b!1444498 (=> (not res!976482) (not e!813855))))

(declare-datatypes ((List!33847 0))(
  ( (Nil!33844) (Cons!33843 (h!35193 (_ BitVec 64)) (t!48541 List!33847)) )
))
(declare-fun arrayNoDuplicates!0 (array!98116 (_ BitVec 32) List!33847) Bool)

(assert (=> b!1444498 (= res!976482 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33844))))

(declare-fun b!1444499 () Bool)

(assert (=> b!1444499 (= e!813857 (not e!813856))))

(declare-fun res!976473 () Bool)

(assert (=> b!1444499 (=> res!976473 e!813856)))

(assert (=> b!1444499 (= res!976473 (or (not (= (select (arr!47346 a!2862) index!646) (select (store (arr!47346 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47346 a!2862) index!646) (select (arr!47346 a!2862) j!93)))))))

(assert (=> b!1444499 (and (= lt!634214 (Found!11598 j!93)) (or (= (select (arr!47346 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47346 a!2862) intermediateBeforeIndex!19) (select (arr!47346 a!2862) j!93))))))

(assert (=> b!1444499 (= lt!634214 (seekEntryOrOpen!0 (select (arr!47346 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1444499 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48692 0))(
  ( (Unit!48693) )
))
(declare-fun lt!634217 () Unit!48692)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98116 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48692)

(assert (=> b!1444499 (= lt!634217 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1444500 () Bool)

(assert (=> b!1444500 (= e!813851 e!813857)))

(declare-fun res!976478 () Bool)

(assert (=> b!1444500 (=> (not res!976478) (not e!813857))))

(declare-fun lt!634215 () SeekEntryResult!11598)

(assert (=> b!1444500 (= res!976478 (= lt!634215 (Intermediate!11598 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1444500 (= lt!634215 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634216 mask!2687) lt!634216 lt!634213 mask!2687))))

(assert (=> b!1444500 (= lt!634216 (select (store (arr!47346 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1444501 () Bool)

(declare-fun res!976475 () Bool)

(assert (=> b!1444501 (=> (not res!976475) (not e!813855))))

(assert (=> b!1444501 (= res!976475 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47896 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47896 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47896 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1444502 () Bool)

(declare-fun res!976479 () Bool)

(assert (=> b!1444502 (=> (not res!976479) (not e!813857))))

(assert (=> b!1444502 (= res!976479 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1444503 () Bool)

(assert (=> b!1444503 (= e!813853 (= lt!634215 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634216 lt!634213 mask!2687)))))

(assert (= (and start!124668 res!976471) b!1444492))

(assert (= (and b!1444492 res!976486) b!1444487))

(assert (= (and b!1444487 res!976484) b!1444495))

(assert (= (and b!1444495 res!976476) b!1444497))

(assert (= (and b!1444497 res!976472) b!1444498))

(assert (= (and b!1444498 res!976482) b!1444501))

(assert (= (and b!1444501 res!976475) b!1444486))

(assert (= (and b!1444486 res!976485) b!1444489))

(assert (= (and b!1444489 res!976477) b!1444494))

(assert (= (and b!1444494 res!976480) b!1444500))

(assert (= (and b!1444500 res!976478) b!1444490))

(assert (= (and b!1444490 c!133518) b!1444503))

(assert (= (and b!1444490 (not c!133518)) b!1444493))

(assert (= (and b!1444490 res!976483) b!1444502))

(assert (= (and b!1444502 res!976479) b!1444499))

(assert (= (and b!1444499 (not res!976473)) b!1444491))

(assert (= (and b!1444491 (not res!976474)) b!1444488))

(assert (= (and b!1444488 (not res!976481)) b!1444496))

(declare-fun m!1333505 () Bool)

(assert (=> b!1444497 m!1333505))

(declare-fun m!1333507 () Bool)

(assert (=> b!1444486 m!1333507))

(declare-fun m!1333509 () Bool)

(assert (=> b!1444486 m!1333509))

(declare-fun m!1333511 () Bool)

(assert (=> b!1444503 m!1333511))

(declare-fun m!1333513 () Bool)

(assert (=> b!1444493 m!1333513))

(declare-fun m!1333515 () Bool)

(assert (=> b!1444493 m!1333515))

(assert (=> b!1444491 m!1333515))

(declare-fun m!1333517 () Bool)

(assert (=> b!1444495 m!1333517))

(assert (=> b!1444495 m!1333517))

(declare-fun m!1333519 () Bool)

(assert (=> b!1444495 m!1333519))

(declare-fun m!1333521 () Bool)

(assert (=> start!124668 m!1333521))

(declare-fun m!1333523 () Bool)

(assert (=> start!124668 m!1333523))

(declare-fun m!1333525 () Bool)

(assert (=> b!1444498 m!1333525))

(assert (=> b!1444489 m!1333517))

(assert (=> b!1444489 m!1333517))

(declare-fun m!1333527 () Bool)

(assert (=> b!1444489 m!1333527))

(assert (=> b!1444489 m!1333527))

(assert (=> b!1444489 m!1333517))

(declare-fun m!1333529 () Bool)

(assert (=> b!1444489 m!1333529))

(declare-fun m!1333531 () Bool)

(assert (=> b!1444500 m!1333531))

(assert (=> b!1444500 m!1333531))

(declare-fun m!1333533 () Bool)

(assert (=> b!1444500 m!1333533))

(assert (=> b!1444500 m!1333507))

(declare-fun m!1333535 () Bool)

(assert (=> b!1444500 m!1333535))

(declare-fun m!1333537 () Bool)

(assert (=> b!1444496 m!1333537))

(declare-fun m!1333539 () Bool)

(assert (=> b!1444487 m!1333539))

(assert (=> b!1444487 m!1333539))

(declare-fun m!1333541 () Bool)

(assert (=> b!1444487 m!1333541))

(assert (=> b!1444494 m!1333517))

(assert (=> b!1444494 m!1333517))

(declare-fun m!1333543 () Bool)

(assert (=> b!1444494 m!1333543))

(declare-fun m!1333545 () Bool)

(assert (=> b!1444499 m!1333545))

(assert (=> b!1444499 m!1333507))

(declare-fun m!1333547 () Bool)

(assert (=> b!1444499 m!1333547))

(declare-fun m!1333549 () Bool)

(assert (=> b!1444499 m!1333549))

(declare-fun m!1333551 () Bool)

(assert (=> b!1444499 m!1333551))

(assert (=> b!1444499 m!1333517))

(declare-fun m!1333553 () Bool)

(assert (=> b!1444499 m!1333553))

(declare-fun m!1333555 () Bool)

(assert (=> b!1444499 m!1333555))

(assert (=> b!1444499 m!1333517))

(check-sat (not b!1444496) (not b!1444493) (not b!1444494) (not start!124668) (not b!1444497) (not b!1444487) (not b!1444503) (not b!1444489) (not b!1444500) (not b!1444498) (not b!1444495) (not b!1444491) (not b!1444499))
(check-sat)
