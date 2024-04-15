; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124420 () Bool)

(assert start!124420)

(declare-fun b!1439702 () Bool)

(declare-fun res!972253 () Bool)

(declare-fun e!811897 () Bool)

(assert (=> b!1439702 (=> (not res!972253) (not e!811897))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97846 0))(
  ( (array!97847 (arr!47212 (Array (_ BitVec 32) (_ BitVec 64))) (size!47764 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97846)

(assert (=> b!1439702 (= res!972253 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47764 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47764 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47764 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47212 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439703 () Bool)

(declare-fun e!811899 () Bool)

(assert (=> b!1439703 (= e!811897 e!811899)))

(declare-fun res!972245 () Bool)

(assert (=> b!1439703 (=> (not res!972245) (not e!811899))))

(declare-datatypes ((SeekEntryResult!11489 0))(
  ( (MissingZero!11489 (index!48348 (_ BitVec 32))) (Found!11489 (index!48349 (_ BitVec 32))) (Intermediate!11489 (undefined!12301 Bool) (index!48350 (_ BitVec 32)) (x!130077 (_ BitVec 32))) (Undefined!11489) (MissingVacant!11489 (index!48351 (_ BitVec 32))) )
))
(declare-fun lt!632649 () SeekEntryResult!11489)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97846 (_ BitVec 32)) SeekEntryResult!11489)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439703 (= res!972245 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47212 a!2862) j!93) mask!2687) (select (arr!47212 a!2862) j!93) a!2862 mask!2687) lt!632649))))

(assert (=> b!1439703 (= lt!632649 (Intermediate!11489 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439704 () Bool)

(declare-fun res!972249 () Bool)

(assert (=> b!1439704 (=> (not res!972249) (not e!811897))))

(declare-datatypes ((List!33791 0))(
  ( (Nil!33788) (Cons!33787 (h!35137 (_ BitVec 64)) (t!48477 List!33791)) )
))
(declare-fun arrayNoDuplicates!0 (array!97846 (_ BitVec 32) List!33791) Bool)

(assert (=> b!1439704 (= res!972249 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33788))))

(declare-fun b!1439705 () Bool)

(declare-fun res!972247 () Bool)

(assert (=> b!1439705 (=> (not res!972247) (not e!811897))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439705 (= res!972247 (validKeyInArray!0 (select (arr!47212 a!2862) i!1006)))))

(declare-fun b!1439706 () Bool)

(declare-fun res!972248 () Bool)

(assert (=> b!1439706 (=> (not res!972248) (not e!811897))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97846 (_ BitVec 32)) Bool)

(assert (=> b!1439706 (= res!972248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439707 () Bool)

(declare-fun res!972251 () Bool)

(assert (=> b!1439707 (=> (not res!972251) (not e!811897))))

(assert (=> b!1439707 (= res!972251 (and (= (size!47764 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47764 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47764 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!972250 () Bool)

(assert (=> start!124420 (=> (not res!972250) (not e!811897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124420 (= res!972250 (validMask!0 mask!2687))))

(assert (=> start!124420 e!811897))

(assert (=> start!124420 true))

(declare-fun array_inv!36445 (array!97846) Bool)

(assert (=> start!124420 (array_inv!36445 a!2862)))

(declare-fun b!1439701 () Bool)

(declare-fun res!972252 () Bool)

(assert (=> b!1439701 (=> (not res!972252) (not e!811899))))

(assert (=> b!1439701 (= res!972252 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47212 a!2862) j!93) a!2862 mask!2687) lt!632649))))

(declare-fun b!1439708 () Bool)

(declare-fun res!972246 () Bool)

(assert (=> b!1439708 (=> (not res!972246) (not e!811897))))

(assert (=> b!1439708 (= res!972246 (validKeyInArray!0 (select (arr!47212 a!2862) j!93)))))

(declare-fun b!1439709 () Bool)

(assert (=> b!1439709 (= e!811899 false)))

(declare-fun lt!632648 () SeekEntryResult!11489)

(assert (=> b!1439709 (= lt!632648 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47212 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47212 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97847 (store (arr!47212 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47764 a!2862)) mask!2687))))

(assert (= (and start!124420 res!972250) b!1439707))

(assert (= (and b!1439707 res!972251) b!1439705))

(assert (= (and b!1439705 res!972247) b!1439708))

(assert (= (and b!1439708 res!972246) b!1439706))

(assert (= (and b!1439706 res!972248) b!1439704))

(assert (= (and b!1439704 res!972249) b!1439702))

(assert (= (and b!1439702 res!972253) b!1439703))

(assert (= (and b!1439703 res!972245) b!1439701))

(assert (= (and b!1439701 res!972252) b!1439709))

(declare-fun m!1328343 () Bool)

(assert (=> start!124420 m!1328343))

(declare-fun m!1328345 () Bool)

(assert (=> start!124420 m!1328345))

(declare-fun m!1328347 () Bool)

(assert (=> b!1439701 m!1328347))

(assert (=> b!1439701 m!1328347))

(declare-fun m!1328349 () Bool)

(assert (=> b!1439701 m!1328349))

(declare-fun m!1328351 () Bool)

(assert (=> b!1439709 m!1328351))

(declare-fun m!1328353 () Bool)

(assert (=> b!1439709 m!1328353))

(assert (=> b!1439709 m!1328353))

(declare-fun m!1328355 () Bool)

(assert (=> b!1439709 m!1328355))

(assert (=> b!1439709 m!1328355))

(assert (=> b!1439709 m!1328353))

(declare-fun m!1328357 () Bool)

(assert (=> b!1439709 m!1328357))

(assert (=> b!1439708 m!1328347))

(assert (=> b!1439708 m!1328347))

(declare-fun m!1328359 () Bool)

(assert (=> b!1439708 m!1328359))

(declare-fun m!1328361 () Bool)

(assert (=> b!1439705 m!1328361))

(assert (=> b!1439705 m!1328361))

(declare-fun m!1328363 () Bool)

(assert (=> b!1439705 m!1328363))

(declare-fun m!1328365 () Bool)

(assert (=> b!1439704 m!1328365))

(declare-fun m!1328367 () Bool)

(assert (=> b!1439706 m!1328367))

(assert (=> b!1439702 m!1328351))

(declare-fun m!1328369 () Bool)

(assert (=> b!1439702 m!1328369))

(assert (=> b!1439703 m!1328347))

(assert (=> b!1439703 m!1328347))

(declare-fun m!1328371 () Bool)

(assert (=> b!1439703 m!1328371))

(assert (=> b!1439703 m!1328371))

(assert (=> b!1439703 m!1328347))

(declare-fun m!1328373 () Bool)

(assert (=> b!1439703 m!1328373))

(check-sat (not b!1439705) (not b!1439701) (not b!1439708) (not b!1439703) (not b!1439706) (not b!1439704) (not start!124420) (not b!1439709))
(check-sat)
