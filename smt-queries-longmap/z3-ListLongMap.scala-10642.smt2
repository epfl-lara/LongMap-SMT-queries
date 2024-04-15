; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124960 () Bool)

(assert start!124960)

(declare-fun b!1453151 () Bool)

(declare-fun res!984304 () Bool)

(declare-fun e!817918 () Bool)

(assert (=> b!1453151 (=> (not res!984304) (not e!817918))))

(declare-datatypes ((array!98386 0))(
  ( (array!98387 (arr!47482 (Array (_ BitVec 32) (_ BitVec 64))) (size!48034 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98386)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1453151 (= res!984304 (validKeyInArray!0 (select (arr!47482 a!2862) j!93)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!817913 () Bool)

(declare-fun b!1453152 () Bool)

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1453152 (= e!817913 (not (or (and (= (select (arr!47482 a!2862) index!646) (select (store (arr!47482 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47482 a!2862) index!646) (select (arr!47482 a!2862) j!93))) (= (select (arr!47482 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvslt mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(declare-fun e!817915 () Bool)

(assert (=> b!1453152 e!817915))

(declare-fun res!984301 () Bool)

(assert (=> b!1453152 (=> (not res!984301) (not e!817915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98386 (_ BitVec 32)) Bool)

(assert (=> b!1453152 (= res!984301 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48855 0))(
  ( (Unit!48856) )
))
(declare-fun lt!636980 () Unit!48855)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98386 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48855)

(assert (=> b!1453152 (= lt!636980 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1453153 () Bool)

(declare-fun res!984293 () Bool)

(assert (=> b!1453153 (=> (not res!984293) (not e!817915))))

(declare-datatypes ((SeekEntryResult!11759 0))(
  ( (MissingZero!11759 (index!49428 (_ BitVec 32))) (Found!11759 (index!49429 (_ BitVec 32))) (Intermediate!11759 (undefined!12571 Bool) (index!49430 (_ BitVec 32)) (x!131067 (_ BitVec 32))) (Undefined!11759) (MissingVacant!11759 (index!49431 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98386 (_ BitVec 32)) SeekEntryResult!11759)

(assert (=> b!1453153 (= res!984293 (= (seekEntryOrOpen!0 (select (arr!47482 a!2862) j!93) a!2862 mask!2687) (Found!11759 j!93)))))

(declare-fun b!1453154 () Bool)

(declare-fun e!817919 () Bool)

(assert (=> b!1453154 (= e!817915 e!817919)))

(declare-fun res!984295 () Bool)

(assert (=> b!1453154 (=> res!984295 e!817919)))

(declare-fun lt!636976 () (_ BitVec 64))

(assert (=> b!1453154 (= res!984295 (or (and (= (select (arr!47482 a!2862) index!646) lt!636976) (= (select (arr!47482 a!2862) index!646) (select (arr!47482 a!2862) j!93))) (= (select (arr!47482 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1453154 (= lt!636976 (select (store (arr!47482 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1453155 () Bool)

(declare-fun res!984290 () Bool)

(assert (=> b!1453155 (=> (not res!984290) (not e!817913))))

(declare-fun e!817914 () Bool)

(assert (=> b!1453155 (= res!984290 e!817914)))

(declare-fun c!133945 () Bool)

(assert (=> b!1453155 (= c!133945 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!984303 () Bool)

(assert (=> start!124960 (=> (not res!984303) (not e!817918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124960 (= res!984303 (validMask!0 mask!2687))))

(assert (=> start!124960 e!817918))

(assert (=> start!124960 true))

(declare-fun array_inv!36715 (array!98386) Bool)

(assert (=> start!124960 (array_inv!36715 a!2862)))

(declare-fun lt!636977 () (_ BitVec 64))

(declare-fun b!1453156 () Bool)

(declare-fun lt!636981 () array!98386)

(declare-fun lt!636979 () SeekEntryResult!11759)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98386 (_ BitVec 32)) SeekEntryResult!11759)

(assert (=> b!1453156 (= e!817914 (= lt!636979 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636977 lt!636981 mask!2687)))))

(declare-fun b!1453157 () Bool)

(declare-fun res!984287 () Bool)

(assert (=> b!1453157 (=> (not res!984287) (not e!817918))))

(assert (=> b!1453157 (= res!984287 (and (= (size!48034 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48034 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48034 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1453158 () Bool)

(declare-fun e!817920 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98386 (_ BitVec 32)) SeekEntryResult!11759)

(assert (=> b!1453158 (= e!817920 (= (seekEntryOrOpen!0 lt!636977 lt!636981 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636977 lt!636981 mask!2687)))))

(declare-fun b!1453159 () Bool)

(declare-fun e!817916 () Bool)

(assert (=> b!1453159 (= e!817916 e!817913)))

(declare-fun res!984299 () Bool)

(assert (=> b!1453159 (=> (not res!984299) (not e!817913))))

(assert (=> b!1453159 (= res!984299 (= lt!636979 (Intermediate!11759 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1453159 (= lt!636979 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636977 mask!2687) lt!636977 lt!636981 mask!2687))))

(assert (=> b!1453159 (= lt!636977 (select (store (arr!47482 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1453160 () Bool)

(declare-fun res!984297 () Bool)

(assert (=> b!1453160 (=> (not res!984297) (not e!817918))))

(assert (=> b!1453160 (= res!984297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1453161 () Bool)

(declare-fun res!984302 () Bool)

(assert (=> b!1453161 (=> (not res!984302) (not e!817918))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1453161 (= res!984302 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48034 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48034 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48034 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1453162 () Bool)

(assert (=> b!1453162 (= e!817914 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636977 lt!636981 mask!2687) (seekEntryOrOpen!0 lt!636977 lt!636981 mask!2687)))))

(declare-fun b!1453163 () Bool)

(assert (=> b!1453163 (= e!817919 e!817920)))

(declare-fun res!984289 () Bool)

(assert (=> b!1453163 (=> (not res!984289) (not e!817920))))

(assert (=> b!1453163 (= res!984289 (and (= index!646 intermediateAfterIndex!19) (= lt!636976 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1453164 () Bool)

(declare-fun res!984300 () Bool)

(assert (=> b!1453164 (=> (not res!984300) (not e!817916))))

(declare-fun lt!636978 () SeekEntryResult!11759)

(assert (=> b!1453164 (= res!984300 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47482 a!2862) j!93) a!2862 mask!2687) lt!636978))))

(declare-fun b!1453165 () Bool)

(declare-fun res!984294 () Bool)

(assert (=> b!1453165 (=> (not res!984294) (not e!817913))))

(assert (=> b!1453165 (= res!984294 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1453166 () Bool)

(declare-fun e!817912 () Bool)

(assert (=> b!1453166 (= e!817912 e!817916)))

(declare-fun res!984288 () Bool)

(assert (=> b!1453166 (=> (not res!984288) (not e!817916))))

(assert (=> b!1453166 (= res!984288 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47482 a!2862) j!93) mask!2687) (select (arr!47482 a!2862) j!93) a!2862 mask!2687) lt!636978))))

(assert (=> b!1453166 (= lt!636978 (Intermediate!11759 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1453167 () Bool)

(declare-fun res!984296 () Bool)

(assert (=> b!1453167 (=> (not res!984296) (not e!817918))))

(assert (=> b!1453167 (= res!984296 (validKeyInArray!0 (select (arr!47482 a!2862) i!1006)))))

(declare-fun b!1453168 () Bool)

(assert (=> b!1453168 (= e!817918 e!817912)))

(declare-fun res!984298 () Bool)

(assert (=> b!1453168 (=> (not res!984298) (not e!817912))))

(assert (=> b!1453168 (= res!984298 (= (select (store (arr!47482 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1453168 (= lt!636981 (array!98387 (store (arr!47482 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48034 a!2862)))))

(declare-fun b!1453169 () Bool)

(declare-fun res!984292 () Bool)

(assert (=> b!1453169 (=> (not res!984292) (not e!817918))))

(declare-datatypes ((List!34061 0))(
  ( (Nil!34058) (Cons!34057 (h!35407 (_ BitVec 64)) (t!48747 List!34061)) )
))
(declare-fun arrayNoDuplicates!0 (array!98386 (_ BitVec 32) List!34061) Bool)

(assert (=> b!1453169 (= res!984292 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34058))))

(declare-fun b!1453170 () Bool)

(declare-fun res!984291 () Bool)

(assert (=> b!1453170 (=> (not res!984291) (not e!817915))))

(assert (=> b!1453170 (= res!984291 (or (= (select (arr!47482 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47482 a!2862) intermediateBeforeIndex!19) (select (arr!47482 a!2862) j!93))))))

(assert (= (and start!124960 res!984303) b!1453157))

(assert (= (and b!1453157 res!984287) b!1453167))

(assert (= (and b!1453167 res!984296) b!1453151))

(assert (= (and b!1453151 res!984304) b!1453160))

(assert (= (and b!1453160 res!984297) b!1453169))

(assert (= (and b!1453169 res!984292) b!1453161))

(assert (= (and b!1453161 res!984302) b!1453168))

(assert (= (and b!1453168 res!984298) b!1453166))

(assert (= (and b!1453166 res!984288) b!1453164))

(assert (= (and b!1453164 res!984300) b!1453159))

(assert (= (and b!1453159 res!984299) b!1453155))

(assert (= (and b!1453155 c!133945) b!1453156))

(assert (= (and b!1453155 (not c!133945)) b!1453162))

(assert (= (and b!1453155 res!984290) b!1453165))

(assert (= (and b!1453165 res!984294) b!1453152))

(assert (= (and b!1453152 res!984301) b!1453153))

(assert (= (and b!1453153 res!984293) b!1453170))

(assert (= (and b!1453170 res!984291) b!1453154))

(assert (= (and b!1453154 (not res!984295)) b!1453163))

(assert (= (and b!1453163 res!984289) b!1453158))

(declare-fun m!1341165 () Bool)

(assert (=> b!1453151 m!1341165))

(assert (=> b!1453151 m!1341165))

(declare-fun m!1341167 () Bool)

(assert (=> b!1453151 m!1341167))

(declare-fun m!1341169 () Bool)

(assert (=> b!1453158 m!1341169))

(declare-fun m!1341171 () Bool)

(assert (=> b!1453158 m!1341171))

(declare-fun m!1341173 () Bool)

(assert (=> start!124960 m!1341173))

(declare-fun m!1341175 () Bool)

(assert (=> start!124960 m!1341175))

(declare-fun m!1341177 () Bool)

(assert (=> b!1453159 m!1341177))

(assert (=> b!1453159 m!1341177))

(declare-fun m!1341179 () Bool)

(assert (=> b!1453159 m!1341179))

(declare-fun m!1341181 () Bool)

(assert (=> b!1453159 m!1341181))

(declare-fun m!1341183 () Bool)

(assert (=> b!1453159 m!1341183))

(assert (=> b!1453166 m!1341165))

(assert (=> b!1453166 m!1341165))

(declare-fun m!1341185 () Bool)

(assert (=> b!1453166 m!1341185))

(assert (=> b!1453166 m!1341185))

(assert (=> b!1453166 m!1341165))

(declare-fun m!1341187 () Bool)

(assert (=> b!1453166 m!1341187))

(assert (=> b!1453168 m!1341181))

(declare-fun m!1341189 () Bool)

(assert (=> b!1453168 m!1341189))

(declare-fun m!1341191 () Bool)

(assert (=> b!1453167 m!1341191))

(assert (=> b!1453167 m!1341191))

(declare-fun m!1341193 () Bool)

(assert (=> b!1453167 m!1341193))

(declare-fun m!1341195 () Bool)

(assert (=> b!1453169 m!1341195))

(declare-fun m!1341197 () Bool)

(assert (=> b!1453170 m!1341197))

(assert (=> b!1453170 m!1341165))

(assert (=> b!1453153 m!1341165))

(assert (=> b!1453153 m!1341165))

(declare-fun m!1341199 () Bool)

(assert (=> b!1453153 m!1341199))

(declare-fun m!1341201 () Bool)

(assert (=> b!1453152 m!1341201))

(assert (=> b!1453152 m!1341181))

(declare-fun m!1341203 () Bool)

(assert (=> b!1453152 m!1341203))

(declare-fun m!1341205 () Bool)

(assert (=> b!1453152 m!1341205))

(declare-fun m!1341207 () Bool)

(assert (=> b!1453152 m!1341207))

(assert (=> b!1453152 m!1341165))

(assert (=> b!1453154 m!1341205))

(assert (=> b!1453154 m!1341165))

(assert (=> b!1453154 m!1341181))

(assert (=> b!1453154 m!1341203))

(declare-fun m!1341209 () Bool)

(assert (=> b!1453156 m!1341209))

(assert (=> b!1453164 m!1341165))

(assert (=> b!1453164 m!1341165))

(declare-fun m!1341211 () Bool)

(assert (=> b!1453164 m!1341211))

(declare-fun m!1341213 () Bool)

(assert (=> b!1453160 m!1341213))

(assert (=> b!1453162 m!1341171))

(assert (=> b!1453162 m!1341169))

(check-sat (not start!124960) (not b!1453159) (not b!1453152) (not b!1453162) (not b!1453153) (not b!1453167) (not b!1453156) (not b!1453169) (not b!1453166) (not b!1453164) (not b!1453160) (not b!1453151) (not b!1453158))
(check-sat)
