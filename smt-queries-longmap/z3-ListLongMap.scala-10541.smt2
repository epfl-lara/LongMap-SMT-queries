; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124560 () Bool)

(assert start!124560)

(declare-fun b!1440046 () Bool)

(declare-fun res!971775 () Bool)

(declare-fun e!812399 () Bool)

(assert (=> b!1440046 (=> (not res!971775) (not e!812399))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97942 0))(
  ( (array!97943 (arr!47257 (Array (_ BitVec 32) (_ BitVec 64))) (size!47808 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97942)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1440046 (= res!971775 (and (= (size!47808 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47808 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47808 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440047 () Bool)

(declare-fun res!971777 () Bool)

(assert (=> b!1440047 (=> (not res!971777) (not e!812399))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97942 (_ BitVec 32)) Bool)

(assert (=> b!1440047 (= res!971777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440048 () Bool)

(declare-fun res!971772 () Bool)

(declare-fun e!812398 () Bool)

(assert (=> b!1440048 (=> (not res!971772) (not e!812398))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11406 0))(
  ( (MissingZero!11406 (index!48016 (_ BitVec 32))) (Found!11406 (index!48017 (_ BitVec 32))) (Intermediate!11406 (undefined!12218 Bool) (index!48018 (_ BitVec 32)) (x!129929 (_ BitVec 32))) (Undefined!11406) (MissingVacant!11406 (index!48019 (_ BitVec 32))) )
))
(declare-fun lt!633115 () SeekEntryResult!11406)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97942 (_ BitVec 32)) SeekEntryResult!11406)

(assert (=> b!1440048 (= res!971772 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47257 a!2862) j!93) a!2862 mask!2687) lt!633115))))

(declare-fun b!1440049 () Bool)

(assert (=> b!1440049 (= e!812399 e!812398)))

(declare-fun res!971773 () Bool)

(assert (=> b!1440049 (=> (not res!971773) (not e!812398))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440049 (= res!971773 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47257 a!2862) j!93) mask!2687) (select (arr!47257 a!2862) j!93) a!2862 mask!2687) lt!633115))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440049 (= lt!633115 (Intermediate!11406 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!971778 () Bool)

(assert (=> start!124560 (=> (not res!971778) (not e!812399))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124560 (= res!971778 (validMask!0 mask!2687))))

(assert (=> start!124560 e!812399))

(assert (=> start!124560 true))

(declare-fun array_inv!36538 (array!97942) Bool)

(assert (=> start!124560 (array_inv!36538 a!2862)))

(declare-fun b!1440050 () Bool)

(declare-fun res!971771 () Bool)

(assert (=> b!1440050 (=> (not res!971771) (not e!812399))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440050 (= res!971771 (validKeyInArray!0 (select (arr!47257 a!2862) i!1006)))))

(declare-fun b!1440051 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1440051 (= e!812398 (and (bvsle x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1440052 () Bool)

(declare-fun res!971776 () Bool)

(assert (=> b!1440052 (=> (not res!971776) (not e!812399))))

(assert (=> b!1440052 (= res!971776 (validKeyInArray!0 (select (arr!47257 a!2862) j!93)))))

(declare-fun b!1440053 () Bool)

(declare-fun res!971774 () Bool)

(assert (=> b!1440053 (=> (not res!971774) (not e!812399))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440053 (= res!971774 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47808 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47808 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47808 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47257 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440054 () Bool)

(declare-fun res!971779 () Bool)

(assert (=> b!1440054 (=> (not res!971779) (not e!812399))))

(declare-datatypes ((List!33745 0))(
  ( (Nil!33742) (Cons!33741 (h!35099 (_ BitVec 64)) (t!48431 List!33745)) )
))
(declare-fun arrayNoDuplicates!0 (array!97942 (_ BitVec 32) List!33745) Bool)

(assert (=> b!1440054 (= res!971779 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33742))))

(declare-fun b!1440055 () Bool)

(declare-fun res!971780 () Bool)

(assert (=> b!1440055 (=> (not res!971780) (not e!812398))))

(assert (=> b!1440055 (= res!971780 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47257 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47257 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97943 (store (arr!47257 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47808 a!2862)) mask!2687) (Intermediate!11406 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (= (and start!124560 res!971778) b!1440046))

(assert (= (and b!1440046 res!971775) b!1440050))

(assert (= (and b!1440050 res!971771) b!1440052))

(assert (= (and b!1440052 res!971776) b!1440047))

(assert (= (and b!1440047 res!971777) b!1440054))

(assert (= (and b!1440054 res!971779) b!1440053))

(assert (= (and b!1440053 res!971774) b!1440049))

(assert (= (and b!1440049 res!971773) b!1440048))

(assert (= (and b!1440048 res!971772) b!1440055))

(assert (= (and b!1440055 res!971780) b!1440051))

(declare-fun m!1329271 () Bool)

(assert (=> b!1440047 m!1329271))

(declare-fun m!1329273 () Bool)

(assert (=> b!1440049 m!1329273))

(assert (=> b!1440049 m!1329273))

(declare-fun m!1329275 () Bool)

(assert (=> b!1440049 m!1329275))

(assert (=> b!1440049 m!1329275))

(assert (=> b!1440049 m!1329273))

(declare-fun m!1329277 () Bool)

(assert (=> b!1440049 m!1329277))

(declare-fun m!1329279 () Bool)

(assert (=> start!124560 m!1329279))

(declare-fun m!1329281 () Bool)

(assert (=> start!124560 m!1329281))

(declare-fun m!1329283 () Bool)

(assert (=> b!1440050 m!1329283))

(assert (=> b!1440050 m!1329283))

(declare-fun m!1329285 () Bool)

(assert (=> b!1440050 m!1329285))

(assert (=> b!1440048 m!1329273))

(assert (=> b!1440048 m!1329273))

(declare-fun m!1329287 () Bool)

(assert (=> b!1440048 m!1329287))

(declare-fun m!1329289 () Bool)

(assert (=> b!1440053 m!1329289))

(declare-fun m!1329291 () Bool)

(assert (=> b!1440053 m!1329291))

(assert (=> b!1440055 m!1329289))

(declare-fun m!1329293 () Bool)

(assert (=> b!1440055 m!1329293))

(assert (=> b!1440055 m!1329293))

(declare-fun m!1329295 () Bool)

(assert (=> b!1440055 m!1329295))

(assert (=> b!1440055 m!1329295))

(assert (=> b!1440055 m!1329293))

(declare-fun m!1329297 () Bool)

(assert (=> b!1440055 m!1329297))

(declare-fun m!1329299 () Bool)

(assert (=> b!1440054 m!1329299))

(assert (=> b!1440052 m!1329273))

(assert (=> b!1440052 m!1329273))

(declare-fun m!1329301 () Bool)

(assert (=> b!1440052 m!1329301))

(check-sat (not b!1440052) (not b!1440054) (not b!1440050) (not b!1440055) (not b!1440047) (not start!124560) (not b!1440048) (not b!1440049))
(check-sat)
