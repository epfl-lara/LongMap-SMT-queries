; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126838 () Bool)

(assert start!126838)

(declare-datatypes ((SeekEntryResult!12317 0))(
  ( (MissingZero!12317 (index!51660 (_ BitVec 32))) (Found!12317 (index!51661 (_ BitVec 32))) (Intermediate!12317 (undefined!13129 Bool) (index!51662 (_ BitVec 32)) (x!133261 (_ BitVec 32))) (Undefined!12317) (MissingVacant!12317 (index!51663 (_ BitVec 32))) )
))
(declare-fun lt!649485 () SeekEntryResult!12317)

(declare-fun b!1489266 () Bool)

(declare-fun lt!649483 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!834699 () Bool)

(declare-fun lt!649484 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!99611 0))(
  ( (array!99612 (arr!48077 (Array (_ BitVec 32) (_ BitVec 64))) (size!48627 (_ BitVec 32))) )
))
(declare-fun lt!649488 () array!99611)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99611 (_ BitVec 32)) SeekEntryResult!12317)

(assert (=> b!1489266 (= e!834699 (not (= lt!649485 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649483 lt!649484 lt!649488 mask!2687))))))

(declare-fun b!1489267 () Bool)

(declare-fun res!1012751 () Bool)

(declare-fun e!834697 () Bool)

(assert (=> b!1489267 (=> (not res!1012751) (not e!834697))))

(declare-fun a!2862 () array!99611)

(declare-datatypes ((List!34578 0))(
  ( (Nil!34575) (Cons!34574 (h!35957 (_ BitVec 64)) (t!49272 List!34578)) )
))
(declare-fun arrayNoDuplicates!0 (array!99611 (_ BitVec 32) List!34578) Bool)

(assert (=> b!1489267 (= res!1012751 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34575))))

(declare-fun b!1489268 () Bool)

(declare-fun res!1012750 () Bool)

(declare-fun e!834701 () Bool)

(assert (=> b!1489268 (=> (not res!1012750) (not e!834701))))

(declare-fun e!834694 () Bool)

(assert (=> b!1489268 (= res!1012750 e!834694)))

