; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124498 () Bool)

(assert start!124498)

(declare-fun res!973398 () Bool)

(declare-fun e!812282 () Bool)

(assert (=> start!124498 (=> (not res!973398) (not e!812282))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124498 (= res!973398 (validMask!0 mask!2687))))

(assert (=> start!124498 e!812282))

(assert (=> start!124498 true))

(declare-datatypes ((array!97924 0))(
  ( (array!97925 (arr!47251 (Array (_ BitVec 32) (_ BitVec 64))) (size!47803 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97924)

(declare-fun array_inv!36484 (array!97924) Bool)

(assert (=> start!124498 (array_inv!36484 a!2862)))

(declare-fun b!1440870 () Bool)

(declare-fun res!973402 () Bool)

(assert (=> b!1440870 (=> (not res!973402) (not e!812282))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440870 (= res!973402 (validKeyInArray!0 (select (arr!47251 a!2862) j!93)))))

(declare-fun b!1440871 () Bool)

(declare-fun res!973393 () Bool)

(assert (=> b!1440871 (=> (not res!973393) (not e!812282))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1440871 (= res!973393 (validKeyInArray!0 (select (arr!47251 a!2862) i!1006)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!632865 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11528 0))(
  ( (MissingZero!11528 (index!48504 (_ BitVec 32))) (Found!11528 (index!48505 (_ BitVec 32))) (Intermediate!11528 (undefined!12340 Bool) (index!48506 (_ BitVec 32)) (x!130220 (_ BitVec 32))) (Undefined!11528) (MissingVacant!11528 (index!48507 (_ BitVec 32))) )
))
(declare-fun lt!632861 () SeekEntryResult!11528)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!812283 () Bool)

(declare-fun b!1440872 () Bool)

(declare-fun lt!632863 () array!97924)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97924 (_ BitVec 32)) SeekEntryResult!11528)

(assert (=> b!1440872 (= e!812283 (not (= lt!632861 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!632865 lt!632863 mask!2687))))))

(declare-fun b!1440873 () Bool)

(declare-fun e!812285 () Bool)

(assert (=> b!1440873 (= e!812285 false)))

(declare-fun lt!632862 () Bool)

(assert (=> b!1440873 (= lt!632862 e!812283)))

(declare-fun c!133252 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1440873 (= c!133252 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1440874 () Bool)

(declare-fun e!812286 () Bool)

(assert (=> b!1440874 (= e!812282 e!812286)))

(declare-fun res!973392 () Bool)

(assert (=> b!1440874 (=> (not res!973392) (not e!812286))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440874 (= res!973392 (= (select (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1440874 (= lt!632863 (array!97925 (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47803 a!2862)))))

(declare-fun b!1440875 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97924 (_ BitVec 32)) SeekEntryResult!11528)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97924 (_ BitVec 32)) SeekEntryResult!11528)

(assert (=> b!1440875 (= e!812283 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!632865 lt!632863 mask!2687) (seekEntryOrOpen!0 lt!632865 lt!632863 mask!2687))))))

(declare-fun b!1440876 () Bool)

(declare-fun res!973396 () Bool)

(assert (=> b!1440876 (=> (not res!973396) (not e!812282))))

(declare-datatypes ((List!33830 0))(
  ( (Nil!33827) (Cons!33826 (h!35176 (_ BitVec 64)) (t!48516 List!33830)) )
))
(declare-fun arrayNoDuplicates!0 (array!97924 (_ BitVec 32) List!33830) Bool)

(assert (=> b!1440876 (= res!973396 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33827))))

(declare-fun b!1440877 () Bool)

(declare-fun e!812284 () Bool)

(assert (=> b!1440877 (= e!812286 e!812284)))

(declare-fun res!973394 () Bool)

(assert (=> b!1440877 (=> (not res!973394) (not e!812284))))

