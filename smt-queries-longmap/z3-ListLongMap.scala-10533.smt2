; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124180 () Bool)

(assert start!124180)

(declare-fun b!1437442 () Bool)

(declare-fun res!970341 () Bool)

(declare-fun e!810958 () Bool)

(assert (=> b!1437442 (=> (not res!970341) (not e!810958))))

(declare-datatypes ((array!97723 0))(
  ( (array!97724 (arr!47155 (Array (_ BitVec 32) (_ BitVec 64))) (size!47707 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97723)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97723 (_ BitVec 32)) Bool)

(assert (=> b!1437442 (= res!970341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!970343 () Bool)

(assert (=> start!124180 (=> (not res!970343) (not e!810958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124180 (= res!970343 (validMask!0 mask!2687))))

(assert (=> start!124180 e!810958))

(assert (=> start!124180 true))

(declare-fun array_inv!36388 (array!97723) Bool)

(assert (=> start!124180 (array_inv!36388 a!2862)))

(declare-fun b!1437443 () Bool)

(declare-fun res!970337 () Bool)

(assert (=> b!1437443 (=> (not res!970337) (not e!810958))))

(declare-datatypes ((List!33734 0))(
  ( (Nil!33731) (Cons!33730 (h!35071 (_ BitVec 64)) (t!48420 List!33734)) )
))
(declare-fun arrayNoDuplicates!0 (array!97723 (_ BitVec 32) List!33734) Bool)

(assert (=> b!1437443 (= res!970337 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33731))))

(declare-fun b!1437444 () Bool)

(declare-fun res!970344 () Bool)

(assert (=> b!1437444 (=> (not res!970344) (not e!810958))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437444 (= res!970344 (and (= (size!47707 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47707 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47707 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437445 () Bool)

(declare-fun res!970338 () Bool)

(assert (=> b!1437445 (=> (not res!970338) (not e!810958))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437445 (= res!970338 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47707 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47707 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47707 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47155 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437446 () Bool)

(declare-fun res!970345 () Bool)

(assert (=> b!1437446 (=> (not res!970345) (not e!810958))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437446 (= res!970345 (validKeyInArray!0 (select (arr!47155 a!2862) j!93)))))

(declare-fun b!1437447 () Bool)

(declare-fun res!970339 () Bool)

(assert (=> b!1437447 (=> (not res!970339) (not e!810958))))

(assert (=> b!1437447 (= res!970339 (validKeyInArray!0 (select (arr!47155 a!2862) i!1006)))))

(declare-fun b!1437448 () Bool)

(declare-fun res!970340 () Bool)

(declare-fun e!810959 () Bool)

(assert (=> b!1437448 (=> (not res!970340) (not e!810959))))

(declare-datatypes ((SeekEntryResult!11432 0))(
  ( (MissingZero!11432 (index!48120 (_ BitVec 32))) (Found!11432 (index!48121 (_ BitVec 32))) (Intermediate!11432 (undefined!12244 Bool) (index!48122 (_ BitVec 32)) (x!129850 (_ BitVec 32))) (Undefined!11432) (MissingVacant!11432 (index!48123 (_ BitVec 32))) )
))
(declare-fun lt!632123 () SeekEntryResult!11432)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97723 (_ BitVec 32)) SeekEntryResult!11432)

(assert (=> b!1437448 (= res!970340 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47155 a!2862) j!93) a!2862 mask!2687) lt!632123))))

(declare-fun b!1437449 () Bool)

(assert (=> b!1437449 (= e!810958 e!810959)))

(declare-fun res!970342 () Bool)

(assert (=> b!1437449 (=> (not res!970342) (not e!810959))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437449 (= res!970342 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47155 a!2862) j!93) mask!2687) (select (arr!47155 a!2862) j!93) a!2862 mask!2687) lt!632123))))

(assert (=> b!1437449 (= lt!632123 (Intermediate!11432 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1437450 () Bool)

(assert (=> b!1437450 (= e!810959 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun lt!632124 () (_ BitVec 32))

(assert (=> b!1437450 (= lt!632124 (toIndex!0 (select (store (arr!47155 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(assert (= (and start!124180 res!970343) b!1437444))

(assert (= (and b!1437444 res!970344) b!1437447))

(assert (= (and b!1437447 res!970339) b!1437446))

(assert (= (and b!1437446 res!970345) b!1437442))

(assert (= (and b!1437442 res!970341) b!1437443))

(assert (= (and b!1437443 res!970337) b!1437445))

(assert (= (and b!1437445 res!970338) b!1437449))

(assert (= (and b!1437449 res!970342) b!1437448))

(assert (= (and b!1437448 res!970340) b!1437450))

(declare-fun m!1326195 () Bool)

(assert (=> b!1437446 m!1326195))

(assert (=> b!1437446 m!1326195))

(declare-fun m!1326197 () Bool)

(assert (=> b!1437446 m!1326197))

(assert (=> b!1437448 m!1326195))

(assert (=> b!1437448 m!1326195))

(declare-fun m!1326199 () Bool)

(assert (=> b!1437448 m!1326199))

(declare-fun m!1326201 () Bool)

(assert (=> b!1437447 m!1326201))

(assert (=> b!1437447 m!1326201))

(declare-fun m!1326203 () Bool)

(assert (=> b!1437447 m!1326203))

(assert (=> b!1437449 m!1326195))

(assert (=> b!1437449 m!1326195))

(declare-fun m!1326205 () Bool)

(assert (=> b!1437449 m!1326205))

(assert (=> b!1437449 m!1326205))

(assert (=> b!1437449 m!1326195))

(declare-fun m!1326207 () Bool)

(assert (=> b!1437449 m!1326207))

(declare-fun m!1326209 () Bool)

(assert (=> b!1437442 m!1326209))

(declare-fun m!1326211 () Bool)

(assert (=> b!1437450 m!1326211))

(declare-fun m!1326213 () Bool)

(assert (=> b!1437450 m!1326213))

(assert (=> b!1437450 m!1326213))

(declare-fun m!1326215 () Bool)

(assert (=> b!1437450 m!1326215))

(declare-fun m!1326217 () Bool)

(assert (=> start!124180 m!1326217))

(declare-fun m!1326219 () Bool)

(assert (=> start!124180 m!1326219))

(declare-fun m!1326221 () Bool)

(assert (=> b!1437443 m!1326221))

(assert (=> b!1437445 m!1326211))

(declare-fun m!1326223 () Bool)

(assert (=> b!1437445 m!1326223))

(check-sat (not b!1437442) (not b!1437450) (not b!1437448) (not b!1437443) (not b!1437446) (not start!124180) (not b!1437449) (not b!1437447))
(check-sat)
