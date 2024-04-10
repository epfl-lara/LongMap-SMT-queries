; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125300 () Bool)

(assert start!125300)

(declare-fun b!1463373 () Bool)

(declare-fun res!992639 () Bool)

(declare-fun e!822496 () Bool)

(assert (=> b!1463373 (=> (not res!992639) (not e!822496))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11914 0))(
  ( (MissingZero!11914 (index!50048 (_ BitVec 32))) (Found!11914 (index!50049 (_ BitVec 32))) (Intermediate!11914 (undefined!12726 Bool) (index!50050 (_ BitVec 32)) (x!131635 (_ BitVec 32))) (Undefined!11914) (MissingVacant!11914 (index!50051 (_ BitVec 32))) )
))
(declare-fun lt!640749 () SeekEntryResult!11914)

(declare-datatypes ((array!98748 0))(
  ( (array!98749 (arr!47662 (Array (_ BitVec 32) (_ BitVec 64))) (size!48212 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98748)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98748 (_ BitVec 32)) SeekEntryResult!11914)

(assert (=> b!1463373 (= res!992639 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47662 a!2862) j!93) a!2862 mask!2687) lt!640749))))

(declare-fun b!1463374 () Bool)

(declare-fun res!992652 () Bool)

(declare-fun e!822499 () Bool)

(assert (=> b!1463374 (=> (not res!992652) (not e!822499))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98748 (_ BitVec 32)) Bool)

