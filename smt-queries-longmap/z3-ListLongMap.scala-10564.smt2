; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124492 () Bool)

(assert start!124492)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!97918 0))(
  ( (array!97919 (arr!47248 (Array (_ BitVec 32) (_ BitVec 64))) (size!47800 (_ BitVec 32))) )
))
(declare-fun lt!632820 () array!97918)

(declare-fun e!812227 () Bool)

(declare-fun b!1440753 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!632819 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11525 0))(
  ( (MissingZero!11525 (index!48492 (_ BitVec 32))) (Found!11525 (index!48493 (_ BitVec 32))) (Intermediate!11525 (undefined!12337 Bool) (index!48494 (_ BitVec 32)) (x!130209 (_ BitVec 32))) (Undefined!11525) (MissingVacant!11525 (index!48495 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97918 (_ BitVec 32)) SeekEntryResult!11525)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97918 (_ BitVec 32)) SeekEntryResult!11525)

(assert (=> b!1440753 (= e!812227 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!632819 lt!632820 mask!2687) (seekEntryOrOpen!0 lt!632819 lt!632820 mask!2687))))))

(declare-fun b!1440754 () Bool)

(declare-fun res!973301 () Bool)

(declare-fun e!812228 () Bool)

(assert (=> b!1440754 (=> (not res!973301) (not e!812228))))

(declare-fun a!2862 () array!97918)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97918 (_ BitVec 32)) Bool)

(assert (=> b!1440754 (= res!973301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440755 () Bool)

(declare-fun res!973300 () Bool)

(declare-fun e!812231 () Bool)

(assert (=> b!1440755 (=> (not res!973300) (not e!812231))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!632816 () SeekEntryResult!11525)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97918 (_ BitVec 32)) SeekEntryResult!11525)

(assert (=> b!1440755 (= res!973300 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47248 a!2862) j!93) a!2862 mask!2687) lt!632816))))

(declare-fun lt!632817 () SeekEntryResult!11525)

(declare-fun b!1440757 () Bool)

(assert (=> b!1440757 (= e!812227 (not (= lt!632817 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!632819 lt!632820 mask!2687))))))

(declare-fun b!1440758 () Bool)

(declare-fun res!973293 () Bool)

(assert (=> b!1440758 (=> (not res!973293) (not e!812228))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440758 (= res!973293 (validKeyInArray!0 (select (arr!47248 a!2862) i!1006)))))

(declare-fun b!1440759 () Bool)

(declare-fun e!812230 () Bool)

(assert (=> b!1440759 (= e!812230 false)))

(declare-fun lt!632818 () Bool)

(assert (=> b!1440759 (= lt!632818 e!812227)))

