; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125254 () Bool)

(assert start!125254)

(declare-fun lt!640346 () (_ BitVec 64))

(declare-fun e!822137 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98680 0))(
  ( (array!98681 (arr!47629 (Array (_ BitVec 32) (_ BitVec 64))) (size!48181 (_ BitVec 32))) )
))
(declare-fun lt!640348 () array!98680)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1462650 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11906 0))(
  ( (MissingZero!11906 (index!50016 (_ BitVec 32))) (Found!11906 (index!50017 (_ BitVec 32))) (Intermediate!11906 (undefined!12718 Bool) (index!50018 (_ BitVec 32)) (x!131606 (_ BitVec 32))) (Undefined!11906) (MissingVacant!11906 (index!50019 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98680 (_ BitVec 32)) SeekEntryResult!11906)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98680 (_ BitVec 32)) SeekEntryResult!11906)

(assert (=> b!1462650 (= e!822137 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640346 lt!640348 mask!2687) (seekEntryOrOpen!0 lt!640346 lt!640348 mask!2687)))))

(declare-fun res!992135 () Bool)

(declare-fun e!822144 () Bool)

(assert (=> start!125254 (=> (not res!992135) (not e!822144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125254 (= res!992135 (validMask!0 mask!2687))))

(assert (=> start!125254 e!822144))

(assert (=> start!125254 true))

(declare-fun a!2862 () array!98680)

(declare-fun array_inv!36862 (array!98680) Bool)

(assert (=> start!125254 (array_inv!36862 a!2862)))

(declare-fun b!1462651 () Bool)

(declare-fun res!992128 () Bool)

(declare-fun e!822141 () Bool)

(assert (=> b!1462651 (=> (not res!992128) (not e!822141))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!640349 () SeekEntryResult!11906)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98680 (_ BitVec 32)) SeekEntryResult!11906)

(assert (=> b!1462651 (= res!992128 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47629 a!2862) j!93) a!2862 mask!2687) lt!640349))))

(declare-fun b!1462652 () Bool)

(declare-fun lt!640350 () SeekEntryResult!11906)

(assert (=> b!1462652 (= e!822137 (= lt!640350 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640346 lt!640348 mask!2687)))))

(declare-fun b!1462653 () Bool)

(declare-fun res!992129 () Bool)

(declare-fun e!822139 () Bool)

(assert (=> b!1462653 (=> (not res!992129) (not e!822139))))

(assert (=> b!1462653 (= res!992129 (= (seekEntryOrOpen!0 (select (arr!47629 a!2862) j!93) a!2862 mask!2687) (Found!11906 j!93)))))

(declare-fun lt!640347 () (_ BitVec 32))

(declare-fun e!822142 () Bool)

(declare-fun b!1462654 () Bool)

(assert (=> b!1462654 (= e!822142 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640347 intermediateAfterIndex!19 lt!640346 lt!640348 mask!2687) (seekEntryOrOpen!0 lt!640346 lt!640348 mask!2687))))))

(declare-fun b!1462655 () Bool)

(declare-fun res!992131 () Bool)

