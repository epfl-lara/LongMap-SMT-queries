; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126872 () Bool)

(assert start!126872)

(declare-fun b!1490356 () Bool)

(declare-fun res!1013644 () Bool)

(declare-fun e!835151 () Bool)

(assert (=> b!1490356 (=> (not res!1013644) (not e!835151))))

(declare-datatypes ((array!99645 0))(
  ( (array!99646 (arr!48094 (Array (_ BitVec 32) (_ BitVec 64))) (size!48644 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99645)

(declare-datatypes ((List!34595 0))(
  ( (Nil!34592) (Cons!34591 (h!35974 (_ BitVec 64)) (t!49289 List!34595)) )
))
(declare-fun arrayNoDuplicates!0 (array!99645 (_ BitVec 32) List!34595) Bool)

(assert (=> b!1490356 (= res!1013644 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34592))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1490357 () Bool)

(declare-fun e!835145 () Bool)

(declare-fun lt!649915 () array!99645)

(declare-fun lt!649919 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12334 0))(
  ( (MissingZero!12334 (index!51728 (_ BitVec 32))) (Found!12334 (index!51729 (_ BitVec 32))) (Intermediate!12334 (undefined!13146 Bool) (index!51730 (_ BitVec 32)) (x!133318 (_ BitVec 32))) (Undefined!12334) (MissingVacant!12334 (index!51731 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99645 (_ BitVec 32)) SeekEntryResult!12334)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99645 (_ BitVec 32)) SeekEntryResult!12334)

(assert (=> b!1490357 (= e!835145 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649919 lt!649915 mask!2687) (seekEntryOrOpen!0 lt!649919 lt!649915 mask!2687)))))

(declare-fun b!1490358 () Bool)

(declare-fun res!1013647 () Bool)

(declare-fun e!835144 () Bool)

(assert (=> b!1490358 (=> (not res!1013647) (not e!835144))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1490358 (= res!1013647 (= (seekEntryOrOpen!0 (select (arr!48094 a!2862) j!93) a!2862 mask!2687) (Found!12334 j!93)))))

(declare-fun b!1490359 () Bool)

(declare-fun e!835150 () Bool)

(declare-fun e!835146 () Bool)

(assert (=> b!1490359 (= e!835150 e!835146)))

(declare-fun res!1013654 () Bool)

(assert (=> b!1490359 (=> (not res!1013654) (not e!835146))))

(declare-fun lt!649920 () SeekEntryResult!12334)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99645 (_ BitVec 32)) SeekEntryResult!12334)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490359 (= res!1013654 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48094 a!2862) j!93) mask!2687) (select (arr!48094 a!2862) j!93) a!2862 mask!2687) lt!649920))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1490359 (= lt!649920 (Intermediate!12334 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!649917 () SeekEntryResult!12334)

(declare-fun b!1490360 () Bool)

(assert (=> b!1490360 (= e!835145 (= lt!649917 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649919 lt!649915 mask!2687)))))

(declare-fun b!1490361 () Bool)

(declare-fun res!1013652 () Bool)

(assert (=> b!1490361 (=> (not res!1013652) (not e!835151))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1490361 (= res!1013652 (validKeyInArray!0 (select (arr!48094 a!2862) j!93)))))

(declare-fun b!1490362 () Bool)

(declare-fun res!1013649 () Bool)

(assert (=> b!1490362 (=> (not res!1013649) (not e!835146))))

(assert (=> b!1490362 (= res!1013649 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48094 a!2862) j!93) a!2862 mask!2687) lt!649920))))

(declare-fun b!1490363 () Bool)

(declare-fun res!1013648 () Bool)

