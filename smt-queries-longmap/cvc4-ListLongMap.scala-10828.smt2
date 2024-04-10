; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126752 () Bool)

(assert start!126752)

(declare-fun b!1488135 () Bool)

(declare-fun res!1012073 () Bool)

(declare-fun e!834138 () Bool)

(assert (=> b!1488135 (=> (not res!1012073) (not e!834138))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99588 0))(
  ( (array!99589 (arr!48067 (Array (_ BitVec 32) (_ BitVec 64))) (size!48617 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99588)

(assert (=> b!1488135 (= res!1012073 (and (= (size!48617 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48617 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48617 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1488136 () Bool)

(declare-fun e!834134 () Bool)

(declare-fun e!834133 () Bool)

(assert (=> b!1488136 (= e!834134 e!834133)))

(declare-fun res!1012072 () Bool)

(assert (=> b!1488136 (=> (not res!1012072) (not e!834133))))

(declare-datatypes ((SeekEntryResult!12307 0))(
  ( (MissingZero!12307 (index!51620 (_ BitVec 32))) (Found!12307 (index!51621 (_ BitVec 32))) (Intermediate!12307 (undefined!13119 Bool) (index!51622 (_ BitVec 32)) (x!133207 (_ BitVec 32))) (Undefined!12307) (MissingVacant!12307 (index!51623 (_ BitVec 32))) )
))
(declare-fun lt!649073 () SeekEntryResult!12307)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1488136 (= res!1012072 (= lt!649073 (Intermediate!12307 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!649071 () array!99588)

(declare-fun lt!649072 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99588 (_ BitVec 32)) SeekEntryResult!12307)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488136 (= lt!649073 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649072 mask!2687) lt!649072 lt!649071 mask!2687))))

(assert (=> b!1488136 (= lt!649072 (select (store (arr!48067 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1488138 () Bool)

(declare-fun res!1012074 () Bool)

(assert (=> b!1488138 (=> (not res!1012074) (not e!834138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1488138 (= res!1012074 (validKeyInArray!0 (select (arr!48067 a!2862) j!93)))))

(declare-fun b!1488139 () Bool)

(declare-fun res!1012063 () Bool)

(declare-fun e!834132 () Bool)

(assert (=> b!1488139 (=> (not res!1012063) (not e!834132))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99588 (_ BitVec 32)) SeekEntryResult!12307)

(assert (=> b!1488139 (= res!1012063 (= (seekEntryOrOpen!0 (select (arr!48067 a!2862) j!93) a!2862 mask!2687) (Found!12307 j!93)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1488140 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1488140 (= e!834132 (and (or (= (select (arr!48067 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48067 a!2862) intermediateBeforeIndex!19) (select (arr!48067 a!2862) j!93))) (let ((bdg!54642 (select (store (arr!48067 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48067 a!2862) index!646) bdg!54642) (= (select (arr!48067 a!2862) index!646) (select (arr!48067 a!2862) j!93))) (= (select (arr!48067 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54642 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1488141 () Bool)

(declare-fun res!1012064 () Bool)

(assert (=> b!1488141 (=> (not res!1012064) (not e!834134))))

(declare-fun lt!649076 () SeekEntryResult!12307)

(assert (=> b!1488141 (= res!1012064 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48067 a!2862) j!93) a!2862 mask!2687) lt!649076))))

(declare-fun e!834131 () Bool)

(declare-fun b!1488142 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99588 (_ BitVec 32)) SeekEntryResult!12307)

(assert (=> b!1488142 (= e!834131 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649072 lt!649071 mask!2687) (seekEntryOrOpen!0 lt!649072 lt!649071 mask!2687)))))

(declare-fun b!1488143 () Bool)

(declare-fun res!1012058 () Bool)

(assert (=> b!1488143 (=> (not res!1012058) (not e!834133))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1488143 (= res!1012058 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1488144 () Bool)

(declare-fun e!834139 () Bool)

(assert (=> b!1488144 (= e!834139 e!834134)))

(declare-fun res!1012069 () Bool)

(assert (=> b!1488144 (=> (not res!1012069) (not e!834134))))

(assert (=> b!1488144 (= res!1012069 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48067 a!2862) j!93) mask!2687) (select (arr!48067 a!2862) j!93) a!2862 mask!2687) lt!649076))))

(assert (=> b!1488144 (= lt!649076 (Intermediate!12307 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1488145 () Bool)

(declare-fun res!1012071 () Bool)

(assert (=> b!1488145 (=> (not res!1012071) (not e!834133))))

(assert (=> b!1488145 (= res!1012071 e!834131)))

(declare-fun c!137565 () Bool)

(assert (=> b!1488145 (= c!137565 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1488146 () Bool)

(declare-fun e!834135 () Bool)

(declare-fun e!834140 () Bool)

(assert (=> b!1488146 (= e!834135 e!834140)))

(declare-fun c!137564 () Bool)

(assert (=> b!1488146 (= c!137564 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1488147 () Bool)

(declare-fun res!1012061 () Bool)

(assert (=> b!1488147 (=> (not res!1012061) (not e!834138))))

(declare-datatypes ((List!34568 0))(
  ( (Nil!34565) (Cons!34564 (h!35944 (_ BitVec 64)) (t!49262 List!34568)) )
))
(declare-fun arrayNoDuplicates!0 (array!99588 (_ BitVec 32) List!34568) Bool)

(assert (=> b!1488147 (= res!1012061 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34565))))

(declare-fun b!1488148 () Bool)

(declare-fun e!834136 () Bool)

(assert (=> b!1488148 (= e!834136 e!834135)))

(declare-fun res!1012062 () Bool)

(assert (=> b!1488148 (=> res!1012062 e!834135)))

(declare-fun lt!649077 () (_ BitVec 32))

(assert (=> b!1488148 (= res!1012062 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649077 #b00000000000000000000000000000000) (bvsge lt!649077 (size!48617 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1488148 (= lt!649077 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!649074 () SeekEntryResult!12307)

(assert (=> b!1488148 (= lt!649074 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649072 lt!649071 mask!2687))))

(assert (=> b!1488148 (= lt!649074 (seekEntryOrOpen!0 lt!649072 lt!649071 mask!2687))))

(declare-fun b!1488149 () Bool)

(assert (=> b!1488149 (= e!834140 (= lt!649073 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649077 lt!649072 lt!649071 mask!2687)))))

(declare-fun b!1488150 () Bool)

(assert (=> b!1488150 (= e!834131 (= lt!649073 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649072 lt!649071 mask!2687)))))

(declare-fun res!1012065 () Bool)

(assert (=> start!126752 (=> (not res!1012065) (not e!834138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126752 (= res!1012065 (validMask!0 mask!2687))))

(assert (=> start!126752 e!834138))

(assert (=> start!126752 true))

(declare-fun array_inv!37095 (array!99588) Bool)

(assert (=> start!126752 (array_inv!37095 a!2862)))

(declare-fun b!1488137 () Bool)

(declare-fun res!1012060 () Bool)

(assert (=> b!1488137 (=> (not res!1012060) (not e!834138))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99588 (_ BitVec 32)) Bool)

(assert (=> b!1488137 (= res!1012060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1488151 () Bool)

(declare-fun res!1012070 () Bool)

(assert (=> b!1488151 (=> (not res!1012070) (not e!834138))))

(assert (=> b!1488151 (= res!1012070 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48617 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48617 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48617 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1488152 () Bool)

(declare-fun res!1012068 () Bool)

(assert (=> b!1488152 (=> res!1012068 e!834135)))

(assert (=> b!1488152 (= res!1012068 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649077 (select (arr!48067 a!2862) j!93) a!2862 mask!2687) lt!649076)))))

(declare-fun b!1488153 () Bool)

(assert (=> b!1488153 (= e!834140 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649077 intermediateAfterIndex!19 lt!649072 lt!649071 mask!2687) lt!649074))))

(declare-fun b!1488154 () Bool)

(declare-fun res!1012059 () Bool)

(assert (=> b!1488154 (=> (not res!1012059) (not e!834138))))

(assert (=> b!1488154 (= res!1012059 (validKeyInArray!0 (select (arr!48067 a!2862) i!1006)))))

(declare-fun b!1488155 () Bool)

(assert (=> b!1488155 (= e!834133 (not e!834136))))

(declare-fun res!1012067 () Bool)

(assert (=> b!1488155 (=> res!1012067 e!834136)))

(assert (=> b!1488155 (= res!1012067 (or (and (= (select (arr!48067 a!2862) index!646) (select (store (arr!48067 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48067 a!2862) index!646) (select (arr!48067 a!2862) j!93))) (= (select (arr!48067 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1488155 e!834132))

(declare-fun res!1012066 () Bool)

(assert (=> b!1488155 (=> (not res!1012066) (not e!834132))))

(assert (=> b!1488155 (= res!1012066 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49954 0))(
  ( (Unit!49955) )
))
(declare-fun lt!649075 () Unit!49954)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99588 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49954)

(assert (=> b!1488155 (= lt!649075 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1488156 () Bool)

(assert (=> b!1488156 (= e!834138 e!834139)))

(declare-fun res!1012075 () Bool)

(assert (=> b!1488156 (=> (not res!1012075) (not e!834139))))

(assert (=> b!1488156 (= res!1012075 (= (select (store (arr!48067 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488156 (= lt!649071 (array!99589 (store (arr!48067 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48617 a!2862)))))

(assert (= (and start!126752 res!1012065) b!1488135))

(assert (= (and b!1488135 res!1012073) b!1488154))

(assert (= (and b!1488154 res!1012059) b!1488138))

(assert (= (and b!1488138 res!1012074) b!1488137))

(assert (= (and b!1488137 res!1012060) b!1488147))

(assert (= (and b!1488147 res!1012061) b!1488151))

(assert (= (and b!1488151 res!1012070) b!1488156))

(assert (= (and b!1488156 res!1012075) b!1488144))

(assert (= (and b!1488144 res!1012069) b!1488141))

(assert (= (and b!1488141 res!1012064) b!1488136))

(assert (= (and b!1488136 res!1012072) b!1488145))

(assert (= (and b!1488145 c!137565) b!1488150))

(assert (= (and b!1488145 (not c!137565)) b!1488142))

(assert (= (and b!1488145 res!1012071) b!1488143))

(assert (= (and b!1488143 res!1012058) b!1488155))

(assert (= (and b!1488155 res!1012066) b!1488139))

(assert (= (and b!1488139 res!1012063) b!1488140))

(assert (= (and b!1488155 (not res!1012067)) b!1488148))

(assert (= (and b!1488148 (not res!1012062)) b!1488152))

(assert (= (and b!1488152 (not res!1012068)) b!1488146))

(assert (= (and b!1488146 c!137564) b!1488149))

(assert (= (and b!1488146 (not c!137564)) b!1488153))

(declare-fun m!1372641 () Bool)

(assert (=> b!1488156 m!1372641))

(declare-fun m!1372643 () Bool)

(assert (=> b!1488156 m!1372643))

(assert (=> b!1488140 m!1372641))

(declare-fun m!1372645 () Bool)

(assert (=> b!1488140 m!1372645))

(declare-fun m!1372647 () Bool)

(assert (=> b!1488140 m!1372647))

(declare-fun m!1372649 () Bool)

(assert (=> b!1488140 m!1372649))

(declare-fun m!1372651 () Bool)

(assert (=> b!1488140 m!1372651))

(assert (=> b!1488152 m!1372651))

(assert (=> b!1488152 m!1372651))

(declare-fun m!1372653 () Bool)

(assert (=> b!1488152 m!1372653))

(declare-fun m!1372655 () Bool)

(assert (=> b!1488147 m!1372655))

(assert (=> b!1488141 m!1372651))

(assert (=> b!1488141 m!1372651))

(declare-fun m!1372657 () Bool)

(assert (=> b!1488141 m!1372657))

(declare-fun m!1372659 () Bool)

(assert (=> b!1488154 m!1372659))

(assert (=> b!1488154 m!1372659))

(declare-fun m!1372661 () Bool)

(assert (=> b!1488154 m!1372661))

(assert (=> b!1488139 m!1372651))

(assert (=> b!1488139 m!1372651))

(declare-fun m!1372663 () Bool)

(assert (=> b!1488139 m!1372663))

(declare-fun m!1372665 () Bool)

(assert (=> b!1488148 m!1372665))

(declare-fun m!1372667 () Bool)

(assert (=> b!1488148 m!1372667))

(declare-fun m!1372669 () Bool)

(assert (=> b!1488148 m!1372669))

(declare-fun m!1372671 () Bool)

(assert (=> b!1488136 m!1372671))

(assert (=> b!1488136 m!1372671))

(declare-fun m!1372673 () Bool)

(assert (=> b!1488136 m!1372673))

(assert (=> b!1488136 m!1372641))

(declare-fun m!1372675 () Bool)

(assert (=> b!1488136 m!1372675))

(declare-fun m!1372677 () Bool)

(assert (=> b!1488155 m!1372677))

(assert (=> b!1488155 m!1372641))

(assert (=> b!1488155 m!1372647))

(assert (=> b!1488155 m!1372649))

(declare-fun m!1372679 () Bool)

(assert (=> b!1488155 m!1372679))

(assert (=> b!1488155 m!1372651))

(assert (=> b!1488142 m!1372667))

(assert (=> b!1488142 m!1372669))

(declare-fun m!1372681 () Bool)

(assert (=> start!126752 m!1372681))

(declare-fun m!1372683 () Bool)

(assert (=> start!126752 m!1372683))

(assert (=> b!1488138 m!1372651))

(assert (=> b!1488138 m!1372651))

(declare-fun m!1372685 () Bool)

(assert (=> b!1488138 m!1372685))

(declare-fun m!1372687 () Bool)

(assert (=> b!1488149 m!1372687))

(declare-fun m!1372689 () Bool)

(assert (=> b!1488150 m!1372689))

(assert (=> b!1488144 m!1372651))

(assert (=> b!1488144 m!1372651))

(declare-fun m!1372691 () Bool)

(assert (=> b!1488144 m!1372691))

(assert (=> b!1488144 m!1372691))

(assert (=> b!1488144 m!1372651))

(declare-fun m!1372693 () Bool)

(assert (=> b!1488144 m!1372693))

(declare-fun m!1372695 () Bool)

(assert (=> b!1488153 m!1372695))

(declare-fun m!1372697 () Bool)

(assert (=> b!1488137 m!1372697))

(push 1)

(assert (not b!1488155))

(assert (not b!1488153))

(assert (not b!1488150))

(assert (not b!1488149))

(assert (not b!1488152))

(assert (not b!1488138))

(assert (not b!1488144))

(assert (not b!1488147))

(assert (not b!1488139))

(assert (not b!1488141))

(assert (not b!1488154))

(assert (not b!1488136))

(assert (not b!1488148))

(assert (not start!126752))

(assert (not b!1488142))

(assert (not b!1488137))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!156679 () Bool)

(assert (=> d!156679 (= (validKeyInArray!0 (select (arr!48067 a!2862) j!93)) (and (not (= (select (arr!48067 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48067 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1488138 d!156679))

(declare-fun b!1488312 () Bool)

(declare-fun lt!649137 () SeekEntryResult!12307)

(assert (=> b!1488312 (and (bvsge (index!51622 lt!649137) #b00000000000000000000000000000000) (bvslt (index!51622 lt!649137) (size!48617 lt!649071)))))

(declare-fun res!1012116 () Bool)

(assert (=> b!1488312 (= res!1012116 (= (select (arr!48067 lt!649071) (index!51622 lt!649137)) lt!649072))))

(declare-fun e!834227 () Bool)

(assert (=> b!1488312 (=> res!1012116 e!834227)))

(declare-fun e!834226 () Bool)

(assert (=> b!1488312 (= e!834226 e!834227)))

(declare-fun b!1488313 () Bool)

(assert (=> b!1488313 (and (bvsge (index!51622 lt!649137) #b00000000000000000000000000000000) (bvslt (index!51622 lt!649137) (size!48617 lt!649071)))))

(assert (=> b!1488313 (= e!834227 (= (select (arr!48067 lt!649071) (index!51622 lt!649137)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1488314 () Bool)

(assert (=> b!1488314 (and (bvsge (index!51622 lt!649137) #b00000000000000000000000000000000) (bvslt (index!51622 lt!649137) (size!48617 lt!649071)))))

(declare-fun res!1012115 () Bool)

(assert (=> b!1488314 (= res!1012115 (= (select (arr!48067 lt!649071) (index!51622 lt!649137)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488314 (=> res!1012115 e!834227)))

(declare-fun b!1488315 () Bool)

(declare-fun e!834229 () Bool)

(assert (=> b!1488315 (= e!834229 e!834226)))

(declare-fun res!1012117 () Bool)

(assert (=> b!1488315 (= res!1012117 (and (is-Intermediate!12307 lt!649137) (not (undefined!13119 lt!649137)) (bvslt (x!133207 lt!649137) #b01111111111111111111111111111110) (bvsge (x!133207 lt!649137) #b00000000000000000000000000000000) (bvsge (x!133207 lt!649137) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1488315 (=> (not res!1012117) (not e!834226))))

(declare-fun d!156681 () Bool)

(assert (=> d!156681 e!834229))

(declare-fun c!137625 () Bool)

(assert (=> d!156681 (= c!137625 (and (is-Intermediate!12307 lt!649137) (undefined!13119 lt!649137)))))

(declare-fun e!834228 () SeekEntryResult!12307)

(assert (=> d!156681 (= lt!649137 e!834228)))

(declare-fun c!137626 () Bool)

(assert (=> d!156681 (= c!137626 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(declare-fun lt!649138 () (_ BitVec 64))

(assert (=> d!156681 (= lt!649138 (select (arr!48067 lt!649071) lt!649077))))

(assert (=> d!156681 (validMask!0 mask!2687)))

(assert (=> d!156681 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649077 lt!649072 lt!649071 mask!2687) lt!649137)))

(declare-fun b!1488316 () Bool)

(declare-fun e!834230 () SeekEntryResult!12307)

(assert (=> b!1488316 (= e!834230 (Intermediate!12307 false lt!649077 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1488317 () Bool)

(assert (=> b!1488317 (= e!834228 e!834230)))

(declare-fun c!137627 () Bool)

(assert (=> b!1488317 (= c!137627 (or (= lt!649138 lt!649072) (= (bvadd lt!649138 lt!649138) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1488318 () Bool)

(assert (=> b!1488318 (= e!834230 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!649077 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) lt!649072 lt!649071 mask!2687))))

(declare-fun b!1488319 () Bool)

(assert (=> b!1488319 (= e!834228 (Intermediate!12307 true lt!649077 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1488320 () Bool)

(assert (=> b!1488320 (= e!834229 (bvsge (x!133207 lt!649137) #b01111111111111111111111111111110))))

(assert (= (and d!156681 c!137626) b!1488319))

(assert (= (and d!156681 (not c!137626)) b!1488317))

(assert (= (and b!1488317 c!137627) b!1488316))

(assert (= (and b!1488317 (not c!137627)) b!1488318))

(assert (= (and d!156681 c!137625) b!1488320))

(assert (= (and d!156681 (not c!137625)) b!1488315))

(assert (= (and b!1488315 res!1012117) b!1488312))

(assert (= (and b!1488312 (not res!1012116)) b!1488314))

(assert (= (and b!1488314 (not res!1012115)) b!1488313))

(declare-fun m!1372771 () Bool)

(assert (=> b!1488313 m!1372771))

(declare-fun m!1372773 () Bool)

(assert (=> b!1488318 m!1372773))

(assert (=> b!1488318 m!1372773))

(declare-fun m!1372775 () Bool)

(assert (=> b!1488318 m!1372775))

(declare-fun m!1372777 () Bool)

(assert (=> d!156681 m!1372777))

(assert (=> d!156681 m!1372681))

(assert (=> b!1488312 m!1372771))

(assert (=> b!1488314 m!1372771))

(assert (=> b!1488149 d!156681))

(declare-fun b!1488395 () Bool)

(declare-fun e!834278 () SeekEntryResult!12307)

(assert (=> b!1488395 (= e!834278 Undefined!12307)))

(declare-fun e!834277 () SeekEntryResult!12307)

(declare-fun lt!649175 () SeekEntryResult!12307)

(declare-fun b!1488396 () Bool)

(assert (=> b!1488396 (= e!834277 (seekKeyOrZeroReturnVacant!0 (x!133207 lt!649175) (index!51622 lt!649175) (index!51622 lt!649175) (select (arr!48067 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1488397 () Bool)

(declare-fun e!834276 () SeekEntryResult!12307)

(assert (=> b!1488397 (= e!834276 (Found!12307 (index!51622 lt!649175)))))

(declare-fun d!156695 () Bool)

(declare-fun lt!649174 () SeekEntryResult!12307)

(assert (=> d!156695 (and (or (is-Undefined!12307 lt!649174) (not (is-Found!12307 lt!649174)) (and (bvsge (index!51621 lt!649174) #b00000000000000000000000000000000) (bvslt (index!51621 lt!649174) (size!48617 a!2862)))) (or (is-Undefined!12307 lt!649174) (is-Found!12307 lt!649174) (not (is-MissingZero!12307 lt!649174)) (and (bvsge (index!51620 lt!649174) #b00000000000000000000000000000000) (bvslt (index!51620 lt!649174) (size!48617 a!2862)))) (or (is-Undefined!12307 lt!649174) (is-Found!12307 lt!649174) (is-MissingZero!12307 lt!649174) (not (is-MissingVacant!12307 lt!649174)) (and (bvsge (index!51623 lt!649174) #b00000000000000000000000000000000) (bvslt (index!51623 lt!649174) (size!48617 a!2862)))) (or (is-Undefined!12307 lt!649174) (ite (is-Found!12307 lt!649174) (= (select (arr!48067 a!2862) (index!51621 lt!649174)) (select (arr!48067 a!2862) j!93)) (ite (is-MissingZero!12307 lt!649174) (= (select (arr!48067 a!2862) (index!51620 lt!649174)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12307 lt!649174) (= (select (arr!48067 a!2862) (index!51623 lt!649174)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156695 (= lt!649174 e!834278)))

(declare-fun c!137654 () Bool)

(assert (=> d!156695 (= c!137654 (and (is-Intermediate!12307 lt!649175) (undefined!13119 lt!649175)))))

(assert (=> d!156695 (= lt!649175 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48067 a!2862) j!93) mask!2687) (select (arr!48067 a!2862) j!93) a!2862 mask!2687))))

(assert (=> d!156695 (validMask!0 mask!2687)))

(assert (=> d!156695 (= (seekEntryOrOpen!0 (select (arr!48067 a!2862) j!93) a!2862 mask!2687) lt!649174)))

(declare-fun b!1488398 () Bool)

(assert (=> b!1488398 (= e!834277 (MissingZero!12307 (index!51622 lt!649175)))))

(declare-fun b!1488399 () Bool)

(assert (=> b!1488399 (= e!834278 e!834276)))

(declare-fun lt!649173 () (_ BitVec 64))

(assert (=> b!1488399 (= lt!649173 (select (arr!48067 a!2862) (index!51622 lt!649175)))))

(declare-fun c!137655 () Bool)

(assert (=> b!1488399 (= c!137655 (= lt!649173 (select (arr!48067 a!2862) j!93)))))

(declare-fun b!1488400 () Bool)

(declare-fun c!137656 () Bool)

(assert (=> b!1488400 (= c!137656 (= lt!649173 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488400 (= e!834276 e!834277)))

(assert (= (and d!156695 c!137654) b!1488395))

(assert (= (and d!156695 (not c!137654)) b!1488399))

(assert (= (and b!1488399 c!137655) b!1488397))

(assert (= (and b!1488399 (not c!137655)) b!1488400))

(assert (= (and b!1488400 c!137656) b!1488398))

(assert (= (and b!1488400 (not c!137656)) b!1488396))

(assert (=> b!1488396 m!1372651))

(declare-fun m!1372823 () Bool)

(assert (=> b!1488396 m!1372823))

(declare-fun m!1372825 () Bool)

(assert (=> d!156695 m!1372825))

(declare-fun m!1372827 () Bool)

(assert (=> d!156695 m!1372827))

(assert (=> d!156695 m!1372651))

(assert (=> d!156695 m!1372691))

(assert (=> d!156695 m!1372691))

(assert (=> d!156695 m!1372651))

(assert (=> d!156695 m!1372693))

(declare-fun m!1372829 () Bool)

(assert (=> d!156695 m!1372829))

(assert (=> d!156695 m!1372681))

(declare-fun m!1372831 () Bool)

(assert (=> b!1488399 m!1372831))

(assert (=> b!1488139 d!156695))

(declare-fun b!1488415 () Bool)

(declare-fun e!834288 () Bool)

(declare-fun call!67925 () Bool)

(assert (=> b!1488415 (= e!834288 call!67925)))

(declare-fun b!1488416 () Bool)

(declare-fun e!834289 () Bool)

(assert (=> b!1488416 (= e!834289 e!834288)))

(declare-fun c!137662 () Bool)

(assert (=> b!1488416 (= c!137662 (validKeyInArray!0 (select (arr!48067 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1488417 () Bool)

(declare-fun e!834290 () Bool)

(assert (=> b!1488417 (= e!834288 e!834290)))

(declare-fun lt!649186 () (_ BitVec 64))

(assert (=> b!1488417 (= lt!649186 (select (arr!48067 a!2862) #b00000000000000000000000000000000))))

(declare-fun lt!649184 () Unit!49954)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99588 (_ BitVec 64) (_ BitVec 32)) Unit!49954)

(assert (=> b!1488417 (= lt!649184 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!649186 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99588 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1488417 (arrayContainsKey!0 a!2862 lt!649186 #b00000000000000000000000000000000)))

(declare-fun lt!649185 () Unit!49954)

(assert (=> b!1488417 (= lt!649185 lt!649184)))

(declare-fun res!1012144 () Bool)

(assert (=> b!1488417 (= res!1012144 (= (seekEntryOrOpen!0 (select (arr!48067 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!12307 #b00000000000000000000000000000000)))))

(assert (=> b!1488417 (=> (not res!1012144) (not e!834290))))

(declare-fun d!156717 () Bool)

(declare-fun res!1012145 () Bool)

(assert (=> d!156717 (=> res!1012145 e!834289)))

(assert (=> d!156717 (= res!1012145 (bvsge #b00000000000000000000000000000000 (size!48617 a!2862)))))

(assert (=> d!156717 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!834289)))

(declare-fun bm!67922 () Bool)

(assert (=> bm!67922 (= call!67925 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1488418 () Bool)

(assert (=> b!1488418 (= e!834290 call!67925)))

(assert (= (and d!156717 (not res!1012145)) b!1488416))

(assert (= (and b!1488416 c!137662) b!1488417))

(assert (= (and b!1488416 (not c!137662)) b!1488415))

(assert (= (and b!1488417 res!1012144) b!1488418))

(assert (= (or b!1488418 b!1488415) bm!67922))

(declare-fun m!1372841 () Bool)

(assert (=> b!1488416 m!1372841))

(assert (=> b!1488416 m!1372841))

(declare-fun m!1372843 () Bool)

(assert (=> b!1488416 m!1372843))

(assert (=> b!1488417 m!1372841))

(declare-fun m!1372845 () Bool)

(assert (=> b!1488417 m!1372845))

(declare-fun m!1372847 () Bool)

(assert (=> b!1488417 m!1372847))

(assert (=> b!1488417 m!1372841))

(declare-fun m!1372849 () Bool)

(assert (=> b!1488417 m!1372849))

(declare-fun m!1372851 () Bool)

(assert (=> bm!67922 m!1372851))

(assert (=> b!1488137 d!156717))

(declare-fun d!156721 () Bool)

(declare-fun lt!649189 () (_ BitVec 32))

(assert (=> d!156721 (and (bvsge lt!649189 #b00000000000000000000000000000000) (bvslt lt!649189 (bvadd mask!2687 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!156721 (= lt!649189 (choose!52 index!646 x!665 mask!2687))))

(assert (=> d!156721 (validMask!0 mask!2687)))

(assert (=> d!156721 (= (nextIndex!0 index!646 x!665 mask!2687) lt!649189)))

(declare-fun bs!42797 () Bool)

(assert (= bs!42797 d!156721))

(declare-fun m!1372853 () Bool)

(assert (=> bs!42797 m!1372853))

(assert (=> bs!42797 m!1372681))

(assert (=> b!1488148 d!156721))

(declare-fun b!1488449 () Bool)

(declare-fun e!834306 () SeekEntryResult!12307)

(assert (=> b!1488449 (= e!834306 Undefined!12307)))

(declare-fun b!1488450 () Bool)

(declare-fun e!834307 () SeekEntryResult!12307)

(assert (=> b!1488450 (= e!834307 (MissingVacant!12307 intermediateAfterIndex!19))))

(declare-fun b!1488451 () Bool)

(assert (=> b!1488451 (= e!834307 (seekKeyOrZeroReturnVacant!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) intermediateAfterIndex!19 lt!649072 lt!649071 mask!2687))))

(declare-fun b!1488452 () Bool)

(declare-fun e!834308 () SeekEntryResult!12307)

(assert (=> b!1488452 (= e!834308 (Found!12307 index!646))))

(declare-fun b!1488453 () Bool)

(declare-fun c!137679 () Bool)

(declare-fun lt!649203 () (_ BitVec 64))

(assert (=> b!1488453 (= c!137679 (= lt!649203 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488453 (= e!834308 e!834307)))

(declare-fun d!156723 () Bool)

(declare-fun lt!649204 () SeekEntryResult!12307)

(assert (=> d!156723 (and (or (is-Undefined!12307 lt!649204) (not (is-Found!12307 lt!649204)) (and (bvsge (index!51621 lt!649204) #b00000000000000000000000000000000) (bvslt (index!51621 lt!649204) (size!48617 lt!649071)))) (or (is-Undefined!12307 lt!649204) (is-Found!12307 lt!649204) (not (is-MissingVacant!12307 lt!649204)) (not (= (index!51623 lt!649204) intermediateAfterIndex!19)) (and (bvsge (index!51623 lt!649204) #b00000000000000000000000000000000) (bvslt (index!51623 lt!649204) (size!48617 lt!649071)))) (or (is-Undefined!12307 lt!649204) (ite (is-Found!12307 lt!649204) (= (select (arr!48067 lt!649071) (index!51621 lt!649204)) lt!649072) (and (is-MissingVacant!12307 lt!649204) (= (index!51623 lt!649204) intermediateAfterIndex!19) (= (select (arr!48067 lt!649071) (index!51623 lt!649204)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156723 (= lt!649204 e!834306)))

(declare-fun c!137680 () Bool)

(assert (=> d!156723 (= c!137680 (bvsge x!665 #b01111111111111111111111111111110))))

(assert (=> d!156723 (= lt!649203 (select (arr!48067 lt!649071) index!646))))

(assert (=> d!156723 (validMask!0 mask!2687)))

(assert (=> d!156723 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649072 lt!649071 mask!2687) lt!649204)))

(declare-fun b!1488454 () Bool)

(assert (=> b!1488454 (= e!834306 e!834308)))

(declare-fun c!137678 () Bool)

(assert (=> b!1488454 (= c!137678 (= lt!649203 lt!649072))))

(assert (= (and d!156723 c!137680) b!1488449))

(assert (= (and d!156723 (not c!137680)) b!1488454))

(assert (= (and b!1488454 c!137678) b!1488452))

(assert (= (and b!1488454 (not c!137678)) b!1488453))

(assert (= (and b!1488453 c!137679) b!1488450))

(assert (= (and b!1488453 (not c!137679)) b!1488451))

(assert (=> b!1488451 m!1372665))

(assert (=> b!1488451 m!1372665))

(declare-fun m!1372865 () Bool)

(assert (=> b!1488451 m!1372865))

(declare-fun m!1372867 () Bool)

(assert (=> d!156723 m!1372867))

(declare-fun m!1372869 () Bool)

(assert (=> d!156723 m!1372869))

(declare-fun m!1372871 () Bool)

(assert (=> d!156723 m!1372871))

(assert (=> d!156723 m!1372681))

(assert (=> b!1488148 d!156723))

(declare-fun b!1488463 () Bool)

(declare-fun e!834317 () SeekEntryResult!12307)

(assert (=> b!1488463 (= e!834317 Undefined!12307)))

(declare-fun e!834316 () SeekEntryResult!12307)

(declare-fun b!1488464 () Bool)

(declare-fun lt!649213 () SeekEntryResult!12307)

(assert (=> b!1488464 (= e!834316 (seekKeyOrZeroReturnVacant!0 (x!133207 lt!649213) (index!51622 lt!649213) (index!51622 lt!649213) lt!649072 lt!649071 mask!2687))))

(declare-fun b!1488465 () Bool)

(declare-fun e!834315 () SeekEntryResult!12307)

(assert (=> b!1488465 (= e!834315 (Found!12307 (index!51622 lt!649213)))))

(declare-fun d!156727 () Bool)

(declare-fun lt!649212 () SeekEntryResult!12307)

(assert (=> d!156727 (and (or (is-Undefined!12307 lt!649212) (not (is-Found!12307 lt!649212)) (and (bvsge (index!51621 lt!649212) #b00000000000000000000000000000000) (bvslt (index!51621 lt!649212) (size!48617 lt!649071)))) (or (is-Undefined!12307 lt!649212) (is-Found!12307 lt!649212) (not (is-MissingZero!12307 lt!649212)) (and (bvsge (index!51620 lt!649212) #b00000000000000000000000000000000) (bvslt (index!51620 lt!649212) (size!48617 lt!649071)))) (or (is-Undefined!12307 lt!649212) (is-Found!12307 lt!649212) (is-MissingZero!12307 lt!649212) (not (is-MissingVacant!12307 lt!649212)) (and (bvsge (index!51623 lt!649212) #b00000000000000000000000000000000) (bvslt (index!51623 lt!649212) (size!48617 lt!649071)))) (or (is-Undefined!12307 lt!649212) (ite (is-Found!12307 lt!649212) (= (select (arr!48067 lt!649071) (index!51621 lt!649212)) lt!649072) (ite (is-MissingZero!12307 lt!649212) (= (select (arr!48067 lt!649071) (index!51620 lt!649212)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!12307 lt!649212) (= (select (arr!48067 lt!649071) (index!51623 lt!649212)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!156727 (= lt!649212 e!834317)))

(declare-fun c!137683 () Bool)

(assert (=> d!156727 (= c!137683 (and (is-Intermediate!12307 lt!649213) (undefined!13119 lt!649213)))))

(assert (=> d!156727 (= lt!649213 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649072 mask!2687) lt!649072 lt!649071 mask!2687))))

(assert (=> d!156727 (validMask!0 mask!2687)))

(assert (=> d!156727 (= (seekEntryOrOpen!0 lt!649072 lt!649071 mask!2687) lt!649212)))

(declare-fun b!1488466 () Bool)

(assert (=> b!1488466 (= e!834316 (MissingZero!12307 (index!51622 lt!649213)))))

(declare-fun b!1488467 () Bool)

(assert (=> b!1488467 (= e!834317 e!834315)))

(declare-fun lt!649211 () (_ BitVec 64))

(assert (=> b!1488467 (= lt!649211 (select (arr!48067 lt!649071) (index!51622 lt!649213)))))

(declare-fun c!137684 () Bool)

(assert (=> b!1488467 (= c!137684 (= lt!649211 lt!649072))))

(declare-fun b!1488468 () Bool)

(declare-fun c!137685 () Bool)

(assert (=> b!1488468 (= c!137685 (= lt!649211 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488468 (= e!834315 e!834316)))

(assert (= (and d!156727 c!137683) b!1488463))

(assert (= (and d!156727 (not c!137683)) b!1488467))

(assert (= (and b!1488467 c!137684) b!1488465))

(assert (= (and b!1488467 (not c!137684)) b!1488468))

(assert (= (and b!1488468 c!137685) b!1488466))

(assert (= (and b!1488468 (not c!137685)) b!1488464))

(declare-fun m!1372873 () Bool)

(assert (=> b!1488464 m!1372873))

(declare-fun m!1372875 () Bool)

(assert (=> d!156727 m!1372875))

(declare-fun m!1372877 () Bool)

(assert (=> d!156727 m!1372877))

(assert (=> d!156727 m!1372671))

(assert (=> d!156727 m!1372671))

(assert (=> d!156727 m!1372673))

(declare-fun m!1372879 () Bool)

(assert (=> d!156727 m!1372879))

(assert (=> d!156727 m!1372681))

(declare-fun m!1372881 () Bool)

(assert (=> b!1488467 m!1372881))

(assert (=> b!1488148 d!156727))

(declare-fun b!1488469 () Bool)

(declare-fun lt!649214 () SeekEntryResult!12307)

(assert (=> b!1488469 (and (bvsge (index!51622 lt!649214) #b00000000000000000000000000000000) (bvslt (index!51622 lt!649214) (size!48617 a!2862)))))

(declare-fun res!1012151 () Bool)

(assert (=> b!1488469 (= res!1012151 (= (select (arr!48067 a!2862) (index!51622 lt!649214)) (select (arr!48067 a!2862) j!93)))))

(declare-fun e!834319 () Bool)

(assert (=> b!1488469 (=> res!1012151 e!834319)))

(declare-fun e!834318 () Bool)

(assert (=> b!1488469 (= e!834318 e!834319)))

(declare-fun b!1488470 () Bool)

(assert (=> b!1488470 (and (bvsge (index!51622 lt!649214) #b00000000000000000000000000000000) (bvslt (index!51622 lt!649214) (size!48617 a!2862)))))

(assert (=> b!1488470 (= e!834319 (= (select (arr!48067 a!2862) (index!51622 lt!649214)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1488471 () Bool)

(assert (=> b!1488471 (and (bvsge (index!51622 lt!649214) #b00000000000000000000000000000000) (bvslt (index!51622 lt!649214) (size!48617 a!2862)))))

(declare-fun res!1012150 () Bool)

(assert (=> b!1488471 (= res!1012150 (= (select (arr!48067 a!2862) (index!51622 lt!649214)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488471 (=> res!1012150 e!834319)))

(declare-fun b!1488472 () Bool)

(declare-fun e!834321 () Bool)

(assert (=> b!1488472 (= e!834321 e!834318)))

(declare-fun res!1012152 () Bool)

(assert (=> b!1488472 (= res!1012152 (and (is-Intermediate!12307 lt!649214) (not (undefined!13119 lt!649214)) (bvslt (x!133207 lt!649214) #b01111111111111111111111111111110) (bvsge (x!133207 lt!649214) #b00000000000000000000000000000000) (bvsge (x!133207 lt!649214) x!665)))))

(assert (=> b!1488472 (=> (not res!1012152) (not e!834318))))

(declare-fun d!156729 () Bool)

(assert (=> d!156729 e!834321))

(declare-fun c!137686 () Bool)

(assert (=> d!156729 (= c!137686 (and (is-Intermediate!12307 lt!649214) (undefined!13119 lt!649214)))))

(declare-fun e!834320 () SeekEntryResult!12307)

(assert (=> d!156729 (= lt!649214 e!834320)))

(declare-fun c!137687 () Bool)

(assert (=> d!156729 (= c!137687 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!649215 () (_ BitVec 64))

(assert (=> d!156729 (= lt!649215 (select (arr!48067 a!2862) index!646))))

(assert (=> d!156729 (validMask!0 mask!2687)))

(assert (=> d!156729 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48067 a!2862) j!93) a!2862 mask!2687) lt!649214)))

(declare-fun b!1488473 () Bool)

(declare-fun e!834322 () SeekEntryResult!12307)

(assert (=> b!1488473 (= e!834322 (Intermediate!12307 false index!646 x!665))))

(declare-fun b!1488474 () Bool)

(assert (=> b!1488474 (= e!834320 e!834322)))

(declare-fun c!137688 () Bool)

(assert (=> b!1488474 (= c!137688 (or (= lt!649215 (select (arr!48067 a!2862) j!93)) (= (bvadd lt!649215 lt!649215) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1488475 () Bool)

(assert (=> b!1488475 (= e!834322 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) (select (arr!48067 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1488476 () Bool)

(assert (=> b!1488476 (= e!834320 (Intermediate!12307 true index!646 x!665))))

(declare-fun b!1488477 () Bool)

(assert (=> b!1488477 (= e!834321 (bvsge (x!133207 lt!649214) #b01111111111111111111111111111110))))

(assert (= (and d!156729 c!137687) b!1488476))

(assert (= (and d!156729 (not c!137687)) b!1488474))

(assert (= (and b!1488474 c!137688) b!1488473))

(assert (= (and b!1488474 (not c!137688)) b!1488475))

(assert (= (and d!156729 c!137686) b!1488477))

(assert (= (and d!156729 (not c!137686)) b!1488472))

(assert (= (and b!1488472 res!1012152) b!1488469))

(assert (= (and b!1488469 (not res!1012151)) b!1488471))

(assert (= (and b!1488471 (not res!1012150)) b!1488470))

(declare-fun m!1372883 () Bool)

(assert (=> b!1488470 m!1372883))

(assert (=> b!1488475 m!1372665))

(assert (=> b!1488475 m!1372665))

(assert (=> b!1488475 m!1372651))

(declare-fun m!1372885 () Bool)

(assert (=> b!1488475 m!1372885))

(assert (=> d!156729 m!1372649))

(assert (=> d!156729 m!1372681))

(assert (=> b!1488469 m!1372883))

(assert (=> b!1488471 m!1372883))

(assert (=> b!1488141 d!156729))

(declare-fun b!1488478 () Bool)

(declare-fun lt!649216 () SeekEntryResult!12307)

(assert (=> b!1488478 (and (bvsge (index!51622 lt!649216) #b00000000000000000000000000000000) (bvslt (index!51622 lt!649216) (size!48617 a!2862)))))

(declare-fun res!1012154 () Bool)

(assert (=> b!1488478 (= res!1012154 (= (select (arr!48067 a!2862) (index!51622 lt!649216)) (select (arr!48067 a!2862) j!93)))))

(declare-fun e!834324 () Bool)

(assert (=> b!1488478 (=> res!1012154 e!834324)))

(declare-fun e!834323 () Bool)

(assert (=> b!1488478 (= e!834323 e!834324)))

(declare-fun b!1488479 () Bool)

(assert (=> b!1488479 (and (bvsge (index!51622 lt!649216) #b00000000000000000000000000000000) (bvslt (index!51622 lt!649216) (size!48617 a!2862)))))

(assert (=> b!1488479 (= e!834324 (= (select (arr!48067 a!2862) (index!51622 lt!649216)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1488480 () Bool)

(assert (=> b!1488480 (and (bvsge (index!51622 lt!649216) #b00000000000000000000000000000000) (bvslt (index!51622 lt!649216) (size!48617 a!2862)))))

(declare-fun res!1012153 () Bool)

(assert (=> b!1488480 (= res!1012153 (= (select (arr!48067 a!2862) (index!51622 lt!649216)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488480 (=> res!1012153 e!834324)))

(declare-fun b!1488481 () Bool)

(declare-fun e!834326 () Bool)

(assert (=> b!1488481 (= e!834326 e!834323)))

(declare-fun res!1012155 () Bool)

(assert (=> b!1488481 (= res!1012155 (and (is-Intermediate!12307 lt!649216) (not (undefined!13119 lt!649216)) (bvslt (x!133207 lt!649216) #b01111111111111111111111111111110) (bvsge (x!133207 lt!649216) #b00000000000000000000000000000000) (bvsge (x!133207 lt!649216) (bvadd #b00000000000000000000000000000001 x!665))))))

(assert (=> b!1488481 (=> (not res!1012155) (not e!834323))))

(declare-fun d!156731 () Bool)

(assert (=> d!156731 e!834326))

(declare-fun c!137689 () Bool)

(assert (=> d!156731 (= c!137689 (and (is-Intermediate!12307 lt!649216) (undefined!13119 lt!649216)))))

(declare-fun e!834325 () SeekEntryResult!12307)

(assert (=> d!156731 (= lt!649216 e!834325)))

(declare-fun c!137690 () Bool)

(assert (=> d!156731 (= c!137690 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(declare-fun lt!649217 () (_ BitVec 64))

(assert (=> d!156731 (= lt!649217 (select (arr!48067 a!2862) lt!649077))))

(assert (=> d!156731 (validMask!0 mask!2687)))

(assert (=> d!156731 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649077 (select (arr!48067 a!2862) j!93) a!2862 mask!2687) lt!649216)))

(declare-fun b!1488482 () Bool)

(declare-fun e!834327 () SeekEntryResult!12307)

(assert (=> b!1488482 (= e!834327 (Intermediate!12307 false lt!649077 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1488483 () Bool)

(assert (=> b!1488483 (= e!834325 e!834327)))

(declare-fun c!137691 () Bool)

(assert (=> b!1488483 (= c!137691 (or (= lt!649217 (select (arr!48067 a!2862) j!93)) (= (bvadd lt!649217 lt!649217) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1488484 () Bool)

(assert (=> b!1488484 (= e!834327 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!649077 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) (select (arr!48067 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1488485 () Bool)

(assert (=> b!1488485 (= e!834325 (Intermediate!12307 true lt!649077 (bvadd #b00000000000000000000000000000001 x!665)))))

(declare-fun b!1488486 () Bool)

(assert (=> b!1488486 (= e!834326 (bvsge (x!133207 lt!649216) #b01111111111111111111111111111110))))

(assert (= (and d!156731 c!137690) b!1488485))

(assert (= (and d!156731 (not c!137690)) b!1488483))

(assert (= (and b!1488483 c!137691) b!1488482))

(assert (= (and b!1488483 (not c!137691)) b!1488484))

(assert (= (and d!156731 c!137689) b!1488486))

(assert (= (and d!156731 (not c!137689)) b!1488481))

(assert (= (and b!1488481 res!1012155) b!1488478))

(assert (= (and b!1488478 (not res!1012154)) b!1488480))

(assert (= (and b!1488480 (not res!1012153)) b!1488479))

(declare-fun m!1372887 () Bool)

(assert (=> b!1488479 m!1372887))

(assert (=> b!1488484 m!1372773))

(assert (=> b!1488484 m!1372773))

(assert (=> b!1488484 m!1372651))

(declare-fun m!1372891 () Bool)

(assert (=> b!1488484 m!1372891))

(declare-fun m!1372895 () Bool)

(assert (=> d!156731 m!1372895))

(assert (=> d!156731 m!1372681))

(assert (=> b!1488478 m!1372887))

(assert (=> b!1488480 m!1372887))

(assert (=> b!1488152 d!156731))

(declare-fun b!1488491 () Bool)

(declare-fun lt!649221 () SeekEntryResult!12307)

(assert (=> b!1488491 (and (bvsge (index!51622 lt!649221) #b00000000000000000000000000000000) (bvslt (index!51622 lt!649221) (size!48617 lt!649071)))))

(declare-fun res!1012159 () Bool)

(assert (=> b!1488491 (= res!1012159 (= (select (arr!48067 lt!649071) (index!51622 lt!649221)) lt!649072))))

(declare-fun e!834332 () Bool)

(assert (=> b!1488491 (=> res!1012159 e!834332)))

(declare-fun e!834331 () Bool)

(assert (=> b!1488491 (= e!834331 e!834332)))

(declare-fun b!1488492 () Bool)

(assert (=> b!1488492 (and (bvsge (index!51622 lt!649221) #b00000000000000000000000000000000) (bvslt (index!51622 lt!649221) (size!48617 lt!649071)))))

(assert (=> b!1488492 (= e!834332 (= (select (arr!48067 lt!649071) (index!51622 lt!649221)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1488493 () Bool)

(assert (=> b!1488493 (and (bvsge (index!51622 lt!649221) #b00000000000000000000000000000000) (bvslt (index!51622 lt!649221) (size!48617 lt!649071)))))

(declare-fun res!1012158 () Bool)

(assert (=> b!1488493 (= res!1012158 (= (select (arr!48067 lt!649071) (index!51622 lt!649221)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488493 (=> res!1012158 e!834332)))

(declare-fun b!1488494 () Bool)

(declare-fun e!834334 () Bool)

(assert (=> b!1488494 (= e!834334 e!834331)))

(declare-fun res!1012160 () Bool)

(assert (=> b!1488494 (= res!1012160 (and (is-Intermediate!12307 lt!649221) (not (undefined!13119 lt!649221)) (bvslt (x!133207 lt!649221) #b01111111111111111111111111111110) (bvsge (x!133207 lt!649221) #b00000000000000000000000000000000) (bvsge (x!133207 lt!649221) x!665)))))

(assert (=> b!1488494 (=> (not res!1012160) (not e!834331))))

(declare-fun d!156733 () Bool)

(assert (=> d!156733 e!834334))

(declare-fun c!137693 () Bool)

(assert (=> d!156733 (= c!137693 (and (is-Intermediate!12307 lt!649221) (undefined!13119 lt!649221)))))

(declare-fun e!834333 () SeekEntryResult!12307)

(assert (=> d!156733 (= lt!649221 e!834333)))

(declare-fun c!137694 () Bool)

(assert (=> d!156733 (= c!137694 (bvsge x!665 #b01111111111111111111111111111110))))

(declare-fun lt!649222 () (_ BitVec 64))

(assert (=> d!156733 (= lt!649222 (select (arr!48067 lt!649071) index!646))))

(assert (=> d!156733 (validMask!0 mask!2687)))

(assert (=> d!156733 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649072 lt!649071 mask!2687) lt!649221)))

(declare-fun b!1488495 () Bool)

(declare-fun e!834335 () SeekEntryResult!12307)

(assert (=> b!1488495 (= e!834335 (Intermediate!12307 false index!646 x!665))))

(declare-fun b!1488496 () Bool)

(assert (=> b!1488496 (= e!834333 e!834335)))

(declare-fun c!137695 () Bool)

(assert (=> b!1488496 (= c!137695 (or (= lt!649222 lt!649072) (= (bvadd lt!649222 lt!649222) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1488497 () Bool)

(assert (=> b!1488497 (= e!834335 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!665 #b00000000000000000000000000000001) (nextIndex!0 index!646 x!665 mask!2687) lt!649072 lt!649071 mask!2687))))

(declare-fun b!1488498 () Bool)

(assert (=> b!1488498 (= e!834333 (Intermediate!12307 true index!646 x!665))))

(declare-fun b!1488499 () Bool)

(assert (=> b!1488499 (= e!834334 (bvsge (x!133207 lt!649221) #b01111111111111111111111111111110))))

(assert (= (and d!156733 c!137694) b!1488498))

(assert (= (and d!156733 (not c!137694)) b!1488496))

(assert (= (and b!1488496 c!137695) b!1488495))

(assert (= (and b!1488496 (not c!137695)) b!1488497))

(assert (= (and d!156733 c!137693) b!1488499))

(assert (= (and d!156733 (not c!137693)) b!1488494))

(assert (= (and b!1488494 res!1012160) b!1488491))

(assert (= (and b!1488491 (not res!1012159)) b!1488493))

(assert (= (and b!1488493 (not res!1012158)) b!1488492))

(declare-fun m!1372899 () Bool)

(assert (=> b!1488492 m!1372899))

(assert (=> b!1488497 m!1372665))

(assert (=> b!1488497 m!1372665))

(declare-fun m!1372901 () Bool)

(assert (=> b!1488497 m!1372901))

(assert (=> d!156733 m!1372871))

(assert (=> d!156733 m!1372681))

(assert (=> b!1488491 m!1372899))

(assert (=> b!1488493 m!1372899))

(assert (=> b!1488150 d!156733))

(declare-fun d!156737 () Bool)

(assert (=> d!156737 (= (validKeyInArray!0 (select (arr!48067 a!2862) i!1006)) (and (not (= (select (arr!48067 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48067 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1488154 d!156737))

(declare-fun b!1488500 () Bool)

(declare-fun lt!649223 () SeekEntryResult!12307)

(assert (=> b!1488500 (and (bvsge (index!51622 lt!649223) #b00000000000000000000000000000000) (bvslt (index!51622 lt!649223) (size!48617 a!2862)))))

(declare-fun res!1012162 () Bool)

(assert (=> b!1488500 (= res!1012162 (= (select (arr!48067 a!2862) (index!51622 lt!649223)) (select (arr!48067 a!2862) j!93)))))

(declare-fun e!834337 () Bool)

(assert (=> b!1488500 (=> res!1012162 e!834337)))

(declare-fun e!834336 () Bool)

(assert (=> b!1488500 (= e!834336 e!834337)))

(declare-fun b!1488501 () Bool)

(assert (=> b!1488501 (and (bvsge (index!51622 lt!649223) #b00000000000000000000000000000000) (bvslt (index!51622 lt!649223) (size!48617 a!2862)))))

(assert (=> b!1488501 (= e!834337 (= (select (arr!48067 a!2862) (index!51622 lt!649223)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1488502 () Bool)

(assert (=> b!1488502 (and (bvsge (index!51622 lt!649223) #b00000000000000000000000000000000) (bvslt (index!51622 lt!649223) (size!48617 a!2862)))))

(declare-fun res!1012161 () Bool)

(assert (=> b!1488502 (= res!1012161 (= (select (arr!48067 a!2862) (index!51622 lt!649223)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488502 (=> res!1012161 e!834337)))

(declare-fun b!1488503 () Bool)

(declare-fun e!834339 () Bool)

(assert (=> b!1488503 (= e!834339 e!834336)))

(declare-fun res!1012163 () Bool)

(assert (=> b!1488503 (= res!1012163 (and (is-Intermediate!12307 lt!649223) (not (undefined!13119 lt!649223)) (bvslt (x!133207 lt!649223) #b01111111111111111111111111111110) (bvsge (x!133207 lt!649223) #b00000000000000000000000000000000) (bvsge (x!133207 lt!649223) #b00000000000000000000000000000000)))))

(assert (=> b!1488503 (=> (not res!1012163) (not e!834336))))

(declare-fun d!156739 () Bool)

(assert (=> d!156739 e!834339))

(declare-fun c!137696 () Bool)

(assert (=> d!156739 (= c!137696 (and (is-Intermediate!12307 lt!649223) (undefined!13119 lt!649223)))))

(declare-fun e!834338 () SeekEntryResult!12307)

(assert (=> d!156739 (= lt!649223 e!834338)))

(declare-fun c!137697 () Bool)

(assert (=> d!156739 (= c!137697 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!649224 () (_ BitVec 64))

(assert (=> d!156739 (= lt!649224 (select (arr!48067 a!2862) (toIndex!0 (select (arr!48067 a!2862) j!93) mask!2687)))))

(assert (=> d!156739 (validMask!0 mask!2687)))

(assert (=> d!156739 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48067 a!2862) j!93) mask!2687) (select (arr!48067 a!2862) j!93) a!2862 mask!2687) lt!649223)))

(declare-fun b!1488504 () Bool)

(declare-fun e!834340 () SeekEntryResult!12307)

(assert (=> b!1488504 (= e!834340 (Intermediate!12307 false (toIndex!0 (select (arr!48067 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1488505 () Bool)

(assert (=> b!1488505 (= e!834338 e!834340)))

(declare-fun c!137698 () Bool)

(assert (=> b!1488505 (= c!137698 (or (= lt!649224 (select (arr!48067 a!2862) j!93)) (= (bvadd lt!649224 lt!649224) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1488506 () Bool)

(assert (=> b!1488506 (= e!834340 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48067 a!2862) j!93) mask!2687) #b00000000000000000000000000000000 mask!2687) (select (arr!48067 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1488507 () Bool)

(assert (=> b!1488507 (= e!834338 (Intermediate!12307 true (toIndex!0 (select (arr!48067 a!2862) j!93) mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1488508 () Bool)

(assert (=> b!1488508 (= e!834339 (bvsge (x!133207 lt!649223) #b01111111111111111111111111111110))))

(assert (= (and d!156739 c!137697) b!1488507))

(assert (= (and d!156739 (not c!137697)) b!1488505))

(assert (= (and b!1488505 c!137698) b!1488504))

(assert (= (and b!1488505 (not c!137698)) b!1488506))

(assert (= (and d!156739 c!137696) b!1488508))

(assert (= (and d!156739 (not c!137696)) b!1488503))

(assert (= (and b!1488503 res!1012163) b!1488500))

(assert (= (and b!1488500 (not res!1012162)) b!1488502))

(assert (= (and b!1488502 (not res!1012161)) b!1488501))

(declare-fun m!1372903 () Bool)

(assert (=> b!1488501 m!1372903))

(assert (=> b!1488506 m!1372691))

(declare-fun m!1372905 () Bool)

(assert (=> b!1488506 m!1372905))

(assert (=> b!1488506 m!1372905))

(assert (=> b!1488506 m!1372651))

(declare-fun m!1372907 () Bool)

(assert (=> b!1488506 m!1372907))

(assert (=> d!156739 m!1372691))

(declare-fun m!1372909 () Bool)

(assert (=> d!156739 m!1372909))

(assert (=> d!156739 m!1372681))

(assert (=> b!1488500 m!1372903))

(assert (=> b!1488502 m!1372903))

(assert (=> b!1488144 d!156739))

(declare-fun d!156741 () Bool)

(declare-fun lt!649233 () (_ BitVec 32))

(declare-fun lt!649232 () (_ BitVec 32))

(assert (=> d!156741 (= lt!649233 (bvmul (bvxor lt!649232 (bvlshr lt!649232 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156741 (= lt!649232 ((_ extract 31 0) (bvand (bvxor (select (arr!48067 a!2862) j!93) (bvlshr (select (arr!48067 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156741 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1012164 (let ((h!35947 ((_ extract 31 0) (bvand (bvxor (select (arr!48067 a!2862) j!93) (bvlshr (select (arr!48067 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133219 (bvmul (bvxor h!35947 (bvlshr h!35947 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133219 (bvlshr x!133219 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1012164 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1012164 #b00000000000000000000000000000000))))))

(assert (=> d!156741 (= (toIndex!0 (select (arr!48067 a!2862) j!93) mask!2687) (bvand (bvxor lt!649233 (bvlshr lt!649233 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1488144 d!156741))

(declare-fun b!1488509 () Bool)

(declare-fun e!834341 () Bool)

(declare-fun call!67929 () Bool)

(assert (=> b!1488509 (= e!834341 call!67929)))

(declare-fun b!1488510 () Bool)

(declare-fun e!834342 () Bool)

(assert (=> b!1488510 (= e!834342 e!834341)))

(declare-fun c!137699 () Bool)

(assert (=> b!1488510 (= c!137699 (validKeyInArray!0 (select (arr!48067 a!2862) j!93)))))

(declare-fun b!1488511 () Bool)

(declare-fun e!834343 () Bool)

(assert (=> b!1488511 (= e!834341 e!834343)))

(declare-fun lt!649236 () (_ BitVec 64))

(assert (=> b!1488511 (= lt!649236 (select (arr!48067 a!2862) j!93))))

(declare-fun lt!649234 () Unit!49954)

(assert (=> b!1488511 (= lt!649234 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!649236 j!93))))

(assert (=> b!1488511 (arrayContainsKey!0 a!2862 lt!649236 #b00000000000000000000000000000000)))

(declare-fun lt!649235 () Unit!49954)

(assert (=> b!1488511 (= lt!649235 lt!649234)))

(declare-fun res!1012165 () Bool)

(assert (=> b!1488511 (= res!1012165 (= (seekEntryOrOpen!0 (select (arr!48067 a!2862) j!93) a!2862 mask!2687) (Found!12307 j!93)))))

(assert (=> b!1488511 (=> (not res!1012165) (not e!834343))))

(declare-fun d!156745 () Bool)

(declare-fun res!1012166 () Bool)

(assert (=> d!156745 (=> res!1012166 e!834342)))

(assert (=> d!156745 (= res!1012166 (bvsge j!93 (size!48617 a!2862)))))

(assert (=> d!156745 (= (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687) e!834342)))

(declare-fun bm!67926 () Bool)

(assert (=> bm!67926 (= call!67929 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!93 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1488512 () Bool)

(assert (=> b!1488512 (= e!834343 call!67929)))

(assert (= (and d!156745 (not res!1012166)) b!1488510))

(assert (= (and b!1488510 c!137699) b!1488511))

(assert (= (and b!1488510 (not c!137699)) b!1488509))

(assert (= (and b!1488511 res!1012165) b!1488512))

(assert (= (or b!1488512 b!1488509) bm!67926))

(assert (=> b!1488510 m!1372651))

(assert (=> b!1488510 m!1372651))

(assert (=> b!1488510 m!1372685))

(assert (=> b!1488511 m!1372651))

(declare-fun m!1372913 () Bool)

(assert (=> b!1488511 m!1372913))

(declare-fun m!1372915 () Bool)

(assert (=> b!1488511 m!1372915))

(assert (=> b!1488511 m!1372651))

(assert (=> b!1488511 m!1372663))

(declare-fun m!1372917 () Bool)

(assert (=> bm!67926 m!1372917))

(assert (=> b!1488155 d!156745))

(declare-fun d!156747 () Bool)

(assert (=> d!156747 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!649242 () Unit!49954)

(declare-fun choose!38 (array!99588 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49954)

(assert (=> d!156747 (= lt!649242 (choose!38 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (=> d!156747 (validMask!0 mask!2687)))

(assert (=> d!156747 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93) lt!649242)))

(declare-fun bs!42799 () Bool)

(assert (= bs!42799 d!156747))

(assert (=> bs!42799 m!1372679))

(declare-fun m!1372935 () Bool)

(assert (=> bs!42799 m!1372935))

(assert (=> bs!42799 m!1372681))

(assert (=> b!1488155 d!156747))

(assert (=> b!1488142 d!156723))

(assert (=> b!1488142 d!156727))

(declare-fun b!1488534 () Bool)

(declare-fun e!834359 () SeekEntryResult!12307)

(assert (=> b!1488534 (= e!834359 Undefined!12307)))

(declare-fun b!1488535 () Bool)

(declare-fun e!834360 () SeekEntryResult!12307)

(assert (=> b!1488535 (= e!834360 (MissingVacant!12307 intermediateAfterIndex!19))))

(declare-fun b!1488536 () Bool)

(assert (=> b!1488536 (= e!834360 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665 #b00000000000000000000000000000001) (nextIndex!0 lt!649077 (bvadd #b00000000000000000000000000000001 x!665) mask!2687) intermediateAfterIndex!19 lt!649072 lt!649071 mask!2687))))

(declare-fun b!1488537 () Bool)

(declare-fun e!834361 () SeekEntryResult!12307)

(assert (=> b!1488537 (= e!834361 (Found!12307 lt!649077))))

(declare-fun b!1488538 () Bool)

(declare-fun c!137707 () Bool)

(declare-fun lt!649243 () (_ BitVec 64))

(assert (=> b!1488538 (= c!137707 (= lt!649243 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488538 (= e!834361 e!834360)))

(declare-fun d!156753 () Bool)

(declare-fun lt!649244 () SeekEntryResult!12307)

(assert (=> d!156753 (and (or (is-Undefined!12307 lt!649244) (not (is-Found!12307 lt!649244)) (and (bvsge (index!51621 lt!649244) #b00000000000000000000000000000000) (bvslt (index!51621 lt!649244) (size!48617 lt!649071)))) (or (is-Undefined!12307 lt!649244) (is-Found!12307 lt!649244) (not (is-MissingVacant!12307 lt!649244)) (not (= (index!51623 lt!649244) intermediateAfterIndex!19)) (and (bvsge (index!51623 lt!649244) #b00000000000000000000000000000000) (bvslt (index!51623 lt!649244) (size!48617 lt!649071)))) (or (is-Undefined!12307 lt!649244) (ite (is-Found!12307 lt!649244) (= (select (arr!48067 lt!649071) (index!51621 lt!649244)) lt!649072) (and (is-MissingVacant!12307 lt!649244) (= (index!51623 lt!649244) intermediateAfterIndex!19) (= (select (arr!48067 lt!649071) (index!51623 lt!649244)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!156753 (= lt!649244 e!834359)))

(declare-fun c!137708 () Bool)

(assert (=> d!156753 (= c!137708 (bvsge (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110))))

(assert (=> d!156753 (= lt!649243 (select (arr!48067 lt!649071) lt!649077))))

(assert (=> d!156753 (validMask!0 mask!2687)))

(assert (=> d!156753 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649077 intermediateAfterIndex!19 lt!649072 lt!649071 mask!2687) lt!649244)))

(declare-fun b!1488539 () Bool)

(assert (=> b!1488539 (= e!834359 e!834361)))

(declare-fun c!137706 () Bool)

(assert (=> b!1488539 (= c!137706 (= lt!649243 lt!649072))))

(assert (= (and d!156753 c!137708) b!1488534))

(assert (= (and d!156753 (not c!137708)) b!1488539))

(assert (= (and b!1488539 c!137706) b!1488537))

(assert (= (and b!1488539 (not c!137706)) b!1488538))

(assert (= (and b!1488538 c!137707) b!1488535))

(assert (= (and b!1488538 (not c!137707)) b!1488536))

(assert (=> b!1488536 m!1372773))

(assert (=> b!1488536 m!1372773))

(declare-fun m!1372939 () Bool)

(assert (=> b!1488536 m!1372939))

(declare-fun m!1372941 () Bool)

(assert (=> d!156753 m!1372941))

(declare-fun m!1372943 () Bool)

(assert (=> d!156753 m!1372943))

(assert (=> d!156753 m!1372777))

(assert (=> d!156753 m!1372681))

(assert (=> b!1488153 d!156753))

(declare-fun d!156755 () Bool)

(assert (=> d!156755 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!126752 d!156755))

(declare-fun d!156761 () Bool)

(assert (=> d!156761 (= (array_inv!37095 a!2862) (bvsge (size!48617 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!126752 d!156761))

(declare-fun b!1488540 () Bool)

(declare-fun lt!649246 () SeekEntryResult!12307)

(assert (=> b!1488540 (and (bvsge (index!51622 lt!649246) #b00000000000000000000000000000000) (bvslt (index!51622 lt!649246) (size!48617 lt!649071)))))

(declare-fun res!1012177 () Bool)

(assert (=> b!1488540 (= res!1012177 (= (select (arr!48067 lt!649071) (index!51622 lt!649246)) lt!649072))))

(declare-fun e!834363 () Bool)

(assert (=> b!1488540 (=> res!1012177 e!834363)))

(declare-fun e!834362 () Bool)

(assert (=> b!1488540 (= e!834362 e!834363)))

(declare-fun b!1488542 () Bool)

(assert (=> b!1488542 (and (bvsge (index!51622 lt!649246) #b00000000000000000000000000000000) (bvslt (index!51622 lt!649246) (size!48617 lt!649071)))))

(assert (=> b!1488542 (= e!834363 (= (select (arr!48067 lt!649071) (index!51622 lt!649246)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1488544 () Bool)

(assert (=> b!1488544 (and (bvsge (index!51622 lt!649246) #b00000000000000000000000000000000) (bvslt (index!51622 lt!649246) (size!48617 lt!649071)))))

(declare-fun res!1012176 () Bool)

(assert (=> b!1488544 (= res!1012176 (= (select (arr!48067 lt!649071) (index!51622 lt!649246)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1488544 (=> res!1012176 e!834363)))

(declare-fun b!1488546 () Bool)

(declare-fun e!834366 () Bool)

(assert (=> b!1488546 (= e!834366 e!834362)))

(declare-fun res!1012178 () Bool)

(assert (=> b!1488546 (= res!1012178 (and (is-Intermediate!12307 lt!649246) (not (undefined!13119 lt!649246)) (bvslt (x!133207 lt!649246) #b01111111111111111111111111111110) (bvsge (x!133207 lt!649246) #b00000000000000000000000000000000) (bvsge (x!133207 lt!649246) #b00000000000000000000000000000000)))))

(assert (=> b!1488546 (=> (not res!1012178) (not e!834362))))

(declare-fun d!156763 () Bool)

(assert (=> d!156763 e!834366))

(declare-fun c!137709 () Bool)

(assert (=> d!156763 (= c!137709 (and (is-Intermediate!12307 lt!649246) (undefined!13119 lt!649246)))))

(declare-fun e!834364 () SeekEntryResult!12307)

(assert (=> d!156763 (= lt!649246 e!834364)))

(declare-fun c!137712 () Bool)

(assert (=> d!156763 (= c!137712 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!649247 () (_ BitVec 64))

(assert (=> d!156763 (= lt!649247 (select (arr!48067 lt!649071) (toIndex!0 lt!649072 mask!2687)))))

(assert (=> d!156763 (validMask!0 mask!2687)))

(assert (=> d!156763 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649072 mask!2687) lt!649072 lt!649071 mask!2687) lt!649246)))

(declare-fun b!1488548 () Bool)

(declare-fun e!834367 () SeekEntryResult!12307)

(assert (=> b!1488548 (= e!834367 (Intermediate!12307 false (toIndex!0 lt!649072 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1488550 () Bool)

(assert (=> b!1488550 (= e!834364 e!834367)))

(declare-fun c!137713 () Bool)

(assert (=> b!1488550 (= c!137713 (or (= lt!649247 lt!649072) (= (bvadd lt!649247 lt!649247) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1488552 () Bool)

(assert (=> b!1488552 (= e!834367 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!649072 mask!2687) #b00000000000000000000000000000000 mask!2687) lt!649072 lt!649071 mask!2687))))

(declare-fun b!1488553 () Bool)

(assert (=> b!1488553 (= e!834364 (Intermediate!12307 true (toIndex!0 lt!649072 mask!2687) #b00000000000000000000000000000000))))

(declare-fun b!1488554 () Bool)

(assert (=> b!1488554 (= e!834366 (bvsge (x!133207 lt!649246) #b01111111111111111111111111111110))))

(assert (= (and d!156763 c!137712) b!1488553))

(assert (= (and d!156763 (not c!137712)) b!1488550))

(assert (= (and b!1488550 c!137713) b!1488548))

(assert (= (and b!1488550 (not c!137713)) b!1488552))

(assert (= (and d!156763 c!137709) b!1488554))

(assert (= (and d!156763 (not c!137709)) b!1488546))

(assert (= (and b!1488546 res!1012178) b!1488540))

(assert (= (and b!1488540 (not res!1012177)) b!1488544))

(assert (= (and b!1488544 (not res!1012176)) b!1488542))

(declare-fun m!1372949 () Bool)

(assert (=> b!1488542 m!1372949))

(assert (=> b!1488552 m!1372671))

(declare-fun m!1372953 () Bool)

(assert (=> b!1488552 m!1372953))

(assert (=> b!1488552 m!1372953))

(declare-fun m!1372955 () Bool)

(assert (=> b!1488552 m!1372955))

(assert (=> d!156763 m!1372671))

(declare-fun m!1372957 () Bool)

(assert (=> d!156763 m!1372957))

(assert (=> d!156763 m!1372681))

(assert (=> b!1488540 m!1372949))

(assert (=> b!1488544 m!1372949))

(assert (=> b!1488136 d!156763))

(declare-fun d!156769 () Bool)

(declare-fun lt!649253 () (_ BitVec 32))

(declare-fun lt!649252 () (_ BitVec 32))

(assert (=> d!156769 (= lt!649253 (bvmul (bvxor lt!649252 (bvlshr lt!649252 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!156769 (= lt!649252 ((_ extract 31 0) (bvand (bvxor lt!649072 (bvlshr lt!649072 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!156769 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!1012164 (let ((h!35947 ((_ extract 31 0) (bvand (bvxor lt!649072 (bvlshr lt!649072 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!133219 (bvmul (bvxor h!35947 (bvlshr h!35947 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!133219 (bvlshr x!133219 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!1012164 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!1012164 #b00000000000000000000000000000000))))))

(assert (=> d!156769 (= (toIndex!0 lt!649072 mask!2687) (bvand (bvxor lt!649253 (bvlshr lt!649253 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1488136 d!156769))

(declare-fun bm!67933 () Bool)

(declare-fun call!67936 () Bool)

(declare-fun c!137730 () Bool)

(assert (=> bm!67933 (= call!67936 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!137730 (Cons!34564 (select (arr!48067 a!2862) #b00000000000000000000000000000000) Nil!34565) Nil!34565)))))

(declare-fun b!1488605 () Bool)

(declare-fun e!834404 () Bool)

(assert (=> b!1488605 (= e!834404 call!67936)))

(declare-fun d!156771 () Bool)

(declare-fun res!1012200 () Bool)

(declare-fun e!834401 () Bool)

(assert (=> d!156771 (=> res!1012200 e!834401)))

(assert (=> d!156771 (= res!1012200 (bvsge #b00000000000000000000000000000000 (size!48617 a!2862)))))

(assert (=> d!156771 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34565) e!834401)))

(declare-fun b!1488606 () Bool)

(declare-fun e!834403 () Bool)

(assert (=> b!1488606 (= e!834401 e!834403)))

(declare-fun res!1012201 () Bool)

(assert (=> b!1488606 (=> (not res!1012201) (not e!834403))))

(declare-fun e!834402 () Bool)

(assert (=> b!1488606 (= res!1012201 (not e!834402))))

(declare-fun res!1012199 () Bool)

(assert (=> b!1488606 (=> (not res!1012199) (not e!834402))))

(assert (=> b!1488606 (= res!1012199 (validKeyInArray!0 (select (arr!48067 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1488607 () Bool)

(assert (=> b!1488607 (= e!834404 call!67936)))

(declare-fun b!1488608 () Bool)

(declare-fun contains!9924 (List!34568 (_ BitVec 64)) Bool)

(assert (=> b!1488608 (= e!834402 (contains!9924 Nil!34565 (select (arr!48067 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1488609 () Bool)

(assert (=> b!1488609 (= e!834403 e!834404)))

(assert (=> b!1488609 (= c!137730 (validKeyInArray!0 (select (arr!48067 a!2862) #b00000000000000000000000000000000)))))

(assert (= (and d!156771 (not res!1012200)) b!1488606))

(assert (= (and b!1488606 res!1012199) b!1488608))

(assert (= (and b!1488606 res!1012201) b!1488609))

(assert (= (and b!1488609 c!137730) b!1488607))

(assert (= (and b!1488609 (not c!137730)) b!1488605))

(assert (= (or b!1488607 b!1488605) bm!67933))

(assert (=> bm!67933 m!1372841))

(declare-fun m!1372989 () Bool)

(assert (=> bm!67933 m!1372989))

(assert (=> b!1488606 m!1372841))

(assert (=> b!1488606 m!1372841))

(assert (=> b!1488606 m!1372843))

(assert (=> b!1488608 m!1372841))

(assert (=> b!1488608 m!1372841))

(declare-fun m!1372991 () Bool)

(assert (=> b!1488608 m!1372991))

(assert (=> b!1488609 m!1372841))

(assert (=> b!1488609 m!1372841))

(assert (=> b!1488609 m!1372843))

(assert (=> b!1488147 d!156771))

(push 1)

