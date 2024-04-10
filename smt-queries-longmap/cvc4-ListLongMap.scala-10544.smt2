; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124406 () Bool)

(assert start!124406)

(declare-fun b!1439248 () Bool)

(declare-fun res!971682 () Bool)

(declare-fun e!811806 () Bool)

(assert (=> b!1439248 (=> (not res!971682) (not e!811806))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97854 0))(
  ( (array!97855 (arr!47215 (Array (_ BitVec 32) (_ BitVec 64))) (size!47765 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97854)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1439248 (= res!971682 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47765 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47765 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47765 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47215 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439249 () Bool)

(declare-fun res!971681 () Bool)

(declare-fun e!811807 () Bool)

(assert (=> b!1439249 (=> (not res!971681) (not e!811807))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11467 0))(
  ( (MissingZero!11467 (index!48260 (_ BitVec 32))) (Found!11467 (index!48261 (_ BitVec 32))) (Intermediate!11467 (undefined!12279 Bool) (index!48262 (_ BitVec 32)) (x!129996 (_ BitVec 32))) (Undefined!11467) (MissingVacant!11467 (index!48263 (_ BitVec 32))) )
))
(declare-fun lt!632777 () SeekEntryResult!11467)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97854 (_ BitVec 32)) SeekEntryResult!11467)

(assert (=> b!1439249 (= res!971681 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47215 a!2862) j!93) a!2862 mask!2687) lt!632777))))

(declare-fun b!1439250 () Bool)

(assert (=> b!1439250 (= e!811806 e!811807)))

(declare-fun res!971680 () Bool)

(assert (=> b!1439250 (=> (not res!971680) (not e!811807))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439250 (= res!971680 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47215 a!2862) j!93) mask!2687) (select (arr!47215 a!2862) j!93) a!2862 mask!2687) lt!632777))))

(assert (=> b!1439250 (= lt!632777 (Intermediate!11467 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439251 () Bool)

(assert (=> b!1439251 (= e!811807 false)))

(declare-fun lt!632778 () SeekEntryResult!11467)

(assert (=> b!1439251 (= lt!632778 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47215 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47215 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97855 (store (arr!47215 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47765 a!2862)) mask!2687))))

(declare-fun b!1439252 () Bool)

(declare-fun res!971677 () Bool)

(assert (=> b!1439252 (=> (not res!971677) (not e!811806))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439252 (= res!971677 (validKeyInArray!0 (select (arr!47215 a!2862) i!1006)))))

(declare-fun res!971679 () Bool)

(assert (=> start!124406 (=> (not res!971679) (not e!811806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124406 (= res!971679 (validMask!0 mask!2687))))

(assert (=> start!124406 e!811806))

(assert (=> start!124406 true))

(declare-fun array_inv!36243 (array!97854) Bool)

(assert (=> start!124406 (array_inv!36243 a!2862)))

(declare-fun b!1439253 () Bool)

(declare-fun res!971683 () Bool)

(assert (=> b!1439253 (=> (not res!971683) (not e!811806))))

(declare-datatypes ((List!33716 0))(
  ( (Nil!33713) (Cons!33712 (h!35062 (_ BitVec 64)) (t!48410 List!33716)) )
))
(declare-fun arrayNoDuplicates!0 (array!97854 (_ BitVec 32) List!33716) Bool)

(assert (=> b!1439253 (= res!971683 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33713))))

(declare-fun b!1439254 () Bool)

(declare-fun res!971675 () Bool)

(assert (=> b!1439254 (=> (not res!971675) (not e!811806))))

(assert (=> b!1439254 (= res!971675 (validKeyInArray!0 (select (arr!47215 a!2862) j!93)))))

(declare-fun b!1439255 () Bool)

(declare-fun res!971678 () Bool)

(assert (=> b!1439255 (=> (not res!971678) (not e!811806))))

(assert (=> b!1439255 (= res!971678 (and (= (size!47765 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47765 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47765 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439256 () Bool)

(declare-fun res!971676 () Bool)

(assert (=> b!1439256 (=> (not res!971676) (not e!811806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97854 (_ BitVec 32)) Bool)

(assert (=> b!1439256 (= res!971676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124406 res!971679) b!1439255))

(assert (= (and b!1439255 res!971678) b!1439252))

(assert (= (and b!1439252 res!971677) b!1439254))

(assert (= (and b!1439254 res!971675) b!1439256))

(assert (= (and b!1439256 res!971676) b!1439253))

(assert (= (and b!1439253 res!971683) b!1439248))

(assert (= (and b!1439248 res!971682) b!1439250))

(assert (= (and b!1439250 res!971680) b!1439249))

(assert (= (and b!1439249 res!971681) b!1439251))

(declare-fun m!1328303 () Bool)

(assert (=> b!1439248 m!1328303))

(declare-fun m!1328305 () Bool)

(assert (=> b!1439248 m!1328305))

(declare-fun m!1328307 () Bool)

(assert (=> b!1439254 m!1328307))

(assert (=> b!1439254 m!1328307))

(declare-fun m!1328309 () Bool)

(assert (=> b!1439254 m!1328309))

(assert (=> b!1439249 m!1328307))

(assert (=> b!1439249 m!1328307))

(declare-fun m!1328311 () Bool)

(assert (=> b!1439249 m!1328311))

(declare-fun m!1328313 () Bool)

(assert (=> b!1439256 m!1328313))

(assert (=> b!1439250 m!1328307))

(assert (=> b!1439250 m!1328307))

(declare-fun m!1328315 () Bool)

(assert (=> b!1439250 m!1328315))

(assert (=> b!1439250 m!1328315))

(assert (=> b!1439250 m!1328307))

(declare-fun m!1328317 () Bool)

(assert (=> b!1439250 m!1328317))

(declare-fun m!1328319 () Bool)

(assert (=> b!1439253 m!1328319))

(declare-fun m!1328321 () Bool)

(assert (=> start!124406 m!1328321))

(declare-fun m!1328323 () Bool)

(assert (=> start!124406 m!1328323))

(assert (=> b!1439251 m!1328303))

(declare-fun m!1328325 () Bool)

(assert (=> b!1439251 m!1328325))

(assert (=> b!1439251 m!1328325))

(declare-fun m!1328327 () Bool)

(assert (=> b!1439251 m!1328327))

(assert (=> b!1439251 m!1328327))

(assert (=> b!1439251 m!1328325))

(declare-fun m!1328329 () Bool)

(assert (=> b!1439251 m!1328329))

(declare-fun m!1328331 () Bool)

(assert (=> b!1439252 m!1328331))

(assert (=> b!1439252 m!1328331))

(declare-fun m!1328333 () Bool)

(assert (=> b!1439252 m!1328333))

(push 1)

(assert (not b!1439254))

(assert (not b!1439253))

(assert (not b!1439249))

(assert (not b!1439251))

(assert (not b!1439250))

(assert (not start!124406))

(assert (not b!1439252))

(assert (not b!1439256))

(check-sat)

(pop 1)

