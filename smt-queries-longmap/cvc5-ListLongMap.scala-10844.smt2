; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126910 () Bool)

(assert start!126910)

(declare-fun b!1491382 () Bool)

(declare-fun res!1014566 () Bool)

(declare-fun e!835604 () Bool)

(assert (=> b!1491382 (=> (not res!1014566) (not e!835604))))

(declare-datatypes ((array!99683 0))(
  ( (array!99684 (arr!48113 (Array (_ BitVec 32) (_ BitVec 64))) (size!48663 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99683)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491382 (= res!1014566 (validKeyInArray!0 (select (arr!48113 a!2862) i!1006)))))

(declare-fun b!1491383 () Bool)

(declare-fun e!835601 () Bool)

(assert (=> b!1491383 (= e!835604 e!835601)))

(declare-fun res!1014563 () Bool)

(assert (=> b!1491383 (=> (not res!1014563) (not e!835601))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1491383 (= res!1014563 (= (select (store (arr!48113 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!650259 () array!99683)

(assert (=> b!1491383 (= lt!650259 (array!99684 (store (arr!48113 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48663 a!2862)))))

(declare-fun b!1491384 () Bool)

(declare-fun res!1014559 () Bool)

(assert (=> b!1491384 (=> (not res!1014559) (not e!835604))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1491384 (= res!1014559 (and (= (size!48663 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48663 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48663 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1491385 () Bool)

(declare-fun res!1014560 () Bool)

(declare-fun e!835603 () Bool)

(assert (=> b!1491385 (=> (not res!1014560) (not e!835603))))

(declare-datatypes ((SeekEntryResult!12353 0))(
  ( (MissingZero!12353 (index!51804 (_ BitVec 32))) (Found!12353 (index!51805 (_ BitVec 32))) (Intermediate!12353 (undefined!13165 Bool) (index!51806 (_ BitVec 32)) (x!133393 (_ BitVec 32))) (Undefined!12353) (MissingVacant!12353 (index!51807 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99683 (_ BitVec 32)) SeekEntryResult!12353)

(assert (=> b!1491385 (= res!1014560 (= (seekEntryOrOpen!0 (select (arr!48113 a!2862) j!93) a!2862 mask!2687) (Found!12353 j!93)))))

(declare-fun e!835600 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!650260 () SeekEntryResult!12353)

(declare-fun lt!650262 () (_ BitVec 64))

(declare-fun b!1491386 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99683 (_ BitVec 32)) SeekEntryResult!12353)

(assert (=> b!1491386 (= e!835600 (= lt!650260 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650262 lt!650259 mask!2687)))))

(declare-fun b!1491387 () Bool)

(declare-fun e!835607 () Bool)

(assert (=> b!1491387 (= e!835607 true)))

(declare-fun lt!650257 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491387 (= lt!650257 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1491388 () Bool)

(declare-fun res!1014569 () Bool)

(declare-fun e!835602 () Bool)

(assert (=> b!1491388 (=> (not res!1014569) (not e!835602))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1491388 (= res!1014569 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1491389 () Bool)

(declare-fun e!835606 () Bool)

(assert (=> b!1491389 (= e!835606 e!835602)))

(declare-fun res!1014568 () Bool)

(assert (=> b!1491389 (=> (not res!1014568) (not e!835602))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1491389 (= res!1014568 (= lt!650260 (Intermediate!12353 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491389 (= lt!650260 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650262 mask!2687) lt!650262 lt!650259 mask!2687))))

(assert (=> b!1491389 (= lt!650262 (select (store (arr!48113 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1491390 () Bool)

(declare-fun res!1014564 () Bool)

(assert (=> b!1491390 (=> (not res!1014564) (not e!835606))))

(declare-fun lt!650261 () SeekEntryResult!12353)

(assert (=> b!1491390 (= res!1014564 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48113 a!2862) j!93) a!2862 mask!2687) lt!650261))))

(declare-fun b!1491391 () Bool)

(declare-fun res!1014558 () Bool)

(assert (=> b!1491391 (=> (not res!1014558) (not e!835604))))

(assert (=> b!1491391 (= res!1014558 (validKeyInArray!0 (select (arr!48113 a!2862) j!93)))))

(declare-fun b!1491392 () Bool)

(declare-fun res!1014565 () Bool)

(assert (=> b!1491392 (=> (not res!1014565) (not e!835604))))

(declare-datatypes ((List!34614 0))(
  ( (Nil!34611) (Cons!34610 (h!35993 (_ BitVec 64)) (t!49308 List!34614)) )
))
(declare-fun arrayNoDuplicates!0 (array!99683 (_ BitVec 32) List!34614) Bool)

(assert (=> b!1491392 (= res!1014565 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34611))))

(declare-fun b!1491393 () Bool)

(assert (=> b!1491393 (= e!835601 e!835606)))

(declare-fun res!1014561 () Bool)

(assert (=> b!1491393 (=> (not res!1014561) (not e!835606))))

(assert (=> b!1491393 (= res!1014561 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48113 a!2862) j!93) mask!2687) (select (arr!48113 a!2862) j!93) a!2862 mask!2687) lt!650261))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1491393 (= lt!650261 (Intermediate!12353 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1491394 () Bool)

(assert (=> b!1491394 (= e!835603 (or (= (select (arr!48113 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48113 a!2862) intermediateBeforeIndex!19) (select (arr!48113 a!2862) j!93))))))

(declare-fun b!1491395 () Bool)

(declare-fun res!1014557 () Bool)

(assert (=> b!1491395 (=> (not res!1014557) (not e!835604))))

(assert (=> b!1491395 (= res!1014557 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48663 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48663 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48663 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1491396 () Bool)

(declare-fun res!1014570 () Bool)

(assert (=> b!1491396 (=> (not res!1014570) (not e!835604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99683 (_ BitVec 32)) Bool)

(assert (=> b!1491396 (= res!1014570 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1491397 () Bool)

(declare-fun res!1014567 () Bool)

(assert (=> b!1491397 (=> (not res!1014567) (not e!835602))))

(assert (=> b!1491397 (= res!1014567 e!835600)))

(declare-fun c!137940 () Bool)

(assert (=> b!1491397 (= c!137940 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1491398 () Bool)

(assert (=> b!1491398 (= e!835602 (not e!835607))))

(declare-fun res!1014571 () Bool)

(assert (=> b!1491398 (=> res!1014571 e!835607)))

(assert (=> b!1491398 (= res!1014571 (or (and (= (select (arr!48113 a!2862) index!646) (select (store (arr!48113 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48113 a!2862) index!646) (select (arr!48113 a!2862) j!93))) (= (select (arr!48113 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1491398 e!835603))

(declare-fun res!1014556 () Bool)

(assert (=> b!1491398 (=> (not res!1014556) (not e!835603))))

(assert (=> b!1491398 (= res!1014556 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50046 0))(
  ( (Unit!50047) )
))
(declare-fun lt!650258 () Unit!50046)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99683 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50046)

(assert (=> b!1491398 (= lt!650258 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1491399 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99683 (_ BitVec 32)) SeekEntryResult!12353)

(assert (=> b!1491399 (= e!835600 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650262 lt!650259 mask!2687) (seekEntryOrOpen!0 lt!650262 lt!650259 mask!2687)))))

(declare-fun res!1014562 () Bool)

(assert (=> start!126910 (=> (not res!1014562) (not e!835604))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126910 (= res!1014562 (validMask!0 mask!2687))))

(assert (=> start!126910 e!835604))

(assert (=> start!126910 true))

(declare-fun array_inv!37141 (array!99683) Bool)

(assert (=> start!126910 (array_inv!37141 a!2862)))

(assert (= (and start!126910 res!1014562) b!1491384))

(assert (= (and b!1491384 res!1014559) b!1491382))

(assert (= (and b!1491382 res!1014566) b!1491391))

(assert (= (and b!1491391 res!1014558) b!1491396))

(assert (= (and b!1491396 res!1014570) b!1491392))

(assert (= (and b!1491392 res!1014565) b!1491395))

(assert (= (and b!1491395 res!1014557) b!1491383))

(assert (= (and b!1491383 res!1014563) b!1491393))

(assert (= (and b!1491393 res!1014561) b!1491390))

(assert (= (and b!1491390 res!1014564) b!1491389))

(assert (= (and b!1491389 res!1014568) b!1491397))

(assert (= (and b!1491397 c!137940) b!1491386))

(assert (= (and b!1491397 (not c!137940)) b!1491399))

(assert (= (and b!1491397 res!1014567) b!1491388))

(assert (= (and b!1491388 res!1014569) b!1491398))

(assert (= (and b!1491398 res!1014556) b!1491385))

(assert (= (and b!1491385 res!1014560) b!1491394))

(assert (= (and b!1491398 (not res!1014571)) b!1491387))

(declare-fun m!1375507 () Bool)

(assert (=> b!1491386 m!1375507))

(declare-fun m!1375509 () Bool)

(assert (=> b!1491383 m!1375509))

(declare-fun m!1375511 () Bool)

(assert (=> b!1491383 m!1375511))

(declare-fun m!1375513 () Bool)

(assert (=> b!1491385 m!1375513))

(assert (=> b!1491385 m!1375513))

(declare-fun m!1375515 () Bool)

(assert (=> b!1491385 m!1375515))

(declare-fun m!1375517 () Bool)

(assert (=> b!1491399 m!1375517))

(declare-fun m!1375519 () Bool)

(assert (=> b!1491399 m!1375519))

(declare-fun m!1375521 () Bool)

(assert (=> b!1491396 m!1375521))

(declare-fun m!1375523 () Bool)

(assert (=> start!126910 m!1375523))

(declare-fun m!1375525 () Bool)

(assert (=> start!126910 m!1375525))

(assert (=> b!1491393 m!1375513))

(assert (=> b!1491393 m!1375513))

(declare-fun m!1375527 () Bool)

(assert (=> b!1491393 m!1375527))

(assert (=> b!1491393 m!1375527))

(assert (=> b!1491393 m!1375513))

(declare-fun m!1375529 () Bool)

(assert (=> b!1491393 m!1375529))

(declare-fun m!1375531 () Bool)

(assert (=> b!1491392 m!1375531))

(declare-fun m!1375533 () Bool)

(assert (=> b!1491394 m!1375533))

(assert (=> b!1491394 m!1375513))

(declare-fun m!1375535 () Bool)

(assert (=> b!1491387 m!1375535))

(declare-fun m!1375537 () Bool)

(assert (=> b!1491389 m!1375537))

(assert (=> b!1491389 m!1375537))

(declare-fun m!1375539 () Bool)

(assert (=> b!1491389 m!1375539))

(assert (=> b!1491389 m!1375509))

(declare-fun m!1375541 () Bool)

(assert (=> b!1491389 m!1375541))

(declare-fun m!1375543 () Bool)

(assert (=> b!1491382 m!1375543))

(assert (=> b!1491382 m!1375543))

(declare-fun m!1375545 () Bool)

(assert (=> b!1491382 m!1375545))

(assert (=> b!1491391 m!1375513))

(assert (=> b!1491391 m!1375513))

(declare-fun m!1375547 () Bool)

(assert (=> b!1491391 m!1375547))

(declare-fun m!1375549 () Bool)

(assert (=> b!1491398 m!1375549))

(assert (=> b!1491398 m!1375509))

(declare-fun m!1375551 () Bool)

(assert (=> b!1491398 m!1375551))

(declare-fun m!1375553 () Bool)

(assert (=> b!1491398 m!1375553))

(declare-fun m!1375555 () Bool)

(assert (=> b!1491398 m!1375555))

(assert (=> b!1491398 m!1375513))

(assert (=> b!1491390 m!1375513))

(assert (=> b!1491390 m!1375513))

(declare-fun m!1375557 () Bool)

(assert (=> b!1491390 m!1375557))

(push 1)

