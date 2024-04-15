; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124558 () Bool)

(assert start!124558)

(declare-fun b!1442192 () Bool)

(declare-fun e!812847 () Bool)

(declare-fun e!812843 () Bool)

(assert (=> b!1442192 (= e!812847 e!812843)))

(declare-fun res!974546 () Bool)

(assert (=> b!1442192 (=> (not res!974546) (not e!812843))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97984 0))(
  ( (array!97985 (arr!47281 (Array (_ BitVec 32) (_ BitVec 64))) (size!47833 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97984)

(assert (=> b!1442192 (= res!974546 (= (select (store (arr!47281 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!633312 () array!97984)

(assert (=> b!1442192 (= lt!633312 (array!97985 (store (arr!47281 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47833 a!2862)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!812841 () Bool)

(declare-fun b!1442193 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1442193 (= e!812841 (or (= (select (arr!47281 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47281 a!2862) intermediateBeforeIndex!19) (select (arr!47281 a!2862) j!93))))))

(declare-fun res!974539 () Bool)

(assert (=> start!124558 (=> (not res!974539) (not e!812847))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124558 (= res!974539 (validMask!0 mask!2687))))

(assert (=> start!124558 e!812847))

(assert (=> start!124558 true))

(declare-fun array_inv!36514 (array!97984) Bool)

(assert (=> start!124558 (array_inv!36514 a!2862)))

(declare-fun b!1442194 () Bool)

(declare-fun res!974538 () Bool)

(assert (=> b!1442194 (=> (not res!974538) (not e!812847))))

(declare-datatypes ((List!33860 0))(
  ( (Nil!33857) (Cons!33856 (h!35206 (_ BitVec 64)) (t!48546 List!33860)) )
))
(declare-fun arrayNoDuplicates!0 (array!97984 (_ BitVec 32) List!33860) Bool)

(assert (=> b!1442194 (= res!974538 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33857))))

(declare-fun b!1442195 () Bool)

(declare-fun res!974542 () Bool)

(declare-fun e!812845 () Bool)

(assert (=> b!1442195 (=> (not res!974542) (not e!812845))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11558 0))(
  ( (MissingZero!11558 (index!48624 (_ BitVec 32))) (Found!11558 (index!48625 (_ BitVec 32))) (Intermediate!11558 (undefined!12370 Bool) (index!48626 (_ BitVec 32)) (x!130330 (_ BitVec 32))) (Undefined!11558) (MissingVacant!11558 (index!48627 (_ BitVec 32))) )
))
(declare-fun lt!633311 () SeekEntryResult!11558)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97984 (_ BitVec 32)) SeekEntryResult!11558)

(assert (=> b!1442195 (= res!974542 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47281 a!2862) j!93) a!2862 mask!2687) lt!633311))))

(declare-fun b!1442196 () Bool)

(declare-fun e!812844 () Bool)

(assert (=> b!1442196 (= e!812844 (not true))))

(assert (=> b!1442196 e!812841))

(declare-fun res!974545 () Bool)

(assert (=> b!1442196 (=> (not res!974545) (not e!812841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97984 (_ BitVec 32)) Bool)

(assert (=> b!1442196 (= res!974545 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48453 0))(
  ( (Unit!48454) )
))
(declare-fun lt!633315 () Unit!48453)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97984 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48453)

(assert (=> b!1442196 (= lt!633315 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1442197 () Bool)

(declare-fun res!974544 () Bool)

(assert (=> b!1442197 (=> (not res!974544) (not e!812847))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442197 (= res!974544 (validKeyInArray!0 (select (arr!47281 a!2862) j!93)))))

(declare-fun b!1442198 () Bool)

(declare-fun res!974547 () Bool)

(assert (=> b!1442198 (=> (not res!974547) (not e!812847))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1442198 (= res!974547 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47833 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47833 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47833 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun e!812846 () Bool)

(declare-fun lt!633314 () (_ BitVec 64))

(declare-fun b!1442199 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97984 (_ BitVec 32)) SeekEntryResult!11558)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97984 (_ BitVec 32)) SeekEntryResult!11558)

(assert (=> b!1442199 (= e!812846 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633314 lt!633312 mask!2687) (seekEntryOrOpen!0 lt!633314 lt!633312 mask!2687)))))

(declare-fun b!1442200 () Bool)

(declare-fun res!974541 () Bool)

(assert (=> b!1442200 (=> (not res!974541) (not e!812844))))

(assert (=> b!1442200 (= res!974541 e!812846)))

(declare-fun c!133342 () Bool)

(assert (=> b!1442200 (= c!133342 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1442201 () Bool)

(assert (=> b!1442201 (= e!812843 e!812845)))

(declare-fun res!974535 () Bool)

(assert (=> b!1442201 (=> (not res!974535) (not e!812845))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442201 (= res!974535 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47281 a!2862) j!93) mask!2687) (select (arr!47281 a!2862) j!93) a!2862 mask!2687) lt!633311))))

(assert (=> b!1442201 (= lt!633311 (Intermediate!11558 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442202 () Bool)

(declare-fun res!974534 () Bool)

(assert (=> b!1442202 (=> (not res!974534) (not e!812844))))

(assert (=> b!1442202 (= res!974534 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1442203 () Bool)

(assert (=> b!1442203 (= e!812845 e!812844)))

(declare-fun res!974548 () Bool)

(assert (=> b!1442203 (=> (not res!974548) (not e!812844))))

(declare-fun lt!633313 () SeekEntryResult!11558)

(assert (=> b!1442203 (= res!974548 (= lt!633313 (Intermediate!11558 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1442203 (= lt!633313 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633314 mask!2687) lt!633314 lt!633312 mask!2687))))

(assert (=> b!1442203 (= lt!633314 (select (store (arr!47281 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1442204 () Bool)

(declare-fun res!974540 () Bool)

(assert (=> b!1442204 (=> (not res!974540) (not e!812847))))

(assert (=> b!1442204 (= res!974540 (validKeyInArray!0 (select (arr!47281 a!2862) i!1006)))))

(declare-fun b!1442205 () Bool)

(declare-fun res!974537 () Bool)

(assert (=> b!1442205 (=> (not res!974537) (not e!812847))))

(assert (=> b!1442205 (= res!974537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442206 () Bool)

(declare-fun res!974536 () Bool)

(assert (=> b!1442206 (=> (not res!974536) (not e!812847))))

(assert (=> b!1442206 (= res!974536 (and (= (size!47833 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47833 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47833 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1442207 () Bool)

(assert (=> b!1442207 (= e!812846 (= lt!633313 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633314 lt!633312 mask!2687)))))

(declare-fun b!1442208 () Bool)

(declare-fun res!974543 () Bool)

(assert (=> b!1442208 (=> (not res!974543) (not e!812841))))

(assert (=> b!1442208 (= res!974543 (= (seekEntryOrOpen!0 (select (arr!47281 a!2862) j!93) a!2862 mask!2687) (Found!11558 j!93)))))

(assert (= (and start!124558 res!974539) b!1442206))

(assert (= (and b!1442206 res!974536) b!1442204))

(assert (= (and b!1442204 res!974540) b!1442197))

(assert (= (and b!1442197 res!974544) b!1442205))

(assert (= (and b!1442205 res!974537) b!1442194))

(assert (= (and b!1442194 res!974538) b!1442198))

(assert (= (and b!1442198 res!974547) b!1442192))

(assert (= (and b!1442192 res!974546) b!1442201))

(assert (= (and b!1442201 res!974535) b!1442195))

(assert (= (and b!1442195 res!974542) b!1442203))

(assert (= (and b!1442203 res!974548) b!1442200))

(assert (= (and b!1442200 c!133342) b!1442207))

(assert (= (and b!1442200 (not c!133342)) b!1442199))

(assert (= (and b!1442200 res!974541) b!1442202))

(assert (= (and b!1442202 res!974534) b!1442196))

(assert (= (and b!1442196 res!974545) b!1442208))

(assert (= (and b!1442208 res!974543) b!1442193))

(declare-fun m!1330869 () Bool)

(assert (=> b!1442203 m!1330869))

(assert (=> b!1442203 m!1330869))

(declare-fun m!1330871 () Bool)

(assert (=> b!1442203 m!1330871))

(declare-fun m!1330873 () Bool)

(assert (=> b!1442203 m!1330873))

(declare-fun m!1330875 () Bool)

(assert (=> b!1442203 m!1330875))

(declare-fun m!1330877 () Bool)

(assert (=> b!1442207 m!1330877))

(declare-fun m!1330879 () Bool)

(assert (=> b!1442197 m!1330879))

(assert (=> b!1442197 m!1330879))

(declare-fun m!1330881 () Bool)

(assert (=> b!1442197 m!1330881))

(declare-fun m!1330883 () Bool)

(assert (=> b!1442194 m!1330883))

(declare-fun m!1330885 () Bool)

(assert (=> b!1442199 m!1330885))

(declare-fun m!1330887 () Bool)

(assert (=> b!1442199 m!1330887))

(assert (=> b!1442192 m!1330873))

(declare-fun m!1330889 () Bool)

(assert (=> b!1442192 m!1330889))

(assert (=> b!1442201 m!1330879))

(assert (=> b!1442201 m!1330879))

(declare-fun m!1330891 () Bool)

(assert (=> b!1442201 m!1330891))

(assert (=> b!1442201 m!1330891))

(assert (=> b!1442201 m!1330879))

(declare-fun m!1330893 () Bool)

(assert (=> b!1442201 m!1330893))

(declare-fun m!1330895 () Bool)

(assert (=> b!1442205 m!1330895))

(declare-fun m!1330897 () Bool)

(assert (=> start!124558 m!1330897))

(declare-fun m!1330899 () Bool)

(assert (=> start!124558 m!1330899))

(assert (=> b!1442208 m!1330879))

(assert (=> b!1442208 m!1330879))

(declare-fun m!1330901 () Bool)

(assert (=> b!1442208 m!1330901))

(declare-fun m!1330903 () Bool)

(assert (=> b!1442196 m!1330903))

(declare-fun m!1330905 () Bool)

(assert (=> b!1442196 m!1330905))

(assert (=> b!1442195 m!1330879))

(assert (=> b!1442195 m!1330879))

(declare-fun m!1330907 () Bool)

(assert (=> b!1442195 m!1330907))

(declare-fun m!1330909 () Bool)

(assert (=> b!1442193 m!1330909))

(assert (=> b!1442193 m!1330879))

(declare-fun m!1330911 () Bool)

(assert (=> b!1442204 m!1330911))

(assert (=> b!1442204 m!1330911))

(declare-fun m!1330913 () Bool)

(assert (=> b!1442204 m!1330913))

(check-sat (not b!1442194) (not b!1442208) (not b!1442197) (not b!1442204) (not b!1442203) (not b!1442205) (not b!1442201) (not b!1442195) (not b!1442196) (not b!1442207) (not start!124558) (not b!1442199))
(check-sat)