(declare-fun c!133243 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1440759 (= c!133243 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1440760 () Bool)

(declare-fun res!973303 () Bool)

(assert (=> b!1440760 (=> (not res!973303) (not e!812228))))

(assert (=> b!1440760 (= res!973303 (and (= (size!47800 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47800 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47800 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440761 () Bool)

(declare-fun res!973294 () Bool)

(assert (=> b!1440761 (=> (not res!973294) (not e!812228))))

(assert (=> b!1440761 (= res!973294 (validKeyInArray!0 (select (arr!47248 a!2862) j!93)))))

(declare-fun b!1440762 () Bool)

(declare-fun res!973299 () Bool)

(assert (=> b!1440762 (=> (not res!973299) (not e!812228))))

(declare-datatypes ((List!33827 0))(
  ( (Nil!33824) (Cons!33823 (h!35173 (_ BitVec 64)) (t!48513 List!33827)) )
))
(declare-fun arrayNoDuplicates!0 (array!97918 (_ BitVec 32) List!33827) Bool)

(assert (=> b!1440762 (= res!973299 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33824))))

(declare-fun b!1440763 () Bool)

(declare-fun e!812229 () Bool)

(assert (=> b!1440763 (= e!812229 e!812231)))

(declare-fun res!973302 () Bool)

(assert (=> b!1440763 (=> (not res!973302) (not e!812231))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440763 (= res!973302 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47248 a!2862) j!93) mask!2687) (select (arr!47248 a!2862) j!93) a!2862 mask!2687) lt!632816))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440763 (= lt!632816 (Intermediate!11525 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440764 () Bool)

(assert (=> b!1440764 (= e!812228 e!812229)))

(declare-fun res!973297 () Bool)

(assert (=> b!1440764 (=> (not res!973297) (not e!812229))))

(assert (=> b!1440764 (= res!973297 (= (select (store (arr!47248 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1440764 (= lt!632820 (array!97919 (store (arr!47248 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47800 a!2862)))))

(declare-fun b!1440765 () Bool)

(assert (=> b!1440765 (= e!812231 e!812230)))

(declare-fun res!973295 () Bool)

(assert (=> b!1440765 (=> (not res!973295) (not e!812230))))

(assert (=> b!1440765 (= res!973295 (= lt!632817 (Intermediate!11525 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1440765 (= lt!632817 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!632819 mask!2687) lt!632819 lt!632820 mask!2687))))

(assert (=> b!1440765 (= lt!632819 (select (store (arr!47248 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!973298 () Bool)

(assert (=> start!124492 (=> (not res!973298) (not e!812228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124492 (= res!973298 (validMask!0 mask!2687))))

(assert (=> start!124492 e!812228))

(assert (=> start!124492 true))

(declare-fun array_inv!36481 (array!97918) Bool)

(assert (=> start!124492 (array_inv!36481 a!2862)))

(declare-fun b!1440756 () Bool)

(declare-fun res!973296 () Bool)

(assert (=> b!1440756 (=> (not res!973296) (not e!812228))))

(assert (=> b!1440756 (= res!973296 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47800 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47800 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47800 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!124492 res!973298) b!1440760))

(assert (= (and b!1440760 res!973303) b!1440758))

(assert (= (and b!1440758 res!973293) b!1440761))

(assert (= (and b!1440761 res!973294) b!1440754))

(assert (= (and b!1440754 res!973301) b!1440762))

(assert (= (and b!1440762 res!973299) b!1440756))

(assert (= (and b!1440756 res!973296) b!1440764))

(assert (= (and b!1440764 res!973297) b!1440763))

(assert (= (and b!1440763 res!973302) b!1440755))

(assert (= (and b!1440755 res!973300) b!1440765))

(assert (= (and b!1440765 res!973295) b!1440759))

(assert (= (and b!1440759 c!133243) b!1440757))

(assert (= (and b!1440759 (not c!133243)) b!1440753))

(declare-fun m!1329507 () Bool)

(assert (=> b!1440765 m!1329507))

(assert (=> b!1440765 m!1329507))

(declare-fun m!1329509 () Bool)

(assert (=> b!1440765 m!1329509))

(declare-fun m!1329511 () Bool)

(assert (=> b!1440765 m!1329511))

(declare-fun m!1329513 () Bool)

(assert (=> b!1440765 m!1329513))

(declare-fun m!1329515 () Bool)

(assert (=> b!1440758 m!1329515))

(assert (=> b!1440758 m!1329515))

(declare-fun m!1329517 () Bool)

(assert (=> b!1440758 m!1329517))

(declare-fun m!1329519 () Bool)

(assert (=> b!1440761 m!1329519))

(assert (=> b!1440761 m!1329519))

(declare-fun m!1329521 () Bool)

(assert (=> b!1440761 m!1329521))

(assert (=> b!1440763 m!1329519))

(assert (=> b!1440763 m!1329519))

(declare-fun m!1329523 () Bool)

(assert (=> b!1440763 m!1329523))

(assert (=> b!1440763 m!1329523))

(assert (=> b!1440763 m!1329519))

(declare-fun m!1329525 () Bool)

(assert (=> b!1440763 m!1329525))

(declare-fun m!1329527 () Bool)

(assert (=> b!1440762 m!1329527))

(assert (=> b!1440755 m!1329519))

(assert (=> b!1440755 m!1329519))

(declare-fun m!1329529 () Bool)

(assert (=> b!1440755 m!1329529))

(declare-fun m!1329531 () Bool)

(assert (=> start!124492 m!1329531))

(declare-fun m!1329533 () Bool)

(assert (=> start!124492 m!1329533))

(declare-fun m!1329535 () Bool)

(assert (=> b!1440754 m!1329535))

(assert (=> b!1440764 m!1329511))

(declare-fun m!1329537 () Bool)

(assert (=> b!1440764 m!1329537))

(declare-fun m!1329539 () Bool)

(assert (=> b!1440753 m!1329539))

(declare-fun m!1329541 () Bool)

(assert (=> b!1440753 m!1329541))

(declare-fun m!1329543 () Bool)

(assert (=> b!1440757 m!1329543))

(check-sat (not b!1440762) (not b!1440753) (not b!1440763) (not b!1440761) (not b!1440755) (not b!1440757) (not b!1440754) (not b!1440758) (not start!124492) (not b!1440765))
(check-sat)
