; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125050 () Bool)

(assert start!125050)

(declare-fun b!1456089 () Bool)

(declare-fun e!819252 () Bool)

(declare-fun e!819254 () Bool)

(assert (=> b!1456089 (= e!819252 e!819254)))

(declare-fun res!986730 () Bool)

(assert (=> b!1456089 (=> (not res!986730) (not e!819254))))

(declare-datatypes ((SeekEntryResult!11804 0))(
  ( (MissingZero!11804 (index!49608 (_ BitVec 32))) (Found!11804 (index!49609 (_ BitVec 32))) (Intermediate!11804 (undefined!12616 Bool) (index!49610 (_ BitVec 32)) (x!131232 (_ BitVec 32))) (Undefined!11804) (MissingVacant!11804 (index!49611 (_ BitVec 32))) )
))
(declare-fun lt!638025 () SeekEntryResult!11804)

(declare-datatypes ((array!98476 0))(
  ( (array!98477 (arr!47527 (Array (_ BitVec 32) (_ BitVec 64))) (size!48079 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98476)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98476 (_ BitVec 32)) SeekEntryResult!11804)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456089 (= res!986730 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47527 a!2862) j!93) mask!2687) (select (arr!47527 a!2862) j!93) a!2862 mask!2687) lt!638025))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1456089 (= lt!638025 (Intermediate!11804 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!638028 () (_ BitVec 64))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!638031 () SeekEntryResult!11804)

(declare-fun e!819246 () Bool)

(declare-fun b!1456090 () Bool)

(declare-fun lt!638030 () (_ BitVec 32))

(declare-fun lt!638024 () array!98476)

(assert (=> b!1456090 (= e!819246 (not (= lt!638031 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638030 lt!638028 lt!638024 mask!2687))))))

(declare-fun e!819251 () Bool)

(declare-fun b!1456092 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98476 (_ BitVec 32)) SeekEntryResult!11804)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98476 (_ BitVec 32)) SeekEntryResult!11804)

(assert (=> b!1456092 (= e!819251 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638028 lt!638024 mask!2687) (seekEntryOrOpen!0 lt!638028 lt!638024 mask!2687)))))

(declare-fun b!1456093 () Bool)

(declare-fun e!819247 () Bool)

(declare-fun e!819249 () Bool)

(assert (=> b!1456093 (= e!819247 e!819249)))

(declare-fun res!986722 () Bool)

(assert (=> b!1456093 (=> res!986722 e!819249)))

(assert (=> b!1456093 (= res!986722 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638030 #b00000000000000000000000000000000) (bvsge lt!638030 (size!48079 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456093 (= lt!638030 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!638027 () SeekEntryResult!11804)

(assert (=> b!1456093 (= lt!638027 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638028 lt!638024 mask!2687))))

(assert (=> b!1456093 (= lt!638027 (seekEntryOrOpen!0 lt!638028 lt!638024 mask!2687))))

(declare-fun b!1456094 () Bool)

(declare-fun res!986721 () Bool)

(declare-fun e!819253 () Bool)

(assert (=> b!1456094 (=> (not res!986721) (not e!819253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98476 (_ BitVec 32)) Bool)

(assert (=> b!1456094 (= res!986721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1456095 () Bool)

(assert (=> b!1456095 (= e!819246 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638030 intermediateAfterIndex!19 lt!638028 lt!638024 mask!2687) lt!638027)))))

(declare-fun b!1456096 () Bool)

(declare-fun res!986727 () Bool)

(declare-fun e!819255 () Bool)

(assert (=> b!1456096 (=> (not res!986727) (not e!819255))))

(assert (=> b!1456096 (= res!986727 e!819251)))

(declare-fun c!134200 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1456096 (= c!134200 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1456097 () Bool)

(declare-fun res!986723 () Bool)

(assert (=> b!1456097 (=> (not res!986723) (not e!819253))))

(declare-datatypes ((List!34106 0))(
  ( (Nil!34103) (Cons!34102 (h!35452 (_ BitVec 64)) (t!48792 List!34106)) )
))
(declare-fun arrayNoDuplicates!0 (array!98476 (_ BitVec 32) List!34106) Bool)

(assert (=> b!1456097 (= res!986723 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34103))))

(declare-fun b!1456098 () Bool)

(declare-fun res!986728 () Bool)

(assert (=> b!1456098 (=> res!986728 e!819249)))

(assert (=> b!1456098 (= res!986728 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638030 (select (arr!47527 a!2862) j!93) a!2862 mask!2687) lt!638025)))))

(declare-fun b!1456099 () Bool)

(assert (=> b!1456099 (= e!819251 (= lt!638031 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638028 lt!638024 mask!2687)))))

(declare-fun b!1456100 () Bool)

(assert (=> b!1456100 (= e!819255 (not e!819247))))

(declare-fun res!986732 () Bool)