(declare-fun c!137790 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1489268 (= c!137790 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1489269 () Bool)

(declare-fun res!1012757 () Bool)

(assert (=> b!1489269 (=> (not res!1012757) (not e!834697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99611 (_ BitVec 32)) Bool)

(assert (=> b!1489269 (= res!1012757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1489270 () Bool)

(declare-fun e!834696 () Bool)

(declare-fun e!834693 () Bool)

(assert (=> b!1489270 (= e!834696 e!834693)))

(declare-fun res!1012756 () Bool)

(assert (=> b!1489270 (=> (not res!1012756) (not e!834693))))

(declare-fun lt!649486 () SeekEntryResult!12317)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489270 (= res!1012756 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48077 a!2862) j!93) mask!2687) (select (arr!48077 a!2862) j!93) a!2862 mask!2687) lt!649486))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1489270 (= lt!649486 (Intermediate!12317 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1489271 () Bool)

(assert (=> b!1489271 (= e!834697 e!834696)))

(declare-fun res!1012754 () Bool)

(assert (=> b!1489271 (=> (not res!1012754) (not e!834696))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1489271 (= res!1012754 (= (select (store (arr!48077 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1489271 (= lt!649488 (array!99612 (store (arr!48077 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48627 a!2862)))))

(declare-fun b!1489272 () Bool)

(declare-fun e!834700 () Bool)

(declare-fun e!834695 () Bool)

(assert (=> b!1489272 (= e!834700 e!834695)))

(declare-fun res!1012743 () Bool)

(assert (=> b!1489272 (=> res!1012743 e!834695)))

(assert (=> b!1489272 (= res!1012743 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649483 #b00000000000000000000000000000000) (bvsge lt!649483 (size!48627 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489272 (= lt!649483 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!649487 () SeekEntryResult!12317)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99611 (_ BitVec 32)) SeekEntryResult!12317)

(assert (=> b!1489272 (= lt!649487 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649484 lt!649488 mask!2687))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99611 (_ BitVec 32)) SeekEntryResult!12317)

(assert (=> b!1489272 (= lt!649487 (seekEntryOrOpen!0 lt!649484 lt!649488 mask!2687))))

(declare-fun b!1489273 () Bool)

(assert (=> b!1489273 (= e!834694 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649484 lt!649488 mask!2687) (seekEntryOrOpen!0 lt!649484 lt!649488 mask!2687)))))

(declare-fun b!1489274 () Bool)

(declare-fun res!1012742 () Bool)

(assert (=> b!1489274 (=> res!1012742 e!834695)))

(assert (=> b!1489274 (= res!1012742 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1489275 () Bool)

(declare-fun res!1012745 () Bool)

(assert (=> b!1489275 (=> (not res!1012745) (not e!834697))))

(assert (=> b!1489275 (= res!1012745 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48627 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48627 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48627 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1489276 () Bool)

(assert (=> b!1489276 (= e!834695 true)))

(declare-fun lt!649480 () SeekEntryResult!12317)

(assert (=> b!1489276 (= lt!649480 lt!649487)))

(declare-datatypes ((Unit!49974 0))(
  ( (Unit!49975) )
))
(declare-fun lt!649482 () Unit!49974)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99611 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49974)

(assert (=> b!1489276 (= lt!649482 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!649483 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1489277 () Bool)

(declare-fun res!1012752 () Bool)

(assert (=> b!1489277 (=> res!1012752 e!834695)))

(assert (=> b!1489277 (= res!1012752 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649483 (select (arr!48077 a!2862) j!93) a!2862 mask!2687) lt!649486)))))

(declare-fun b!1489278 () Bool)

(assert (=> b!1489278 (= e!834693 e!834701)))

(declare-fun res!1012753 () Bool)

(assert (=> b!1489278 (=> (not res!1012753) (not e!834701))))

(assert (=> b!1489278 (= res!1012753 (= lt!649485 (Intermediate!12317 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1489278 (= lt!649485 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649484 mask!2687) lt!649484 lt!649488 mask!2687))))

(assert (=> b!1489278 (= lt!649484 (select (store (arr!48077 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1489279 () Bool)

(declare-fun res!1012749 () Bool)

(assert (=> b!1489279 (=> (not res!1012749) (not e!834697))))

(assert (=> b!1489279 (= res!1012749 (and (= (size!48627 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48627 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48627 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1489280 () Bool)

(assert (=> b!1489280 (= e!834699 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649483 intermediateAfterIndex!19 lt!649484 lt!649488 mask!2687) lt!649487)))))

(declare-fun b!1489281 () Bool)

(declare-fun res!1012747 () Bool)

(assert (=> b!1489281 (=> res!1012747 e!834695)))

(assert (=> b!1489281 (= res!1012747 e!834699)))

(declare-fun c!137789 () Bool)

(assert (=> b!1489281 (= c!137789 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1489282 () Bool)

(declare-fun res!1012758 () Bool)

(assert (=> b!1489282 (=> (not res!1012758) (not e!834693))))

(assert (=> b!1489282 (= res!1012758 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48077 a!2862) j!93) a!2862 mask!2687) lt!649486))))

(declare-fun b!1489283 () Bool)

(declare-fun res!1012746 () Bool)

(assert (=> b!1489283 (=> (not res!1012746) (not e!834697))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1489283 (= res!1012746 (validKeyInArray!0 (select (arr!48077 a!2862) i!1006)))))

(declare-fun b!1489284 () Bool)

(declare-fun res!1012759 () Bool)

(assert (=> b!1489284 (=> (not res!1012759) (not e!834697))))

(assert (=> b!1489284 (= res!1012759 (validKeyInArray!0 (select (arr!48077 a!2862) j!93)))))

(declare-fun b!1489285 () Bool)

(assert (=> b!1489285 (= e!834701 (not e!834700))))

(declare-fun res!1012748 () Bool)

(assert (=> b!1489285 (=> res!1012748 e!834700)))

(assert (=> b!1489285 (= res!1012748 (or (and (= (select (arr!48077 a!2862) index!646) (select (store (arr!48077 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48077 a!2862) index!646) (select (arr!48077 a!2862) j!93))) (= (select (arr!48077 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1489285 (and (= lt!649480 (Found!12317 j!93)) (or (= (select (arr!48077 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48077 a!2862) intermediateBeforeIndex!19) (select (arr!48077 a!2862) j!93))) (let ((bdg!54706 (select (store (arr!48077 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48077 a!2862) index!646) bdg!54706) (= (select (arr!48077 a!2862) index!646) (select (arr!48077 a!2862) j!93))) (= (select (arr!48077 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54706 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!1489285 (= lt!649480 (seekEntryOrOpen!0 (select (arr!48077 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1489285 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!649481 () Unit!49974)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99611 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49974)

(assert (=> b!1489285 (= lt!649481 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1489286 () Bool)

(declare-fun res!1012755 () Bool)

(assert (=> b!1489286 (=> (not res!1012755) (not e!834701))))

(assert (=> b!1489286 (= res!1012755 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1489287 () Bool)

(assert (=> b!1489287 (= e!834694 (= lt!649485 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649484 lt!649488 mask!2687)))))

(declare-fun res!1012744 () Bool)

(assert (=> start!126838 (=> (not res!1012744) (not e!834697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126838 (= res!1012744 (validMask!0 mask!2687))))

(assert (=> start!126838 e!834697))

(assert (=> start!126838 true))

(declare-fun array_inv!37105 (array!99611) Bool)

(assert (=> start!126838 (array_inv!37105 a!2862)))

(assert (= (and start!126838 res!1012744) b!1489279))

(assert (= (and b!1489279 res!1012749) b!1489283))

(assert (= (and b!1489283 res!1012746) b!1489284))

(assert (= (and b!1489284 res!1012759) b!1489269))

(assert (= (and b!1489269 res!1012757) b!1489267))

(assert (= (and b!1489267 res!1012751) b!1489275))

(assert (= (and b!1489275 res!1012745) b!1489271))

(assert (= (and b!1489271 res!1012754) b!1489270))

(assert (= (and b!1489270 res!1012756) b!1489282))

(assert (= (and b!1489282 res!1012758) b!1489278))

(assert (= (and b!1489278 res!1012753) b!1489268))

(assert (= (and b!1489268 c!137790) b!1489287))

(assert (= (and b!1489268 (not c!137790)) b!1489273))

(assert (= (and b!1489268 res!1012750) b!1489286))

(assert (= (and b!1489286 res!1012755) b!1489285))

(assert (= (and b!1489285 (not res!1012748)) b!1489272))

(assert (= (and b!1489272 (not res!1012743)) b!1489277))

(assert (= (and b!1489277 (not res!1012752)) b!1489281))

(assert (= (and b!1489281 c!137789) b!1489266))

(assert (= (and b!1489281 (not c!137789)) b!1489280))

(assert (= (and b!1489281 (not res!1012747)) b!1489274))

(assert (= (and b!1489274 (not res!1012742)) b!1489276))

(declare-fun m!1373515 () Bool)

(assert (=> b!1489270 m!1373515))

(assert (=> b!1489270 m!1373515))

(declare-fun m!1373517 () Bool)

(assert (=> b!1489270 m!1373517))

(assert (=> b!1489270 m!1373517))

(assert (=> b!1489270 m!1373515))

(declare-fun m!1373519 () Bool)

(assert (=> b!1489270 m!1373519))

(declare-fun m!1373521 () Bool)

(assert (=> b!1489280 m!1373521))

(declare-fun m!1373523 () Bool)

(assert (=> b!1489283 m!1373523))

(assert (=> b!1489283 m!1373523))

(declare-fun m!1373525 () Bool)

(assert (=> b!1489283 m!1373525))

(declare-fun m!1373527 () Bool)

(assert (=> b!1489266 m!1373527))

(declare-fun m!1373529 () Bool)

(assert (=> b!1489269 m!1373529))

(declare-fun m!1373531 () Bool)

(assert (=> b!1489276 m!1373531))

(declare-fun m!1373533 () Bool)

(assert (=> b!1489287 m!1373533))

(declare-fun m!1373535 () Bool)

(assert (=> start!126838 m!1373535))

(declare-fun m!1373537 () Bool)

(assert (=> start!126838 m!1373537))

(assert (=> b!1489282 m!1373515))

(assert (=> b!1489282 m!1373515))

(declare-fun m!1373539 () Bool)

(assert (=> b!1489282 m!1373539))

(declare-fun m!1373541 () Bool)

(assert (=> b!1489271 m!1373541))

(declare-fun m!1373543 () Bool)

(assert (=> b!1489271 m!1373543))

(declare-fun m!1373545 () Bool)

(assert (=> b!1489285 m!1373545))

(assert (=> b!1489285 m!1373541))

(declare-fun m!1373547 () Bool)

(assert (=> b!1489285 m!1373547))

(declare-fun m!1373549 () Bool)

(assert (=> b!1489285 m!1373549))

(declare-fun m!1373551 () Bool)

(assert (=> b!1489285 m!1373551))

(assert (=> b!1489285 m!1373515))

(declare-fun m!1373553 () Bool)

(assert (=> b!1489285 m!1373553))

(declare-fun m!1373555 () Bool)

(assert (=> b!1489285 m!1373555))

(assert (=> b!1489285 m!1373515))

(assert (=> b!1489284 m!1373515))

(assert (=> b!1489284 m!1373515))

(declare-fun m!1373557 () Bool)

(assert (=> b!1489284 m!1373557))

(assert (=> b!1489277 m!1373515))

(assert (=> b!1489277 m!1373515))

(declare-fun m!1373559 () Bool)

(assert (=> b!1489277 m!1373559))

(declare-fun m!1373561 () Bool)

(assert (=> b!1489278 m!1373561))

(assert (=> b!1489278 m!1373561))

(declare-fun m!1373563 () Bool)

(assert (=> b!1489278 m!1373563))

(assert (=> b!1489278 m!1373541))

(declare-fun m!1373565 () Bool)

(assert (=> b!1489278 m!1373565))

(declare-fun m!1373567 () Bool)

(assert (=> b!1489272 m!1373567))

(declare-fun m!1373569 () Bool)

(assert (=> b!1489272 m!1373569))

(declare-fun m!1373571 () Bool)

(assert (=> b!1489272 m!1373571))

(declare-fun m!1373573 () Bool)

(assert (=> b!1489267 m!1373573))

(assert (=> b!1489273 m!1373569))

(assert (=> b!1489273 m!1373571))

(push 1)

