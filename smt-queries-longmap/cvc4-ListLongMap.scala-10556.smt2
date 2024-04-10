; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124478 () Bool)

(assert start!124478)

(declare-fun b!1440292 () Bool)

(declare-fun res!972727 () Bool)

(declare-fun e!812140 () Bool)

(assert (=> b!1440292 (=> (not res!972727) (not e!812140))))

(declare-datatypes ((array!97926 0))(
  ( (array!97927 (arr!47251 (Array (_ BitVec 32) (_ BitVec 64))) (size!47801 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97926)

(declare-datatypes ((List!33752 0))(
  ( (Nil!33749) (Cons!33748 (h!35098 (_ BitVec 64)) (t!48446 List!33752)) )
))
(declare-fun arrayNoDuplicates!0 (array!97926 (_ BitVec 32) List!33752) Bool)

(assert (=> b!1440292 (= res!972727 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33749))))

(declare-fun b!1440293 () Bool)

(declare-fun res!972722 () Bool)

(assert (=> b!1440293 (=> (not res!972722) (not e!812140))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97926 (_ BitVec 32)) Bool)

(assert (=> b!1440293 (= res!972722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!972719 () Bool)

(assert (=> start!124478 (=> (not res!972719) (not e!812140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124478 (= res!972719 (validMask!0 mask!2687))))

(assert (=> start!124478 e!812140))

(assert (=> start!124478 true))

(declare-fun array_inv!36279 (array!97926) Bool)

(assert (=> start!124478 (array_inv!36279 a!2862)))

(declare-fun b!1440294 () Bool)

(declare-fun e!812141 () Bool)

(assert (=> b!1440294 (= e!812140 e!812141)))

(declare-fun res!972720 () Bool)

(assert (=> b!1440294 (=> (not res!972720) (not e!812141))))

(declare-datatypes ((SeekEntryResult!11503 0))(
  ( (MissingZero!11503 (index!48404 (_ BitVec 32))) (Found!11503 (index!48405 (_ BitVec 32))) (Intermediate!11503 (undefined!12315 Bool) (index!48406 (_ BitVec 32)) (x!130128 (_ BitVec 32))) (Undefined!11503) (MissingVacant!11503 (index!48407 (_ BitVec 32))) )
))
(declare-fun lt!632949 () SeekEntryResult!11503)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97926 (_ BitVec 32)) SeekEntryResult!11503)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440294 (= res!972720 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47251 a!2862) j!93) mask!2687) (select (arr!47251 a!2862) j!93) a!2862 mask!2687) lt!632949))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440294 (= lt!632949 (Intermediate!11503 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440295 () Bool)

(declare-fun res!972724 () Bool)

(assert (=> b!1440295 (=> (not res!972724) (not e!812140))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1440295 (= res!972724 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47801 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47801 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47801 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440296 () Bool)

(declare-fun res!972725 () Bool)

(assert (=> b!1440296 (=> (not res!972725) (not e!812141))))

(assert (=> b!1440296 (= res!972725 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47251 a!2862) j!93) a!2862 mask!2687) lt!632949))))

(declare-fun b!1440297 () Bool)

(declare-fun res!972721 () Bool)

(assert (=> b!1440297 (=> (not res!972721) (not e!812140))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440297 (= res!972721 (validKeyInArray!0 (select (arr!47251 a!2862) i!1006)))))

(declare-fun b!1440298 () Bool)

(assert (=> b!1440298 (= e!812141 false)))

(declare-fun lt!632948 () SeekEntryResult!11503)

(assert (=> b!1440298 (= lt!632948 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97927 (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47801 a!2862)) mask!2687))))

(declare-fun b!1440299 () Bool)

(declare-fun res!972723 () Bool)

(assert (=> b!1440299 (=> (not res!972723) (not e!812140))))

(assert (=> b!1440299 (= res!972723 (and (= (size!47801 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47801 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47801 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440300 () Bool)

(declare-fun res!972726 () Bool)

(assert (=> b!1440300 (=> (not res!972726) (not e!812140))))

(assert (=> b!1440300 (= res!972726 (validKeyInArray!0 (select (arr!47251 a!2862) j!93)))))

(assert (= (and start!124478 res!972719) b!1440299))

(assert (= (and b!1440299 res!972723) b!1440297))

(assert (= (and b!1440297 res!972721) b!1440300))

(assert (= (and b!1440300 res!972726) b!1440293))

(assert (= (and b!1440293 res!972722) b!1440292))

(assert (= (and b!1440292 res!972727) b!1440295))

(assert (= (and b!1440295 res!972724) b!1440294))

(assert (= (and b!1440294 res!972720) b!1440296))

(assert (= (and b!1440296 res!972725) b!1440298))

(declare-fun m!1329467 () Bool)

(assert (=> b!1440292 m!1329467))

(declare-fun m!1329469 () Bool)

(assert (=> b!1440294 m!1329469))

(assert (=> b!1440294 m!1329469))

(declare-fun m!1329471 () Bool)

(assert (=> b!1440294 m!1329471))

(assert (=> b!1440294 m!1329471))

(assert (=> b!1440294 m!1329469))

(declare-fun m!1329473 () Bool)

(assert (=> b!1440294 m!1329473))

(assert (=> b!1440300 m!1329469))

(assert (=> b!1440300 m!1329469))

(declare-fun m!1329475 () Bool)

(assert (=> b!1440300 m!1329475))

(declare-fun m!1329477 () Bool)

(assert (=> b!1440298 m!1329477))

(declare-fun m!1329479 () Bool)

(assert (=> b!1440298 m!1329479))

(assert (=> b!1440298 m!1329479))

(declare-fun m!1329481 () Bool)

(assert (=> b!1440298 m!1329481))

(assert (=> b!1440298 m!1329481))

(assert (=> b!1440298 m!1329479))

(declare-fun m!1329483 () Bool)

(assert (=> b!1440298 m!1329483))

(declare-fun m!1329485 () Bool)

(assert (=> b!1440297 m!1329485))

(assert (=> b!1440297 m!1329485))

(declare-fun m!1329487 () Bool)

(assert (=> b!1440297 m!1329487))

(declare-fun m!1329489 () Bool)

(assert (=> b!1440293 m!1329489))

(assert (=> b!1440295 m!1329477))

(declare-fun m!1329491 () Bool)

(assert (=> b!1440295 m!1329491))

(assert (=> b!1440296 m!1329469))

(assert (=> b!1440296 m!1329469))

(declare-fun m!1329493 () Bool)

(assert (=> b!1440296 m!1329493))

(declare-fun m!1329495 () Bool)

(assert (=> start!124478 m!1329495))

(declare-fun m!1329497 () Bool)

(assert (=> start!124478 m!1329497))

(push 1)

(assert (not b!1440297))

(assert (not b!1440294))

(assert (not b!1440292))

(assert (not b!1440298))

(assert (not b!1440296))

(assert (not b!1440300))

(assert (not b!1440293))

(assert (not start!124478))

(check-sat)

(pop 1)

