; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124426 () Bool)

(assert start!124426)

(declare-fun b!1439784 () Bool)

(declare-fun e!811925 () Bool)

(declare-fun e!811924 () Bool)

(assert (=> b!1439784 (= e!811925 e!811924)))

(declare-fun res!972334 () Bool)

(assert (=> b!1439784 (=> (not res!972334) (not e!811924))))

(declare-datatypes ((SeekEntryResult!11492 0))(
  ( (MissingZero!11492 (index!48360 (_ BitVec 32))) (Found!11492 (index!48361 (_ BitVec 32))) (Intermediate!11492 (undefined!12304 Bool) (index!48362 (_ BitVec 32)) (x!130088 (_ BitVec 32))) (Undefined!11492) (MissingVacant!11492 (index!48363 (_ BitVec 32))) )
))
(declare-fun lt!632664 () SeekEntryResult!11492)

(declare-datatypes ((array!97852 0))(
  ( (array!97853 (arr!47215 (Array (_ BitVec 32) (_ BitVec 64))) (size!47767 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97852)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97852 (_ BitVec 32)) SeekEntryResult!11492)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439784 (= res!972334 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47215 a!2862) j!93) mask!2687) (select (arr!47215 a!2862) j!93) a!2862 mask!2687) lt!632664))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1439784 (= lt!632664 (Intermediate!11492 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!972330 () Bool)

(assert (=> start!124426 (=> (not res!972330) (not e!811925))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124426 (= res!972330 (validMask!0 mask!2687))))

(assert (=> start!124426 e!811925))

(assert (=> start!124426 true))

(declare-fun array_inv!36448 (array!97852) Bool)

(assert (=> start!124426 (array_inv!36448 a!2862)))

(declare-fun b!1439785 () Bool)

(declare-fun res!972337 () Bool)

(assert (=> b!1439785 (=> (not res!972337) (not e!811925))))

(declare-datatypes ((List!33794 0))(
  ( (Nil!33791) (Cons!33790 (h!35140 (_ BitVec 64)) (t!48480 List!33794)) )
))
(declare-fun arrayNoDuplicates!0 (array!97852 (_ BitVec 32) List!33794) Bool)

(assert (=> b!1439785 (= res!972337 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33791))))

(declare-fun b!1439786 () Bool)

(declare-fun res!972335 () Bool)

(assert (=> b!1439786 (=> (not res!972335) (not e!811925))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1439786 (= res!972335 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47767 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47767 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47767 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47215 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439787 () Bool)

(assert (=> b!1439787 (= e!811924 (and (bvsgt x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1439788 () Bool)

(declare-fun res!972333 () Bool)

(assert (=> b!1439788 (=> (not res!972333) (not e!811924))))

(assert (=> b!1439788 (= res!972333 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47215 a!2862) j!93) a!2862 mask!2687) lt!632664))))

(declare-fun b!1439789 () Bool)

(declare-fun res!972328 () Bool)

(assert (=> b!1439789 (=> (not res!972328) (not e!811925))))

(assert (=> b!1439789 (= res!972328 (and (= (size!47767 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47767 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47767 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439790 () Bool)

(declare-fun res!972336 () Bool)

(assert (=> b!1439790 (=> (not res!972336) (not e!811925))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439790 (= res!972336 (validKeyInArray!0 (select (arr!47215 a!2862) j!93)))))

(declare-fun b!1439791 () Bool)

(declare-fun res!972332 () Bool)

(assert (=> b!1439791 (=> (not res!972332) (not e!811925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97852 (_ BitVec 32)) Bool)

(assert (=> b!1439791 (= res!972332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439792 () Bool)

(declare-fun res!972329 () Bool)

(assert (=> b!1439792 (=> (not res!972329) (not e!811924))))

(assert (=> b!1439792 (= res!972329 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47215 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47215 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97853 (store (arr!47215 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47767 a!2862)) mask!2687) (Intermediate!11492 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1439793 () Bool)

(declare-fun res!972331 () Bool)

(assert (=> b!1439793 (=> (not res!972331) (not e!811925))))

(assert (=> b!1439793 (= res!972331 (validKeyInArray!0 (select (arr!47215 a!2862) i!1006)))))

(assert (= (and start!124426 res!972330) b!1439789))

(assert (= (and b!1439789 res!972328) b!1439793))

(assert (= (and b!1439793 res!972331) b!1439790))

(assert (= (and b!1439790 res!972336) b!1439791))

(assert (= (and b!1439791 res!972332) b!1439785))

(assert (= (and b!1439785 res!972337) b!1439786))

(assert (= (and b!1439786 res!972335) b!1439784))

(assert (= (and b!1439784 res!972334) b!1439788))

(assert (= (and b!1439788 res!972333) b!1439792))

(assert (= (and b!1439792 res!972329) b!1439787))

(declare-fun m!1328439 () Bool)

(assert (=> b!1439793 m!1328439))

(assert (=> b!1439793 m!1328439))

(declare-fun m!1328441 () Bool)

(assert (=> b!1439793 m!1328441))

(declare-fun m!1328443 () Bool)

(assert (=> b!1439784 m!1328443))

(assert (=> b!1439784 m!1328443))

(declare-fun m!1328445 () Bool)

(assert (=> b!1439784 m!1328445))

(assert (=> b!1439784 m!1328445))

(assert (=> b!1439784 m!1328443))

(declare-fun m!1328447 () Bool)

(assert (=> b!1439784 m!1328447))

(declare-fun m!1328449 () Bool)

(assert (=> start!124426 m!1328449))

(declare-fun m!1328451 () Bool)

(assert (=> start!124426 m!1328451))

(declare-fun m!1328453 () Bool)

(assert (=> b!1439792 m!1328453))

(declare-fun m!1328455 () Bool)

(assert (=> b!1439792 m!1328455))

(assert (=> b!1439792 m!1328455))

(declare-fun m!1328457 () Bool)

(assert (=> b!1439792 m!1328457))

(assert (=> b!1439792 m!1328457))

(assert (=> b!1439792 m!1328455))

(declare-fun m!1328459 () Bool)

(assert (=> b!1439792 m!1328459))

(declare-fun m!1328461 () Bool)

(assert (=> b!1439791 m!1328461))

(assert (=> b!1439790 m!1328443))

(assert (=> b!1439790 m!1328443))

(declare-fun m!1328463 () Bool)

(assert (=> b!1439790 m!1328463))

(assert (=> b!1439786 m!1328453))

(declare-fun m!1328465 () Bool)

(assert (=> b!1439786 m!1328465))

(assert (=> b!1439788 m!1328443))

(assert (=> b!1439788 m!1328443))

(declare-fun m!1328467 () Bool)

(assert (=> b!1439788 m!1328467))

(declare-fun m!1328469 () Bool)

(assert (=> b!1439785 m!1328469))

(check-sat (not b!1439793) (not b!1439785) (not b!1439788) (not b!1439790) (not start!124426) (not b!1439791) (not b!1439792) (not b!1439784))
(check-sat)
