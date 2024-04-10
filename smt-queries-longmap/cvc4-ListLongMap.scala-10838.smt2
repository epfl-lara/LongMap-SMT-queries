; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126878 () Bool)

(assert start!126878)

(declare-fun e!835220 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1490518 () Bool)

(declare-datatypes ((array!99651 0))(
  ( (array!99652 (arr!48097 (Array (_ BitVec 32) (_ BitVec 64))) (size!48647 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99651)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1490518 (= e!835220 (or (= (select (arr!48097 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48097 a!2862) intermediateBeforeIndex!19) (select (arr!48097 a!2862) j!93))))))

(declare-fun b!1490519 () Bool)

(declare-fun res!1013793 () Bool)

(assert (=> b!1490519 (=> (not res!1013793) (not e!835220))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12337 0))(
  ( (MissingZero!12337 (index!51740 (_ BitVec 32))) (Found!12337 (index!51741 (_ BitVec 32))) (Intermediate!12337 (undefined!13149 Bool) (index!51742 (_ BitVec 32)) (x!133329 (_ BitVec 32))) (Undefined!12337) (MissingVacant!12337 (index!51743 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99651 (_ BitVec 32)) SeekEntryResult!12337)

(assert (=> b!1490519 (= res!1013793 (= (seekEntryOrOpen!0 (select (arr!48097 a!2862) j!93) a!2862 mask!2687) (Found!12337 j!93)))))

(declare-fun res!1013794 () Bool)

(declare-fun e!835223 () Bool)

(assert (=> start!126878 (=> (not res!1013794) (not e!835223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126878 (= res!1013794 (validMask!0 mask!2687))))

(assert (=> start!126878 e!835223))

(assert (=> start!126878 true))

(declare-fun array_inv!37125 (array!99651) Bool)

(assert (=> start!126878 (array_inv!37125 a!2862)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!835222 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!649972 () array!99651)

(declare-fun lt!649970 () SeekEntryResult!12337)

(declare-fun b!1490520 () Bool)

(declare-fun lt!649969 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99651 (_ BitVec 32)) SeekEntryResult!12337)

(assert (=> b!1490520 (= e!835222 (= lt!649970 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649969 lt!649972 mask!2687)))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1490521 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99651 (_ BitVec 32)) SeekEntryResult!12337)

(assert (=> b!1490521 (= e!835222 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649969 lt!649972 mask!2687) (seekEntryOrOpen!0 lt!649969 lt!649972 mask!2687)))))

(declare-fun b!1490522 () Bool)

(declare-fun res!1013792 () Bool)

(declare-fun e!835218 () Bool)

(assert (=> b!1490522 (=> (not res!1013792) (not e!835218))))

(assert (=> b!1490522 (= res!1013792 e!835222)))

(declare-fun c!137892 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1490522 (= c!137892 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1490523 () Bool)

(declare-fun res!1013802 () Bool)

(assert (=> b!1490523 (=> (not res!1013802) (not e!835223))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1490523 (= res!1013802 (validKeyInArray!0 (select (arr!48097 a!2862) i!1006)))))

(declare-fun b!1490524 () Bool)

(declare-fun res!1013790 () Bool)

(assert (=> b!1490524 (=> (not res!1013790) (not e!835223))))

(assert (=> b!1490524 (= res!1013790 (and (= (size!48647 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48647 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48647 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1490525 () Bool)

(declare-fun res!1013789 () Bool)

(declare-fun e!835217 () Bool)

(assert (=> b!1490525 (=> (not res!1013789) (not e!835217))))

(declare-fun lt!649971 () SeekEntryResult!12337)

(assert (=> b!1490525 (= res!1013789 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48097 a!2862) j!93) a!2862 mask!2687) lt!649971))))

(declare-fun b!1490526 () Bool)

(declare-fun e!835221 () Bool)

(assert (=> b!1490526 (= e!835221 e!835217)))

(declare-fun res!1013796 () Bool)

(assert (=> b!1490526 (=> (not res!1013796) (not e!835217))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490526 (= res!1013796 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48097 a!2862) j!93) mask!2687) (select (arr!48097 a!2862) j!93) a!2862 mask!2687) lt!649971))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1490526 (= lt!649971 (Intermediate!12337 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1490527 () Bool)

(assert (=> b!1490527 (= e!835223 e!835221)))

(declare-fun res!1013791 () Bool)

(assert (=> b!1490527 (=> (not res!1013791) (not e!835221))))

(assert (=> b!1490527 (= res!1013791 (= (select (store (arr!48097 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490527 (= lt!649972 (array!99652 (store (arr!48097 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48647 a!2862)))))

(declare-fun b!1490528 () Bool)

(declare-fun e!835219 () Bool)

(assert (=> b!1490528 (= e!835218 (not e!835219))))

(declare-fun res!1013799 () Bool)

(assert (=> b!1490528 (=> res!1013799 e!835219)))

(assert (=> b!1490528 (= res!1013799 (or (and (= (select (arr!48097 a!2862) index!646) (select (store (arr!48097 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48097 a!2862) index!646) (select (arr!48097 a!2862) j!93))) (= (select (arr!48097 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1490528 e!835220))

(declare-fun res!1013788 () Bool)

(assert (=> b!1490528 (=> (not res!1013788) (not e!835220))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99651 (_ BitVec 32)) Bool)

(assert (=> b!1490528 (= res!1013788 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50014 0))(
  ( (Unit!50015) )
))
(declare-fun lt!649974 () Unit!50014)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99651 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50014)

(assert (=> b!1490528 (= lt!649974 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1490529 () Bool)

(assert (=> b!1490529 (= e!835219 true)))

(declare-fun lt!649973 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490529 (= lt!649973 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1490530 () Bool)

(declare-fun res!1013797 () Bool)

(assert (=> b!1490530 (=> (not res!1013797) (not e!835218))))

(assert (=> b!1490530 (= res!1013797 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1490531 () Bool)

(declare-fun res!1013803 () Bool)

(assert (=> b!1490531 (=> (not res!1013803) (not e!835223))))

(assert (=> b!1490531 (= res!1013803 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48647 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48647 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48647 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1490532 () Bool)

(declare-fun res!1013798 () Bool)

(assert (=> b!1490532 (=> (not res!1013798) (not e!835223))))

(assert (=> b!1490532 (= res!1013798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1490533 () Bool)

(assert (=> b!1490533 (= e!835217 e!835218)))

(declare-fun res!1013801 () Bool)

(assert (=> b!1490533 (=> (not res!1013801) (not e!835218))))

(assert (=> b!1490533 (= res!1013801 (= lt!649970 (Intermediate!12337 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1490533 (= lt!649970 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649969 mask!2687) lt!649969 lt!649972 mask!2687))))

(assert (=> b!1490533 (= lt!649969 (select (store (arr!48097 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1490534 () Bool)

(declare-fun res!1013795 () Bool)

(assert (=> b!1490534 (=> (not res!1013795) (not e!835223))))

(assert (=> b!1490534 (= res!1013795 (validKeyInArray!0 (select (arr!48097 a!2862) j!93)))))

(declare-fun b!1490535 () Bool)

(declare-fun res!1013800 () Bool)

(assert (=> b!1490535 (=> (not res!1013800) (not e!835223))))

(declare-datatypes ((List!34598 0))(
  ( (Nil!34595) (Cons!34594 (h!35977 (_ BitVec 64)) (t!49292 List!34598)) )
))
(declare-fun arrayNoDuplicates!0 (array!99651 (_ BitVec 32) List!34598) Bool)

(assert (=> b!1490535 (= res!1013800 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34595))))

(assert (= (and start!126878 res!1013794) b!1490524))

(assert (= (and b!1490524 res!1013790) b!1490523))

(assert (= (and b!1490523 res!1013802) b!1490534))

(assert (= (and b!1490534 res!1013795) b!1490532))

(assert (= (and b!1490532 res!1013798) b!1490535))

(assert (= (and b!1490535 res!1013800) b!1490531))

(assert (= (and b!1490531 res!1013803) b!1490527))

(assert (= (and b!1490527 res!1013791) b!1490526))

(assert (= (and b!1490526 res!1013796) b!1490525))

(assert (= (and b!1490525 res!1013789) b!1490533))

(assert (= (and b!1490533 res!1013801) b!1490522))

(assert (= (and b!1490522 c!137892) b!1490520))

(assert (= (and b!1490522 (not c!137892)) b!1490521))

(assert (= (and b!1490522 res!1013792) b!1490530))

(assert (= (and b!1490530 res!1013797) b!1490528))

(assert (= (and b!1490528 res!1013788) b!1490519))

(assert (= (and b!1490519 res!1013793) b!1490518))

(assert (= (and b!1490528 (not res!1013799)) b!1490529))

(declare-fun m!1374675 () Bool)

(assert (=> b!1490523 m!1374675))

(assert (=> b!1490523 m!1374675))

(declare-fun m!1374677 () Bool)

(assert (=> b!1490523 m!1374677))

(declare-fun m!1374679 () Bool)

(assert (=> b!1490527 m!1374679))

(declare-fun m!1374681 () Bool)

(assert (=> b!1490527 m!1374681))

(declare-fun m!1374683 () Bool)

(assert (=> b!1490533 m!1374683))

(assert (=> b!1490533 m!1374683))

(declare-fun m!1374685 () Bool)

(assert (=> b!1490533 m!1374685))

(assert (=> b!1490533 m!1374679))

(declare-fun m!1374687 () Bool)

(assert (=> b!1490533 m!1374687))

(declare-fun m!1374689 () Bool)

(assert (=> b!1490521 m!1374689))

(declare-fun m!1374691 () Bool)

(assert (=> b!1490521 m!1374691))

(declare-fun m!1374693 () Bool)

(assert (=> b!1490519 m!1374693))

(assert (=> b!1490519 m!1374693))

(declare-fun m!1374695 () Bool)

(assert (=> b!1490519 m!1374695))

(declare-fun m!1374697 () Bool)

(assert (=> b!1490535 m!1374697))

(declare-fun m!1374699 () Bool)

(assert (=> b!1490520 m!1374699))

(declare-fun m!1374701 () Bool)

(assert (=> b!1490529 m!1374701))

(declare-fun m!1374703 () Bool)

(assert (=> start!126878 m!1374703))

(declare-fun m!1374705 () Bool)

(assert (=> start!126878 m!1374705))

(assert (=> b!1490525 m!1374693))

(assert (=> b!1490525 m!1374693))

(declare-fun m!1374707 () Bool)

(assert (=> b!1490525 m!1374707))

(declare-fun m!1374709 () Bool)

(assert (=> b!1490528 m!1374709))

(assert (=> b!1490528 m!1374679))

(declare-fun m!1374711 () Bool)

(assert (=> b!1490528 m!1374711))

(declare-fun m!1374713 () Bool)

(assert (=> b!1490528 m!1374713))

(declare-fun m!1374715 () Bool)

(assert (=> b!1490528 m!1374715))

(assert (=> b!1490528 m!1374693))

(declare-fun m!1374717 () Bool)

(assert (=> b!1490518 m!1374717))

(assert (=> b!1490518 m!1374693))

(assert (=> b!1490526 m!1374693))

(assert (=> b!1490526 m!1374693))

(declare-fun m!1374719 () Bool)

(assert (=> b!1490526 m!1374719))

(assert (=> b!1490526 m!1374719))

(assert (=> b!1490526 m!1374693))

(declare-fun m!1374721 () Bool)

(assert (=> b!1490526 m!1374721))

(declare-fun m!1374723 () Bool)

(assert (=> b!1490532 m!1374723))

(assert (=> b!1490534 m!1374693))

(assert (=> b!1490534 m!1374693))

(declare-fun m!1374725 () Bool)

(assert (=> b!1490534 m!1374725))

(push 1)

