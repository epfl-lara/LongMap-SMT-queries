; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124408 () Bool)

(assert start!124408)

(declare-fun b!1439279 () Bool)

(declare-fun e!811818 () Bool)

(declare-fun e!811820 () Bool)

(assert (=> b!1439279 (= e!811818 e!811820)))

(declare-fun res!971710 () Bool)

(assert (=> b!1439279 (=> (not res!971710) (not e!811820))))

(declare-fun lt!632784 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97856 0))(
  ( (array!97857 (arr!47216 (Array (_ BitVec 32) (_ BitVec 64))) (size!47766 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97856)

(declare-datatypes ((SeekEntryResult!11468 0))(
  ( (MissingZero!11468 (index!48264 (_ BitVec 32))) (Found!11468 (index!48265 (_ BitVec 32))) (Intermediate!11468 (undefined!12280 Bool) (index!48266 (_ BitVec 32)) (x!130005 (_ BitVec 32))) (Undefined!11468) (MissingVacant!11468 (index!48267 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97856 (_ BitVec 32)) SeekEntryResult!11468)

(assert (=> b!1439279 (= res!971710 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!632784 (select (store (arr!47216 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97857 (store (arr!47216 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47766 a!2862)) mask!2687) (Intermediate!11468 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439279 (= lt!632784 (toIndex!0 (select (store (arr!47216 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1439280 () Bool)

(declare-fun res!971711 () Bool)

(declare-fun e!811817 () Bool)

(assert (=> b!1439280 (=> (not res!971711) (not e!811817))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439280 (= res!971711 (validKeyInArray!0 (select (arr!47216 a!2862) i!1006)))))

(declare-fun b!1439281 () Bool)

(assert (=> b!1439281 (= e!811817 e!811818)))

(declare-fun res!971713 () Bool)

(assert (=> b!1439281 (=> (not res!971713) (not e!811818))))

(declare-fun lt!632783 () SeekEntryResult!11468)

(assert (=> b!1439281 (= res!971713 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47216 a!2862) j!93) mask!2687) (select (arr!47216 a!2862) j!93) a!2862 mask!2687) lt!632783))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1439281 (= lt!632783 (Intermediate!11468 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!971708 () Bool)

(assert (=> start!124408 (=> (not res!971708) (not e!811817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124408 (= res!971708 (validMask!0 mask!2687))))

(assert (=> start!124408 e!811817))

(assert (=> start!124408 true))

(declare-fun array_inv!36244 (array!97856) Bool)

(assert (=> start!124408 (array_inv!36244 a!2862)))

(declare-fun b!1439282 () Bool)

(declare-fun res!971706 () Bool)

(assert (=> b!1439282 (=> (not res!971706) (not e!811818))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1439282 (= res!971706 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47216 a!2862) j!93) a!2862 mask!2687) lt!632783))))

(declare-fun b!1439283 () Bool)

(declare-fun res!971709 () Bool)

(assert (=> b!1439283 (=> (not res!971709) (not e!811817))))

(declare-datatypes ((List!33717 0))(
  ( (Nil!33714) (Cons!33713 (h!35063 (_ BitVec 64)) (t!48411 List!33717)) )
))
(declare-fun arrayNoDuplicates!0 (array!97856 (_ BitVec 32) List!33717) Bool)

(assert (=> b!1439283 (= res!971709 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33714))))

(declare-fun b!1439284 () Bool)

(declare-fun res!971712 () Bool)

(assert (=> b!1439284 (=> (not res!971712) (not e!811817))))

(assert (=> b!1439284 (= res!971712 (validKeyInArray!0 (select (arr!47216 a!2862) j!93)))))

(declare-fun b!1439285 () Bool)

(declare-fun res!971707 () Bool)

(assert (=> b!1439285 (=> (not res!971707) (not e!811820))))

(assert (=> b!1439285 (= res!971707 (and (bvsle x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvsge lt!632784 #b00000000000000000000000000000000) (bvslt lt!632784 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1439286 () Bool)

(declare-fun res!971715 () Bool)

(assert (=> b!1439286 (=> (not res!971715) (not e!811817))))

(assert (=> b!1439286 (= res!971715 (and (= (size!47766 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47766 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47766 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439287 () Bool)

(declare-fun res!971714 () Bool)

(assert (=> b!1439287 (=> (not res!971714) (not e!811817))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97856 (_ BitVec 32)) Bool)

(assert (=> b!1439287 (= res!971714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439288 () Bool)

(assert (=> b!1439288 (= e!811820 (not (validKeyInArray!0 (select (store (arr!47216 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))))

(declare-fun b!1439289 () Bool)

(declare-fun res!971716 () Bool)

(assert (=> b!1439289 (=> (not res!971716) (not e!811817))))

(assert (=> b!1439289 (= res!971716 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47766 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47766 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47766 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47216 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124408 res!971708) b!1439286))

(assert (= (and b!1439286 res!971715) b!1439280))

(assert (= (and b!1439280 res!971711) b!1439284))

(assert (= (and b!1439284 res!971712) b!1439287))

(assert (= (and b!1439287 res!971714) b!1439283))

(assert (= (and b!1439283 res!971709) b!1439289))

(assert (= (and b!1439289 res!971716) b!1439281))

(assert (= (and b!1439281 res!971713) b!1439282))

(assert (= (and b!1439282 res!971706) b!1439279))

(assert (= (and b!1439279 res!971710) b!1439285))

(assert (= (and b!1439285 res!971707) b!1439288))

(declare-fun m!1328335 () Bool)

(assert (=> b!1439280 m!1328335))

(assert (=> b!1439280 m!1328335))

(declare-fun m!1328337 () Bool)

(assert (=> b!1439280 m!1328337))

(declare-fun m!1328339 () Bool)

(assert (=> start!124408 m!1328339))

(declare-fun m!1328341 () Bool)

(assert (=> start!124408 m!1328341))

(declare-fun m!1328343 () Bool)

(assert (=> b!1439279 m!1328343))

(declare-fun m!1328345 () Bool)

(assert (=> b!1439279 m!1328345))

(assert (=> b!1439279 m!1328345))

(declare-fun m!1328347 () Bool)

(assert (=> b!1439279 m!1328347))

(assert (=> b!1439279 m!1328345))

(declare-fun m!1328349 () Bool)

(assert (=> b!1439279 m!1328349))

(declare-fun m!1328351 () Bool)

(assert (=> b!1439284 m!1328351))

(assert (=> b!1439284 m!1328351))

(declare-fun m!1328353 () Bool)

(assert (=> b!1439284 m!1328353))

(declare-fun m!1328355 () Bool)

(assert (=> b!1439287 m!1328355))

(assert (=> b!1439282 m!1328351))

(assert (=> b!1439282 m!1328351))

(declare-fun m!1328357 () Bool)

(assert (=> b!1439282 m!1328357))

(assert (=> b!1439288 m!1328343))

(assert (=> b!1439288 m!1328345))

(assert (=> b!1439288 m!1328345))

(declare-fun m!1328359 () Bool)

(assert (=> b!1439288 m!1328359))

(assert (=> b!1439281 m!1328351))

(assert (=> b!1439281 m!1328351))

(declare-fun m!1328361 () Bool)

(assert (=> b!1439281 m!1328361))

(assert (=> b!1439281 m!1328361))

(assert (=> b!1439281 m!1328351))

(declare-fun m!1328363 () Bool)

(assert (=> b!1439281 m!1328363))

(assert (=> b!1439289 m!1328343))

(declare-fun m!1328365 () Bool)

(assert (=> b!1439289 m!1328365))

(declare-fun m!1328367 () Bool)

(assert (=> b!1439283 m!1328367))

(push 1)

