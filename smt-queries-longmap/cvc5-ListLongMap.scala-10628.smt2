; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124906 () Bool)

(assert start!124906)

(declare-fun b!1451126 () Bool)

(declare-fun res!982404 () Bool)

(declare-fun e!817089 () Bool)

(assert (=> b!1451126 (=> (not res!982404) (not e!817089))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98354 0))(
  ( (array!98355 (arr!47465 (Array (_ BitVec 32) (_ BitVec 64))) (size!48015 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98354)

(assert (=> b!1451126 (= res!982404 (and (= (size!48015 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48015 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48015 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1451127 () Bool)

(declare-fun res!982397 () Bool)

(assert (=> b!1451127 (=> (not res!982397) (not e!817089))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1451127 (= res!982397 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48015 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48015 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48015 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1451128 () Bool)

(declare-fun res!982406 () Bool)

(assert (=> b!1451128 (=> (not res!982406) (not e!817089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98354 (_ BitVec 32)) Bool)

(assert (=> b!1451128 (= res!982406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1451129 () Bool)

(declare-fun e!817092 () Bool)

(assert (=> b!1451129 (= e!817092 (and (or (= (select (arr!47465 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47465 a!2862) intermediateBeforeIndex!19) (select (arr!47465 a!2862) j!93))) (or (and (= (select (arr!47465 a!2862) index!646) (select (store (arr!47465 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47465 a!2862) index!646) (select (arr!47465 a!2862) j!93))) (= (select (arr!47465 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47465 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1451130 () Bool)

(declare-fun res!982408 () Bool)

(assert (=> b!1451130 (=> (not res!982408) (not e!817092))))

(declare-datatypes ((SeekEntryResult!11717 0))(
  ( (MissingZero!11717 (index!49260 (_ BitVec 32))) (Found!11717 (index!49261 (_ BitVec 32))) (Intermediate!11717 (undefined!12529 Bool) (index!49262 (_ BitVec 32)) (x!130918 (_ BitVec 32))) (Undefined!11717) (MissingVacant!11717 (index!49263 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98354 (_ BitVec 32)) SeekEntryResult!11717)

(assert (=> b!1451130 (= res!982408 (= (seekEntryOrOpen!0 (select (arr!47465 a!2862) j!93) a!2862 mask!2687) (Found!11717 j!93)))))

(declare-fun b!1451131 () Bool)

(declare-fun res!982398 () Bool)

(declare-fun e!817093 () Bool)

(assert (=> b!1451131 (=> (not res!982398) (not e!817093))))

(assert (=> b!1451131 (= res!982398 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun lt!636561 () array!98354)

(declare-fun e!817088 () Bool)

(declare-fun b!1451132 () Bool)

(declare-fun lt!636563 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98354 (_ BitVec 32)) SeekEntryResult!11717)

(assert (=> b!1451132 (= e!817088 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636563 lt!636561 mask!2687) (seekEntryOrOpen!0 lt!636563 lt!636561 mask!2687)))))

(declare-fun b!1451133 () Bool)

(declare-fun res!982407 () Bool)

(declare-fun e!817091 () Bool)

(assert (=> b!1451133 (=> (not res!982407) (not e!817091))))

(declare-fun lt!636564 () SeekEntryResult!11717)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98354 (_ BitVec 32)) SeekEntryResult!11717)

(assert (=> b!1451133 (= res!982407 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47465 a!2862) j!93) a!2862 mask!2687) lt!636564))))

(declare-fun b!1451134 () Bool)

(assert (=> b!1451134 (= e!817093 (not true))))

(assert (=> b!1451134 e!817092))

(declare-fun res!982402 () Bool)

(assert (=> b!1451134 (=> (not res!982402) (not e!817092))))

(assert (=> b!1451134 (= res!982402 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48930 0))(
  ( (Unit!48931) )
))
(declare-fun lt!636560 () Unit!48930)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98354 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48930)

(assert (=> b!1451134 (= lt!636560 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1451135 () Bool)

(declare-fun e!817090 () Bool)

(assert (=> b!1451135 (= e!817090 e!817091)))

(declare-fun res!982399 () Bool)

(assert (=> b!1451135 (=> (not res!982399) (not e!817091))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451135 (= res!982399 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47465 a!2862) j!93) mask!2687) (select (arr!47465 a!2862) j!93) a!2862 mask!2687) lt!636564))))

(assert (=> b!1451135 (= lt!636564 (Intermediate!11717 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1451136 () Bool)

(declare-fun res!982400 () Bool)

(assert (=> b!1451136 (=> (not res!982400) (not e!817089))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1451136 (= res!982400 (validKeyInArray!0 (select (arr!47465 a!2862) i!1006)))))

(declare-fun res!982405 () Bool)

(assert (=> start!124906 (=> (not res!982405) (not e!817089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124906 (= res!982405 (validMask!0 mask!2687))))

(assert (=> start!124906 e!817089))

(assert (=> start!124906 true))

(declare-fun array_inv!36493 (array!98354) Bool)

(assert (=> start!124906 (array_inv!36493 a!2862)))

(declare-fun b!1451137 () Bool)

(declare-fun res!982403 () Bool)

(assert (=> b!1451137 (=> (not res!982403) (not e!817093))))

(assert (=> b!1451137 (= res!982403 e!817088)))

(declare-fun c!133875 () Bool)

(assert (=> b!1451137 (= c!133875 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1451138 () Bool)

(assert (=> b!1451138 (= e!817089 e!817090)))

(declare-fun res!982401 () Bool)

(assert (=> b!1451138 (=> (not res!982401) (not e!817090))))

(assert (=> b!1451138 (= res!982401 (= (select (store (arr!47465 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1451138 (= lt!636561 (array!98355 (store (arr!47465 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48015 a!2862)))))

(declare-fun b!1451139 () Bool)

(declare-fun res!982409 () Bool)

(assert (=> b!1451139 (=> (not res!982409) (not e!817089))))

(assert (=> b!1451139 (= res!982409 (validKeyInArray!0 (select (arr!47465 a!2862) j!93)))))

(declare-fun b!1451140 () Bool)

(declare-fun lt!636562 () SeekEntryResult!11717)

(assert (=> b!1451140 (= e!817088 (= lt!636562 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636563 lt!636561 mask!2687)))))

(declare-fun b!1451141 () Bool)

(assert (=> b!1451141 (= e!817091 e!817093)))

(declare-fun res!982410 () Bool)

(assert (=> b!1451141 (=> (not res!982410) (not e!817093))))

(assert (=> b!1451141 (= res!982410 (= lt!636562 (Intermediate!11717 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1451141 (= lt!636562 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636563 mask!2687) lt!636563 lt!636561 mask!2687))))

(assert (=> b!1451141 (= lt!636563 (select (store (arr!47465 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1451142 () Bool)

(declare-fun res!982411 () Bool)

(assert (=> b!1451142 (=> (not res!982411) (not e!817089))))

(declare-datatypes ((List!33966 0))(
  ( (Nil!33963) (Cons!33962 (h!35312 (_ BitVec 64)) (t!48660 List!33966)) )
))
(declare-fun arrayNoDuplicates!0 (array!98354 (_ BitVec 32) List!33966) Bool)

(assert (=> b!1451142 (= res!982411 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33963))))

(assert (= (and start!124906 res!982405) b!1451126))

(assert (= (and b!1451126 res!982404) b!1451136))

(assert (= (and b!1451136 res!982400) b!1451139))

(assert (= (and b!1451139 res!982409) b!1451128))

(assert (= (and b!1451128 res!982406) b!1451142))

(assert (= (and b!1451142 res!982411) b!1451127))

(assert (= (and b!1451127 res!982397) b!1451138))

(assert (= (and b!1451138 res!982401) b!1451135))

(assert (= (and b!1451135 res!982399) b!1451133))

(assert (= (and b!1451133 res!982407) b!1451141))

(assert (= (and b!1451141 res!982410) b!1451137))

(assert (= (and b!1451137 c!133875) b!1451140))

(assert (= (and b!1451137 (not c!133875)) b!1451132))

(assert (= (and b!1451137 res!982403) b!1451131))

(assert (= (and b!1451131 res!982398) b!1451134))

(assert (= (and b!1451134 res!982402) b!1451130))

(assert (= (and b!1451130 res!982408) b!1451129))

(declare-fun m!1339729 () Bool)

(assert (=> b!1451139 m!1339729))

(assert (=> b!1451139 m!1339729))

(declare-fun m!1339731 () Bool)

(assert (=> b!1451139 m!1339731))

(declare-fun m!1339733 () Bool)

(assert (=> b!1451138 m!1339733))

(declare-fun m!1339735 () Bool)

(assert (=> b!1451138 m!1339735))

(assert (=> b!1451129 m!1339733))

(declare-fun m!1339737 () Bool)

(assert (=> b!1451129 m!1339737))

(declare-fun m!1339739 () Bool)

(assert (=> b!1451129 m!1339739))

(declare-fun m!1339741 () Bool)

(assert (=> b!1451129 m!1339741))

(assert (=> b!1451129 m!1339729))

(assert (=> b!1451130 m!1339729))

(assert (=> b!1451130 m!1339729))

(declare-fun m!1339743 () Bool)

(assert (=> b!1451130 m!1339743))

(declare-fun m!1339745 () Bool)

(assert (=> start!124906 m!1339745))

(declare-fun m!1339747 () Bool)

(assert (=> start!124906 m!1339747))

(assert (=> b!1451135 m!1339729))

(assert (=> b!1451135 m!1339729))

(declare-fun m!1339749 () Bool)

(assert (=> b!1451135 m!1339749))

(assert (=> b!1451135 m!1339749))

(assert (=> b!1451135 m!1339729))

(declare-fun m!1339751 () Bool)

(assert (=> b!1451135 m!1339751))

(declare-fun m!1339753 () Bool)

(assert (=> b!1451142 m!1339753))

(declare-fun m!1339755 () Bool)

(assert (=> b!1451140 m!1339755))

(declare-fun m!1339757 () Bool)

(assert (=> b!1451141 m!1339757))

(assert (=> b!1451141 m!1339757))

(declare-fun m!1339759 () Bool)

(assert (=> b!1451141 m!1339759))

(assert (=> b!1451141 m!1339733))

(declare-fun m!1339761 () Bool)

(assert (=> b!1451141 m!1339761))

(assert (=> b!1451133 m!1339729))

(assert (=> b!1451133 m!1339729))

(declare-fun m!1339763 () Bool)

(assert (=> b!1451133 m!1339763))

(declare-fun m!1339765 () Bool)

(assert (=> b!1451136 m!1339765))

(assert (=> b!1451136 m!1339765))

(declare-fun m!1339767 () Bool)

(assert (=> b!1451136 m!1339767))

(declare-fun m!1339769 () Bool)

(assert (=> b!1451128 m!1339769))

(declare-fun m!1339771 () Bool)

(assert (=> b!1451132 m!1339771))

(declare-fun m!1339773 () Bool)

(assert (=> b!1451132 m!1339773))

(declare-fun m!1339775 () Bool)

(assert (=> b!1451134 m!1339775))

(declare-fun m!1339777 () Bool)

(assert (=> b!1451134 m!1339777))

(push 1)

