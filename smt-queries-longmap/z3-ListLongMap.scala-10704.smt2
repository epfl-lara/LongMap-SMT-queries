; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125364 () Bool)

(assert start!125364)

(declare-fun b!1465485 () Bool)

(declare-fun res!994372 () Bool)

(declare-fun e!823456 () Bool)

(assert (=> b!1465485 (=> (not res!994372) (not e!823456))))

(declare-fun e!823457 () Bool)

(assert (=> b!1465485 (= res!994372 e!823457)))

(declare-fun c!135071 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1465485 (= c!135071 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1465486 () Bool)

(declare-fun res!994369 () Bool)

(declare-fun e!823460 () Bool)

(assert (=> b!1465486 (=> (not res!994369) (not e!823460))))

(declare-datatypes ((array!98812 0))(
  ( (array!98813 (arr!47694 (Array (_ BitVec 32) (_ BitVec 64))) (size!48244 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98812)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1465486 (= res!994369 (validKeyInArray!0 (select (arr!47694 a!2862) i!1006)))))

(declare-fun b!1465487 () Bool)

(declare-fun e!823453 () Bool)

(declare-fun e!823459 () Bool)

(assert (=> b!1465487 (= e!823453 e!823459)))

(declare-fun res!994370 () Bool)

(assert (=> b!1465487 (=> (not res!994370) (not e!823459))))

(declare-datatypes ((SeekEntryResult!11946 0))(
  ( (MissingZero!11946 (index!50176 (_ BitVec 32))) (Found!11946 (index!50177 (_ BitVec 32))) (Intermediate!11946 (undefined!12758 Bool) (index!50178 (_ BitVec 32)) (x!131755 (_ BitVec 32))) (Undefined!11946) (MissingVacant!11946 (index!50179 (_ BitVec 32))) )
))
(declare-fun lt!641420 () SeekEntryResult!11946)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98812 (_ BitVec 32)) SeekEntryResult!11946)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465487 (= res!994370 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47694 a!2862) j!93) mask!2687) (select (arr!47694 a!2862) j!93) a!2862 mask!2687) lt!641420))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1465487 (= lt!641420 (Intermediate!11946 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1465488 () Bool)

(declare-fun lt!641424 () SeekEntryResult!11946)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!641418 () array!98812)

(declare-fun lt!641422 () (_ BitVec 64))

(assert (=> b!1465488 (= e!823457 (= lt!641424 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641422 lt!641418 mask!2687)))))

(declare-fun b!1465489 () Bool)

(declare-fun res!994381 () Bool)

(assert (=> b!1465489 (=> (not res!994381) (not e!823460))))

(declare-datatypes ((List!34195 0))(
  ( (Nil!34192) (Cons!34191 (h!35541 (_ BitVec 64)) (t!48889 List!34195)) )
))
(declare-fun arrayNoDuplicates!0 (array!98812 (_ BitVec 32) List!34195) Bool)

(assert (=> b!1465489 (= res!994381 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34192))))

(declare-fun b!1465490 () Bool)

(assert (=> b!1465490 (= e!823460 e!823453)))

(declare-fun res!994375 () Bool)