(assert (=> b!1456100 (=> res!986732 e!819247)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1456100 (= res!986732 (or (and (= (select (arr!47527 a!2862) index!646) (select (store (arr!47527 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47527 a!2862) index!646) (select (arr!47527 a!2862) j!93))) (= (select (arr!47527 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!819248 () Bool)

(assert (=> b!1456100 e!819248))

(declare-fun res!986717 () Bool)

(assert (=> b!1456100 (=> (not res!986717) (not e!819248))))

(assert (=> b!1456100 (= res!986717 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48945 0))(
  ( (Unit!48946) )
))
(declare-fun lt!638029 () Unit!48945)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98476 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48945)

(assert (=> b!1456100 (= lt!638029 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1456101 () Bool)

(declare-fun res!986725 () Bool)

(assert (=> b!1456101 (=> (not res!986725) (not e!819255))))

(assert (=> b!1456101 (= res!986725 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1456102 () Bool)

(assert (=> b!1456102 (= e!819249 true)))

(declare-fun lt!638026 () Bool)

(assert (=> b!1456102 (= lt!638026 e!819246)))

(declare-fun c!134199 () Bool)

(assert (=> b!1456102 (= c!134199 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun res!986719 () Bool)

(assert (=> start!125050 (=> (not res!986719) (not e!819253))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125050 (= res!986719 (validMask!0 mask!2687))))

(assert (=> start!125050 e!819253))

(assert (=> start!125050 true))

(declare-fun array_inv!36760 (array!98476) Bool)

(assert (=> start!125050 (array_inv!36760 a!2862)))

(declare-fun b!1456091 () Bool)

(declare-fun res!986733 () Bool)

(assert (=> b!1456091 (=> (not res!986733) (not e!819253))))

(assert (=> b!1456091 (= res!986733 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48079 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48079 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48079 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1456103 () Bool)

(assert (=> b!1456103 (= e!819253 e!819252)))

(declare-fun res!986734 () Bool)

(assert (=> b!1456103 (=> (not res!986734) (not e!819252))))

(assert (=> b!1456103 (= res!986734 (= (select (store (arr!47527 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1456103 (= lt!638024 (array!98477 (store (arr!47527 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48079 a!2862)))))

(declare-fun b!1456104 () Bool)

(declare-fun res!986720 () Bool)

(assert (=> b!1456104 (=> (not res!986720) (not e!819253))))

(assert (=> b!1456104 (= res!986720 (and (= (size!48079 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48079 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48079 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1456105 () Bool)

(declare-fun res!986724 () Bool)

(assert (=> b!1456105 (=> (not res!986724) (not e!819253))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1456105 (= res!986724 (validKeyInArray!0 (select (arr!47527 a!2862) i!1006)))))

(declare-fun b!1456106 () Bool)

(assert (=> b!1456106 (= e!819248 (and (or (= (select (arr!47527 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47527 a!2862) intermediateBeforeIndex!19) (select (arr!47527 a!2862) j!93))) (let ((bdg!53233 (select (store (arr!47527 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47527 a!2862) index!646) bdg!53233) (= (select (arr!47527 a!2862) index!646) (select (arr!47527 a!2862) j!93))) (= (select (arr!47527 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53233 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1456107 () Bool)

(declare-fun res!986718 () Bool)

(assert (=> b!1456107 (=> (not res!986718) (not e!819248))))

(assert (=> b!1456107 (= res!986718 (= (seekEntryOrOpen!0 (select (arr!47527 a!2862) j!93) a!2862 mask!2687) (Found!11804 j!93)))))

(declare-fun b!1456108 () Bool)

(declare-fun res!986731 () Bool)

(assert (=> b!1456108 (=> (not res!986731) (not e!819254))))

(assert (=> b!1456108 (= res!986731 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47527 a!2862) j!93) a!2862 mask!2687) lt!638025))))

(declare-fun b!1456109 () Bool)

(assert (=> b!1456109 (= e!819254 e!819255)))

(declare-fun res!986726 () Bool)

(assert (=> b!1456109 (=> (not res!986726) (not e!819255))))

(assert (=> b!1456109 (= res!986726 (= lt!638031 (Intermediate!11804 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1456109 (= lt!638031 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638028 mask!2687) lt!638028 lt!638024 mask!2687))))

(assert (=> b!1456109 (= lt!638028 (select (store (arr!47527 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1456110 () Bool)

(declare-fun res!986729 () Bool)

(assert (=> b!1456110 (=> (not res!986729) (not e!819253))))

(assert (=> b!1456110 (= res!986729 (validKeyInArray!0 (select (arr!47527 a!2862) j!93)))))

(assert (= (and start!125050 res!986719) b!1456104))

(assert (= (and b!1456104 res!986720) b!1456105))

(assert (= (and b!1456105 res!986724) b!1456110))

(assert (= (and b!1456110 res!986729) b!1456094))

(assert (= (and b!1456094 res!986721) b!1456097))

(assert (= (and b!1456097 res!986723) b!1456091))

(assert (= (and b!1456091 res!986733) b!1456103))

(assert (= (and b!1456103 res!986734) b!1456089))

(assert (= (and b!1456089 res!986730) b!1456108))

(assert (= (and b!1456108 res!986731) b!1456109))

(assert (= (and b!1456109 res!986726) b!1456096))

(assert (= (and b!1456096 c!134200) b!1456099))

(assert (= (and b!1456096 (not c!134200)) b!1456092))

(assert (= (and b!1456096 res!986727) b!1456101))

(assert (= (and b!1456101 res!986725) b!1456100))

(assert (= (and b!1456100 res!986717) b!1456107))

(assert (= (and b!1456107 res!986718) b!1456106))

(assert (= (and b!1456100 (not res!986732)) b!1456093))

(assert (= (and b!1456093 (not res!986722)) b!1456098))

(assert (= (and b!1456098 (not res!986728)) b!1456102))

(assert (= (and b!1456102 c!134199) b!1456090))

(assert (= (and b!1456102 (not c!134199)) b!1456095))

(declare-fun m!1343727 () Bool)

(assert (=> b!1456105 m!1343727))

(assert (=> b!1456105 m!1343727))

(declare-fun m!1343729 () Bool)

(assert (=> b!1456105 m!1343729))

(declare-fun m!1343731 () Bool)

(assert (=> b!1456093 m!1343731))

(declare-fun m!1343733 () Bool)

(assert (=> b!1456093 m!1343733))

(declare-fun m!1343735 () Bool)

(assert (=> b!1456093 m!1343735))

(declare-fun m!1343737 () Bool)

(assert (=> b!1456110 m!1343737))

(assert (=> b!1456110 m!1343737))

(declare-fun m!1343739 () Bool)

(assert (=> b!1456110 m!1343739))

(declare-fun m!1343741 () Bool)

(assert (=> b!1456100 m!1343741))

(declare-fun m!1343743 () Bool)

(assert (=> b!1456100 m!1343743))

(declare-fun m!1343745 () Bool)

(assert (=> b!1456100 m!1343745))

(declare-fun m!1343747 () Bool)

(assert (=> b!1456100 m!1343747))

(declare-fun m!1343749 () Bool)

(assert (=> b!1456100 m!1343749))

(assert (=> b!1456100 m!1343737))

(declare-fun m!1343751 () Bool)

(assert (=> b!1456094 m!1343751))

(assert (=> b!1456108 m!1343737))

(assert (=> b!1456108 m!1343737))

(declare-fun m!1343753 () Bool)

(assert (=> b!1456108 m!1343753))

(declare-fun m!1343755 () Bool)

(assert (=> b!1456095 m!1343755))

(declare-fun m!1343757 () Bool)

(assert (=> b!1456109 m!1343757))

(assert (=> b!1456109 m!1343757))

(declare-fun m!1343759 () Bool)

(assert (=> b!1456109 m!1343759))

(assert (=> b!1456109 m!1343743))

(declare-fun m!1343761 () Bool)

(assert (=> b!1456109 m!1343761))

(declare-fun m!1343763 () Bool)

(assert (=> b!1456099 m!1343763))

(declare-fun m!1343765 () Bool)

(assert (=> b!1456090 m!1343765))

(declare-fun m!1343767 () Bool)

(assert (=> b!1456097 m!1343767))

(assert (=> b!1456092 m!1343733))

(assert (=> b!1456092 m!1343735))

(assert (=> b!1456107 m!1343737))

(assert (=> b!1456107 m!1343737))

(declare-fun m!1343769 () Bool)

(assert (=> b!1456107 m!1343769))

(declare-fun m!1343771 () Bool)

(assert (=> start!125050 m!1343771))

(declare-fun m!1343773 () Bool)

(assert (=> start!125050 m!1343773))

(assert (=> b!1456089 m!1343737))

(assert (=> b!1456089 m!1343737))

(declare-fun m!1343775 () Bool)

(assert (=> b!1456089 m!1343775))

(assert (=> b!1456089 m!1343775))

(assert (=> b!1456089 m!1343737))

(declare-fun m!1343777 () Bool)

(assert (=> b!1456089 m!1343777))

(assert (=> b!1456103 m!1343743))

(declare-fun m!1343779 () Bool)

(assert (=> b!1456103 m!1343779))

(assert (=> b!1456106 m!1343743))

(declare-fun m!1343781 () Bool)

(assert (=> b!1456106 m!1343781))

(assert (=> b!1456106 m!1343745))

(assert (=> b!1456106 m!1343747))

(assert (=> b!1456106 m!1343737))

(assert (=> b!1456098 m!1343737))

(assert (=> b!1456098 m!1343737))

(declare-fun m!1343783 () Bool)

(assert (=> b!1456098 m!1343783))

(check-sat (not b!1456100) (not b!1456105) (not b!1456093) (not b!1456109) (not b!1456107) (not b!1456099) (not b!1456095) (not b!1456094) (not b!1456097) (not b!1456090) (not b!1456092) (not b!1456110) (not start!125050) (not b!1456108) (not b!1456089) (not b!1456098))
(check-sat)
