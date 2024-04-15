; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124322 () Bool)

(assert start!124322)

(declare-fun b!1438666 () Bool)

(declare-fun e!811489 () Bool)

(declare-fun e!811491 () Bool)

(assert (=> b!1438666 (= e!811489 e!811491)))

(declare-fun res!971334 () Bool)

(assert (=> b!1438666 (=> (not res!971334) (not e!811491))))

(declare-datatypes ((SeekEntryResult!11461 0))(
  ( (MissingZero!11461 (index!48236 (_ BitVec 32))) (Found!11461 (index!48237 (_ BitVec 32))) (Intermediate!11461 (undefined!12273 Bool) (index!48238 (_ BitVec 32)) (x!129963 (_ BitVec 32))) (Undefined!11461) (MissingVacant!11461 (index!48239 (_ BitVec 32))) )
))
(declare-fun lt!632427 () SeekEntryResult!11461)

(declare-datatypes ((array!97787 0))(
  ( (array!97788 (arr!47184 (Array (_ BitVec 32) (_ BitVec 64))) (size!47736 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97787)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97787 (_ BitVec 32)) SeekEntryResult!11461)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438666 (= res!971334 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47184 a!2862) j!93) mask!2687) (select (arr!47184 a!2862) j!93) a!2862 mask!2687) lt!632427))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1438666 (= lt!632427 (Intermediate!11461 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438667 () Bool)

(declare-fun res!971341 () Bool)

(assert (=> b!1438667 (=> (not res!971341) (not e!811489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438667 (= res!971341 (validKeyInArray!0 (select (arr!47184 a!2862) j!93)))))

(declare-fun b!1438668 () Bool)

(declare-fun res!971337 () Bool)

(assert (=> b!1438668 (=> (not res!971337) (not e!811489))))

(declare-datatypes ((List!33763 0))(
  ( (Nil!33760) (Cons!33759 (h!35106 (_ BitVec 64)) (t!48449 List!33763)) )
))
(declare-fun arrayNoDuplicates!0 (array!97787 (_ BitVec 32) List!33763) Bool)

(assert (=> b!1438668 (= res!971337 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33760))))

(declare-fun b!1438669 () Bool)

(declare-fun res!971336 () Bool)

(assert (=> b!1438669 (=> (not res!971336) (not e!811489))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1438669 (= res!971336 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47736 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47736 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47736 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47184 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!971333 () Bool)

(assert (=> start!124322 (=> (not res!971333) (not e!811489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124322 (= res!971333 (validMask!0 mask!2687))))

(assert (=> start!124322 e!811489))

(assert (=> start!124322 true))

(declare-fun array_inv!36417 (array!97787) Bool)

(assert (=> start!124322 (array_inv!36417 a!2862)))

(declare-fun b!1438670 () Bool)

(declare-fun res!971340 () Bool)

(assert (=> b!1438670 (=> (not res!971340) (not e!811489))))

(assert (=> b!1438670 (= res!971340 (validKeyInArray!0 (select (arr!47184 a!2862) i!1006)))))

(declare-fun b!1438671 () Bool)

(declare-fun res!971338 () Bool)

(assert (=> b!1438671 (=> (not res!971338) (not e!811489))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97787 (_ BitVec 32)) Bool)

(assert (=> b!1438671 (= res!971338 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438672 () Bool)

(assert (=> b!1438672 (= e!811491 false)))

(declare-fun lt!632426 () SeekEntryResult!11461)

(assert (=> b!1438672 (= lt!632426 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47184 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47184 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97788 (store (arr!47184 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47736 a!2862)) mask!2687))))

(declare-fun b!1438673 () Bool)

(declare-fun res!971339 () Bool)

(assert (=> b!1438673 (=> (not res!971339) (not e!811491))))

(assert (=> b!1438673 (= res!971339 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47184 a!2862) j!93) a!2862 mask!2687) lt!632427))))

(declare-fun b!1438674 () Bool)

(declare-fun res!971335 () Bool)

(assert (=> b!1438674 (=> (not res!971335) (not e!811489))))

(assert (=> b!1438674 (= res!971335 (and (= (size!47736 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47736 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47736 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124322 res!971333) b!1438674))

(assert (= (and b!1438674 res!971335) b!1438670))

(assert (= (and b!1438670 res!971340) b!1438667))

(assert (= (and b!1438667 res!971341) b!1438671))

(assert (= (and b!1438671 res!971338) b!1438668))

(assert (= (and b!1438668 res!971337) b!1438669))

(assert (= (and b!1438669 res!971336) b!1438666))

(assert (= (and b!1438666 res!971334) b!1438673))

(assert (= (and b!1438673 res!971339) b!1438672))

(declare-fun m!1327315 () Bool)

(assert (=> b!1438668 m!1327315))

(declare-fun m!1327317 () Bool)

(assert (=> b!1438673 m!1327317))

(assert (=> b!1438673 m!1327317))

(declare-fun m!1327319 () Bool)

(assert (=> b!1438673 m!1327319))

(declare-fun m!1327321 () Bool)

(assert (=> b!1438672 m!1327321))

(declare-fun m!1327323 () Bool)

(assert (=> b!1438672 m!1327323))

(assert (=> b!1438672 m!1327323))

(declare-fun m!1327325 () Bool)

(assert (=> b!1438672 m!1327325))

(assert (=> b!1438672 m!1327325))

(assert (=> b!1438672 m!1327323))

(declare-fun m!1327327 () Bool)

(assert (=> b!1438672 m!1327327))

(declare-fun m!1327329 () Bool)

(assert (=> start!124322 m!1327329))

(declare-fun m!1327331 () Bool)

(assert (=> start!124322 m!1327331))

(assert (=> b!1438666 m!1327317))

(assert (=> b!1438666 m!1327317))

(declare-fun m!1327333 () Bool)

(assert (=> b!1438666 m!1327333))

(assert (=> b!1438666 m!1327333))

(assert (=> b!1438666 m!1327317))

(declare-fun m!1327335 () Bool)

(assert (=> b!1438666 m!1327335))

(assert (=> b!1438669 m!1327321))

(declare-fun m!1327337 () Bool)

(assert (=> b!1438669 m!1327337))

(declare-fun m!1327339 () Bool)

(assert (=> b!1438671 m!1327339))

(declare-fun m!1327341 () Bool)

(assert (=> b!1438670 m!1327341))

(assert (=> b!1438670 m!1327341))

(declare-fun m!1327343 () Bool)

(assert (=> b!1438670 m!1327343))

(assert (=> b!1438667 m!1327317))

(assert (=> b!1438667 m!1327317))

(declare-fun m!1327345 () Bool)

(assert (=> b!1438667 m!1327345))

(push 1)

(assert (not b!1438673))

(assert (not start!124322))

(assert (not b!1438668))

(assert (not b!1438670))

(assert (not b!1438666))

(assert (not b!1438671))

(assert (not b!1438667))

(assert (not b!1438672))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

