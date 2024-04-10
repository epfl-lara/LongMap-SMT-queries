; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124614 () Bool)

(assert start!124614)

(declare-fun b!1443050 () Bool)

(declare-fun res!975197 () Bool)

(declare-fun e!813230 () Bool)

(assert (=> b!1443050 (=> (not res!975197) (not e!813230))))

(declare-datatypes ((array!98062 0))(
  ( (array!98063 (arr!47319 (Array (_ BitVec 32) (_ BitVec 64))) (size!47869 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98062)

(declare-datatypes ((List!33820 0))(
  ( (Nil!33817) (Cons!33816 (h!35166 (_ BitVec 64)) (t!48514 List!33820)) )
))
(declare-fun arrayNoDuplicates!0 (array!98062 (_ BitVec 32) List!33820) Bool)

(assert (=> b!1443050 (= res!975197 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33817))))

(declare-fun b!1443051 () Bool)

(declare-fun e!813233 () Bool)

(declare-fun e!813235 () Bool)

(assert (=> b!1443051 (= e!813233 e!813235)))

(declare-fun res!975204 () Bool)

(assert (=> b!1443051 (=> (not res!975204) (not e!813235))))

(declare-datatypes ((SeekEntryResult!11571 0))(
  ( (MissingZero!11571 (index!48676 (_ BitVec 32))) (Found!11571 (index!48677 (_ BitVec 32))) (Intermediate!11571 (undefined!12383 Bool) (index!48678 (_ BitVec 32)) (x!130380 (_ BitVec 32))) (Undefined!11571) (MissingVacant!11571 (index!48679 (_ BitVec 32))) )
))
(declare-fun lt!633744 () SeekEntryResult!11571)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1443051 (= res!975204 (= lt!633744 (Intermediate!11571 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633743 () (_ BitVec 64))

(declare-fun lt!633740 () array!98062)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98062 (_ BitVec 32)) SeekEntryResult!11571)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443051 (= lt!633744 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633743 mask!2687) lt!633743 lt!633740 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1443051 (= lt!633743 (select (store (arr!47319 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443052 () Bool)

(declare-fun res!975209 () Bool)

(assert (=> b!1443052 (=> (not res!975209) (not e!813233))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!633742 () SeekEntryResult!11571)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1443052 (= res!975209 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47319 a!2862) j!93) a!2862 mask!2687) lt!633742))))

(declare-fun res!975205 () Bool)

(assert (=> start!124614 (=> (not res!975205) (not e!813230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124614 (= res!975205 (validMask!0 mask!2687))))

(assert (=> start!124614 e!813230))

(assert (=> start!124614 true))

(declare-fun array_inv!36347 (array!98062) Bool)

(assert (=> start!124614 (array_inv!36347 a!2862)))

(declare-fun b!1443053 () Bool)

(declare-fun e!813231 () Bool)

(assert (=> b!1443053 (= e!813231 e!813233)))

(declare-fun res!975203 () Bool)

(assert (=> b!1443053 (=> (not res!975203) (not e!813233))))

(assert (=> b!1443053 (= res!975203 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47319 a!2862) j!93) mask!2687) (select (arr!47319 a!2862) j!93) a!2862 mask!2687) lt!633742))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1443053 (= lt!633742 (Intermediate!11571 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!813232 () Bool)

(declare-fun b!1443054 () Bool)

(assert (=> b!1443054 (= e!813232 (or (= (select (arr!47319 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47319 a!2862) intermediateBeforeIndex!19) (select (arr!47319 a!2862) j!93))))))

(declare-fun b!1443055 () Bool)

(declare-fun res!975206 () Bool)

(assert (=> b!1443055 (=> (not res!975206) (not e!813235))))

(declare-fun e!813236 () Bool)

(assert (=> b!1443055 (= res!975206 e!813236)))

(declare-fun c!133437 () Bool)

(assert (=> b!1443055 (= c!133437 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443056 () Bool)

(declare-fun res!975207 () Bool)

(assert (=> b!1443056 (=> (not res!975207) (not e!813230))))

(assert (=> b!1443056 (= res!975207 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47869 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47869 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47869 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443057 () Bool)

(declare-fun res!975201 () Bool)

(assert (=> b!1443057 (=> (not res!975201) (not e!813230))))

(assert (=> b!1443057 (= res!975201 (and (= (size!47869 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47869 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47869 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1443058 () Bool)

(assert (=> b!1443058 (= e!813230 e!813231)))

(declare-fun res!975211 () Bool)

(assert (=> b!1443058 (=> (not res!975211) (not e!813231))))

(assert (=> b!1443058 (= res!975211 (= (select (store (arr!47319 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1443058 (= lt!633740 (array!98063 (store (arr!47319 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47869 a!2862)))))

(declare-fun b!1443059 () Bool)

(declare-fun res!975200 () Bool)

(assert (=> b!1443059 (=> (not res!975200) (not e!813230))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443059 (= res!975200 (validKeyInArray!0 (select (arr!47319 a!2862) j!93)))))

(declare-fun b!1443060 () Bool)

(declare-fun res!975210 () Bool)

(assert (=> b!1443060 (=> (not res!975210) (not e!813230))))

(assert (=> b!1443060 (= res!975210 (validKeyInArray!0 (select (arr!47319 a!2862) i!1006)))))

(declare-fun b!1443061 () Bool)

(assert (=> b!1443061 (= e!813235 (not true))))

(assert (=> b!1443061 e!813232))

(declare-fun res!975199 () Bool)

(assert (=> b!1443061 (=> (not res!975199) (not e!813232))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98062 (_ BitVec 32)) Bool)

(assert (=> b!1443061 (= res!975199 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48638 0))(
  ( (Unit!48639) )
))
(declare-fun lt!633741 () Unit!48638)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98062 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48638)

(assert (=> b!1443061 (= lt!633741 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1443062 () Bool)

(declare-fun res!975198 () Bool)

(assert (=> b!1443062 (=> (not res!975198) (not e!813235))))

(assert (=> b!1443062 (= res!975198 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1443063 () Bool)

(assert (=> b!1443063 (= e!813236 (= lt!633744 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633743 lt!633740 mask!2687)))))

(declare-fun b!1443064 () Bool)

(declare-fun res!975208 () Bool)

(assert (=> b!1443064 (=> (not res!975208) (not e!813230))))

(assert (=> b!1443064 (= res!975208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1443065 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98062 (_ BitVec 32)) SeekEntryResult!11571)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98062 (_ BitVec 32)) SeekEntryResult!11571)

(assert (=> b!1443065 (= e!813236 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633743 lt!633740 mask!2687) (seekEntryOrOpen!0 lt!633743 lt!633740 mask!2687)))))

(declare-fun b!1443066 () Bool)

(declare-fun res!975202 () Bool)

(assert (=> b!1443066 (=> (not res!975202) (not e!813232))))

(assert (=> b!1443066 (= res!975202 (= (seekEntryOrOpen!0 (select (arr!47319 a!2862) j!93) a!2862 mask!2687) (Found!11571 j!93)))))

(assert (= (and start!124614 res!975205) b!1443057))

(assert (= (and b!1443057 res!975201) b!1443060))

(assert (= (and b!1443060 res!975210) b!1443059))

(assert (= (and b!1443059 res!975200) b!1443064))

(assert (= (and b!1443064 res!975208) b!1443050))

(assert (= (and b!1443050 res!975197) b!1443056))

(assert (= (and b!1443056 res!975207) b!1443058))

(assert (= (and b!1443058 res!975211) b!1443053))

(assert (= (and b!1443053 res!975203) b!1443052))

(assert (= (and b!1443052 res!975209) b!1443051))

(assert (= (and b!1443051 res!975204) b!1443055))

(assert (= (and b!1443055 c!133437) b!1443063))

(assert (= (and b!1443055 (not c!133437)) b!1443065))

(assert (= (and b!1443055 res!975206) b!1443062))

(assert (= (and b!1443062 res!975198) b!1443061))

(assert (= (and b!1443061 res!975199) b!1443066))

(assert (= (and b!1443066 res!975202) b!1443054))

(declare-fun m!1332155 () Bool)

(assert (=> b!1443050 m!1332155))

(declare-fun m!1332157 () Bool)

(assert (=> b!1443063 m!1332157))

(declare-fun m!1332159 () Bool)

(assert (=> b!1443058 m!1332159))

(declare-fun m!1332161 () Bool)

(assert (=> b!1443058 m!1332161))

(declare-fun m!1332163 () Bool)

(assert (=> b!1443060 m!1332163))

(assert (=> b!1443060 m!1332163))

(declare-fun m!1332165 () Bool)

(assert (=> b!1443060 m!1332165))

(declare-fun m!1332167 () Bool)

(assert (=> b!1443066 m!1332167))

(assert (=> b!1443066 m!1332167))

(declare-fun m!1332169 () Bool)

(assert (=> b!1443066 m!1332169))

(assert (=> b!1443052 m!1332167))

(assert (=> b!1443052 m!1332167))

(declare-fun m!1332171 () Bool)

(assert (=> b!1443052 m!1332171))

(assert (=> b!1443059 m!1332167))

(assert (=> b!1443059 m!1332167))

(declare-fun m!1332173 () Bool)

(assert (=> b!1443059 m!1332173))

(declare-fun m!1332175 () Bool)

(assert (=> b!1443064 m!1332175))

(declare-fun m!1332177 () Bool)

(assert (=> b!1443061 m!1332177))

(declare-fun m!1332179 () Bool)

(assert (=> b!1443061 m!1332179))

(declare-fun m!1332181 () Bool)

(assert (=> b!1443065 m!1332181))

(declare-fun m!1332183 () Bool)

(assert (=> b!1443065 m!1332183))

(declare-fun m!1332185 () Bool)

(assert (=> b!1443054 m!1332185))

(assert (=> b!1443054 m!1332167))

(assert (=> b!1443053 m!1332167))

(assert (=> b!1443053 m!1332167))

(declare-fun m!1332187 () Bool)

(assert (=> b!1443053 m!1332187))

(assert (=> b!1443053 m!1332187))

(assert (=> b!1443053 m!1332167))

(declare-fun m!1332189 () Bool)

(assert (=> b!1443053 m!1332189))

(declare-fun m!1332191 () Bool)

(assert (=> start!124614 m!1332191))

(declare-fun m!1332193 () Bool)

(assert (=> start!124614 m!1332193))

(declare-fun m!1332195 () Bool)

(assert (=> b!1443051 m!1332195))

(assert (=> b!1443051 m!1332195))

(declare-fun m!1332197 () Bool)

(assert (=> b!1443051 m!1332197))

(assert (=> b!1443051 m!1332159))

(declare-fun m!1332199 () Bool)

(assert (=> b!1443051 m!1332199))

(check-sat (not b!1443064) (not b!1443051) (not start!124614) (not b!1443052) (not b!1443060) (not b!1443053) (not b!1443065) (not b!1443061) (not b!1443066) (not b!1443059) (not b!1443063) (not b!1443050))
(check-sat)