(assert (=> b!1463374 (= res!992652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1463375 () Bool)

(declare-fun e!822493 () Bool)

(assert (=> b!1463375 (= e!822493 (or (= (select (arr!47662 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47662 a!2862) intermediateBeforeIndex!19) (select (arr!47662 a!2862) j!93))))))

(declare-fun b!1463376 () Bool)

(declare-fun e!822491 () Bool)

(assert (=> b!1463376 (= e!822496 e!822491)))

(declare-fun res!992653 () Bool)

(assert (=> b!1463376 (=> (not res!992653) (not e!822491))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!640750 () SeekEntryResult!11914)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1463376 (= res!992653 (= lt!640750 (Intermediate!11914 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!640751 () array!98748)

(declare-fun lt!640747 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463376 (= lt!640750 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640747 mask!2687) lt!640747 lt!640751 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1463376 (= lt!640747 (select (store (arr!47662 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1463377 () Bool)

(declare-fun res!992640 () Bool)

(assert (=> b!1463377 (=> (not res!992640) (not e!822499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1463377 (= res!992640 (validKeyInArray!0 (select (arr!47662 a!2862) i!1006)))))

(declare-fun b!1463378 () Bool)

(declare-fun e!822492 () Bool)

(assert (=> b!1463378 (= e!822492 (= lt!640750 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640747 lt!640751 mask!2687)))))

(declare-fun b!1463379 () Bool)

(declare-fun res!992637 () Bool)

(assert (=> b!1463379 (=> (not res!992637) (not e!822493))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98748 (_ BitVec 32)) SeekEntryResult!11914)

(assert (=> b!1463379 (= res!992637 (= (seekEntryOrOpen!0 (select (arr!47662 a!2862) j!93) a!2862 mask!2687) (Found!11914 j!93)))))

(declare-fun b!1463380 () Bool)

(declare-fun res!992647 () Bool)

(assert (=> b!1463380 (=> (not res!992647) (not e!822491))))

(assert (=> b!1463380 (= res!992647 e!822492)))

(declare-fun c!134880 () Bool)

(assert (=> b!1463380 (= c!134880 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1463381 () Bool)

(declare-fun res!992641 () Bool)

(assert (=> b!1463381 (=> (not res!992641) (not e!822499))))

(assert (=> b!1463381 (= res!992641 (and (= (size!48212 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48212 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48212 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1463382 () Bool)

(declare-fun e!822495 () Bool)

(declare-fun e!822498 () Bool)

(assert (=> b!1463382 (= e!822495 e!822498)))

(declare-fun res!992650 () Bool)

(assert (=> b!1463382 (=> res!992650 e!822498)))

(declare-fun lt!640746 () (_ BitVec 32))

(assert (=> b!1463382 (= res!992650 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640746 #b00000000000000000000000000000000) (bvsge lt!640746 (size!48212 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1463382 (= lt!640746 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1463383 () Bool)

(declare-fun res!992644 () Bool)

(assert (=> b!1463383 (=> (not res!992644) (not e!822499))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1463383 (= res!992644 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48212 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48212 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48212 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1463384 () Bool)

(assert (=> b!1463384 (= e!822498 true)))

(declare-fun lt!640748 () Bool)

(declare-fun e!822497 () Bool)

(assert (=> b!1463384 (= lt!640748 e!822497)))

(declare-fun c!134879 () Bool)

(assert (=> b!1463384 (= c!134879 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1463385 () Bool)

(declare-fun res!992643 () Bool)

(assert (=> b!1463385 (=> (not res!992643) (not e!822499))))

(declare-datatypes ((List!34163 0))(
  ( (Nil!34160) (Cons!34159 (h!35509 (_ BitVec 64)) (t!48857 List!34163)) )
))
(declare-fun arrayNoDuplicates!0 (array!98748 (_ BitVec 32) List!34163) Bool)

(assert (=> b!1463385 (= res!992643 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34160))))

(declare-fun b!1463386 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98748 (_ BitVec 32)) SeekEntryResult!11914)

(assert (=> b!1463386 (= e!822497 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640746 intermediateAfterIndex!19 lt!640747 lt!640751 mask!2687) (seekEntryOrOpen!0 lt!640747 lt!640751 mask!2687))))))

(declare-fun b!1463387 () Bool)

(declare-fun res!992638 () Bool)

(assert (=> b!1463387 (=> (not res!992638) (not e!822491))))

(assert (=> b!1463387 (= res!992638 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1463388 () Bool)

(declare-fun e!822500 () Bool)

(assert (=> b!1463388 (= e!822499 e!822500)))

(declare-fun res!992649 () Bool)

(assert (=> b!1463388 (=> (not res!992649) (not e!822500))))

(assert (=> b!1463388 (= res!992649 (= (select (store (arr!47662 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1463388 (= lt!640751 (array!98749 (store (arr!47662 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48212 a!2862)))))

(declare-fun b!1463389 () Bool)

(assert (=> b!1463389 (= e!822500 e!822496)))

(declare-fun res!992648 () Bool)

(assert (=> b!1463389 (=> (not res!992648) (not e!822496))))

(assert (=> b!1463389 (= res!992648 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47662 a!2862) j!93) mask!2687) (select (arr!47662 a!2862) j!93) a!2862 mask!2687) lt!640749))))

(assert (=> b!1463389 (= lt!640749 (Intermediate!11914 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1463390 () Bool)

(assert (=> b!1463390 (= e!822491 (not e!822495))))

(declare-fun res!992651 () Bool)

(assert (=> b!1463390 (=> res!992651 e!822495)))

(assert (=> b!1463390 (= res!992651 (or (and (= (select (arr!47662 a!2862) index!646) (select (store (arr!47662 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47662 a!2862) index!646) (select (arr!47662 a!2862) j!93))) (= (select (arr!47662 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1463390 e!822493))

(declare-fun res!992642 () Bool)

(assert (=> b!1463390 (=> (not res!992642) (not e!822493))))

(assert (=> b!1463390 (= res!992642 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49324 0))(
  ( (Unit!49325) )
))
(declare-fun lt!640752 () Unit!49324)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98748 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49324)

(assert (=> b!1463390 (= lt!640752 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1463391 () Bool)

(declare-fun res!992645 () Bool)

(assert (=> b!1463391 (=> res!992645 e!822498)))

(assert (=> b!1463391 (= res!992645 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640746 (select (arr!47662 a!2862) j!93) a!2862 mask!2687) lt!640749)))))

(declare-fun b!1463392 () Bool)

(declare-fun res!992636 () Bool)

(assert (=> b!1463392 (=> (not res!992636) (not e!822499))))

(assert (=> b!1463392 (= res!992636 (validKeyInArray!0 (select (arr!47662 a!2862) j!93)))))

(declare-fun res!992646 () Bool)

(assert (=> start!125300 (=> (not res!992646) (not e!822499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125300 (= res!992646 (validMask!0 mask!2687))))

(assert (=> start!125300 e!822499))

(assert (=> start!125300 true))

(declare-fun array_inv!36690 (array!98748) Bool)

(assert (=> start!125300 (array_inv!36690 a!2862)))

(declare-fun b!1463393 () Bool)

(assert (=> b!1463393 (= e!822492 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640747 lt!640751 mask!2687) (seekEntryOrOpen!0 lt!640747 lt!640751 mask!2687)))))

(declare-fun b!1463394 () Bool)

(assert (=> b!1463394 (= e!822497 (not (= lt!640750 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640746 lt!640747 lt!640751 mask!2687))))))

(assert (= (and start!125300 res!992646) b!1463381))

(assert (= (and b!1463381 res!992641) b!1463377))

(assert (= (and b!1463377 res!992640) b!1463392))

(assert (= (and b!1463392 res!992636) b!1463374))

(assert (= (and b!1463374 res!992652) b!1463385))

(assert (= (and b!1463385 res!992643) b!1463383))

(assert (= (and b!1463383 res!992644) b!1463388))

(assert (= (and b!1463388 res!992649) b!1463389))

(assert (= (and b!1463389 res!992648) b!1463373))

(assert (= (and b!1463373 res!992639) b!1463376))

(assert (= (and b!1463376 res!992653) b!1463380))

(assert (= (and b!1463380 c!134880) b!1463378))

(assert (= (and b!1463380 (not c!134880)) b!1463393))

(assert (= (and b!1463380 res!992647) b!1463387))

(assert (= (and b!1463387 res!992638) b!1463390))

(assert (= (and b!1463390 res!992642) b!1463379))

(assert (= (and b!1463379 res!992637) b!1463375))

(assert (= (and b!1463390 (not res!992651)) b!1463382))

(assert (= (and b!1463382 (not res!992650)) b!1463391))

(assert (= (and b!1463391 (not res!992645)) b!1463384))

(assert (= (and b!1463384 c!134879) b!1463394))

(assert (= (and b!1463384 (not c!134879)) b!1463386))

(declare-fun m!1350717 () Bool)

(assert (=> b!1463376 m!1350717))

(assert (=> b!1463376 m!1350717))

(declare-fun m!1350719 () Bool)

(assert (=> b!1463376 m!1350719))

(declare-fun m!1350721 () Bool)

(assert (=> b!1463376 m!1350721))

(declare-fun m!1350723 () Bool)

(assert (=> b!1463376 m!1350723))

(declare-fun m!1350725 () Bool)

(assert (=> b!1463379 m!1350725))

(assert (=> b!1463379 m!1350725))

(declare-fun m!1350727 () Bool)

(assert (=> b!1463379 m!1350727))

(declare-fun m!1350729 () Bool)

(assert (=> b!1463385 m!1350729))

(declare-fun m!1350731 () Bool)

(assert (=> b!1463375 m!1350731))

(assert (=> b!1463375 m!1350725))

(assert (=> b!1463373 m!1350725))

(assert (=> b!1463373 m!1350725))

(declare-fun m!1350733 () Bool)

(assert (=> b!1463373 m!1350733))

(assert (=> b!1463391 m!1350725))

(assert (=> b!1463391 m!1350725))

(declare-fun m!1350735 () Bool)

(assert (=> b!1463391 m!1350735))

(declare-fun m!1350737 () Bool)

(assert (=> b!1463382 m!1350737))

(assert (=> b!1463392 m!1350725))

(assert (=> b!1463392 m!1350725))

(declare-fun m!1350739 () Bool)

(assert (=> b!1463392 m!1350739))

(declare-fun m!1350741 () Bool)

(assert (=> b!1463393 m!1350741))

(declare-fun m!1350743 () Bool)

(assert (=> b!1463393 m!1350743))

(declare-fun m!1350745 () Bool)

(assert (=> b!1463390 m!1350745))

(assert (=> b!1463390 m!1350721))

(declare-fun m!1350747 () Bool)

(assert (=> b!1463390 m!1350747))

(declare-fun m!1350749 () Bool)

(assert (=> b!1463390 m!1350749))

(declare-fun m!1350751 () Bool)

(assert (=> b!1463390 m!1350751))

(assert (=> b!1463390 m!1350725))

(declare-fun m!1350753 () Bool)

(assert (=> b!1463394 m!1350753))

(declare-fun m!1350755 () Bool)

(assert (=> b!1463377 m!1350755))

(assert (=> b!1463377 m!1350755))

(declare-fun m!1350757 () Bool)

(assert (=> b!1463377 m!1350757))

(declare-fun m!1350759 () Bool)

(assert (=> b!1463378 m!1350759))

(declare-fun m!1350761 () Bool)

(assert (=> b!1463374 m!1350761))

(declare-fun m!1350763 () Bool)

(assert (=> b!1463386 m!1350763))

(assert (=> b!1463386 m!1350743))

(assert (=> b!1463389 m!1350725))

(assert (=> b!1463389 m!1350725))

(declare-fun m!1350765 () Bool)

(assert (=> b!1463389 m!1350765))

(assert (=> b!1463389 m!1350765))

(assert (=> b!1463389 m!1350725))

(declare-fun m!1350767 () Bool)

(assert (=> b!1463389 m!1350767))

(declare-fun m!1350769 () Bool)

(assert (=> start!125300 m!1350769))

(declare-fun m!1350771 () Bool)

(assert (=> start!125300 m!1350771))

(assert (=> b!1463388 m!1350721))

(declare-fun m!1350773 () Bool)

(assert (=> b!1463388 m!1350773))

(push 1)

