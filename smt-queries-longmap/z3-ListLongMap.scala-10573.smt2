; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124578 () Bool)

(assert start!124578)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!812856 () Bool)

(declare-datatypes ((SeekEntryResult!11553 0))(
  ( (MissingZero!11553 (index!48604 (_ BitVec 32))) (Found!11553 (index!48605 (_ BitVec 32))) (Intermediate!11553 (undefined!12365 Bool) (index!48606 (_ BitVec 32)) (x!130314 (_ BitVec 32))) (Undefined!11553) (MissingVacant!11553 (index!48607 (_ BitVec 32))) )
))
(declare-fun lt!633472 () SeekEntryResult!11553)

(declare-datatypes ((array!98026 0))(
  ( (array!98027 (arr!47301 (Array (_ BitVec 32) (_ BitVec 64))) (size!47851 (_ BitVec 32))) )
))
(declare-fun lt!633474 () array!98026)

(declare-fun b!1442132 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!633470 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98026 (_ BitVec 32)) SeekEntryResult!11553)

(assert (=> b!1442132 (= e!812856 (= lt!633472 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633470 lt!633474 mask!2687)))))

(declare-fun b!1442134 () Bool)

(declare-fun res!974387 () Bool)

(declare-fun e!812852 () Bool)

(assert (=> b!1442134 (=> (not res!974387) (not e!812852))))

(declare-fun a!2862 () array!98026)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98026 (_ BitVec 32)) SeekEntryResult!11553)

(assert (=> b!1442134 (= res!974387 (= (seekEntryOrOpen!0 (select (arr!47301 a!2862) j!93) a!2862 mask!2687) (Found!11553 j!93)))))

(declare-fun b!1442135 () Bool)

(declare-fun res!974391 () Bool)

(declare-fun e!812858 () Bool)

