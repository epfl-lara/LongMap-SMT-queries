; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125178 () Bool)

(assert start!125178)

(declare-fun b!1459518 () Bool)

(declare-fun res!989446 () Bool)

(declare-fun e!820796 () Bool)

(assert (=> b!1459518 (=> (not res!989446) (not e!820796))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98626 0))(
  ( (array!98627 (arr!47601 (Array (_ BitVec 32) (_ BitVec 64))) (size!48151 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98626)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1459518 (= res!989446 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48151 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48151 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48151 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!639478 () array!98626)

(declare-fun lt!639480 () (_ BitVec 64))

(declare-fun b!1459519 () Bool)

(declare-fun e!820791 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11853 0))(
  ( (MissingZero!11853 (index!49804 (_ BitVec 32))) (Found!11853 (index!49805 (_ BitVec 32))) (Intermediate!11853 (undefined!12665 Bool) (index!49806 (_ BitVec 32)) (x!131414 (_ BitVec 32))) (Undefined!11853) (MissingVacant!11853 (index!49807 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98626 (_ BitVec 32)) SeekEntryResult!11853)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98626 (_ BitVec 32)) SeekEntryResult!11853)

(assert (=> b!1459519 (= e!820791 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639480 lt!639478 mask!2687) (seekEntryOrOpen!0 lt!639480 lt!639478 mask!2687)))))

(declare-fun b!1459520 () Bool)

(declare-fun e!820793 () Bool)

(declare-fun e!820799 () Bool)

(assert (=> b!1459520 (= e!820793 e!820799)))

(declare-fun res!989450 () Bool)

(assert (=> b!1459520 (=> res!989450 e!820799)))

(declare-fun lt!639475 () (_ BitVec 32))