(assert (=> b!1465490 (=> (not res!994375) (not e!823453))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1465490 (= res!994375 (= (select (store (arr!47694 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1465490 (= lt!641418 (array!98813 (store (arr!47694 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48244 a!2862)))))

(declare-fun b!1465492 () Bool)

(declare-fun e!823458 () Bool)

(assert (=> b!1465492 (= e!823458 (or (= (select (arr!47694 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47694 a!2862) intermediateBeforeIndex!19) (select (arr!47694 a!2862) j!93))))))

(declare-fun b!1465493 () Bool)

(declare-fun res!994376 () Bool)

(assert (=> b!1465493 (=> (not res!994376) (not e!823460))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98812 (_ BitVec 32)) Bool)

(assert (=> b!1465493 (= res!994376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1465494 () Bool)

(declare-fun e!823455 () Bool)

(assert (=> b!1465494 (= e!823455 true)))

(declare-fun lt!641423 () Bool)

(declare-fun e!823451 () Bool)

(assert (=> b!1465494 (= lt!641423 e!823451)))

(declare-fun c!135072 () Bool)

(assert (=> b!1465494 (= c!135072 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1465495 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98812 (_ BitVec 32)) SeekEntryResult!11946)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98812 (_ BitVec 32)) SeekEntryResult!11946)

(assert (=> b!1465495 (= e!823457 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641422 lt!641418 mask!2687) (seekEntryOrOpen!0 lt!641422 lt!641418 mask!2687)))))

(declare-fun lt!641421 () (_ BitVec 32))

(declare-fun b!1465496 () Bool)

(assert (=> b!1465496 (= e!823451 (not (= lt!641424 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641421 lt!641422 lt!641418 mask!2687))))))

(declare-fun b!1465497 () Bool)

(declare-fun res!994379 () Bool)

(assert (=> b!1465497 (=> res!994379 e!823455)))

(assert (=> b!1465497 (= res!994379 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641421 (select (arr!47694 a!2862) j!93) a!2862 mask!2687) lt!641420)))))

(declare-fun b!1465498 () Bool)

(declare-fun e!823452 () Bool)

(assert (=> b!1465498 (= e!823456 (not e!823452))))

(declare-fun res!994378 () Bool)

(assert (=> b!1465498 (=> res!994378 e!823452)))

(assert (=> b!1465498 (= res!994378 (or (and (= (select (arr!47694 a!2862) index!646) (select (store (arr!47694 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47694 a!2862) index!646) (select (arr!47694 a!2862) j!93))) (= (select (arr!47694 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1465498 e!823458))

(declare-fun res!994373 () Bool)

(assert (=> b!1465498 (=> (not res!994373) (not e!823458))))

(assert (=> b!1465498 (= res!994373 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49388 0))(
  ( (Unit!49389) )
))
(declare-fun lt!641419 () Unit!49388)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98812 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49388)

(assert (=> b!1465498 (= lt!641419 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1465499 () Bool)

(declare-fun res!994367 () Bool)

(assert (=> b!1465499 (=> (not res!994367) (not e!823456))))

(assert (=> b!1465499 (= res!994367 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1465500 () Bool)

(declare-fun res!994374 () Bool)

(assert (=> b!1465500 (=> (not res!994374) (not e!823458))))

(assert (=> b!1465500 (= res!994374 (= (seekEntryOrOpen!0 (select (arr!47694 a!2862) j!93) a!2862 mask!2687) (Found!11946 j!93)))))

(declare-fun b!1465491 () Bool)

(declare-fun res!994365 () Bool)

(assert (=> b!1465491 (=> (not res!994365) (not e!823460))))

(assert (=> b!1465491 (= res!994365 (and (= (size!48244 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48244 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48244 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!994380 () Bool)

(assert (=> start!125364 (=> (not res!994380) (not e!823460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125364 (= res!994380 (validMask!0 mask!2687))))

(assert (=> start!125364 e!823460))

(assert (=> start!125364 true))

(declare-fun array_inv!36722 (array!98812) Bool)

(assert (=> start!125364 (array_inv!36722 a!2862)))

(declare-fun b!1465501 () Bool)

(declare-fun res!994364 () Bool)

(assert (=> b!1465501 (=> (not res!994364) (not e!823460))))

(assert (=> b!1465501 (= res!994364 (validKeyInArray!0 (select (arr!47694 a!2862) j!93)))))

(declare-fun b!1465502 () Bool)

(declare-fun res!994366 () Bool)

(assert (=> b!1465502 (=> (not res!994366) (not e!823459))))

(assert (=> b!1465502 (= res!994366 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47694 a!2862) j!93) a!2862 mask!2687) lt!641420))))

(declare-fun b!1465503 () Bool)

(assert (=> b!1465503 (= e!823459 e!823456)))

(declare-fun res!994377 () Bool)

(assert (=> b!1465503 (=> (not res!994377) (not e!823456))))

(assert (=> b!1465503 (= res!994377 (= lt!641424 (Intermediate!11946 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1465503 (= lt!641424 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641422 mask!2687) lt!641422 lt!641418 mask!2687))))

(assert (=> b!1465503 (= lt!641422 (select (store (arr!47694 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1465504 () Bool)

(assert (=> b!1465504 (= e!823452 e!823455)))

(declare-fun res!994368 () Bool)

(assert (=> b!1465504 (=> res!994368 e!823455)))

(assert (=> b!1465504 (= res!994368 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641421 #b00000000000000000000000000000000) (bvsge lt!641421 (size!48244 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465504 (= lt!641421 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1465505 () Bool)

(assert (=> b!1465505 (= e!823451 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641421 intermediateAfterIndex!19 lt!641422 lt!641418 mask!2687) (seekEntryOrOpen!0 lt!641422 lt!641418 mask!2687))))))

(declare-fun b!1465506 () Bool)

(declare-fun res!994371 () Bool)

(assert (=> b!1465506 (=> (not res!994371) (not e!823460))))

(assert (=> b!1465506 (= res!994371 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48244 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48244 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48244 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!125364 res!994380) b!1465491))

(assert (= (and b!1465491 res!994365) b!1465486))

(assert (= (and b!1465486 res!994369) b!1465501))

(assert (= (and b!1465501 res!994364) b!1465493))

(assert (= (and b!1465493 res!994376) b!1465489))

(assert (= (and b!1465489 res!994381) b!1465506))

(assert (= (and b!1465506 res!994371) b!1465490))

(assert (= (and b!1465490 res!994375) b!1465487))

(assert (= (and b!1465487 res!994370) b!1465502))

(assert (= (and b!1465502 res!994366) b!1465503))

(assert (= (and b!1465503 res!994377) b!1465485))

(assert (= (and b!1465485 c!135071) b!1465488))

(assert (= (and b!1465485 (not c!135071)) b!1465495))

(assert (= (and b!1465485 res!994372) b!1465499))

(assert (= (and b!1465499 res!994367) b!1465498))

(assert (= (and b!1465498 res!994373) b!1465500))

(assert (= (and b!1465500 res!994374) b!1465492))

(assert (= (and b!1465498 (not res!994378)) b!1465504))

(assert (= (and b!1465504 (not res!994368)) b!1465497))

(assert (= (and b!1465497 (not res!994379)) b!1465494))

(assert (= (and b!1465494 c!135072) b!1465496))

(assert (= (and b!1465494 (not c!135072)) b!1465505))

(declare-fun m!1352573 () Bool)

(assert (=> b!1465497 m!1352573))

(assert (=> b!1465497 m!1352573))

(declare-fun m!1352575 () Bool)

(assert (=> b!1465497 m!1352575))

(declare-fun m!1352577 () Bool)

(assert (=> b!1465503 m!1352577))

(assert (=> b!1465503 m!1352577))

(declare-fun m!1352579 () Bool)

(assert (=> b!1465503 m!1352579))

(declare-fun m!1352581 () Bool)

(assert (=> b!1465503 m!1352581))

(declare-fun m!1352583 () Bool)

(assert (=> b!1465503 m!1352583))

(declare-fun m!1352585 () Bool)

(assert (=> b!1465495 m!1352585))

(declare-fun m!1352587 () Bool)

(assert (=> b!1465495 m!1352587))

(declare-fun m!1352589 () Bool)

(assert (=> b!1465496 m!1352589))

(assert (=> b!1465487 m!1352573))

(assert (=> b!1465487 m!1352573))

(declare-fun m!1352591 () Bool)

(assert (=> b!1465487 m!1352591))

(assert (=> b!1465487 m!1352591))

(assert (=> b!1465487 m!1352573))

(declare-fun m!1352593 () Bool)

(assert (=> b!1465487 m!1352593))

(declare-fun m!1352595 () Bool)

(assert (=> b!1465489 m!1352595))

(assert (=> b!1465500 m!1352573))

(assert (=> b!1465500 m!1352573))

(declare-fun m!1352597 () Bool)

(assert (=> b!1465500 m!1352597))

(declare-fun m!1352599 () Bool)

(assert (=> b!1465493 m!1352599))

(declare-fun m!1352601 () Bool)

(assert (=> b!1465486 m!1352601))

(assert (=> b!1465486 m!1352601))

(declare-fun m!1352603 () Bool)

(assert (=> b!1465486 m!1352603))

(declare-fun m!1352605 () Bool)

(assert (=> start!125364 m!1352605))

(declare-fun m!1352607 () Bool)

(assert (=> start!125364 m!1352607))

(assert (=> b!1465490 m!1352581))

(declare-fun m!1352609 () Bool)

(assert (=> b!1465490 m!1352609))

(declare-fun m!1352611 () Bool)

(assert (=> b!1465492 m!1352611))

(assert (=> b!1465492 m!1352573))

(declare-fun m!1352613 () Bool)

(assert (=> b!1465505 m!1352613))

(assert (=> b!1465505 m!1352587))

(declare-fun m!1352615 () Bool)

(assert (=> b!1465498 m!1352615))

(assert (=> b!1465498 m!1352581))

(declare-fun m!1352617 () Bool)

(assert (=> b!1465498 m!1352617))

(declare-fun m!1352619 () Bool)

(assert (=> b!1465498 m!1352619))

(declare-fun m!1352621 () Bool)

(assert (=> b!1465498 m!1352621))

(assert (=> b!1465498 m!1352573))

(declare-fun m!1352623 () Bool)

(assert (=> b!1465488 m!1352623))

(assert (=> b!1465502 m!1352573))

(assert (=> b!1465502 m!1352573))

(declare-fun m!1352625 () Bool)

(assert (=> b!1465502 m!1352625))

(declare-fun m!1352627 () Bool)

(assert (=> b!1465504 m!1352627))

(assert (=> b!1465501 m!1352573))

(assert (=> b!1465501 m!1352573))

(declare-fun m!1352629 () Bool)

(assert (=> b!1465501 m!1352629))

(check-sat (not b!1465487) (not b!1465503) (not b!1465500) (not b!1465493) (not b!1465496) (not b!1465488) (not b!1465489) (not b!1465501) (not b!1465497) (not b!1465495) (not b!1465502) (not start!125364) (not b!1465505) (not b!1465498) (not b!1465504) (not b!1465486))
(check-sat)
