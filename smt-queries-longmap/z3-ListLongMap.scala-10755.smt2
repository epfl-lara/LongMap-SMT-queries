; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125758 () Bool)

(assert start!125758)

(declare-fun b!1472069 () Bool)

(declare-fun res!999882 () Bool)

(declare-fun e!826163 () Bool)

(assert (=> b!1472069 (=> (not res!999882) (not e!826163))))

(declare-fun e!826161 () Bool)

(assert (=> b!1472069 (= res!999882 e!826161)))

(declare-fun c!135616 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1472069 (= c!135616 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1472070 () Bool)

(declare-fun e!826166 () Bool)

(declare-fun e!826167 () Bool)

(assert (=> b!1472070 (= e!826166 e!826167)))

(declare-fun res!999872 () Bool)

(assert (=> b!1472070 (=> (not res!999872) (not e!826167))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99070 0))(
  ( (array!99071 (arr!47821 (Array (_ BitVec 32) (_ BitVec 64))) (size!48373 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99070)

(assert (=> b!1472070 (= res!999872 (= (select (store (arr!47821 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!643286 () array!99070)

(assert (=> b!1472070 (= lt!643286 (array!99071 (store (arr!47821 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48373 a!2862)))))

(declare-fun b!1472071 () Bool)

(declare-fun res!999881 () Bool)

(assert (=> b!1472071 (=> (not res!999881) (not e!826166))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1472071 (= res!999881 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48373 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48373 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48373 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun b!1472072 () Bool)

(declare-fun lt!643288 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12086 0))(
  ( (MissingZero!12086 (index!50736 (_ BitVec 32))) (Found!12086 (index!50737 (_ BitVec 32))) (Intermediate!12086 (undefined!12898 Bool) (index!50738 (_ BitVec 32)) (x!132316 (_ BitVec 32))) (Undefined!12086) (MissingVacant!12086 (index!50739 (_ BitVec 32))) )
))
(declare-fun lt!643287 () SeekEntryResult!12086)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99070 (_ BitVec 32)) SeekEntryResult!12086)

(assert (=> b!1472072 (= e!826161 (= lt!643287 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643288 lt!643286 mask!2687)))))

(declare-fun b!1472073 () Bool)

(declare-fun e!826164 () Bool)

(assert (=> b!1472073 (= e!826167 e!826164)))

(declare-fun res!999875 () Bool)

(assert (=> b!1472073 (=> (not res!999875) (not e!826164))))

(declare-fun lt!643289 () SeekEntryResult!12086)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472073 (= res!999875 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47821 a!2862) j!93) mask!2687) (select (arr!47821 a!2862) j!93) a!2862 mask!2687) lt!643289))))

(assert (=> b!1472073 (= lt!643289 (Intermediate!12086 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1472074 () Bool)

(assert (=> b!1472074 (= e!826163 (not true))))

(declare-fun e!826165 () Bool)

(assert (=> b!1472074 e!826165))

(declare-fun res!999873 () Bool)

(assert (=> b!1472074 (=> (not res!999873) (not e!826165))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99070 (_ BitVec 32)) Bool)

(assert (=> b!1472074 (= res!999873 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49353 0))(
  ( (Unit!49354) )
))
(declare-fun lt!643290 () Unit!49353)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99070 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49353)

(assert (=> b!1472074 (= lt!643290 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1472075 () Bool)

(declare-fun res!999879 () Bool)

(assert (=> b!1472075 (=> (not res!999879) (not e!826166))))

(assert (=> b!1472075 (= res!999879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1472076 () Bool)

(assert (=> b!1472076 (= e!826164 e!826163)))

(declare-fun res!999877 () Bool)

(assert (=> b!1472076 (=> (not res!999877) (not e!826163))))

(assert (=> b!1472076 (= res!999877 (= lt!643287 (Intermediate!12086 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1472076 (= lt!643287 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643288 mask!2687) lt!643288 lt!643286 mask!2687))))

(assert (=> b!1472076 (= lt!643288 (select (store (arr!47821 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1472077 () Bool)

(declare-fun res!999880 () Bool)

(assert (=> b!1472077 (=> (not res!999880) (not e!826166))))

(assert (=> b!1472077 (= res!999880 (and (= (size!48373 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48373 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48373 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1472078 () Bool)

(declare-fun res!999871 () Bool)

(assert (=> b!1472078 (=> (not res!999871) (not e!826166))))

(declare-datatypes ((List!34400 0))(
  ( (Nil!34397) (Cons!34396 (h!35752 (_ BitVec 64)) (t!49086 List!34400)) )
))
(declare-fun arrayNoDuplicates!0 (array!99070 (_ BitVec 32) List!34400) Bool)

(assert (=> b!1472078 (= res!999871 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34397))))

(declare-fun b!1472079 () Bool)

(declare-fun res!999869 () Bool)

(assert (=> b!1472079 (=> (not res!999869) (not e!826164))))

(assert (=> b!1472079 (= res!999869 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47821 a!2862) j!93) a!2862 mask!2687) lt!643289))))

(declare-fun b!1472080 () Bool)

(assert (=> b!1472080 (= e!826165 (or (= (select (arr!47821 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47821 a!2862) intermediateBeforeIndex!19) (select (arr!47821 a!2862) j!93))))))

(declare-fun b!1472081 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99070 (_ BitVec 32)) SeekEntryResult!12086)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99070 (_ BitVec 32)) SeekEntryResult!12086)

(assert (=> b!1472081 (= e!826161 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643288 lt!643286 mask!2687) (seekEntryOrOpen!0 lt!643288 lt!643286 mask!2687)))))

(declare-fun res!999878 () Bool)

(assert (=> start!125758 (=> (not res!999878) (not e!826166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125758 (= res!999878 (validMask!0 mask!2687))))

(assert (=> start!125758 e!826166))

(assert (=> start!125758 true))

(declare-fun array_inv!37054 (array!99070) Bool)

(assert (=> start!125758 (array_inv!37054 a!2862)))

(declare-fun b!1472082 () Bool)

(declare-fun res!999874 () Bool)

(assert (=> b!1472082 (=> (not res!999874) (not e!826166))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472082 (= res!999874 (validKeyInArray!0 (select (arr!47821 a!2862) j!93)))))

(declare-fun b!1472083 () Bool)

(declare-fun res!999883 () Bool)

(assert (=> b!1472083 (=> (not res!999883) (not e!826165))))

(assert (=> b!1472083 (= res!999883 (= (seekEntryOrOpen!0 (select (arr!47821 a!2862) j!93) a!2862 mask!2687) (Found!12086 j!93)))))

(declare-fun b!1472084 () Bool)

(declare-fun res!999870 () Bool)

(assert (=> b!1472084 (=> (not res!999870) (not e!826163))))

(assert (=> b!1472084 (= res!999870 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1472085 () Bool)

(declare-fun res!999876 () Bool)

(assert (=> b!1472085 (=> (not res!999876) (not e!826166))))

(assert (=> b!1472085 (= res!999876 (validKeyInArray!0 (select (arr!47821 a!2862) i!1006)))))

(assert (= (and start!125758 res!999878) b!1472077))

(assert (= (and b!1472077 res!999880) b!1472085))

(assert (= (and b!1472085 res!999876) b!1472082))

(assert (= (and b!1472082 res!999874) b!1472075))

(assert (= (and b!1472075 res!999879) b!1472078))

(assert (= (and b!1472078 res!999871) b!1472071))

(assert (= (and b!1472071 res!999881) b!1472070))

(assert (= (and b!1472070 res!999872) b!1472073))

(assert (= (and b!1472073 res!999875) b!1472079))

(assert (= (and b!1472079 res!999869) b!1472076))

(assert (= (and b!1472076 res!999877) b!1472069))

(assert (= (and b!1472069 c!135616) b!1472072))

(assert (= (and b!1472069 (not c!135616)) b!1472081))

(assert (= (and b!1472069 res!999882) b!1472084))

(assert (= (and b!1472084 res!999870) b!1472074))

(assert (= (and b!1472074 res!999873) b!1472083))

(assert (= (and b!1472083 res!999883) b!1472080))

(declare-fun m!1358319 () Bool)

(assert (=> b!1472073 m!1358319))

(assert (=> b!1472073 m!1358319))

(declare-fun m!1358321 () Bool)

(assert (=> b!1472073 m!1358321))

(assert (=> b!1472073 m!1358321))

(assert (=> b!1472073 m!1358319))

(declare-fun m!1358323 () Bool)

(assert (=> b!1472073 m!1358323))

(declare-fun m!1358325 () Bool)

(assert (=> b!1472074 m!1358325))

(declare-fun m!1358327 () Bool)

(assert (=> b!1472074 m!1358327))

(assert (=> b!1472079 m!1358319))

(assert (=> b!1472079 m!1358319))

(declare-fun m!1358329 () Bool)

(assert (=> b!1472079 m!1358329))

(declare-fun m!1358331 () Bool)

(assert (=> b!1472072 m!1358331))

(declare-fun m!1358333 () Bool)

(assert (=> start!125758 m!1358333))

(declare-fun m!1358335 () Bool)

(assert (=> start!125758 m!1358335))

(declare-fun m!1358337 () Bool)

(assert (=> b!1472080 m!1358337))

(assert (=> b!1472080 m!1358319))

(declare-fun m!1358339 () Bool)

(assert (=> b!1472078 m!1358339))

(declare-fun m!1358341 () Bool)

(assert (=> b!1472070 m!1358341))

(declare-fun m!1358343 () Bool)

(assert (=> b!1472070 m!1358343))

(assert (=> b!1472083 m!1358319))

(assert (=> b!1472083 m!1358319))

(declare-fun m!1358345 () Bool)

(assert (=> b!1472083 m!1358345))

(declare-fun m!1358347 () Bool)

(assert (=> b!1472085 m!1358347))

(assert (=> b!1472085 m!1358347))

(declare-fun m!1358349 () Bool)

(assert (=> b!1472085 m!1358349))

(declare-fun m!1358351 () Bool)

(assert (=> b!1472076 m!1358351))

(assert (=> b!1472076 m!1358351))

(declare-fun m!1358353 () Bool)

(assert (=> b!1472076 m!1358353))

(assert (=> b!1472076 m!1358341))

(declare-fun m!1358355 () Bool)

(assert (=> b!1472076 m!1358355))

(declare-fun m!1358357 () Bool)

(assert (=> b!1472075 m!1358357))

(declare-fun m!1358359 () Bool)

(assert (=> b!1472081 m!1358359))

(declare-fun m!1358361 () Bool)

(assert (=> b!1472081 m!1358361))

(assert (=> b!1472082 m!1358319))

(assert (=> b!1472082 m!1358319))

(declare-fun m!1358363 () Bool)

(assert (=> b!1472082 m!1358363))

(check-sat (not b!1472076) (not b!1472074) (not b!1472072) (not b!1472085) (not b!1472073) (not b!1472082) (not b!1472079) (not b!1472075) (not b!1472083) (not b!1472081) (not start!125758) (not b!1472078))
(check-sat)