(assert (=> b!1490363 (=> (not res!1013648) (not e!835151))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1490363 (= res!1013648 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48644 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48644 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48644 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1490364 () Bool)

(assert (=> b!1490364 (= e!835151 e!835150)))

(declare-fun res!1013651 () Bool)

(assert (=> b!1490364 (=> (not res!1013651) (not e!835150))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1490364 (= res!1013651 (= (select (store (arr!48094 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490364 (= lt!649915 (array!99646 (store (arr!48094 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48644 a!2862)))))

(declare-fun b!1490365 () Bool)

(declare-fun e!835148 () Bool)

(assert (=> b!1490365 (= e!835148 true)))

(declare-fun lt!649918 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490365 (= lt!649918 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1490366 () Bool)

(declare-fun e!835149 () Bool)

(assert (=> b!1490366 (= e!835146 e!835149)))

(declare-fun res!1013658 () Bool)

(assert (=> b!1490366 (=> (not res!1013658) (not e!835149))))

(assert (=> b!1490366 (= res!1013658 (= lt!649917 (Intermediate!12334 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1490366 (= lt!649917 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649919 mask!2687) lt!649919 lt!649915 mask!2687))))

(assert (=> b!1490366 (= lt!649919 (select (store (arr!48094 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1490368 () Bool)

(declare-fun res!1013655 () Bool)

(assert (=> b!1490368 (=> (not res!1013655) (not e!835149))))

(assert (=> b!1490368 (= res!1013655 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1490369 () Bool)

(declare-fun res!1013646 () Bool)

(assert (=> b!1490369 (=> (not res!1013646) (not e!835151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99645 (_ BitVec 32)) Bool)

(assert (=> b!1490369 (= res!1013646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1490367 () Bool)

(declare-fun res!1013653 () Bool)

(assert (=> b!1490367 (=> (not res!1013653) (not e!835151))))

(assert (=> b!1490367 (= res!1013653 (validKeyInArray!0 (select (arr!48094 a!2862) i!1006)))))

(declare-fun res!1013650 () Bool)

(assert (=> start!126872 (=> (not res!1013650) (not e!835151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126872 (= res!1013650 (validMask!0 mask!2687))))

(assert (=> start!126872 e!835151))

(assert (=> start!126872 true))

(declare-fun array_inv!37122 (array!99645) Bool)

(assert (=> start!126872 (array_inv!37122 a!2862)))

(declare-fun b!1490370 () Bool)

(declare-fun res!1013657 () Bool)

(assert (=> b!1490370 (=> (not res!1013657) (not e!835149))))

(assert (=> b!1490370 (= res!1013657 e!835145)))

(declare-fun c!137883 () Bool)

(assert (=> b!1490370 (= c!137883 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1490371 () Bool)

(declare-fun res!1013645 () Bool)

(assert (=> b!1490371 (=> (not res!1013645) (not e!835151))))

(assert (=> b!1490371 (= res!1013645 (and (= (size!48644 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48644 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48644 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1490372 () Bool)

(assert (=> b!1490372 (= e!835144 (or (= (select (arr!48094 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48094 a!2862) intermediateBeforeIndex!19) (select (arr!48094 a!2862) j!93))))))

(declare-fun b!1490373 () Bool)

(assert (=> b!1490373 (= e!835149 (not e!835148))))

(declare-fun res!1013659 () Bool)

(assert (=> b!1490373 (=> res!1013659 e!835148)))

(assert (=> b!1490373 (= res!1013659 (or (and (= (select (arr!48094 a!2862) index!646) (select (store (arr!48094 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48094 a!2862) index!646) (select (arr!48094 a!2862) j!93))) (= (select (arr!48094 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1490373 e!835144))

(declare-fun res!1013656 () Bool)

(assert (=> b!1490373 (=> (not res!1013656) (not e!835144))))

(assert (=> b!1490373 (= res!1013656 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50008 0))(
  ( (Unit!50009) )
))
(declare-fun lt!649916 () Unit!50008)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99645 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50008)

(assert (=> b!1490373 (= lt!649916 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!126872 res!1013650) b!1490371))

(assert (= (and b!1490371 res!1013645) b!1490367))

(assert (= (and b!1490367 res!1013653) b!1490361))

(assert (= (and b!1490361 res!1013652) b!1490369))

(assert (= (and b!1490369 res!1013646) b!1490356))

(assert (= (and b!1490356 res!1013644) b!1490363))

(assert (= (and b!1490363 res!1013648) b!1490364))

(assert (= (and b!1490364 res!1013651) b!1490359))

(assert (= (and b!1490359 res!1013654) b!1490362))

(assert (= (and b!1490362 res!1013649) b!1490366))

(assert (= (and b!1490366 res!1013658) b!1490370))

(assert (= (and b!1490370 c!137883) b!1490360))

(assert (= (and b!1490370 (not c!137883)) b!1490357))

(assert (= (and b!1490370 res!1013657) b!1490368))

(assert (= (and b!1490368 res!1013655) b!1490373))

(assert (= (and b!1490373 res!1013656) b!1490358))

(assert (= (and b!1490358 res!1013647) b!1490372))

(assert (= (and b!1490373 (not res!1013659)) b!1490365))

(declare-fun m!1374519 () Bool)

(assert (=> b!1490361 m!1374519))

(assert (=> b!1490361 m!1374519))

(declare-fun m!1374521 () Bool)

(assert (=> b!1490361 m!1374521))

(declare-fun m!1374523 () Bool)

(assert (=> b!1490367 m!1374523))

(assert (=> b!1490367 m!1374523))

(declare-fun m!1374525 () Bool)

(assert (=> b!1490367 m!1374525))

(declare-fun m!1374527 () Bool)

(assert (=> b!1490365 m!1374527))

(declare-fun m!1374529 () Bool)

(assert (=> b!1490369 m!1374529))

(declare-fun m!1374531 () Bool)

(assert (=> b!1490356 m!1374531))

(declare-fun m!1374533 () Bool)

(assert (=> b!1490360 m!1374533))

(assert (=> b!1490358 m!1374519))

(assert (=> b!1490358 m!1374519))

(declare-fun m!1374535 () Bool)

(assert (=> b!1490358 m!1374535))

(declare-fun m!1374537 () Bool)

(assert (=> b!1490372 m!1374537))

(assert (=> b!1490372 m!1374519))

(declare-fun m!1374539 () Bool)

(assert (=> start!126872 m!1374539))

(declare-fun m!1374541 () Bool)

(assert (=> start!126872 m!1374541))

(declare-fun m!1374543 () Bool)

(assert (=> b!1490357 m!1374543))

(declare-fun m!1374545 () Bool)

(assert (=> b!1490357 m!1374545))

(declare-fun m!1374547 () Bool)

(assert (=> b!1490366 m!1374547))

(assert (=> b!1490366 m!1374547))

(declare-fun m!1374549 () Bool)

(assert (=> b!1490366 m!1374549))

(declare-fun m!1374551 () Bool)

(assert (=> b!1490366 m!1374551))

(declare-fun m!1374553 () Bool)

(assert (=> b!1490366 m!1374553))

(declare-fun m!1374555 () Bool)

(assert (=> b!1490373 m!1374555))

(assert (=> b!1490373 m!1374551))

(declare-fun m!1374557 () Bool)

(assert (=> b!1490373 m!1374557))

(declare-fun m!1374559 () Bool)

(assert (=> b!1490373 m!1374559))

(declare-fun m!1374561 () Bool)

(assert (=> b!1490373 m!1374561))

(assert (=> b!1490373 m!1374519))

(assert (=> b!1490364 m!1374551))

(declare-fun m!1374563 () Bool)

(assert (=> b!1490364 m!1374563))

(assert (=> b!1490359 m!1374519))

(assert (=> b!1490359 m!1374519))

(declare-fun m!1374565 () Bool)

(assert (=> b!1490359 m!1374565))

(assert (=> b!1490359 m!1374565))

(assert (=> b!1490359 m!1374519))

(declare-fun m!1374567 () Bool)

(assert (=> b!1490359 m!1374567))

(assert (=> b!1490362 m!1374519))

(assert (=> b!1490362 m!1374519))

(declare-fun m!1374569 () Bool)

(assert (=> b!1490362 m!1374569))

(push 1)

