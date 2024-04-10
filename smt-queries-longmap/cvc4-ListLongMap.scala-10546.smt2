; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124418 () Bool)

(assert start!124418)

(declare-fun b!1439428 () Bool)

(declare-fun res!971857 () Bool)

(declare-fun e!811871 () Bool)

(assert (=> b!1439428 (=> (not res!971857) (not e!811871))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97866 0))(
  ( (array!97867 (arr!47221 (Array (_ BitVec 32) (_ BitVec 64))) (size!47771 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97866)

(assert (=> b!1439428 (= res!971857 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47771 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47771 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47771 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47221 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439429 () Bool)

(declare-fun e!811870 () Bool)

(assert (=> b!1439429 (= e!811870 false)))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11473 0))(
  ( (MissingZero!11473 (index!48284 (_ BitVec 32))) (Found!11473 (index!48285 (_ BitVec 32))) (Intermediate!11473 (undefined!12285 Bool) (index!48286 (_ BitVec 32)) (x!130018 (_ BitVec 32))) (Undefined!11473) (MissingVacant!11473 (index!48287 (_ BitVec 32))) )
))
(declare-fun lt!632814 () SeekEntryResult!11473)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97866 (_ BitVec 32)) SeekEntryResult!11473)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439429 (= lt!632814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47221 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47221 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97867 (store (arr!47221 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47771 a!2862)) mask!2687))))

(declare-fun res!971861 () Bool)

(assert (=> start!124418 (=> (not res!971861) (not e!811871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124418 (= res!971861 (validMask!0 mask!2687))))

(assert (=> start!124418 e!811871))

(assert (=> start!124418 true))

(declare-fun array_inv!36249 (array!97866) Bool)

(assert (=> start!124418 (array_inv!36249 a!2862)))

(declare-fun b!1439430 () Bool)

(assert (=> b!1439430 (= e!811871 e!811870)))

(declare-fun res!971855 () Bool)

(assert (=> b!1439430 (=> (not res!971855) (not e!811870))))

(declare-fun lt!632813 () SeekEntryResult!11473)

(assert (=> b!1439430 (= res!971855 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47221 a!2862) j!93) mask!2687) (select (arr!47221 a!2862) j!93) a!2862 mask!2687) lt!632813))))

(assert (=> b!1439430 (= lt!632813 (Intermediate!11473 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439431 () Bool)

(declare-fun res!971858 () Bool)

(assert (=> b!1439431 (=> (not res!971858) (not e!811871))))

(assert (=> b!1439431 (= res!971858 (and (= (size!47771 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47771 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47771 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439432 () Bool)

(declare-fun res!971862 () Bool)

(assert (=> b!1439432 (=> (not res!971862) (not e!811871))))

(declare-datatypes ((List!33722 0))(
  ( (Nil!33719) (Cons!33718 (h!35068 (_ BitVec 64)) (t!48416 List!33722)) )
))
(declare-fun arrayNoDuplicates!0 (array!97866 (_ BitVec 32) List!33722) Bool)

(assert (=> b!1439432 (= res!971862 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33719))))

(declare-fun b!1439433 () Bool)

(declare-fun res!971860 () Bool)

(assert (=> b!1439433 (=> (not res!971860) (not e!811871))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97866 (_ BitVec 32)) Bool)

(assert (=> b!1439433 (= res!971860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439434 () Bool)

(declare-fun res!971863 () Bool)

(assert (=> b!1439434 (=> (not res!971863) (not e!811871))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439434 (= res!971863 (validKeyInArray!0 (select (arr!47221 a!2862) j!93)))))

(declare-fun b!1439435 () Bool)

(declare-fun res!971856 () Bool)

(assert (=> b!1439435 (=> (not res!971856) (not e!811871))))

(assert (=> b!1439435 (= res!971856 (validKeyInArray!0 (select (arr!47221 a!2862) i!1006)))))

(declare-fun b!1439436 () Bool)

(declare-fun res!971859 () Bool)

(assert (=> b!1439436 (=> (not res!971859) (not e!811870))))

(assert (=> b!1439436 (= res!971859 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47221 a!2862) j!93) a!2862 mask!2687) lt!632813))))

(assert (= (and start!124418 res!971861) b!1439431))

(assert (= (and b!1439431 res!971858) b!1439435))

(assert (= (and b!1439435 res!971856) b!1439434))

(assert (= (and b!1439434 res!971863) b!1439433))

(assert (= (and b!1439433 res!971860) b!1439432))

(assert (= (and b!1439432 res!971862) b!1439428))

(assert (= (and b!1439428 res!971857) b!1439430))

(assert (= (and b!1439430 res!971855) b!1439436))

(assert (= (and b!1439436 res!971859) b!1439429))

(declare-fun m!1328501 () Bool)

(assert (=> b!1439435 m!1328501))

(assert (=> b!1439435 m!1328501))

(declare-fun m!1328503 () Bool)

(assert (=> b!1439435 m!1328503))

(declare-fun m!1328505 () Bool)

(assert (=> b!1439432 m!1328505))

(declare-fun m!1328507 () Bool)

(assert (=> start!124418 m!1328507))

(declare-fun m!1328509 () Bool)

(assert (=> start!124418 m!1328509))

(declare-fun m!1328511 () Bool)

(assert (=> b!1439436 m!1328511))

(assert (=> b!1439436 m!1328511))

(declare-fun m!1328513 () Bool)

(assert (=> b!1439436 m!1328513))

(assert (=> b!1439434 m!1328511))

(assert (=> b!1439434 m!1328511))

(declare-fun m!1328515 () Bool)

(assert (=> b!1439434 m!1328515))

(assert (=> b!1439430 m!1328511))

(assert (=> b!1439430 m!1328511))

(declare-fun m!1328517 () Bool)

(assert (=> b!1439430 m!1328517))

(assert (=> b!1439430 m!1328517))

(assert (=> b!1439430 m!1328511))

(declare-fun m!1328519 () Bool)

(assert (=> b!1439430 m!1328519))

(declare-fun m!1328521 () Bool)

(assert (=> b!1439429 m!1328521))

(declare-fun m!1328523 () Bool)

(assert (=> b!1439429 m!1328523))

(assert (=> b!1439429 m!1328523))

(declare-fun m!1328525 () Bool)

(assert (=> b!1439429 m!1328525))

(assert (=> b!1439429 m!1328525))

(assert (=> b!1439429 m!1328523))

(declare-fun m!1328527 () Bool)

(assert (=> b!1439429 m!1328527))

(assert (=> b!1439428 m!1328521))

(declare-fun m!1328529 () Bool)

(assert (=> b!1439428 m!1328529))

(declare-fun m!1328531 () Bool)

(assert (=> b!1439433 m!1328531))

(push 1)

(assert (not b!1439436))

(assert (not b!1439435))

(assert (not b!1439433))

(assert (not b!1439434))

(assert (not b!1439430))

(assert (not b!1439432))

(assert (not start!124418))

(assert (not b!1439429))

