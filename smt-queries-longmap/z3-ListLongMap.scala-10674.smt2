; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125152 () Bool)

(assert start!125152)

(declare-fun b!1459455 () Bool)

(declare-fun res!989479 () Bool)

(declare-fun e!820737 () Bool)

(assert (=> b!1459455 (=> (not res!989479) (not e!820737))))

(declare-datatypes ((array!98578 0))(
  ( (array!98579 (arr!47578 (Array (_ BitVec 32) (_ BitVec 64))) (size!48130 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98578)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1459455 (= res!989479 (validKeyInArray!0 (select (arr!47578 a!2862) i!1006)))))

(declare-fun b!1459456 () Bool)

(declare-fun e!820730 () Bool)

(declare-fun e!820734 () Bool)

(assert (=> b!1459456 (= e!820730 e!820734)))

(declare-fun res!989485 () Bool)

(assert (=> b!1459456 (=> (not res!989485) (not e!820734))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11855 0))(
  ( (MissingZero!11855 (index!49812 (_ BitVec 32))) (Found!11855 (index!49813 (_ BitVec 32))) (Intermediate!11855 (undefined!12667 Bool) (index!49814 (_ BitVec 32)) (x!131419 (_ BitVec 32))) (Undefined!11855) (MissingVacant!11855 (index!49815 (_ BitVec 32))) )
))
(declare-fun lt!639301 () SeekEntryResult!11855)

(assert (=> b!1459456 (= res!989485 (= lt!639301 (Intermediate!11855 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!639298 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!639300 () array!98578)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98578 (_ BitVec 32)) SeekEntryResult!11855)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459456 (= lt!639301 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639298 mask!2687) lt!639298 lt!639300 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1459456 (= lt!639298 (select (store (arr!47578 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!820736 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1459457 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98578 (_ BitVec 32)) SeekEntryResult!11855)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98578 (_ BitVec 32)) SeekEntryResult!11855)

(assert (=> b!1459457 (= e!820736 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639298 lt!639300 mask!2687) (seekEntryOrOpen!0 lt!639298 lt!639300 mask!2687)))))

(declare-fun b!1459458 () Bool)

(declare-fun res!989476 () Bool)

(assert (=> b!1459458 (=> (not res!989476) (not e!820734))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1459458 (= res!989476 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1459459 () Bool)

(declare-fun res!989483 () Bool)

(assert (=> b!1459459 (=> (not res!989483) (not e!820737))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1459459 (= res!989483 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48130 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48130 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48130 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1459460 () Bool)

(declare-fun res!989478 () Bool)

(declare-fun e!820735 () Bool)

(assert (=> b!1459460 (=> res!989478 e!820735)))

(assert (=> b!1459460 (= res!989478 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun e!820732 () Bool)

(declare-fun lt!639296 () (_ BitVec 32))

(declare-fun lt!639302 () SeekEntryResult!11855)

(declare-fun b!1459461 () Bool)

(assert (=> b!1459461 (= e!820732 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639296 intermediateAfterIndex!19 lt!639298 lt!639300 mask!2687) lt!639302)))))

(declare-fun b!1459462 () Bool)

(declare-fun res!989474 () Bool)

(assert (=> b!1459462 (=> (not res!989474) (not e!820737))))

(assert (=> b!1459462 (= res!989474 (and (= (size!48130 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48130 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48130 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1459463 () Bool)

(assert (=> b!1459463 (= e!820732 (not (= lt!639301 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639296 lt!639298 lt!639300 mask!2687))))))

(declare-fun b!1459464 () Bool)

(assert (=> b!1459464 (= e!820735 (bvsge mask!2687 #b00000000000000000000000000000000))))

(declare-fun lt!639295 () SeekEntryResult!11855)

(assert (=> b!1459464 (= lt!639295 lt!639302)))

(declare-datatypes ((Unit!49047 0))(
  ( (Unit!49048) )
))
(declare-fun lt!639299 () Unit!49047)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98578 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49047)

(assert (=> b!1459464 (= lt!639299 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!639296 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1459465 () Bool)

(declare-fun e!820731 () Bool)

(assert (=> b!1459465 (= e!820731 e!820735)))

(declare-fun res!989487 () Bool)

(assert (=> b!1459465 (=> res!989487 e!820735)))

(assert (=> b!1459465 (= res!989487 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!639296 #b00000000000000000000000000000000) (bvsge lt!639296 (size!48130 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1459465 (= lt!639296 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1459465 (= lt!639302 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639298 lt!639300 mask!2687))))

(assert (=> b!1459465 (= lt!639302 (seekEntryOrOpen!0 lt!639298 lt!639300 mask!2687))))

(declare-fun b!1459466 () Bool)

(declare-fun res!989480 () Bool)

(assert (=> b!1459466 (=> (not res!989480) (not e!820737))))

(declare-datatypes ((List!34157 0))(
  ( (Nil!34154) (Cons!34153 (h!35503 (_ BitVec 64)) (t!48843 List!34157)) )
))
(declare-fun arrayNoDuplicates!0 (array!98578 (_ BitVec 32) List!34157) Bool)

(assert (=> b!1459466 (= res!989480 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34154))))

(declare-fun res!989477 () Bool)

(assert (=> start!125152 (=> (not res!989477) (not e!820737))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125152 (= res!989477 (validMask!0 mask!2687))))

(assert (=> start!125152 e!820737))

(assert (=> start!125152 true))

(declare-fun array_inv!36811 (array!98578) Bool)

(assert (=> start!125152 (array_inv!36811 a!2862)))

(declare-fun b!1459467 () Bool)

(declare-fun res!989486 () Bool)

(assert (=> b!1459467 (=> res!989486 e!820735)))

(declare-fun lt!639303 () SeekEntryResult!11855)

(assert (=> b!1459467 (= res!989486 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!639296 (select (arr!47578 a!2862) j!93) a!2862 mask!2687) lt!639303)))))

(declare-fun b!1459468 () Bool)

(declare-fun res!989471 () Bool)

(assert (=> b!1459468 (=> (not res!989471) (not e!820730))))

(assert (=> b!1459468 (= res!989471 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47578 a!2862) j!93) a!2862 mask!2687) lt!639303))))

(declare-fun b!1459469 () Bool)

(assert (=> b!1459469 (= e!820736 (= lt!639301 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639298 lt!639300 mask!2687)))))

(declare-fun b!1459470 () Bool)

(declare-fun e!820729 () Bool)

(assert (=> b!1459470 (= e!820729 e!820730)))

(declare-fun res!989473 () Bool)

(assert (=> b!1459470 (=> (not res!989473) (not e!820730))))

(assert (=> b!1459470 (= res!989473 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47578 a!2862) j!93) mask!2687) (select (arr!47578 a!2862) j!93) a!2862 mask!2687) lt!639303))))

(assert (=> b!1459470 (= lt!639303 (Intermediate!11855 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1459471 () Bool)

(declare-fun res!989488 () Bool)

(assert (=> b!1459471 (=> res!989488 e!820735)))

(assert (=> b!1459471 (= res!989488 e!820732)))

(declare-fun c!134505 () Bool)

(assert (=> b!1459471 (= c!134505 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1459472 () Bool)

(declare-fun res!989482 () Bool)

(assert (=> b!1459472 (=> (not res!989482) (not e!820737))))

(assert (=> b!1459472 (= res!989482 (validKeyInArray!0 (select (arr!47578 a!2862) j!93)))))

(declare-fun b!1459473 () Bool)

(declare-fun res!989475 () Bool)

(assert (=> b!1459473 (=> (not res!989475) (not e!820737))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98578 (_ BitVec 32)) Bool)

(assert (=> b!1459473 (= res!989475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1459474 () Bool)

(assert (=> b!1459474 (= e!820737 e!820729)))

(declare-fun res!989472 () Bool)

(assert (=> b!1459474 (=> (not res!989472) (not e!820729))))

(assert (=> b!1459474 (= res!989472 (= (select (store (arr!47578 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1459474 (= lt!639300 (array!98579 (store (arr!47578 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48130 a!2862)))))

(declare-fun b!1459475 () Bool)

(assert (=> b!1459475 (= e!820734 (not e!820731))))

(declare-fun res!989481 () Bool)

(assert (=> b!1459475 (=> res!989481 e!820731)))

(assert (=> b!1459475 (= res!989481 (or (and (= (select (arr!47578 a!2862) index!646) (select (store (arr!47578 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47578 a!2862) index!646) (select (arr!47578 a!2862) j!93))) (= (select (arr!47578 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1459475 (and (= lt!639295 (Found!11855 j!93)) (or (= (select (arr!47578 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47578 a!2862) intermediateBeforeIndex!19) (select (arr!47578 a!2862) j!93))) (let ((bdg!53529 (select (store (arr!47578 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47578 a!2862) index!646) bdg!53529) (= (select (arr!47578 a!2862) index!646) (select (arr!47578 a!2862) j!93))) (= (select (arr!47578 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53529 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1459475 (= lt!639295 (seekEntryOrOpen!0 (select (arr!47578 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1459475 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!639297 () Unit!49047)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98578 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49047)

(assert (=> b!1459475 (= lt!639297 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1459476 () Bool)

(declare-fun res!989484 () Bool)

(assert (=> b!1459476 (=> (not res!989484) (not e!820734))))

(assert (=> b!1459476 (= res!989484 e!820736)))

(declare-fun c!134506 () Bool)

(assert (=> b!1459476 (= c!134506 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125152 res!989477) b!1459462))

(assert (= (and b!1459462 res!989474) b!1459455))

(assert (= (and b!1459455 res!989479) b!1459472))

(assert (= (and b!1459472 res!989482) b!1459473))

(assert (= (and b!1459473 res!989475) b!1459466))

(assert (= (and b!1459466 res!989480) b!1459459))

(assert (= (and b!1459459 res!989483) b!1459474))

(assert (= (and b!1459474 res!989472) b!1459470))

(assert (= (and b!1459470 res!989473) b!1459468))

(assert (= (and b!1459468 res!989471) b!1459456))

(assert (= (and b!1459456 res!989485) b!1459476))

(assert (= (and b!1459476 c!134506) b!1459469))

(assert (= (and b!1459476 (not c!134506)) b!1459457))

(assert (= (and b!1459476 res!989484) b!1459458))

(assert (= (and b!1459458 res!989476) b!1459475))

(assert (= (and b!1459475 (not res!989481)) b!1459465))

(assert (= (and b!1459465 (not res!989487)) b!1459467))

(assert (= (and b!1459467 (not res!989486)) b!1459471))

(assert (= (and b!1459471 c!134505) b!1459463))

(assert (= (and b!1459471 (not c!134505)) b!1459461))

(assert (= (and b!1459471 (not res!989488)) b!1459460))

(assert (= (and b!1459460 (not res!989478)) b!1459464))

(declare-fun m!1346715 () Bool)

(assert (=> b!1459455 m!1346715))

(assert (=> b!1459455 m!1346715))

(declare-fun m!1346717 () Bool)

(assert (=> b!1459455 m!1346717))

(declare-fun m!1346719 () Bool)

(assert (=> b!1459457 m!1346719))

(declare-fun m!1346721 () Bool)

(assert (=> b!1459457 m!1346721))

(declare-fun m!1346723 () Bool)

(assert (=> b!1459473 m!1346723))

(declare-fun m!1346725 () Bool)

(assert (=> b!1459466 m!1346725))

(declare-fun m!1346727 () Bool)

(assert (=> b!1459465 m!1346727))

(assert (=> b!1459465 m!1346719))

(assert (=> b!1459465 m!1346721))

(declare-fun m!1346729 () Bool)

(assert (=> b!1459467 m!1346729))

(assert (=> b!1459467 m!1346729))

(declare-fun m!1346731 () Bool)

(assert (=> b!1459467 m!1346731))

(declare-fun m!1346733 () Bool)

(assert (=> b!1459475 m!1346733))

(declare-fun m!1346735 () Bool)

(assert (=> b!1459475 m!1346735))

(declare-fun m!1346737 () Bool)

(assert (=> b!1459475 m!1346737))

(declare-fun m!1346739 () Bool)

(assert (=> b!1459475 m!1346739))

(declare-fun m!1346741 () Bool)

(assert (=> b!1459475 m!1346741))

(assert (=> b!1459475 m!1346729))

(declare-fun m!1346743 () Bool)

(assert (=> b!1459475 m!1346743))

(declare-fun m!1346745 () Bool)

(assert (=> b!1459475 m!1346745))

(assert (=> b!1459475 m!1346729))

(assert (=> b!1459470 m!1346729))

(assert (=> b!1459470 m!1346729))

(declare-fun m!1346747 () Bool)

(assert (=> b!1459470 m!1346747))

(assert (=> b!1459470 m!1346747))

(assert (=> b!1459470 m!1346729))

(declare-fun m!1346749 () Bool)

(assert (=> b!1459470 m!1346749))

(declare-fun m!1346751 () Bool)

(assert (=> b!1459456 m!1346751))

(assert (=> b!1459456 m!1346751))

(declare-fun m!1346753 () Bool)

(assert (=> b!1459456 m!1346753))

(assert (=> b!1459456 m!1346735))

(declare-fun m!1346755 () Bool)

(assert (=> b!1459456 m!1346755))

(declare-fun m!1346757 () Bool)

(assert (=> b!1459469 m!1346757))

(assert (=> b!1459468 m!1346729))

(assert (=> b!1459468 m!1346729))

(declare-fun m!1346759 () Bool)

(assert (=> b!1459468 m!1346759))

(declare-fun m!1346761 () Bool)

(assert (=> b!1459464 m!1346761))

(declare-fun m!1346763 () Bool)

(assert (=> start!125152 m!1346763))

(declare-fun m!1346765 () Bool)

(assert (=> start!125152 m!1346765))

(assert (=> b!1459472 m!1346729))

(assert (=> b!1459472 m!1346729))

(declare-fun m!1346767 () Bool)

(assert (=> b!1459472 m!1346767))

(declare-fun m!1346769 () Bool)

(assert (=> b!1459463 m!1346769))

(declare-fun m!1346771 () Bool)

(assert (=> b!1459461 m!1346771))

(assert (=> b!1459474 m!1346735))

(declare-fun m!1346773 () Bool)

(assert (=> b!1459474 m!1346773))

(check-sat (not b!1459470) (not b!1459475) (not b!1459473) (not b!1459455) (not b!1459468) (not b!1459457) (not b!1459469) (not b!1459463) (not b!1459461) (not b!1459472) (not b!1459467) (not b!1459456) (not start!125152) (not b!1459465) (not b!1459464) (not b!1459466))
(check-sat)