(assert (=> b!1442135 (=> (not res!974391) (not e!812858))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1442135 (= res!974391 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1442136 () Bool)

(declare-fun e!812854 () Bool)

(assert (=> b!1442136 (= e!812854 e!812858)))

(declare-fun res!974394 () Bool)

(assert (=> b!1442136 (=> (not res!974394) (not e!812858))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1442136 (= res!974394 (= lt!633472 (Intermediate!11553 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442136 (= lt!633472 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633470 mask!2687) lt!633470 lt!633474 mask!2687))))

(assert (=> b!1442136 (= lt!633470 (select (store (arr!47301 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1442137 () Bool)

(declare-fun res!974392 () Bool)

(declare-fun e!812857 () Bool)

(assert (=> b!1442137 (=> (not res!974392) (not e!812857))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98026 (_ BitVec 32)) Bool)

(assert (=> b!1442137 (= res!974392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442138 () Bool)

(declare-fun res!974397 () Bool)

(assert (=> b!1442138 (=> (not res!974397) (not e!812857))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442138 (= res!974397 (validKeyInArray!0 (select (arr!47301 a!2862) i!1006)))))

(declare-fun b!1442139 () Bool)

(declare-fun res!974393 () Bool)

(assert (=> b!1442139 (=> (not res!974393) (not e!812857))))

(declare-datatypes ((List!33802 0))(
  ( (Nil!33799) (Cons!33798 (h!35148 (_ BitVec 64)) (t!48496 List!33802)) )
))
(declare-fun arrayNoDuplicates!0 (array!98026 (_ BitVec 32) List!33802) Bool)

(assert (=> b!1442139 (= res!974393 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33799))))

(declare-fun b!1442140 () Bool)

(assert (=> b!1442140 (= e!812858 (not true))))

(assert (=> b!1442140 e!812852))

(declare-fun res!974398 () Bool)

(assert (=> b!1442140 (=> (not res!974398) (not e!812852))))

(assert (=> b!1442140 (= res!974398 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48602 0))(
  ( (Unit!48603) )
))
(declare-fun lt!633471 () Unit!48602)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98026 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48602)

(assert (=> b!1442140 (= lt!633471 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1442133 () Bool)

(declare-fun res!974399 () Bool)

(assert (=> b!1442133 (=> (not res!974399) (not e!812857))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1442133 (= res!974399 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47851 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47851 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47851 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!974400 () Bool)

(assert (=> start!124578 (=> (not res!974400) (not e!812857))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124578 (= res!974400 (validMask!0 mask!2687))))

(assert (=> start!124578 e!812857))

(assert (=> start!124578 true))

(declare-fun array_inv!36329 (array!98026) Bool)

(assert (=> start!124578 (array_inv!36329 a!2862)))

(declare-fun b!1442141 () Bool)

(declare-fun res!974388 () Bool)

(assert (=> b!1442141 (=> (not res!974388) (not e!812857))))

(assert (=> b!1442141 (= res!974388 (validKeyInArray!0 (select (arr!47301 a!2862) j!93)))))

(declare-fun b!1442142 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98026 (_ BitVec 32)) SeekEntryResult!11553)

(assert (=> b!1442142 (= e!812856 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633470 lt!633474 mask!2687) (seekEntryOrOpen!0 lt!633470 lt!633474 mask!2687)))))

(declare-fun b!1442143 () Bool)

(declare-fun res!974396 () Bool)

(assert (=> b!1442143 (=> (not res!974396) (not e!812854))))

(declare-fun lt!633473 () SeekEntryResult!11553)

(assert (=> b!1442143 (= res!974396 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47301 a!2862) j!93) a!2862 mask!2687) lt!633473))))

(declare-fun b!1442144 () Bool)

(declare-fun e!812855 () Bool)

(assert (=> b!1442144 (= e!812857 e!812855)))

(declare-fun res!974390 () Bool)

(assert (=> b!1442144 (=> (not res!974390) (not e!812855))))

(assert (=> b!1442144 (= res!974390 (= (select (store (arr!47301 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442144 (= lt!633474 (array!98027 (store (arr!47301 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47851 a!2862)))))

(declare-fun b!1442145 () Bool)

(assert (=> b!1442145 (= e!812852 (or (= (select (arr!47301 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47301 a!2862) intermediateBeforeIndex!19) (select (arr!47301 a!2862) j!93))))))

(declare-fun b!1442146 () Bool)

(declare-fun res!974389 () Bool)

(assert (=> b!1442146 (=> (not res!974389) (not e!812858))))

(assert (=> b!1442146 (= res!974389 e!812856)))

(declare-fun c!133383 () Bool)

(assert (=> b!1442146 (= c!133383 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1442147 () Bool)

(assert (=> b!1442147 (= e!812855 e!812854)))

(declare-fun res!974401 () Bool)

(assert (=> b!1442147 (=> (not res!974401) (not e!812854))))

(assert (=> b!1442147 (= res!974401 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47301 a!2862) j!93) mask!2687) (select (arr!47301 a!2862) j!93) a!2862 mask!2687) lt!633473))))

(assert (=> b!1442147 (= lt!633473 (Intermediate!11553 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442148 () Bool)

(declare-fun res!974395 () Bool)

(assert (=> b!1442148 (=> (not res!974395) (not e!812857))))

(assert (=> b!1442148 (= res!974395 (and (= (size!47851 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47851 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47851 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124578 res!974400) b!1442148))

(assert (= (and b!1442148 res!974395) b!1442138))

(assert (= (and b!1442138 res!974397) b!1442141))

(assert (= (and b!1442141 res!974388) b!1442137))

(assert (= (and b!1442137 res!974392) b!1442139))

(assert (= (and b!1442139 res!974393) b!1442133))

(assert (= (and b!1442133 res!974399) b!1442144))

(assert (= (and b!1442144 res!974390) b!1442147))

(assert (= (and b!1442147 res!974401) b!1442143))

(assert (= (and b!1442143 res!974396) b!1442136))

(assert (= (and b!1442136 res!974394) b!1442146))

(assert (= (and b!1442146 c!133383) b!1442132))

(assert (= (and b!1442146 (not c!133383)) b!1442142))

(assert (= (and b!1442146 res!974389) b!1442135))

(assert (= (and b!1442135 res!974391) b!1442140))

(assert (= (and b!1442140 res!974398) b!1442134))

(assert (= (and b!1442134 res!974387) b!1442145))

(declare-fun m!1331303 () Bool)

(assert (=> b!1442143 m!1331303))

(assert (=> b!1442143 m!1331303))

(declare-fun m!1331305 () Bool)

(assert (=> b!1442143 m!1331305))

(declare-fun m!1331307 () Bool)

(assert (=> b!1442145 m!1331307))

(assert (=> b!1442145 m!1331303))

(assert (=> b!1442147 m!1331303))

(assert (=> b!1442147 m!1331303))

(declare-fun m!1331309 () Bool)

(assert (=> b!1442147 m!1331309))

(assert (=> b!1442147 m!1331309))

(assert (=> b!1442147 m!1331303))

(declare-fun m!1331311 () Bool)

(assert (=> b!1442147 m!1331311))

(declare-fun m!1331313 () Bool)

(assert (=> b!1442139 m!1331313))

(declare-fun m!1331315 () Bool)

(assert (=> b!1442132 m!1331315))

(declare-fun m!1331317 () Bool)

(assert (=> b!1442138 m!1331317))

(assert (=> b!1442138 m!1331317))

(declare-fun m!1331319 () Bool)

(assert (=> b!1442138 m!1331319))

(declare-fun m!1331321 () Bool)

(assert (=> b!1442140 m!1331321))

(declare-fun m!1331323 () Bool)

(assert (=> b!1442140 m!1331323))

(assert (=> b!1442141 m!1331303))

(assert (=> b!1442141 m!1331303))

(declare-fun m!1331325 () Bool)

(assert (=> b!1442141 m!1331325))

(declare-fun m!1331327 () Bool)

(assert (=> start!124578 m!1331327))

(declare-fun m!1331329 () Bool)

(assert (=> start!124578 m!1331329))

(declare-fun m!1331331 () Bool)

(assert (=> b!1442142 m!1331331))

(declare-fun m!1331333 () Bool)

(assert (=> b!1442142 m!1331333))

(declare-fun m!1331335 () Bool)

(assert (=> b!1442144 m!1331335))

(declare-fun m!1331337 () Bool)

(assert (=> b!1442144 m!1331337))

(declare-fun m!1331339 () Bool)

(assert (=> b!1442136 m!1331339))

(assert (=> b!1442136 m!1331339))

(declare-fun m!1331341 () Bool)

(assert (=> b!1442136 m!1331341))

(assert (=> b!1442136 m!1331335))

(declare-fun m!1331343 () Bool)

(assert (=> b!1442136 m!1331343))

(assert (=> b!1442134 m!1331303))

(assert (=> b!1442134 m!1331303))

(declare-fun m!1331345 () Bool)

(assert (=> b!1442134 m!1331345))

(declare-fun m!1331347 () Bool)

(assert (=> b!1442137 m!1331347))

(check-sat (not b!1442140) (not b!1442136) (not b!1442142) (not b!1442141) (not start!124578) (not b!1442134) (not b!1442143) (not b!1442139) (not b!1442147) (not b!1442137) (not b!1442138) (not b!1442132))
(check-sat)
