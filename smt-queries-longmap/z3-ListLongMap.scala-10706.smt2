; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125344 () Bool)

(assert start!125344)

(declare-fun res!994560 () Bool)

(declare-fun e!823490 () Bool)

(assert (=> start!125344 (=> (not res!994560) (not e!823490))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125344 (= res!994560 (validMask!0 mask!2687))))

(assert (=> start!125344 e!823490))

(assert (=> start!125344 true))

(declare-datatypes ((array!98770 0))(
  ( (array!98771 (arr!47674 (Array (_ BitVec 32) (_ BitVec 64))) (size!48226 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98770)

(declare-fun array_inv!36907 (array!98770) Bool)

(assert (=> start!125344 (array_inv!36907 a!2862)))

(declare-fun b!1465620 () Bool)

(declare-fun res!994565 () Bool)

(declare-fun e!823486 () Bool)

(assert (=> b!1465620 (=> res!994565 e!823486)))

(declare-fun e!823488 () Bool)

(assert (=> b!1465620 (= res!994565 e!823488)))

(declare-fun c!135046 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1465620 (= c!135046 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1465621 () Bool)

(declare-fun res!994559 () Bool)

(assert (=> b!1465621 (=> (not res!994559) (not e!823490))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1465621 (= res!994559 (validKeyInArray!0 (select (arr!47674 a!2862) i!1006)))))

(declare-fun lt!641298 () (_ BitVec 64))

(declare-fun b!1465622 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!641294 () array!98770)

(declare-fun lt!641291 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11951 0))(
  ( (MissingZero!11951 (index!50196 (_ BitVec 32))) (Found!11951 (index!50197 (_ BitVec 32))) (Intermediate!11951 (undefined!12763 Bool) (index!50198 (_ BitVec 32)) (x!131771 (_ BitVec 32))) (Undefined!11951) (MissingVacant!11951 (index!50199 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98770 (_ BitVec 32)) SeekEntryResult!11951)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98770 (_ BitVec 32)) SeekEntryResult!11951)

(assert (=> b!1465622 (= e!823488 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641291 intermediateAfterIndex!19 lt!641298 lt!641294 mask!2687) (seekEntryOrOpen!0 lt!641298 lt!641294 mask!2687))))))

(declare-fun b!1465623 () Bool)

(declare-fun res!994556 () Bool)

(assert (=> b!1465623 (=> (not res!994556) (not e!823490))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1465623 (= res!994556 (validKeyInArray!0 (select (arr!47674 a!2862) j!93)))))

(declare-fun b!1465624 () Bool)

(declare-fun res!994557 () Bool)

(declare-fun e!823484 () Bool)

(assert (=> b!1465624 (=> (not res!994557) (not e!823484))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1465624 (= res!994557 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1465625 () Bool)

(declare-fun res!994570 () Bool)

(assert (=> b!1465625 (=> (not res!994570) (not e!823490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98770 (_ BitVec 32)) Bool)

(assert (=> b!1465625 (= res!994570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1465626 () Bool)

(declare-fun res!994558 () Bool)

(assert (=> b!1465626 (=> (not res!994558) (not e!823490))))

(declare-datatypes ((List!34253 0))(
  ( (Nil!34250) (Cons!34249 (h!35599 (_ BitVec 64)) (t!48939 List!34253)) )
))
(declare-fun arrayNoDuplicates!0 (array!98770 (_ BitVec 32) List!34253) Bool)

(assert (=> b!1465626 (= res!994558 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34250))))

(declare-fun b!1465627 () Bool)

(declare-fun res!994562 () Bool)

(assert (=> b!1465627 (=> (not res!994562) (not e!823490))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1465627 (= res!994562 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48226 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48226 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48226 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1465628 () Bool)

(declare-fun e!823491 () Bool)

(assert (=> b!1465628 (= e!823491 e!823484)))

(declare-fun res!994568 () Bool)

(assert (=> b!1465628 (=> (not res!994568) (not e!823484))))

(declare-fun lt!641292 () SeekEntryResult!11951)

(assert (=> b!1465628 (= res!994568 (= lt!641292 (Intermediate!11951 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98770 (_ BitVec 32)) SeekEntryResult!11951)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465628 (= lt!641292 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641298 mask!2687) lt!641298 lt!641294 mask!2687))))

(assert (=> b!1465628 (= lt!641298 (select (store (arr!47674 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1465629 () Bool)

(declare-fun res!994567 () Bool)

(assert (=> b!1465629 (=> (not res!994567) (not e!823490))))

(assert (=> b!1465629 (= res!994567 (and (= (size!48226 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48226 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48226 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1465630 () Bool)

(declare-fun e!823487 () Bool)

(assert (=> b!1465630 (= e!823487 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641298 lt!641294 mask!2687) (seekEntryOrOpen!0 lt!641298 lt!641294 mask!2687)))))

(declare-fun b!1465631 () Bool)

(assert (=> b!1465631 (= e!823487 (= lt!641292 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641298 lt!641294 mask!2687)))))

(declare-fun b!1465632 () Bool)

(declare-fun res!994566 () Bool)

(assert (=> b!1465632 (=> res!994566 e!823486)))

(assert (=> b!1465632 (= res!994566 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1465633 () Bool)

(declare-fun e!823489 () Bool)

(assert (=> b!1465633 (= e!823490 e!823489)))

(declare-fun res!994573 () Bool)

(assert (=> b!1465633 (=> (not res!994573) (not e!823489))))

(assert (=> b!1465633 (= res!994573 (= (select (store (arr!47674 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1465633 (= lt!641294 (array!98771 (store (arr!47674 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48226 a!2862)))))

(declare-fun b!1465634 () Bool)

(declare-fun res!994564 () Bool)

(assert (=> b!1465634 (=> (not res!994564) (not e!823484))))

(assert (=> b!1465634 (= res!994564 e!823487)))

(declare-fun c!135045 () Bool)

(assert (=> b!1465634 (= c!135045 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1465635 () Bool)

(declare-fun res!994571 () Bool)

(assert (=> b!1465635 (=> res!994571 e!823486)))

(declare-fun lt!641293 () SeekEntryResult!11951)

(assert (=> b!1465635 (= res!994571 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641291 (select (arr!47674 a!2862) j!93) a!2862 mask!2687) lt!641293)))))

(declare-fun b!1465636 () Bool)

(assert (=> b!1465636 (= e!823489 e!823491)))

(declare-fun res!994563 () Bool)

(assert (=> b!1465636 (=> (not res!994563) (not e!823491))))

(assert (=> b!1465636 (= res!994563 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47674 a!2862) j!93) mask!2687) (select (arr!47674 a!2862) j!93) a!2862 mask!2687) lt!641293))))

(assert (=> b!1465636 (= lt!641293 (Intermediate!11951 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1465637 () Bool)

(declare-fun e!823485 () Bool)

(assert (=> b!1465637 (= e!823484 (not e!823485))))

(declare-fun res!994572 () Bool)

(assert (=> b!1465637 (=> res!994572 e!823485)))

(assert (=> b!1465637 (= res!994572 (or (and (= (select (arr!47674 a!2862) index!646) (select (store (arr!47674 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47674 a!2862) index!646) (select (arr!47674 a!2862) j!93))) (= (select (arr!47674 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun lt!641297 () SeekEntryResult!11951)

(assert (=> b!1465637 (and (= lt!641297 (Found!11951 j!93)) (or (= (select (arr!47674 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47674 a!2862) intermediateBeforeIndex!19) (select (arr!47674 a!2862) j!93))))))

(assert (=> b!1465637 (= lt!641297 (seekEntryOrOpen!0 (select (arr!47674 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1465637 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49239 0))(
  ( (Unit!49240) )
))
(declare-fun lt!641296 () Unit!49239)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98770 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49239)

(assert (=> b!1465637 (= lt!641296 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1465638 () Bool)

(assert (=> b!1465638 (= e!823486 true)))

(assert (=> b!1465638 (= lt!641297 (seekEntryOrOpen!0 lt!641298 lt!641294 mask!2687))))

(declare-fun lt!641295 () Unit!49239)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98770 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49239)

(assert (=> b!1465638 (= lt!641295 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641291 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1465639 () Bool)

(declare-fun res!994569 () Bool)

(assert (=> b!1465639 (=> (not res!994569) (not e!823491))))

(assert (=> b!1465639 (= res!994569 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47674 a!2862) j!93) a!2862 mask!2687) lt!641293))))

(declare-fun b!1465640 () Bool)

(assert (=> b!1465640 (= e!823488 (not (= lt!641292 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641291 lt!641298 lt!641294 mask!2687))))))

(declare-fun b!1465641 () Bool)

(assert (=> b!1465641 (= e!823485 e!823486)))

(declare-fun res!994561 () Bool)

(assert (=> b!1465641 (=> res!994561 e!823486)))

(assert (=> b!1465641 (= res!994561 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641291 #b00000000000000000000000000000000) (bvsge lt!641291 (size!48226 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465641 (= lt!641291 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (= (and start!125344 res!994560) b!1465629))

(assert (= (and b!1465629 res!994567) b!1465621))

(assert (= (and b!1465621 res!994559) b!1465623))

(assert (= (and b!1465623 res!994556) b!1465625))

(assert (= (and b!1465625 res!994570) b!1465626))

(assert (= (and b!1465626 res!994558) b!1465627))

(assert (= (and b!1465627 res!994562) b!1465633))

(assert (= (and b!1465633 res!994573) b!1465636))

(assert (= (and b!1465636 res!994563) b!1465639))

(assert (= (and b!1465639 res!994569) b!1465628))

(assert (= (and b!1465628 res!994568) b!1465634))

(assert (= (and b!1465634 c!135045) b!1465631))

(assert (= (and b!1465634 (not c!135045)) b!1465630))

(assert (= (and b!1465634 res!994564) b!1465624))

(assert (= (and b!1465624 res!994557) b!1465637))

(assert (= (and b!1465637 (not res!994572)) b!1465641))

(assert (= (and b!1465641 (not res!994561)) b!1465635))

(assert (= (and b!1465635 (not res!994571)) b!1465620))

(assert (= (and b!1465620 c!135046) b!1465640))

(assert (= (and b!1465620 (not c!135046)) b!1465622))

(assert (= (and b!1465620 (not res!994565)) b!1465632))

(assert (= (and b!1465632 (not res!994566)) b!1465638))

(declare-fun m!1352187 () Bool)

(assert (=> b!1465628 m!1352187))

(assert (=> b!1465628 m!1352187))

(declare-fun m!1352189 () Bool)

(assert (=> b!1465628 m!1352189))

(declare-fun m!1352191 () Bool)

(assert (=> b!1465628 m!1352191))

(declare-fun m!1352193 () Bool)

(assert (=> b!1465628 m!1352193))

(declare-fun m!1352195 () Bool)

(assert (=> b!1465622 m!1352195))

(declare-fun m!1352197 () Bool)

(assert (=> b!1465622 m!1352197))

(assert (=> b!1465638 m!1352197))

(declare-fun m!1352199 () Bool)

(assert (=> b!1465638 m!1352199))

(declare-fun m!1352201 () Bool)

(assert (=> b!1465626 m!1352201))

(declare-fun m!1352203 () Bool)

(assert (=> b!1465636 m!1352203))

(assert (=> b!1465636 m!1352203))

(declare-fun m!1352205 () Bool)

(assert (=> b!1465636 m!1352205))

(assert (=> b!1465636 m!1352205))

(assert (=> b!1465636 m!1352203))

(declare-fun m!1352207 () Bool)

(assert (=> b!1465636 m!1352207))

(assert (=> b!1465639 m!1352203))

(assert (=> b!1465639 m!1352203))

(declare-fun m!1352209 () Bool)

(assert (=> b!1465639 m!1352209))

(declare-fun m!1352211 () Bool)

(assert (=> b!1465640 m!1352211))

(assert (=> b!1465623 m!1352203))

(assert (=> b!1465623 m!1352203))

(declare-fun m!1352213 () Bool)

(assert (=> b!1465623 m!1352213))

(declare-fun m!1352215 () Bool)

(assert (=> b!1465630 m!1352215))

(assert (=> b!1465630 m!1352197))

(declare-fun m!1352217 () Bool)

(assert (=> b!1465621 m!1352217))

(assert (=> b!1465621 m!1352217))

(declare-fun m!1352219 () Bool)

(assert (=> b!1465621 m!1352219))

(declare-fun m!1352221 () Bool)

(assert (=> start!125344 m!1352221))

(declare-fun m!1352223 () Bool)

(assert (=> start!125344 m!1352223))

(declare-fun m!1352225 () Bool)

(assert (=> b!1465625 m!1352225))

(declare-fun m!1352227 () Bool)

(assert (=> b!1465641 m!1352227))

(assert (=> b!1465633 m!1352191))

(declare-fun m!1352229 () Bool)

(assert (=> b!1465633 m!1352229))

(assert (=> b!1465635 m!1352203))

(assert (=> b!1465635 m!1352203))

(declare-fun m!1352231 () Bool)

(assert (=> b!1465635 m!1352231))

(declare-fun m!1352233 () Bool)

(assert (=> b!1465631 m!1352233))

(declare-fun m!1352235 () Bool)

(assert (=> b!1465637 m!1352235))

(assert (=> b!1465637 m!1352191))

(declare-fun m!1352237 () Bool)

(assert (=> b!1465637 m!1352237))

(declare-fun m!1352239 () Bool)

(assert (=> b!1465637 m!1352239))

(declare-fun m!1352241 () Bool)

(assert (=> b!1465637 m!1352241))

(assert (=> b!1465637 m!1352203))

(declare-fun m!1352243 () Bool)

(assert (=> b!1465637 m!1352243))

(declare-fun m!1352245 () Bool)

(assert (=> b!1465637 m!1352245))

(assert (=> b!1465637 m!1352203))

(check-sat (not b!1465630) (not b!1465640) (not b!1465639) (not b!1465623) (not start!125344) (not b!1465625) (not b!1465641) (not b!1465637) (not b!1465636) (not b!1465621) (not b!1465622) (not b!1465628) (not b!1465635) (not b!1465638) (not b!1465631) (not b!1465626))
(check-sat)
