; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124284 () Bool)

(assert start!124284)

(declare-fun b!1438272 () Bool)

(declare-fun res!970945 () Bool)

(declare-fun e!811351 () Bool)

(assert (=> b!1438272 (=> (not res!970945) (not e!811351))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97810 0))(
  ( (array!97811 (arr!47196 (Array (_ BitVec 32) (_ BitVec 64))) (size!47746 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97810)

(assert (=> b!1438272 (= res!970945 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47746 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47746 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47746 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47196 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438273 () Bool)

(declare-fun res!970954 () Bool)

(assert (=> b!1438273 (=> (not res!970954) (not e!811351))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1438273 (= res!970954 (and (= (size!47746 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47746 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47746 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438274 () Bool)

(declare-fun res!970949 () Bool)

(declare-fun e!811352 () Bool)

(assert (=> b!1438274 (=> (not res!970949) (not e!811352))))

(declare-datatypes ((SeekEntryResult!11448 0))(
  ( (MissingZero!11448 (index!48184 (_ BitVec 32))) (Found!11448 (index!48185 (_ BitVec 32))) (Intermediate!11448 (undefined!12260 Bool) (index!48186 (_ BitVec 32)) (x!129917 (_ BitVec 32))) (Undefined!11448) (MissingVacant!11448 (index!48187 (_ BitVec 32))) )
))
(declare-fun lt!632523 () SeekEntryResult!11448)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97810 (_ BitVec 32)) SeekEntryResult!11448)

(assert (=> b!1438274 (= res!970949 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47196 a!2862) j!93) a!2862 mask!2687) lt!632523))))

(declare-fun b!1438275 () Bool)

(declare-fun res!970953 () Bool)

(assert (=> b!1438275 (=> (not res!970953) (not e!811351))))

(declare-datatypes ((List!33697 0))(
  ( (Nil!33694) (Cons!33693 (h!35037 (_ BitVec 64)) (t!48391 List!33697)) )
))
(declare-fun arrayNoDuplicates!0 (array!97810 (_ BitVec 32) List!33697) Bool)

(assert (=> b!1438275 (= res!970953 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33694))))

(declare-fun b!1438276 () Bool)

(declare-fun res!970950 () Bool)

(assert (=> b!1438276 (=> (not res!970950) (not e!811352))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438276 (= res!970950 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47196 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47196 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97811 (store (arr!47196 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47746 a!2862)) mask!2687) (Intermediate!11448 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1438277 () Bool)

(declare-fun res!970952 () Bool)

(assert (=> b!1438277 (=> (not res!970952) (not e!811351))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438277 (= res!970952 (validKeyInArray!0 (select (arr!47196 a!2862) j!93)))))

(declare-fun b!1438278 () Bool)

(assert (=> b!1438278 (= e!811351 e!811352)))

(declare-fun res!970948 () Bool)

(assert (=> b!1438278 (=> (not res!970948) (not e!811352))))

(assert (=> b!1438278 (= res!970948 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47196 a!2862) j!93) mask!2687) (select (arr!47196 a!2862) j!93) a!2862 mask!2687) lt!632523))))

(assert (=> b!1438278 (= lt!632523 (Intermediate!11448 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!970951 () Bool)

(assert (=> start!124284 (=> (not res!970951) (not e!811351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124284 (= res!970951 (validMask!0 mask!2687))))

(assert (=> start!124284 e!811351))

(assert (=> start!124284 true))

(declare-fun array_inv!36224 (array!97810) Bool)

(assert (=> start!124284 (array_inv!36224 a!2862)))

(declare-fun b!1438279 () Bool)

(assert (=> b!1438279 (= e!811352 (and (bvsle x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1438280 () Bool)

(declare-fun res!970946 () Bool)

(assert (=> b!1438280 (=> (not res!970946) (not e!811351))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97810 (_ BitVec 32)) Bool)

(assert (=> b!1438280 (= res!970946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438281 () Bool)

(declare-fun res!970947 () Bool)

(assert (=> b!1438281 (=> (not res!970947) (not e!811351))))

(assert (=> b!1438281 (= res!970947 (validKeyInArray!0 (select (arr!47196 a!2862) i!1006)))))

(assert (= (and start!124284 res!970951) b!1438273))

(assert (= (and b!1438273 res!970954) b!1438281))

(assert (= (and b!1438281 res!970947) b!1438277))

(assert (= (and b!1438277 res!970952) b!1438280))

(assert (= (and b!1438280 res!970946) b!1438275))

(assert (= (and b!1438275 res!970953) b!1438272))

(assert (= (and b!1438272 res!970945) b!1438278))

(assert (= (and b!1438278 res!970948) b!1438274))

(assert (= (and b!1438274 res!970949) b!1438276))

(assert (= (and b!1438276 res!970950) b!1438279))

(declare-fun m!1327455 () Bool)

(assert (=> b!1438278 m!1327455))

(assert (=> b!1438278 m!1327455))

(declare-fun m!1327457 () Bool)

(assert (=> b!1438278 m!1327457))

(assert (=> b!1438278 m!1327457))

(assert (=> b!1438278 m!1327455))

(declare-fun m!1327459 () Bool)

(assert (=> b!1438278 m!1327459))

(assert (=> b!1438277 m!1327455))

(assert (=> b!1438277 m!1327455))

(declare-fun m!1327461 () Bool)

(assert (=> b!1438277 m!1327461))

(declare-fun m!1327463 () Bool)

(assert (=> start!124284 m!1327463))

(declare-fun m!1327465 () Bool)

(assert (=> start!124284 m!1327465))

(declare-fun m!1327467 () Bool)

(assert (=> b!1438272 m!1327467))

(declare-fun m!1327469 () Bool)

(assert (=> b!1438272 m!1327469))

(assert (=> b!1438274 m!1327455))

(assert (=> b!1438274 m!1327455))

(declare-fun m!1327471 () Bool)

(assert (=> b!1438274 m!1327471))

(assert (=> b!1438276 m!1327467))

(declare-fun m!1327473 () Bool)

(assert (=> b!1438276 m!1327473))

(assert (=> b!1438276 m!1327473))

(declare-fun m!1327475 () Bool)

(assert (=> b!1438276 m!1327475))

(assert (=> b!1438276 m!1327475))

(assert (=> b!1438276 m!1327473))

(declare-fun m!1327477 () Bool)

(assert (=> b!1438276 m!1327477))

(declare-fun m!1327479 () Bool)

(assert (=> b!1438280 m!1327479))

(declare-fun m!1327481 () Bool)

(assert (=> b!1438275 m!1327481))

(declare-fun m!1327483 () Bool)

(assert (=> b!1438281 m!1327483))

(assert (=> b!1438281 m!1327483))

(declare-fun m!1327485 () Bool)

(assert (=> b!1438281 m!1327485))

(check-sat (not b!1438276) (not b!1438274) (not b!1438275) (not b!1438280) (not b!1438281) (not start!124284) (not b!1438278) (not b!1438277))
(check-sat)
