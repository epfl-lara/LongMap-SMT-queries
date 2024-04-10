; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125330 () Bool)

(assert start!125330)

(declare-fun b!1464363 () Bool)

(declare-fun res!993455 () Bool)

(declare-fun e!822941 () Bool)

(assert (=> b!1464363 (=> res!993455 e!822941)))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11929 0))(
  ( (MissingZero!11929 (index!50108 (_ BitVec 32))) (Found!11929 (index!50109 (_ BitVec 32))) (Intermediate!11929 (undefined!12741 Bool) (index!50110 (_ BitVec 32)) (x!131690 (_ BitVec 32))) (Undefined!11929) (MissingVacant!11929 (index!50111 (_ BitVec 32))) )
))
(declare-fun lt!641061 () SeekEntryResult!11929)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!641063 () (_ BitVec 32))

(declare-datatypes ((array!98778 0))(
  ( (array!98779 (arr!47677 (Array (_ BitVec 32) (_ BitVec 64))) (size!48227 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98778)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98778 (_ BitVec 32)) SeekEntryResult!11929)

(assert (=> b!1464363 (= res!993455 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641063 (select (arr!47677 a!2862) j!93) a!2862 mask!2687) lt!641061)))))

(declare-fun b!1464364 () Bool)

(assert (=> b!1464364 (= e!822941 true)))

(declare-fun lt!641062 () Bool)

(declare-fun e!822950 () Bool)

(assert (=> b!1464364 (= lt!641062 e!822950)))

(declare-fun c!134969 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1464364 (= c!134969 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1464365 () Bool)

(declare-fun res!993449 () Bool)

(declare-fun e!822948 () Bool)

(assert (=> b!1464365 (=> (not res!993449) (not e!822948))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1464365 (= res!993449 (validKeyInArray!0 (select (arr!47677 a!2862) i!1006)))))

(declare-fun b!1464366 () Bool)

(declare-fun res!993454 () Bool)

(declare-fun e!822947 () Bool)

(assert (=> b!1464366 (=> (not res!993454) (not e!822947))))

(declare-fun e!822949 () Bool)

(assert (=> b!1464366 (= res!993454 e!822949)))

(declare-fun c!134970 () Bool)

(assert (=> b!1464366 (= c!134970 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1464367 () Bool)

(declare-fun lt!641066 () (_ BitVec 64))

(declare-fun lt!641065 () array!98778)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98778 (_ BitVec 32)) SeekEntryResult!11929)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98778 (_ BitVec 32)) SeekEntryResult!11929)

(assert (=> b!1464367 (= e!822950 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641063 intermediateAfterIndex!19 lt!641066 lt!641065 mask!2687) (seekEntryOrOpen!0 lt!641066 lt!641065 mask!2687))))))

(declare-fun b!1464368 () Bool)

(declare-fun lt!641064 () SeekEntryResult!11929)

(assert (=> b!1464368 (= e!822950 (not (= lt!641064 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641063 lt!641066 lt!641065 mask!2687))))))

(declare-fun b!1464369 () Bool)

(declare-fun res!993446 () Bool)