(declare-fun lt!632864 () SeekEntryResult!11528)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440877 (= res!973394 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47251 a!2862) j!93) mask!2687) (select (arr!47251 a!2862) j!93) a!2862 mask!2687) lt!632864))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440877 (= lt!632864 (Intermediate!11528 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440878 () Bool)

(declare-fun res!973401 () Bool)

(assert (=> b!1440878 (=> (not res!973401) (not e!812282))))

(assert (=> b!1440878 (= res!973401 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47803 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47803 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47803 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1440879 () Bool)

(declare-fun res!973399 () Bool)

(assert (=> b!1440879 (=> (not res!973399) (not e!812282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97924 (_ BitVec 32)) Bool)

(assert (=> b!1440879 (= res!973399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440880 () Bool)

(declare-fun res!973397 () Bool)

(assert (=> b!1440880 (=> (not res!973397) (not e!812282))))

(assert (=> b!1440880 (= res!973397 (and (= (size!47803 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47803 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47803 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440881 () Bool)

(assert (=> b!1440881 (= e!812284 e!812285)))

(declare-fun res!973395 () Bool)

(assert (=> b!1440881 (=> (not res!973395) (not e!812285))))

(assert (=> b!1440881 (= res!973395 (= lt!632861 (Intermediate!11528 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1440881 (= lt!632861 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!632865 mask!2687) lt!632865 lt!632863 mask!2687))))

(assert (=> b!1440881 (= lt!632865 (select (store (arr!47251 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1440882 () Bool)

(declare-fun res!973400 () Bool)

(assert (=> b!1440882 (=> (not res!973400) (not e!812284))))

(assert (=> b!1440882 (= res!973400 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47251 a!2862) j!93) a!2862 mask!2687) lt!632864))))

(assert (= (and start!124498 res!973398) b!1440880))

(assert (= (and b!1440880 res!973397) b!1440871))

(assert (= (and b!1440871 res!973393) b!1440870))

(assert (= (and b!1440870 res!973402) b!1440879))

(assert (= (and b!1440879 res!973399) b!1440876))

(assert (= (and b!1440876 res!973396) b!1440878))

(assert (= (and b!1440878 res!973401) b!1440874))

(assert (= (and b!1440874 res!973392) b!1440877))

(assert (= (and b!1440877 res!973394) b!1440882))

(assert (= (and b!1440882 res!973400) b!1440881))

(assert (= (and b!1440881 res!973395) b!1440873))

(assert (= (and b!1440873 c!133252) b!1440872))

(assert (= (and b!1440873 (not c!133252)) b!1440875))

(declare-fun m!1329621 () Bool)

(assert (=> b!1440871 m!1329621))

(assert (=> b!1440871 m!1329621))

(declare-fun m!1329623 () Bool)

(assert (=> b!1440871 m!1329623))

(declare-fun m!1329625 () Bool)

(assert (=> b!1440875 m!1329625))

(declare-fun m!1329627 () Bool)

(assert (=> b!1440875 m!1329627))

(declare-fun m!1329629 () Bool)

(assert (=> b!1440874 m!1329629))

(declare-fun m!1329631 () Bool)

(assert (=> b!1440874 m!1329631))

(declare-fun m!1329633 () Bool)

(assert (=> b!1440870 m!1329633))

(assert (=> b!1440870 m!1329633))

(declare-fun m!1329635 () Bool)

(assert (=> b!1440870 m!1329635))

(assert (=> b!1440877 m!1329633))

(assert (=> b!1440877 m!1329633))

(declare-fun m!1329637 () Bool)

(assert (=> b!1440877 m!1329637))

(assert (=> b!1440877 m!1329637))

(assert (=> b!1440877 m!1329633))

(declare-fun m!1329639 () Bool)

(assert (=> b!1440877 m!1329639))

(declare-fun m!1329641 () Bool)

(assert (=> b!1440876 m!1329641))

(declare-fun m!1329643 () Bool)

(assert (=> b!1440881 m!1329643))

(assert (=> b!1440881 m!1329643))

(declare-fun m!1329645 () Bool)

(assert (=> b!1440881 m!1329645))

(assert (=> b!1440881 m!1329629))

(declare-fun m!1329647 () Bool)

(assert (=> b!1440881 m!1329647))

(declare-fun m!1329649 () Bool)

(assert (=> start!124498 m!1329649))

(declare-fun m!1329651 () Bool)

(assert (=> start!124498 m!1329651))

(declare-fun m!1329653 () Bool)

(assert (=> b!1440872 m!1329653))

(declare-fun m!1329655 () Bool)

(assert (=> b!1440879 m!1329655))

(assert (=> b!1440882 m!1329633))

(assert (=> b!1440882 m!1329633))

(declare-fun m!1329657 () Bool)

(assert (=> b!1440882 m!1329657))

(check-sat (not b!1440881) (not b!1440879) (not b!1440871) (not b!1440870) (not b!1440877) (not b!1440876) (not b!1440882) (not b!1440875) (not start!124498) (not b!1440872))
(check-sat)
