; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124474 () Bool)

(assert start!124474)

(declare-fun b!1440238 () Bool)

(declare-fun res!972668 () Bool)

(declare-fun e!812123 () Bool)

(assert (=> b!1440238 (=> (not res!972668) (not e!812123))))

(declare-datatypes ((array!97922 0))(
  ( (array!97923 (arr!47249 (Array (_ BitVec 32) (_ BitVec 64))) (size!47799 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97922)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440238 (= res!972668 (validKeyInArray!0 (select (arr!47249 a!2862) j!93)))))

(declare-fun b!1440239 () Bool)

(declare-fun res!972672 () Bool)

(declare-fun e!812121 () Bool)

(assert (=> b!1440239 (=> (not res!972672) (not e!812121))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11501 0))(
  ( (MissingZero!11501 (index!48396 (_ BitVec 32))) (Found!11501 (index!48397 (_ BitVec 32))) (Intermediate!11501 (undefined!12313 Bool) (index!48398 (_ BitVec 32)) (x!130126 (_ BitVec 32))) (Undefined!11501) (MissingVacant!11501 (index!48399 (_ BitVec 32))) )
))
(declare-fun lt!632937 () SeekEntryResult!11501)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97922 (_ BitVec 32)) SeekEntryResult!11501)

(assert (=> b!1440239 (= res!972672 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47249 a!2862) j!93) a!2862 mask!2687) lt!632937))))

(declare-fun b!1440240 () Bool)

(declare-fun res!972665 () Bool)

(assert (=> b!1440240 (=> (not res!972665) (not e!812123))))

(declare-datatypes ((List!33750 0))(
  ( (Nil!33747) (Cons!33746 (h!35096 (_ BitVec 64)) (t!48444 List!33750)) )
))
(declare-fun arrayNoDuplicates!0 (array!97922 (_ BitVec 32) List!33750) Bool)

(assert (=> b!1440240 (= res!972665 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33747))))

(declare-fun b!1440241 () Bool)

(declare-fun res!972666 () Bool)

(assert (=> b!1440241 (=> (not res!972666) (not e!812123))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1440241 (= res!972666 (and (= (size!47799 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47799 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47799 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440242 () Bool)

(declare-fun res!972670 () Bool)

(assert (=> b!1440242 (=> (not res!972670) (not e!812123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97922 (_ BitVec 32)) Bool)

(assert (=> b!1440242 (= res!972670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440244 () Bool)

(declare-fun res!972671 () Bool)

(assert (=> b!1440244 (=> (not res!972671) (not e!812123))))

(assert (=> b!1440244 (= res!972671 (validKeyInArray!0 (select (arr!47249 a!2862) i!1006)))))

(declare-fun b!1440245 () Bool)

(assert (=> b!1440245 (= e!812121 false)))

(declare-fun lt!632936 () SeekEntryResult!11501)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440245 (= lt!632936 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47249 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47249 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97923 (store (arr!47249 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47799 a!2862)) mask!2687))))

(declare-fun b!1440246 () Bool)

(declare-fun res!972669 () Bool)

(assert (=> b!1440246 (=> (not res!972669) (not e!812123))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440246 (= res!972669 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47799 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47799 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47799 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47249 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!972667 () Bool)

(assert (=> start!124474 (=> (not res!972667) (not e!812123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124474 (= res!972667 (validMask!0 mask!2687))))

(assert (=> start!124474 e!812123))

(assert (=> start!124474 true))

(declare-fun array_inv!36277 (array!97922) Bool)

(assert (=> start!124474 (array_inv!36277 a!2862)))

(declare-fun b!1440243 () Bool)

(assert (=> b!1440243 (= e!812123 e!812121)))

(declare-fun res!972673 () Bool)

(assert (=> b!1440243 (=> (not res!972673) (not e!812121))))

(assert (=> b!1440243 (= res!972673 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47249 a!2862) j!93) mask!2687) (select (arr!47249 a!2862) j!93) a!2862 mask!2687) lt!632937))))

(assert (=> b!1440243 (= lt!632937 (Intermediate!11501 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124474 res!972667) b!1440241))

(assert (= (and b!1440241 res!972666) b!1440244))

(assert (= (and b!1440244 res!972671) b!1440238))

(assert (= (and b!1440238 res!972668) b!1440242))

(assert (= (and b!1440242 res!972670) b!1440240))

(assert (= (and b!1440240 res!972665) b!1440246))

(assert (= (and b!1440246 res!972669) b!1440243))

(assert (= (and b!1440243 res!972673) b!1440239))

(assert (= (and b!1440239 res!972672) b!1440245))

(declare-fun m!1329403 () Bool)

(assert (=> start!124474 m!1329403))

(declare-fun m!1329405 () Bool)

(assert (=> start!124474 m!1329405))

(declare-fun m!1329407 () Bool)

(assert (=> b!1440243 m!1329407))

(assert (=> b!1440243 m!1329407))

(declare-fun m!1329409 () Bool)

(assert (=> b!1440243 m!1329409))

(assert (=> b!1440243 m!1329409))

(assert (=> b!1440243 m!1329407))

(declare-fun m!1329411 () Bool)

(assert (=> b!1440243 m!1329411))

(assert (=> b!1440239 m!1329407))

(assert (=> b!1440239 m!1329407))

(declare-fun m!1329413 () Bool)

(assert (=> b!1440239 m!1329413))

(declare-fun m!1329415 () Bool)

(assert (=> b!1440244 m!1329415))

(assert (=> b!1440244 m!1329415))

(declare-fun m!1329417 () Bool)

(assert (=> b!1440244 m!1329417))

(declare-fun m!1329419 () Bool)

(assert (=> b!1440246 m!1329419))

(declare-fun m!1329421 () Bool)

(assert (=> b!1440246 m!1329421))

(declare-fun m!1329423 () Bool)

(assert (=> b!1440242 m!1329423))

(assert (=> b!1440245 m!1329419))

(declare-fun m!1329425 () Bool)

(assert (=> b!1440245 m!1329425))

(assert (=> b!1440245 m!1329425))

(declare-fun m!1329427 () Bool)

(assert (=> b!1440245 m!1329427))

(assert (=> b!1440245 m!1329427))

(assert (=> b!1440245 m!1329425))

(declare-fun m!1329429 () Bool)

(assert (=> b!1440245 m!1329429))

(assert (=> b!1440238 m!1329407))

(assert (=> b!1440238 m!1329407))

(declare-fun m!1329431 () Bool)

(assert (=> b!1440238 m!1329431))

(declare-fun m!1329433 () Bool)

(assert (=> b!1440240 m!1329433))

(push 1)