(assert (=> b!1464369 (=> (not res!993446) (not e!822947))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1464369 (= res!993446 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!993453 () Bool)

(assert (=> start!125330 (=> (not res!993453) (not e!822948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125330 (= res!993453 (validMask!0 mask!2687))))

(assert (=> start!125330 e!822948))

(assert (=> start!125330 true))

(declare-fun array_inv!36705 (array!98778) Bool)

(assert (=> start!125330 (array_inv!36705 a!2862)))

(declare-fun b!1464370 () Bool)

(declare-fun e!822944 () Bool)

(assert (=> b!1464370 (= e!822947 (not e!822944))))

(declare-fun res!993450 () Bool)

(assert (=> b!1464370 (=> res!993450 e!822944)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1464370 (= res!993450 (or (and (= (select (arr!47677 a!2862) index!646) (select (store (arr!47677 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47677 a!2862) index!646) (select (arr!47677 a!2862) j!93))) (= (select (arr!47677 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!822943 () Bool)

(assert (=> b!1464370 e!822943))

(declare-fun res!993461 () Bool)

(assert (=> b!1464370 (=> (not res!993461) (not e!822943))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98778 (_ BitVec 32)) Bool)

(assert (=> b!1464370 (= res!993461 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49354 0))(
  ( (Unit!49355) )
))
(declare-fun lt!641067 () Unit!49354)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98778 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49354)

(assert (=> b!1464370 (= lt!641067 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1464371 () Bool)

(declare-fun res!993463 () Bool)

(assert (=> b!1464371 (=> (not res!993463) (not e!822948))))

(assert (=> b!1464371 (= res!993463 (and (= (size!48227 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48227 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48227 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1464372 () Bool)

(declare-fun res!993447 () Bool)

(assert (=> b!1464372 (=> (not res!993447) (not e!822948))))

(assert (=> b!1464372 (= res!993447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1464373 () Bool)

(declare-fun res!993448 () Bool)

(assert (=> b!1464373 (=> (not res!993448) (not e!822948))))

(declare-datatypes ((List!34178 0))(
  ( (Nil!34175) (Cons!34174 (h!35524 (_ BitVec 64)) (t!48872 List!34178)) )
))
(declare-fun arrayNoDuplicates!0 (array!98778 (_ BitVec 32) List!34178) Bool)

(assert (=> b!1464373 (= res!993448 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34175))))

(declare-fun b!1464374 () Bool)

(declare-fun res!993460 () Bool)

(assert (=> b!1464374 (=> (not res!993460) (not e!822948))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1464374 (= res!993460 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48227 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48227 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48227 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1464375 () Bool)

(declare-fun res!993457 () Bool)

(declare-fun e!822942 () Bool)

(assert (=> b!1464375 (=> (not res!993457) (not e!822942))))

(assert (=> b!1464375 (= res!993457 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47677 a!2862) j!93) a!2862 mask!2687) lt!641061))))

(declare-fun b!1464376 () Bool)

(declare-fun res!993459 () Bool)

(assert (=> b!1464376 (=> (not res!993459) (not e!822948))))

(assert (=> b!1464376 (= res!993459 (validKeyInArray!0 (select (arr!47677 a!2862) j!93)))))

(declare-fun b!1464377 () Bool)

(declare-fun e!822946 () Bool)

(assert (=> b!1464377 (= e!822946 e!822942)))

(declare-fun res!993462 () Bool)

(assert (=> b!1464377 (=> (not res!993462) (not e!822942))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464377 (= res!993462 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47677 a!2862) j!93) mask!2687) (select (arr!47677 a!2862) j!93) a!2862 mask!2687) lt!641061))))

(assert (=> b!1464377 (= lt!641061 (Intermediate!11929 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1464378 () Bool)

(assert (=> b!1464378 (= e!822942 e!822947)))

(declare-fun res!993451 () Bool)

(assert (=> b!1464378 (=> (not res!993451) (not e!822947))))

(assert (=> b!1464378 (= res!993451 (= lt!641064 (Intermediate!11929 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1464378 (= lt!641064 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641066 mask!2687) lt!641066 lt!641065 mask!2687))))

(assert (=> b!1464378 (= lt!641066 (select (store (arr!47677 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1464379 () Bool)

(assert (=> b!1464379 (= e!822944 e!822941)))

(declare-fun res!993452 () Bool)

(assert (=> b!1464379 (=> res!993452 e!822941)))

(assert (=> b!1464379 (= res!993452 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641063 #b00000000000000000000000000000000) (bvsge lt!641063 (size!48227 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1464379 (= lt!641063 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1464380 () Bool)

(assert (=> b!1464380 (= e!822943 (or (= (select (arr!47677 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47677 a!2862) intermediateBeforeIndex!19) (select (arr!47677 a!2862) j!93))))))

(declare-fun b!1464381 () Bool)

(assert (=> b!1464381 (= e!822949 (= lt!641064 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641066 lt!641065 mask!2687)))))

(declare-fun b!1464382 () Bool)

(declare-fun res!993458 () Bool)

(assert (=> b!1464382 (=> (not res!993458) (not e!822943))))

(assert (=> b!1464382 (= res!993458 (= (seekEntryOrOpen!0 (select (arr!47677 a!2862) j!93) a!2862 mask!2687) (Found!11929 j!93)))))

(declare-fun b!1464383 () Bool)

(assert (=> b!1464383 (= e!822949 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641066 lt!641065 mask!2687) (seekEntryOrOpen!0 lt!641066 lt!641065 mask!2687)))))

(declare-fun b!1464384 () Bool)

(assert (=> b!1464384 (= e!822948 e!822946)))

(declare-fun res!993456 () Bool)

(assert (=> b!1464384 (=> (not res!993456) (not e!822946))))

(assert (=> b!1464384 (= res!993456 (= (select (store (arr!47677 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1464384 (= lt!641065 (array!98779 (store (arr!47677 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48227 a!2862)))))

(assert (= (and start!125330 res!993453) b!1464371))

(assert (= (and b!1464371 res!993463) b!1464365))

(assert (= (and b!1464365 res!993449) b!1464376))

(assert (= (and b!1464376 res!993459) b!1464372))

(assert (= (and b!1464372 res!993447) b!1464373))

(assert (= (and b!1464373 res!993448) b!1464374))

(assert (= (and b!1464374 res!993460) b!1464384))

(assert (= (and b!1464384 res!993456) b!1464377))

(assert (= (and b!1464377 res!993462) b!1464375))

(assert (= (and b!1464375 res!993457) b!1464378))

(assert (= (and b!1464378 res!993451) b!1464366))

(assert (= (and b!1464366 c!134970) b!1464381))

(assert (= (and b!1464366 (not c!134970)) b!1464383))

(assert (= (and b!1464366 res!993454) b!1464369))

(assert (= (and b!1464369 res!993446) b!1464370))

(assert (= (and b!1464370 res!993461) b!1464382))

(assert (= (and b!1464382 res!993458) b!1464380))

(assert (= (and b!1464370 (not res!993450)) b!1464379))

(assert (= (and b!1464379 (not res!993452)) b!1464363))

(assert (= (and b!1464363 (not res!993455)) b!1464364))

(assert (= (and b!1464364 c!134969) b!1464368))

(assert (= (and b!1464364 (not c!134969)) b!1464367))

(declare-fun m!1351587 () Bool)

(assert (=> b!1464384 m!1351587))

(declare-fun m!1351589 () Bool)

(assert (=> b!1464384 m!1351589))

(declare-fun m!1351591 () Bool)

(assert (=> b!1464373 m!1351591))

(declare-fun m!1351593 () Bool)

(assert (=> b!1464375 m!1351593))

(assert (=> b!1464375 m!1351593))

(declare-fun m!1351595 () Bool)

(assert (=> b!1464375 m!1351595))

(declare-fun m!1351597 () Bool)

(assert (=> b!1464367 m!1351597))

(declare-fun m!1351599 () Bool)

(assert (=> b!1464367 m!1351599))

(assert (=> b!1464382 m!1351593))

(assert (=> b!1464382 m!1351593))

(declare-fun m!1351601 () Bool)

(assert (=> b!1464382 m!1351601))

(declare-fun m!1351603 () Bool)

(assert (=> start!125330 m!1351603))

(declare-fun m!1351605 () Bool)

(assert (=> start!125330 m!1351605))

(assert (=> b!1464363 m!1351593))

(assert (=> b!1464363 m!1351593))

(declare-fun m!1351607 () Bool)

(assert (=> b!1464363 m!1351607))

(declare-fun m!1351609 () Bool)

(assert (=> b!1464381 m!1351609))

(declare-fun m!1351611 () Bool)

(assert (=> b!1464378 m!1351611))

(assert (=> b!1464378 m!1351611))

(declare-fun m!1351613 () Bool)

(assert (=> b!1464378 m!1351613))

(assert (=> b!1464378 m!1351587))

(declare-fun m!1351615 () Bool)

(assert (=> b!1464378 m!1351615))

(assert (=> b!1464377 m!1351593))

(assert (=> b!1464377 m!1351593))

(declare-fun m!1351617 () Bool)

(assert (=> b!1464377 m!1351617))

(assert (=> b!1464377 m!1351617))

(assert (=> b!1464377 m!1351593))

(declare-fun m!1351619 () Bool)

(assert (=> b!1464377 m!1351619))

(declare-fun m!1351621 () Bool)

(assert (=> b!1464383 m!1351621))

(assert (=> b!1464383 m!1351599))

(declare-fun m!1351623 () Bool)

(assert (=> b!1464379 m!1351623))

(declare-fun m!1351625 () Bool)

(assert (=> b!1464380 m!1351625))

(assert (=> b!1464380 m!1351593))

(declare-fun m!1351627 () Bool)

(assert (=> b!1464370 m!1351627))

(assert (=> b!1464370 m!1351587))

(declare-fun m!1351629 () Bool)

(assert (=> b!1464370 m!1351629))

(declare-fun m!1351631 () Bool)

(assert (=> b!1464370 m!1351631))

(declare-fun m!1351633 () Bool)

(assert (=> b!1464370 m!1351633))

(assert (=> b!1464370 m!1351593))

(declare-fun m!1351635 () Bool)

(assert (=> b!1464368 m!1351635))

(declare-fun m!1351637 () Bool)

(assert (=> b!1464365 m!1351637))

(assert (=> b!1464365 m!1351637))

(declare-fun m!1351639 () Bool)

(assert (=> b!1464365 m!1351639))

(assert (=> b!1464376 m!1351593))

(assert (=> b!1464376 m!1351593))

(declare-fun m!1351641 () Bool)

(assert (=> b!1464376 m!1351641))

(declare-fun m!1351643 () Bool)

(assert (=> b!1464372 m!1351643))

(push 1)