(assert (=> b!1459520 (= res!989450 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639475 #b00000000000000000000000000000000) (bvsge lt!639475 (size!48151 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459520 (= lt!639475 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!639481 () SeekEntryResult!11853)

(assert (=> b!1459520 (= lt!639481 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639480 lt!639478 mask!2687))))

(assert (=> b!1459520 (= lt!639481 (seekEntryOrOpen!0 lt!639480 lt!639478 mask!2687))))

(declare-fun b!1459521 () Bool)

(declare-fun e!820798 () Bool)

(declare-fun e!820794 () Bool)

(assert (=> b!1459521 (= e!820798 e!820794)))

(declare-fun res!989453 () Bool)

(assert (=> b!1459521 (=> (not res!989453) (not e!820794))))

(declare-fun lt!639479 () SeekEntryResult!11853)

(assert (=> b!1459521 (= res!989453 (= lt!639479 (Intermediate!11853 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98626 (_ BitVec 32)) SeekEntryResult!11853)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459521 (= lt!639479 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639480 mask!2687) lt!639480 lt!639478 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1459521 (= lt!639480 (select (store (arr!47601 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1459522 () Bool)

(assert (=> b!1459522 (= e!820799 true)))

(declare-fun lt!639483 () SeekEntryResult!11853)

(assert (=> b!1459522 (= lt!639483 lt!639481)))

(declare-datatypes ((Unit!49202 0))(
  ( (Unit!49203) )
))
(declare-fun lt!639482 () Unit!49202)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98626 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49202)

(assert (=> b!1459522 (= lt!639482 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639475 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1459523 () Bool)

(declare-fun res!989445 () Bool)

(assert (=> b!1459523 (=> (not res!989445) (not e!820794))))

(assert (=> b!1459523 (= res!989445 e!820791)))

(declare-fun c!134550 () Bool)

(assert (=> b!1459523 (= c!134550 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1459524 () Bool)

(declare-fun res!989458 () Bool)

(assert (=> b!1459524 (=> (not res!989458) (not e!820796))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1459524 (= res!989458 (validKeyInArray!0 (select (arr!47601 a!2862) i!1006)))))

(declare-fun res!989452 () Bool)

(assert (=> start!125178 (=> (not res!989452) (not e!820796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125178 (= res!989452 (validMask!0 mask!2687))))

(assert (=> start!125178 e!820796))

(assert (=> start!125178 true))

(declare-fun array_inv!36629 (array!98626) Bool)

(assert (=> start!125178 (array_inv!36629 a!2862)))

(declare-fun b!1459525 () Bool)

(declare-fun e!820792 () Bool)

(assert (=> b!1459525 (= e!820792 (not (= lt!639479 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639475 lt!639480 lt!639478 mask!2687))))))

(declare-fun b!1459526 () Bool)

(declare-fun res!989444 () Bool)

(assert (=> b!1459526 (=> (not res!989444) (not e!820796))))

(assert (=> b!1459526 (= res!989444 (validKeyInArray!0 (select (arr!47601 a!2862) j!93)))))

(declare-fun b!1459527 () Bool)

(declare-fun e!820797 () Bool)

(assert (=> b!1459527 (= e!820796 e!820797)))

(declare-fun res!989456 () Bool)

(assert (=> b!1459527 (=> (not res!989456) (not e!820797))))

(assert (=> b!1459527 (= res!989456 (= (select (store (arr!47601 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1459527 (= lt!639478 (array!98627 (store (arr!47601 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48151 a!2862)))))

(declare-fun b!1459528 () Bool)

(declare-fun res!989455 () Bool)

(assert (=> b!1459528 (=> res!989455 e!820799)))

(assert (=> b!1459528 (= res!989455 e!820792)))

(declare-fun c!134549 () Bool)

(assert (=> b!1459528 (= c!134549 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1459529 () Bool)

(declare-fun res!989448 () Bool)

(assert (=> b!1459529 (=> res!989448 e!820799)))

(declare-fun lt!639477 () SeekEntryResult!11853)

(assert (=> b!1459529 (= res!989448 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639475 (select (arr!47601 a!2862) j!93) a!2862 mask!2687) lt!639477)))))

(declare-fun b!1459530 () Bool)

(declare-fun res!989449 () Bool)

(assert (=> b!1459530 (=> (not res!989449) (not e!820796))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98626 (_ BitVec 32)) Bool)

(assert (=> b!1459530 (= res!989449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1459531 () Bool)

(assert (=> b!1459531 (= e!820792 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639475 intermediateAfterIndex!19 lt!639480 lt!639478 mask!2687) lt!639481)))))

(declare-fun b!1459532 () Bool)

(assert (=> b!1459532 (= e!820797 e!820798)))

(declare-fun res!989447 () Bool)

(assert (=> b!1459532 (=> (not res!989447) (not e!820798))))

(assert (=> b!1459532 (= res!989447 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47601 a!2862) j!93) mask!2687) (select (arr!47601 a!2862) j!93) a!2862 mask!2687) lt!639477))))

(assert (=> b!1459532 (= lt!639477 (Intermediate!11853 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1459533 () Bool)

(declare-fun res!989442 () Bool)

(assert (=> b!1459533 (=> (not res!989442) (not e!820794))))

(assert (=> b!1459533 (= res!989442 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1459534 () Bool)

(declare-fun res!989443 () Bool)

(assert (=> b!1459534 (=> res!989443 e!820799)))

(assert (=> b!1459534 (= res!989443 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1459535 () Bool)

(declare-fun res!989454 () Bool)

(assert (=> b!1459535 (=> (not res!989454) (not e!820798))))

(assert (=> b!1459535 (= res!989454 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47601 a!2862) j!93) a!2862 mask!2687) lt!639477))))

(declare-fun b!1459536 () Bool)

(declare-fun res!989441 () Bool)

(assert (=> b!1459536 (=> (not res!989441) (not e!820796))))

(declare-datatypes ((List!34102 0))(
  ( (Nil!34099) (Cons!34098 (h!35448 (_ BitVec 64)) (t!48796 List!34102)) )
))
(declare-fun arrayNoDuplicates!0 (array!98626 (_ BitVec 32) List!34102) Bool)

(assert (=> b!1459536 (= res!989441 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34099))))

(declare-fun b!1459537 () Bool)

(declare-fun res!989457 () Bool)

(assert (=> b!1459537 (=> (not res!989457) (not e!820796))))

(assert (=> b!1459537 (= res!989457 (and (= (size!48151 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48151 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48151 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1459538 () Bool)

(assert (=> b!1459538 (= e!820794 (not e!820793))))

(declare-fun res!989451 () Bool)

(assert (=> b!1459538 (=> res!989451 e!820793)))

(assert (=> b!1459538 (= res!989451 (or (and (= (select (arr!47601 a!2862) index!646) (select (store (arr!47601 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47601 a!2862) index!646) (select (arr!47601 a!2862) j!93))) (= (select (arr!47601 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1459538 (and (= lt!639483 (Found!11853 j!93)) (or (= (select (arr!47601 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47601 a!2862) intermediateBeforeIndex!19) (select (arr!47601 a!2862) j!93))) (let ((bdg!53515 (select (store (arr!47601 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47601 a!2862) index!646) bdg!53515) (= (select (arr!47601 a!2862) index!646) (select (arr!47601 a!2862) j!93))) (= (select (arr!47601 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53515 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1459538 (= lt!639483 (seekEntryOrOpen!0 (select (arr!47601 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1459538 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!639476 () Unit!49202)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98626 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49202)

(assert (=> b!1459538 (= lt!639476 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1459539 () Bool)

(assert (=> b!1459539 (= e!820791 (= lt!639479 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639480 lt!639478 mask!2687)))))

(assert (= (and start!125178 res!989452) b!1459537))

(assert (= (and b!1459537 res!989457) b!1459524))

(assert (= (and b!1459524 res!989458) b!1459526))

(assert (= (and b!1459526 res!989444) b!1459530))

(assert (= (and b!1459530 res!989449) b!1459536))

(assert (= (and b!1459536 res!989441) b!1459518))

(assert (= (and b!1459518 res!989446) b!1459527))

(assert (= (and b!1459527 res!989456) b!1459532))

(assert (= (and b!1459532 res!989447) b!1459535))

(assert (= (and b!1459535 res!989454) b!1459521))

(assert (= (and b!1459521 res!989453) b!1459523))

(assert (= (and b!1459523 c!134550) b!1459539))

(assert (= (and b!1459523 (not c!134550)) b!1459519))

(assert (= (and b!1459523 res!989445) b!1459533))

(assert (= (and b!1459533 res!989442) b!1459538))

(assert (= (and b!1459538 (not res!989451)) b!1459520))

(assert (= (and b!1459520 (not res!989450)) b!1459529))

(assert (= (and b!1459529 (not res!989448)) b!1459528))

(assert (= (and b!1459528 c!134549) b!1459525))

(assert (= (and b!1459528 (not c!134549)) b!1459531))

(assert (= (and b!1459528 (not res!989455)) b!1459534))

(assert (= (and b!1459534 (not res!989443)) b!1459522))

(declare-fun m!1347271 () Bool)

(assert (=> b!1459539 m!1347271))

(declare-fun m!1347273 () Bool)

(assert (=> b!1459526 m!1347273))

(assert (=> b!1459526 m!1347273))

(declare-fun m!1347275 () Bool)

(assert (=> b!1459526 m!1347275))

(assert (=> b!1459532 m!1347273))

(assert (=> b!1459532 m!1347273))

(declare-fun m!1347277 () Bool)

(assert (=> b!1459532 m!1347277))

(assert (=> b!1459532 m!1347277))

(assert (=> b!1459532 m!1347273))

(declare-fun m!1347279 () Bool)

(assert (=> b!1459532 m!1347279))

(declare-fun m!1347281 () Bool)

(assert (=> start!125178 m!1347281))

(declare-fun m!1347283 () Bool)

(assert (=> start!125178 m!1347283))

(declare-fun m!1347285 () Bool)

(assert (=> b!1459522 m!1347285))

(declare-fun m!1347287 () Bool)

(assert (=> b!1459520 m!1347287))

(declare-fun m!1347289 () Bool)

(assert (=> b!1459520 m!1347289))

(declare-fun m!1347291 () Bool)

(assert (=> b!1459520 m!1347291))

(assert (=> b!1459529 m!1347273))

(assert (=> b!1459529 m!1347273))

(declare-fun m!1347293 () Bool)

(assert (=> b!1459529 m!1347293))

(declare-fun m!1347295 () Bool)

(assert (=> b!1459521 m!1347295))

(assert (=> b!1459521 m!1347295))

(declare-fun m!1347297 () Bool)

(assert (=> b!1459521 m!1347297))

(declare-fun m!1347299 () Bool)

(assert (=> b!1459521 m!1347299))

(declare-fun m!1347301 () Bool)

(assert (=> b!1459521 m!1347301))

(declare-fun m!1347303 () Bool)

(assert (=> b!1459536 m!1347303))

(declare-fun m!1347305 () Bool)

(assert (=> b!1459530 m!1347305))

(assert (=> b!1459535 m!1347273))

(assert (=> b!1459535 m!1347273))

(declare-fun m!1347307 () Bool)

(assert (=> b!1459535 m!1347307))

(declare-fun m!1347309 () Bool)

(assert (=> b!1459531 m!1347309))

(declare-fun m!1347311 () Bool)

(assert (=> b!1459538 m!1347311))

(assert (=> b!1459538 m!1347299))

(declare-fun m!1347313 () Bool)

(assert (=> b!1459538 m!1347313))

(declare-fun m!1347315 () Bool)

(assert (=> b!1459538 m!1347315))

(declare-fun m!1347317 () Bool)

(assert (=> b!1459538 m!1347317))

(assert (=> b!1459538 m!1347273))

(declare-fun m!1347319 () Bool)

(assert (=> b!1459538 m!1347319))

(declare-fun m!1347321 () Bool)

(assert (=> b!1459538 m!1347321))

(assert (=> b!1459538 m!1347273))

(assert (=> b!1459527 m!1347299))

(declare-fun m!1347323 () Bool)

(assert (=> b!1459527 m!1347323))

(declare-fun m!1347325 () Bool)

(assert (=> b!1459525 m!1347325))

(assert (=> b!1459519 m!1347289))

(assert (=> b!1459519 m!1347291))

(declare-fun m!1347327 () Bool)

(assert (=> b!1459524 m!1347327))

(assert (=> b!1459524 m!1347327))

(declare-fun m!1347329 () Bool)

(assert (=> b!1459524 m!1347329))

(check-sat (not b!1459521) (not b!1459524) (not b!1459519) (not b!1459531) (not b!1459526) (not start!125178) (not b!1459529) (not b!1459539) (not b!1459530) (not b!1459522) (not b!1459536) (not b!1459532) (not b!1459520) (not b!1459538) (not b!1459525) (not b!1459535))
(check-sat)
