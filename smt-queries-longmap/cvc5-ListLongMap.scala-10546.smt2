; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124414 () Bool)

(assert start!124414)

(declare-fun b!1439374 () Bool)

(declare-fun res!971805 () Bool)

(declare-fun e!811853 () Bool)

(assert (=> b!1439374 (=> (not res!971805) (not e!811853))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97862 0))(
  ( (array!97863 (arr!47219 (Array (_ BitVec 32) (_ BitVec 64))) (size!47769 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97862)

(assert (=> b!1439374 (= res!971805 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47769 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47769 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47769 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47219 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439375 () Bool)

(declare-fun res!971808 () Bool)

(assert (=> b!1439375 (=> (not res!971808) (not e!811853))))

(declare-datatypes ((List!33720 0))(
  ( (Nil!33717) (Cons!33716 (h!35066 (_ BitVec 64)) (t!48414 List!33720)) )
))
(declare-fun arrayNoDuplicates!0 (array!97862 (_ BitVec 32) List!33720) Bool)

(assert (=> b!1439375 (= res!971808 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33717))))

(declare-fun b!1439376 () Bool)

(declare-fun res!971802 () Bool)

(declare-fun e!811852 () Bool)

(assert (=> b!1439376 (=> (not res!971802) (not e!811852))))

(declare-datatypes ((SeekEntryResult!11471 0))(
  ( (MissingZero!11471 (index!48276 (_ BitVec 32))) (Found!11471 (index!48277 (_ BitVec 32))) (Intermediate!11471 (undefined!12283 Bool) (index!48278 (_ BitVec 32)) (x!130016 (_ BitVec 32))) (Undefined!11471) (MissingVacant!11471 (index!48279 (_ BitVec 32))) )
))
(declare-fun lt!632801 () SeekEntryResult!11471)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97862 (_ BitVec 32)) SeekEntryResult!11471)

(assert (=> b!1439376 (= res!971802 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47219 a!2862) j!93) a!2862 mask!2687) lt!632801))))

(declare-fun res!971809 () Bool)

(assert (=> start!124414 (=> (not res!971809) (not e!811853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124414 (= res!971809 (validMask!0 mask!2687))))

(assert (=> start!124414 e!811853))

(assert (=> start!124414 true))

(declare-fun array_inv!36247 (array!97862) Bool)

(assert (=> start!124414 (array_inv!36247 a!2862)))

(declare-fun b!1439377 () Bool)

(declare-fun res!971806 () Bool)

(assert (=> b!1439377 (=> (not res!971806) (not e!811853))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439377 (= res!971806 (validKeyInArray!0 (select (arr!47219 a!2862) j!93)))))

(declare-fun b!1439378 () Bool)

(declare-fun res!971801 () Bool)

(assert (=> b!1439378 (=> (not res!971801) (not e!811853))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97862 (_ BitVec 32)) Bool)

(assert (=> b!1439378 (= res!971801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439379 () Bool)

(declare-fun res!971807 () Bool)

(assert (=> b!1439379 (=> (not res!971807) (not e!811853))))

(assert (=> b!1439379 (= res!971807 (validKeyInArray!0 (select (arr!47219 a!2862) i!1006)))))

(declare-fun b!1439380 () Bool)

(declare-fun res!971804 () Bool)

(assert (=> b!1439380 (=> (not res!971804) (not e!811853))))

(assert (=> b!1439380 (= res!971804 (and (= (size!47769 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47769 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47769 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439381 () Bool)

(assert (=> b!1439381 (= e!811852 false)))

(declare-fun lt!632802 () SeekEntryResult!11471)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439381 (= lt!632802 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47219 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47219 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97863 (store (arr!47219 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47769 a!2862)) mask!2687))))

(declare-fun b!1439382 () Bool)

(assert (=> b!1439382 (= e!811853 e!811852)))

(declare-fun res!971803 () Bool)

(assert (=> b!1439382 (=> (not res!971803) (not e!811852))))

(assert (=> b!1439382 (= res!971803 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47219 a!2862) j!93) mask!2687) (select (arr!47219 a!2862) j!93) a!2862 mask!2687) lt!632801))))

(assert (=> b!1439382 (= lt!632801 (Intermediate!11471 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124414 res!971809) b!1439380))

(assert (= (and b!1439380 res!971804) b!1439379))

(assert (= (and b!1439379 res!971807) b!1439377))

(assert (= (and b!1439377 res!971806) b!1439378))

(assert (= (and b!1439378 res!971801) b!1439375))

(assert (= (and b!1439375 res!971808) b!1439374))

(assert (= (and b!1439374 res!971805) b!1439382))

(assert (= (and b!1439382 res!971803) b!1439376))

(assert (= (and b!1439376 res!971802) b!1439381))

(declare-fun m!1328437 () Bool)

(assert (=> b!1439376 m!1328437))

(assert (=> b!1439376 m!1328437))

(declare-fun m!1328439 () Bool)

(assert (=> b!1439376 m!1328439))

(declare-fun m!1328441 () Bool)

(assert (=> start!124414 m!1328441))

(declare-fun m!1328443 () Bool)

(assert (=> start!124414 m!1328443))

(declare-fun m!1328445 () Bool)

(assert (=> b!1439375 m!1328445))

(declare-fun m!1328447 () Bool)

(assert (=> b!1439374 m!1328447))

(declare-fun m!1328449 () Bool)

(assert (=> b!1439374 m!1328449))

(assert (=> b!1439381 m!1328447))

(declare-fun m!1328451 () Bool)

(assert (=> b!1439381 m!1328451))

(assert (=> b!1439381 m!1328451))

(declare-fun m!1328453 () Bool)

(assert (=> b!1439381 m!1328453))

(assert (=> b!1439381 m!1328453))

(assert (=> b!1439381 m!1328451))

(declare-fun m!1328455 () Bool)

(assert (=> b!1439381 m!1328455))

(assert (=> b!1439382 m!1328437))

(assert (=> b!1439382 m!1328437))

(declare-fun m!1328457 () Bool)

(assert (=> b!1439382 m!1328457))

(assert (=> b!1439382 m!1328457))

(assert (=> b!1439382 m!1328437))

(declare-fun m!1328459 () Bool)

(assert (=> b!1439382 m!1328459))

(declare-fun m!1328461 () Bool)

(assert (=> b!1439378 m!1328461))

(assert (=> b!1439377 m!1328437))

(assert (=> b!1439377 m!1328437))

(declare-fun m!1328463 () Bool)

(assert (=> b!1439377 m!1328463))

(declare-fun m!1328465 () Bool)

(assert (=> b!1439379 m!1328465))

(assert (=> b!1439379 m!1328465))

(declare-fun m!1328467 () Bool)

(assert (=> b!1439379 m!1328467))

(push 1)

