; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124588 () Bool)

(assert start!124588)

(declare-fun b!1442387 () Bool)

(declare-fun res!974622 () Bool)

(declare-fun e!812962 () Bool)

(assert (=> b!1442387 (=> (not res!974622) (not e!812962))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98036 0))(
  ( (array!98037 (arr!47306 (Array (_ BitVec 32) (_ BitVec 64))) (size!47856 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98036)

(assert (=> b!1442387 (= res!974622 (and (= (size!47856 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47856 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47856 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1442388 () Bool)

(declare-fun res!974612 () Bool)

(assert (=> b!1442388 (=> (not res!974612) (not e!812962))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442388 (= res!974612 (validKeyInArray!0 (select (arr!47306 a!2862) i!1006)))))

(declare-fun b!1442389 () Bool)

(declare-fun res!974617 () Bool)

(assert (=> b!1442389 (=> (not res!974617) (not e!812962))))

(assert (=> b!1442389 (= res!974617 (validKeyInArray!0 (select (arr!47306 a!2862) j!93)))))

(declare-fun b!1442390 () Bool)

(declare-fun res!974616 () Bool)

(declare-fun e!812961 () Bool)

(assert (=> b!1442390 (=> (not res!974616) (not e!812961))))

(declare-fun e!812959 () Bool)

(assert (=> b!1442390 (= res!974616 e!812959)))

(declare-fun c!133398 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1442390 (= c!133398 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1442391 () Bool)

(declare-fun e!812963 () Bool)

(assert (=> b!1442391 (= e!812963 e!812961)))

(declare-fun res!974619 () Bool)

(assert (=> b!1442391 (=> (not res!974619) (not e!812961))))

(declare-datatypes ((SeekEntryResult!11558 0))(
  ( (MissingZero!11558 (index!48624 (_ BitVec 32))) (Found!11558 (index!48625 (_ BitVec 32))) (Intermediate!11558 (undefined!12370 Bool) (index!48626 (_ BitVec 32)) (x!130335 (_ BitVec 32))) (Undefined!11558) (MissingVacant!11558 (index!48627 (_ BitVec 32))) )
))
(declare-fun lt!633545 () SeekEntryResult!11558)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1442391 (= res!974619 (= lt!633545 (Intermediate!11558 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633548 () (_ BitVec 64))

(declare-fun lt!633546 () array!98036)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98036 (_ BitVec 32)) SeekEntryResult!11558)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442391 (= lt!633545 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633548 mask!2687) lt!633548 lt!633546 mask!2687))))

(assert (=> b!1442391 (= lt!633548 (select (store (arr!47306 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!812958 () Bool)

(declare-fun b!1442392 () Bool)

(assert (=> b!1442392 (= e!812958 (or (= (select (arr!47306 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47306 a!2862) intermediateBeforeIndex!19) (select (arr!47306 a!2862) j!93))))))

(declare-fun b!1442393 () Bool)

(declare-fun res!974615 () Bool)

(assert (=> b!1442393 (=> (not res!974615) (not e!812962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98036 (_ BitVec 32)) Bool)

(assert (=> b!1442393 (= res!974615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442394 () Bool)

(declare-fun e!812957 () Bool)

(assert (=> b!1442394 (= e!812957 e!812963)))

(declare-fun res!974614 () Bool)

(assert (=> b!1442394 (=> (not res!974614) (not e!812963))))

(declare-fun lt!633549 () SeekEntryResult!11558)

(assert (=> b!1442394 (= res!974614 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47306 a!2862) j!93) mask!2687) (select (arr!47306 a!2862) j!93) a!2862 mask!2687) lt!633549))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1442394 (= lt!633549 (Intermediate!11558 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442395 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98036 (_ BitVec 32)) SeekEntryResult!11558)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98036 (_ BitVec 32)) SeekEntryResult!11558)

(assert (=> b!1442395 (= e!812959 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633548 lt!633546 mask!2687) (seekEntryOrOpen!0 lt!633548 lt!633546 mask!2687)))))

(declare-fun b!1442396 () Bool)

(assert (=> b!1442396 (= e!812959 (= lt!633545 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633548 lt!633546 mask!2687)))))

(declare-fun b!1442397 () Bool)

(assert (=> b!1442397 (= e!812961 (not true))))

(assert (=> b!1442397 e!812958))

(declare-fun res!974620 () Bool)

(assert (=> b!1442397 (=> (not res!974620) (not e!812958))))

(assert (=> b!1442397 (= res!974620 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48612 0))(
  ( (Unit!48613) )
))
(declare-fun lt!633547 () Unit!48612)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98036 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48612)

(assert (=> b!1442397 (= lt!633547 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!974626 () Bool)

(assert (=> start!124588 (=> (not res!974626) (not e!812962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124588 (= res!974626 (validMask!0 mask!2687))))

(assert (=> start!124588 e!812962))

(assert (=> start!124588 true))

(declare-fun array_inv!36334 (array!98036) Bool)

(assert (=> start!124588 (array_inv!36334 a!2862)))

(declare-fun b!1442398 () Bool)

(declare-fun res!974613 () Bool)

(assert (=> b!1442398 (=> (not res!974613) (not e!812962))))

(assert (=> b!1442398 (= res!974613 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47856 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47856 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47856 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1442399 () Bool)

(declare-fun res!974618 () Bool)

(assert (=> b!1442399 (=> (not res!974618) (not e!812958))))

(assert (=> b!1442399 (= res!974618 (= (seekEntryOrOpen!0 (select (arr!47306 a!2862) j!93) a!2862 mask!2687) (Found!11558 j!93)))))

(declare-fun b!1442400 () Bool)

(declare-fun res!974623 () Bool)

(assert (=> b!1442400 (=> (not res!974623) (not e!812961))))

(assert (=> b!1442400 (= res!974623 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1442401 () Bool)

(declare-fun res!974624 () Bool)

(assert (=> b!1442401 (=> (not res!974624) (not e!812963))))

(assert (=> b!1442401 (= res!974624 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47306 a!2862) j!93) a!2862 mask!2687) lt!633549))))

(declare-fun b!1442402 () Bool)

(assert (=> b!1442402 (= e!812962 e!812957)))

(declare-fun res!974621 () Bool)

(assert (=> b!1442402 (=> (not res!974621) (not e!812957))))

(assert (=> b!1442402 (= res!974621 (= (select (store (arr!47306 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442402 (= lt!633546 (array!98037 (store (arr!47306 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47856 a!2862)))))

(declare-fun b!1442403 () Bool)

(declare-fun res!974625 () Bool)

(assert (=> b!1442403 (=> (not res!974625) (not e!812962))))

(declare-datatypes ((List!33807 0))(
  ( (Nil!33804) (Cons!33803 (h!35153 (_ BitVec 64)) (t!48501 List!33807)) )
))
(declare-fun arrayNoDuplicates!0 (array!98036 (_ BitVec 32) List!33807) Bool)

(assert (=> b!1442403 (= res!974625 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33804))))

(assert (= (and start!124588 res!974626) b!1442387))

(assert (= (and b!1442387 res!974622) b!1442388))

(assert (= (and b!1442388 res!974612) b!1442389))

(assert (= (and b!1442389 res!974617) b!1442393))

(assert (= (and b!1442393 res!974615) b!1442403))

(assert (= (and b!1442403 res!974625) b!1442398))

(assert (= (and b!1442398 res!974613) b!1442402))

(assert (= (and b!1442402 res!974621) b!1442394))

(assert (= (and b!1442394 res!974614) b!1442401))

(assert (= (and b!1442401 res!974624) b!1442391))

(assert (= (and b!1442391 res!974619) b!1442390))

(assert (= (and b!1442390 c!133398) b!1442396))

(assert (= (and b!1442390 (not c!133398)) b!1442395))

(assert (= (and b!1442390 res!974616) b!1442400))

(assert (= (and b!1442400 res!974623) b!1442397))

(assert (= (and b!1442397 res!974620) b!1442399))

(assert (= (and b!1442399 res!974618) b!1442392))

(declare-fun m!1331545 () Bool)

(assert (=> b!1442392 m!1331545))

(declare-fun m!1331547 () Bool)

(assert (=> b!1442392 m!1331547))

(assert (=> b!1442389 m!1331547))

(assert (=> b!1442389 m!1331547))

(declare-fun m!1331549 () Bool)

(assert (=> b!1442389 m!1331549))

(assert (=> b!1442394 m!1331547))

(assert (=> b!1442394 m!1331547))

(declare-fun m!1331551 () Bool)

(assert (=> b!1442394 m!1331551))

(assert (=> b!1442394 m!1331551))

(assert (=> b!1442394 m!1331547))

(declare-fun m!1331553 () Bool)

(assert (=> b!1442394 m!1331553))

(assert (=> b!1442401 m!1331547))

(assert (=> b!1442401 m!1331547))

(declare-fun m!1331555 () Bool)

(assert (=> b!1442401 m!1331555))

(declare-fun m!1331557 () Bool)

(assert (=> b!1442402 m!1331557))

(declare-fun m!1331559 () Bool)

(assert (=> b!1442402 m!1331559))

(declare-fun m!1331561 () Bool)

(assert (=> b!1442388 m!1331561))

(assert (=> b!1442388 m!1331561))

(declare-fun m!1331563 () Bool)

(assert (=> b!1442388 m!1331563))

(declare-fun m!1331565 () Bool)

(assert (=> b!1442393 m!1331565))

(declare-fun m!1331567 () Bool)

(assert (=> b!1442391 m!1331567))

(assert (=> b!1442391 m!1331567))

(declare-fun m!1331569 () Bool)

(assert (=> b!1442391 m!1331569))

(assert (=> b!1442391 m!1331557))

(declare-fun m!1331571 () Bool)

(assert (=> b!1442391 m!1331571))

(assert (=> b!1442399 m!1331547))

(assert (=> b!1442399 m!1331547))

(declare-fun m!1331573 () Bool)

(assert (=> b!1442399 m!1331573))

(declare-fun m!1331575 () Bool)

(assert (=> b!1442403 m!1331575))

(declare-fun m!1331577 () Bool)

(assert (=> b!1442397 m!1331577))

(declare-fun m!1331579 () Bool)

(assert (=> b!1442397 m!1331579))

(declare-fun m!1331581 () Bool)

(assert (=> b!1442396 m!1331581))

(declare-fun m!1331583 () Bool)

(assert (=> b!1442395 m!1331583))

(declare-fun m!1331585 () Bool)

(assert (=> b!1442395 m!1331585))

(declare-fun m!1331587 () Bool)

(assert (=> start!124588 m!1331587))

(declare-fun m!1331589 () Bool)

(assert (=> start!124588 m!1331589))

(push 1)