(assert (=> b!1462655 (=> (not res!992131) (not e!822144))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1462655 (= res!992131 (and (= (size!48181 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48181 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48181 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1462656 () Bool)

(declare-fun res!992137 () Bool)

(assert (=> b!1462656 (=> (not res!992137) (not e!822144))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1462656 (= res!992137 (validKeyInArray!0 (select (arr!47629 a!2862) j!93)))))

(declare-fun b!1462657 () Bool)

(declare-fun res!992126 () Bool)

(assert (=> b!1462657 (=> (not res!992126) (not e!822144))))

(assert (=> b!1462657 (= res!992126 (validKeyInArray!0 (select (arr!47629 a!2862) i!1006)))))

(declare-fun b!1462658 () Bool)

(declare-fun e!822135 () Bool)

(assert (=> b!1462658 (= e!822144 e!822135)))

(declare-fun res!992132 () Bool)

(assert (=> b!1462658 (=> (not res!992132) (not e!822135))))

(assert (=> b!1462658 (= res!992132 (= (select (store (arr!47629 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462658 (= lt!640348 (array!98681 (store (arr!47629 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48181 a!2862)))))

(declare-fun b!1462659 () Bool)

(declare-fun e!822143 () Bool)

(assert (=> b!1462659 (= e!822141 e!822143)))

(declare-fun res!992136 () Bool)

(assert (=> b!1462659 (=> (not res!992136) (not e!822143))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1462659 (= res!992136 (= lt!640350 (Intermediate!11906 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462659 (= lt!640350 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640346 mask!2687) lt!640346 lt!640348 mask!2687))))

(assert (=> b!1462659 (= lt!640346 (select (store (arr!47629 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1462660 () Bool)

(assert (=> b!1462660 (= e!822139 (or (= (select (arr!47629 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47629 a!2862) intermediateBeforeIndex!19) (select (arr!47629 a!2862) j!93))))))

(declare-fun b!1462661 () Bool)

(declare-fun res!992138 () Bool)

(assert (=> b!1462661 (=> (not res!992138) (not e!822144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98680 (_ BitVec 32)) Bool)

(assert (=> b!1462661 (= res!992138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1462662 () Bool)

(assert (=> b!1462662 (= e!822142 (not (= lt!640350 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640347 lt!640346 lt!640348 mask!2687))))))

(declare-fun b!1462663 () Bool)

(declare-fun e!822138 () Bool)

(declare-fun e!822136 () Bool)

(assert (=> b!1462663 (= e!822138 e!822136)))

(declare-fun res!992142 () Bool)

(assert (=> b!1462663 (=> res!992142 e!822136)))

(assert (=> b!1462663 (= res!992142 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640347 #b00000000000000000000000000000000) (bvsge lt!640347 (size!48181 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462663 (= lt!640347 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1462664 () Bool)

(assert (=> b!1462664 (= e!822135 e!822141)))

(declare-fun res!992130 () Bool)

(assert (=> b!1462664 (=> (not res!992130) (not e!822141))))

(assert (=> b!1462664 (= res!992130 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47629 a!2862) j!93) mask!2687) (select (arr!47629 a!2862) j!93) a!2862 mask!2687) lt!640349))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1462664 (= lt!640349 (Intermediate!11906 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1462665 () Bool)

(declare-fun res!992127 () Bool)

(assert (=> b!1462665 (=> (not res!992127) (not e!822144))))

(declare-datatypes ((List!34208 0))(
  ( (Nil!34205) (Cons!34204 (h!35554 (_ BitVec 64)) (t!48894 List!34208)) )
))
(declare-fun arrayNoDuplicates!0 (array!98680 (_ BitVec 32) List!34208) Bool)

(assert (=> b!1462665 (= res!992127 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34205))))

(declare-fun b!1462666 () Bool)

(declare-fun res!992139 () Bool)

(assert (=> b!1462666 (=> (not res!992139) (not e!822143))))

(assert (=> b!1462666 (= res!992139 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1462667 () Bool)

(assert (=> b!1462667 (= e!822143 (not e!822138))))

(declare-fun res!992134 () Bool)

(assert (=> b!1462667 (=> res!992134 e!822138)))

(assert (=> b!1462667 (= res!992134 (or (and (= (select (arr!47629 a!2862) index!646) (select (store (arr!47629 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47629 a!2862) index!646) (select (arr!47629 a!2862) j!93))) (= (select (arr!47629 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1462667 e!822139))

(declare-fun res!992141 () Bool)

(assert (=> b!1462667 (=> (not res!992141) (not e!822139))))

(assert (=> b!1462667 (= res!992141 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49149 0))(
  ( (Unit!49150) )
))
(declare-fun lt!640345 () Unit!49149)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98680 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49149)

(assert (=> b!1462667 (= lt!640345 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1462668 () Bool)

(declare-fun res!992133 () Bool)

(assert (=> b!1462668 (=> res!992133 e!822136)))

(assert (=> b!1462668 (= res!992133 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640347 (select (arr!47629 a!2862) j!93) a!2862 mask!2687) lt!640349)))))

(declare-fun b!1462669 () Bool)

(declare-fun res!992140 () Bool)

(assert (=> b!1462669 (=> (not res!992140) (not e!822143))))

(assert (=> b!1462669 (= res!992140 e!822137)))

(declare-fun c!134776 () Bool)

(assert (=> b!1462669 (= c!134776 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1462670 () Bool)

(assert (=> b!1462670 (= e!822136 true)))

(declare-fun lt!640344 () Bool)

(assert (=> b!1462670 (= lt!640344 e!822142)))

(declare-fun c!134775 () Bool)

(assert (=> b!1462670 (= c!134775 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1462671 () Bool)

(declare-fun res!992143 () Bool)

(assert (=> b!1462671 (=> (not res!992143) (not e!822144))))

(assert (=> b!1462671 (= res!992143 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48181 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48181 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48181 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!125254 res!992135) b!1462655))

(assert (= (and b!1462655 res!992131) b!1462657))

(assert (= (and b!1462657 res!992126) b!1462656))

(assert (= (and b!1462656 res!992137) b!1462661))

(assert (= (and b!1462661 res!992138) b!1462665))

(assert (= (and b!1462665 res!992127) b!1462671))

(assert (= (and b!1462671 res!992143) b!1462658))

(assert (= (and b!1462658 res!992132) b!1462664))

(assert (= (and b!1462664 res!992130) b!1462651))

(assert (= (and b!1462651 res!992128) b!1462659))

(assert (= (and b!1462659 res!992136) b!1462669))

(assert (= (and b!1462669 c!134776) b!1462652))

(assert (= (and b!1462669 (not c!134776)) b!1462650))

(assert (= (and b!1462669 res!992140) b!1462666))

(assert (= (and b!1462666 res!992139) b!1462667))

(assert (= (and b!1462667 res!992141) b!1462653))

(assert (= (and b!1462653 res!992129) b!1462660))

(assert (= (and b!1462667 (not res!992134)) b!1462663))

(assert (= (and b!1462663 (not res!992142)) b!1462668))

(assert (= (and b!1462668 (not res!992133)) b!1462670))

(assert (= (and b!1462670 c!134775) b!1462662))

(assert (= (and b!1462670 (not c!134775)) b!1462654))

(declare-fun m!1349577 () Bool)

(assert (=> b!1462668 m!1349577))

(assert (=> b!1462668 m!1349577))

(declare-fun m!1349579 () Bool)

(assert (=> b!1462668 m!1349579))

(declare-fun m!1349581 () Bool)

(assert (=> b!1462665 m!1349581))

(declare-fun m!1349583 () Bool)

(assert (=> b!1462657 m!1349583))

(assert (=> b!1462657 m!1349583))

(declare-fun m!1349585 () Bool)

(assert (=> b!1462657 m!1349585))

(declare-fun m!1349587 () Bool)

(assert (=> b!1462661 m!1349587))

(declare-fun m!1349589 () Bool)

(assert (=> start!125254 m!1349589))

(declare-fun m!1349591 () Bool)

(assert (=> start!125254 m!1349591))

(declare-fun m!1349593 () Bool)

(assert (=> b!1462659 m!1349593))

(assert (=> b!1462659 m!1349593))

(declare-fun m!1349595 () Bool)

(assert (=> b!1462659 m!1349595))

(declare-fun m!1349597 () Bool)

(assert (=> b!1462659 m!1349597))

(declare-fun m!1349599 () Bool)

(assert (=> b!1462659 m!1349599))

(declare-fun m!1349601 () Bool)

(assert (=> b!1462652 m!1349601))

(declare-fun m!1349603 () Bool)

(assert (=> b!1462663 m!1349603))

(assert (=> b!1462651 m!1349577))

(assert (=> b!1462651 m!1349577))

(declare-fun m!1349605 () Bool)

(assert (=> b!1462651 m!1349605))

(declare-fun m!1349607 () Bool)

(assert (=> b!1462654 m!1349607))

(declare-fun m!1349609 () Bool)

(assert (=> b!1462654 m!1349609))

(declare-fun m!1349611 () Bool)

(assert (=> b!1462660 m!1349611))

(assert (=> b!1462660 m!1349577))

(declare-fun m!1349613 () Bool)

(assert (=> b!1462667 m!1349613))

(assert (=> b!1462667 m!1349597))

(declare-fun m!1349615 () Bool)

(assert (=> b!1462667 m!1349615))

(declare-fun m!1349617 () Bool)

(assert (=> b!1462667 m!1349617))

(declare-fun m!1349619 () Bool)

(assert (=> b!1462667 m!1349619))

(assert (=> b!1462667 m!1349577))

(declare-fun m!1349621 () Bool)

(assert (=> b!1462650 m!1349621))

(assert (=> b!1462650 m!1349609))

(assert (=> b!1462658 m!1349597))

(declare-fun m!1349623 () Bool)

(assert (=> b!1462658 m!1349623))

(assert (=> b!1462656 m!1349577))

(assert (=> b!1462656 m!1349577))

(declare-fun m!1349625 () Bool)

(assert (=> b!1462656 m!1349625))

(declare-fun m!1349627 () Bool)

(assert (=> b!1462662 m!1349627))

(assert (=> b!1462653 m!1349577))

(assert (=> b!1462653 m!1349577))

(declare-fun m!1349629 () Bool)

(assert (=> b!1462653 m!1349629))

(assert (=> b!1462664 m!1349577))

(assert (=> b!1462664 m!1349577))

(declare-fun m!1349631 () Bool)

(assert (=> b!1462664 m!1349631))

(assert (=> b!1462664 m!1349631))

(assert (=> b!1462664 m!1349577))

(declare-fun m!1349633 () Bool)

(assert (=> b!1462664 m!1349633))

(check-sat (not b!1462650) (not b!1462665) (not b!1462667) (not b!1462653) (not b!1462664) (not b!1462668) (not b!1462661) (not start!125254) (not b!1462659) (not b!1462656) (not b!1462662) (not b!1462652) (not b!1462651) (not b!1462654) (not b!1462663) (not b!1462657))
(check-sat)
