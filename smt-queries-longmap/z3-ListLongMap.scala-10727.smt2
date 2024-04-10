; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125502 () Bool)

(assert start!125502)

(declare-fun b!1468291 () Bool)

(declare-fun e!824532 () Bool)

(assert (=> b!1468291 (= e!824532 false)))

(declare-datatypes ((SeekEntryResult!12003 0))(
  ( (MissingZero!12003 (index!50404 (_ BitVec 32))) (Found!12003 (index!50405 (_ BitVec 32))) (Intermediate!12003 (undefined!12815 Bool) (index!50406 (_ BitVec 32)) (x!131996 (_ BitVec 32))) (Undefined!12003) (MissingVacant!12003 (index!50407 (_ BitVec 32))) )
))
(declare-fun lt!642258 () SeekEntryResult!12003)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98950 0))(
  ( (array!98951 (arr!47763 (Array (_ BitVec 32) (_ BitVec 64))) (size!48313 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98950)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98950 (_ BitVec 32)) SeekEntryResult!12003)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468291 (= lt!642258 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47763 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47763 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98951 (store (arr!47763 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48313 a!2862)) mask!2687))))

(declare-fun b!1468292 () Bool)

(declare-fun res!996831 () Bool)

(declare-fun e!824533 () Bool)

(assert (=> b!1468292 (=> (not res!996831) (not e!824533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98950 (_ BitVec 32)) Bool)

(assert (=> b!1468292 (= res!996831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468293 () Bool)

(assert (=> b!1468293 (= e!824533 e!824532)))

(declare-fun res!996834 () Bool)

(assert (=> b!1468293 (=> (not res!996834) (not e!824532))))

(declare-fun lt!642257 () SeekEntryResult!12003)

(assert (=> b!1468293 (= res!996834 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47763 a!2862) j!93) mask!2687) (select (arr!47763 a!2862) j!93) a!2862 mask!2687) lt!642257))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468293 (= lt!642257 (Intermediate!12003 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468294 () Bool)

(declare-fun res!996836 () Bool)

(assert (=> b!1468294 (=> (not res!996836) (not e!824533))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468294 (= res!996836 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48313 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48313 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48313 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47763 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468295 () Bool)

(declare-fun res!996833 () Bool)

(assert (=> b!1468295 (=> (not res!996833) (not e!824533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468295 (= res!996833 (validKeyInArray!0 (select (arr!47763 a!2862) i!1006)))))

(declare-fun b!1468297 () Bool)

(declare-fun res!996837 () Bool)

(assert (=> b!1468297 (=> (not res!996837) (not e!824533))))

(assert (=> b!1468297 (= res!996837 (validKeyInArray!0 (select (arr!47763 a!2862) j!93)))))

(declare-fun b!1468298 () Bool)

(declare-fun res!996830 () Bool)

(assert (=> b!1468298 (=> (not res!996830) (not e!824533))))

(assert (=> b!1468298 (= res!996830 (and (= (size!48313 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48313 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48313 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468299 () Bool)

(declare-fun res!996838 () Bool)

(assert (=> b!1468299 (=> (not res!996838) (not e!824532))))

(assert (=> b!1468299 (= res!996838 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47763 a!2862) j!93) a!2862 mask!2687) lt!642257))))

(declare-fun res!996835 () Bool)

(assert (=> start!125502 (=> (not res!996835) (not e!824533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125502 (= res!996835 (validMask!0 mask!2687))))

(assert (=> start!125502 e!824533))

(assert (=> start!125502 true))

(declare-fun array_inv!36791 (array!98950) Bool)

(assert (=> start!125502 (array_inv!36791 a!2862)))

(declare-fun b!1468296 () Bool)

(declare-fun res!996832 () Bool)

(assert (=> b!1468296 (=> (not res!996832) (not e!824533))))

(declare-datatypes ((List!34264 0))(
  ( (Nil!34261) (Cons!34260 (h!35610 (_ BitVec 64)) (t!48958 List!34264)) )
))
(declare-fun arrayNoDuplicates!0 (array!98950 (_ BitVec 32) List!34264) Bool)

(assert (=> b!1468296 (= res!996832 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34261))))

(assert (= (and start!125502 res!996835) b!1468298))

(assert (= (and b!1468298 res!996830) b!1468295))

(assert (= (and b!1468295 res!996833) b!1468297))

(assert (= (and b!1468297 res!996837) b!1468292))

(assert (= (and b!1468292 res!996831) b!1468296))

(assert (= (and b!1468296 res!996832) b!1468294))

(assert (= (and b!1468294 res!996836) b!1468293))

(assert (= (and b!1468293 res!996834) b!1468299))

(assert (= (and b!1468299 res!996838) b!1468291))

(declare-fun m!1355325 () Bool)

(assert (=> b!1468296 m!1355325))

(declare-fun m!1355327 () Bool)

(assert (=> b!1468295 m!1355327))

(assert (=> b!1468295 m!1355327))

(declare-fun m!1355329 () Bool)

(assert (=> b!1468295 m!1355329))

(declare-fun m!1355331 () Bool)

(assert (=> b!1468292 m!1355331))

(declare-fun m!1355333 () Bool)

(assert (=> b!1468293 m!1355333))

(assert (=> b!1468293 m!1355333))

(declare-fun m!1355335 () Bool)

(assert (=> b!1468293 m!1355335))

(assert (=> b!1468293 m!1355335))

(assert (=> b!1468293 m!1355333))

(declare-fun m!1355337 () Bool)

(assert (=> b!1468293 m!1355337))

(declare-fun m!1355339 () Bool)

(assert (=> b!1468291 m!1355339))

(declare-fun m!1355341 () Bool)

(assert (=> b!1468291 m!1355341))

(assert (=> b!1468291 m!1355341))

(declare-fun m!1355343 () Bool)

(assert (=> b!1468291 m!1355343))

(assert (=> b!1468291 m!1355343))

(assert (=> b!1468291 m!1355341))

(declare-fun m!1355345 () Bool)

(assert (=> b!1468291 m!1355345))

(declare-fun m!1355347 () Bool)

(assert (=> start!125502 m!1355347))

(declare-fun m!1355349 () Bool)

(assert (=> start!125502 m!1355349))

(assert (=> b!1468299 m!1355333))

(assert (=> b!1468299 m!1355333))

(declare-fun m!1355351 () Bool)

(assert (=> b!1468299 m!1355351))

(assert (=> b!1468297 m!1355333))

(assert (=> b!1468297 m!1355333))

(declare-fun m!1355353 () Bool)

(assert (=> b!1468297 m!1355353))

(assert (=> b!1468294 m!1355339))

(declare-fun m!1355355 () Bool)

(assert (=> b!1468294 m!1355355))

(check-sat (not b!1468297) (not b!1468292) (not b!1468291) (not start!125502) (not b!1468296) (not b!1468293) (not b!1468299) (not b!1468295))
(check-sat)
