; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124432 () Bool)

(assert start!124432)

(declare-fun b!1439872 () Bool)

(declare-fun res!972417 () Bool)

(declare-fun e!811952 () Bool)

(assert (=> b!1439872 (=> (not res!972417) (not e!811952))))

(declare-datatypes ((SeekEntryResult!11495 0))(
  ( (MissingZero!11495 (index!48372 (_ BitVec 32))) (Found!11495 (index!48373 (_ BitVec 32))) (Intermediate!11495 (undefined!12307 Bool) (index!48374 (_ BitVec 32)) (x!130099 (_ BitVec 32))) (Undefined!11495) (MissingVacant!11495 (index!48375 (_ BitVec 32))) )
))
(declare-fun lt!632675 () SeekEntryResult!11495)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!97858 0))(
  ( (array!97859 (arr!47218 (Array (_ BitVec 32) (_ BitVec 64))) (size!47770 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97858)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97858 (_ BitVec 32)) SeekEntryResult!11495)

(assert (=> b!1439872 (= res!972417 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47218 a!2862) j!93) a!2862 mask!2687) lt!632675))))

(declare-fun b!1439873 () Bool)

(declare-fun e!811953 () Bool)

(assert (=> b!1439873 (= e!811953 e!811952)))

(declare-fun res!972419 () Bool)

(assert (=> b!1439873 (=> (not res!972419) (not e!811952))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439873 (= res!972419 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47218 a!2862) j!93) mask!2687) (select (arr!47218 a!2862) j!93) a!2862 mask!2687) lt!632675))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1439873 (= lt!632675 (Intermediate!11495 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439874 () Bool)

(declare-fun res!972421 () Bool)

(assert (=> b!1439874 (=> (not res!972421) (not e!811953))))

(declare-datatypes ((List!33797 0))(
  ( (Nil!33794) (Cons!33793 (h!35143 (_ BitVec 64)) (t!48483 List!33797)) )
))
(declare-fun arrayNoDuplicates!0 (array!97858 (_ BitVec 32) List!33797) Bool)

(assert (=> b!1439874 (= res!972421 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33794))))

(declare-fun b!1439875 () Bool)

(declare-fun res!972424 () Bool)

(assert (=> b!1439875 (=> (not res!972424) (not e!811953))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1439875 (= res!972424 (and (= (size!47770 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47770 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47770 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439876 () Bool)

(declare-fun res!972422 () Bool)

(assert (=> b!1439876 (=> (not res!972422) (not e!811953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97858 (_ BitVec 32)) Bool)

(assert (=> b!1439876 (= res!972422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439877 () Bool)

(declare-fun res!972416 () Bool)

(assert (=> b!1439877 (=> (not res!972416) (not e!811953))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439877 (= res!972416 (validKeyInArray!0 (select (arr!47218 a!2862) i!1006)))))

(declare-fun b!1439879 () Bool)

(declare-fun res!972420 () Bool)

(assert (=> b!1439879 (=> (not res!972420) (not e!811953))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1439879 (= res!972420 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47770 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47770 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47770 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47218 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439880 () Bool)

(declare-fun res!972418 () Bool)

(assert (=> b!1439880 (=> (not res!972418) (not e!811953))))

(assert (=> b!1439880 (= res!972418 (validKeyInArray!0 (select (arr!47218 a!2862) j!93)))))

(declare-fun res!972423 () Bool)

(assert (=> start!124432 (=> (not res!972423) (not e!811953))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124432 (= res!972423 (validMask!0 mask!2687))))

(assert (=> start!124432 e!811953))

(assert (=> start!124432 true))

(declare-fun array_inv!36451 (array!97858) Bool)

(assert (=> start!124432 (array_inv!36451 a!2862)))

(declare-fun b!1439878 () Bool)

(assert (=> b!1439878 (= e!811952 false)))

(declare-fun lt!632676 () SeekEntryResult!11495)

(assert (=> b!1439878 (= lt!632676 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47218 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47218 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97859 (store (arr!47218 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47770 a!2862)) mask!2687))))

(assert (= (and start!124432 res!972423) b!1439875))

(assert (= (and b!1439875 res!972424) b!1439877))

(assert (= (and b!1439877 res!972416) b!1439880))

(assert (= (and b!1439880 res!972418) b!1439876))

(assert (= (and b!1439876 res!972422) b!1439874))

(assert (= (and b!1439874 res!972421) b!1439879))

(assert (= (and b!1439879 res!972420) b!1439873))

(assert (= (and b!1439873 res!972419) b!1439872))

(assert (= (and b!1439872 res!972417) b!1439878))

(declare-fun m!1328535 () Bool)

(assert (=> b!1439879 m!1328535))

(declare-fun m!1328537 () Bool)

(assert (=> b!1439879 m!1328537))

(declare-fun m!1328539 () Bool)

(assert (=> b!1439877 m!1328539))

(assert (=> b!1439877 m!1328539))

(declare-fun m!1328541 () Bool)

(assert (=> b!1439877 m!1328541))

(assert (=> b!1439878 m!1328535))

(declare-fun m!1328543 () Bool)

(assert (=> b!1439878 m!1328543))

(assert (=> b!1439878 m!1328543))

(declare-fun m!1328545 () Bool)

(assert (=> b!1439878 m!1328545))

(assert (=> b!1439878 m!1328545))

(assert (=> b!1439878 m!1328543))

(declare-fun m!1328547 () Bool)

(assert (=> b!1439878 m!1328547))

(declare-fun m!1328549 () Bool)

(assert (=> b!1439874 m!1328549))

(declare-fun m!1328551 () Bool)

(assert (=> start!124432 m!1328551))

(declare-fun m!1328553 () Bool)

(assert (=> start!124432 m!1328553))

(declare-fun m!1328555 () Bool)

(assert (=> b!1439880 m!1328555))

(assert (=> b!1439880 m!1328555))

(declare-fun m!1328557 () Bool)

(assert (=> b!1439880 m!1328557))

(declare-fun m!1328559 () Bool)

(assert (=> b!1439876 m!1328559))

(assert (=> b!1439872 m!1328555))

(assert (=> b!1439872 m!1328555))

(declare-fun m!1328561 () Bool)

(assert (=> b!1439872 m!1328561))

(assert (=> b!1439873 m!1328555))

(assert (=> b!1439873 m!1328555))

(declare-fun m!1328563 () Bool)

(assert (=> b!1439873 m!1328563))

(assert (=> b!1439873 m!1328563))

(assert (=> b!1439873 m!1328555))

(declare-fun m!1328565 () Bool)

(assert (=> b!1439873 m!1328565))

(check-sat (not b!1439872) (not b!1439874) (not start!124432) (not b!1439876) (not b!1439873) (not b!1439877) (not b!1439880) (not b!1439878))
(check-sat)
