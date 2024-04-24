; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124644 () Bool)

(assert start!124644)

(declare-fun b!1440872 () Bool)

(declare-fun res!972475 () Bool)

(declare-fun e!812744 () Bool)

(assert (=> b!1440872 (=> (not res!972475) (not e!812744))))

(declare-datatypes ((array!97987 0))(
  ( (array!97988 (arr!47278 (Array (_ BitVec 32) (_ BitVec 64))) (size!47829 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97987)

(declare-datatypes ((List!33766 0))(
  ( (Nil!33763) (Cons!33762 (h!35123 (_ BitVec 64)) (t!48452 List!33766)) )
))
(declare-fun arrayNoDuplicates!0 (array!97987 (_ BitVec 32) List!33766) Bool)

(assert (=> b!1440872 (= res!972475 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33763))))

(declare-fun res!972476 () Bool)

(assert (=> start!124644 (=> (not res!972476) (not e!812744))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124644 (= res!972476 (validMask!0 mask!2687))))

(assert (=> start!124644 e!812744))

(assert (=> start!124644 true))

(declare-fun array_inv!36559 (array!97987) Bool)

(assert (=> start!124644 (array_inv!36559 a!2862)))

(declare-fun b!1440873 () Bool)

(declare-fun res!972477 () Bool)

(assert (=> b!1440873 (=> (not res!972477) (not e!812744))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1440873 (= res!972477 (and (= (size!47829 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47829 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47829 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440874 () Bool)

(declare-fun res!972478 () Bool)

(assert (=> b!1440874 (=> (not res!972478) (not e!812744))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440874 (= res!972478 (validKeyInArray!0 (select (arr!47278 a!2862) j!93)))))

(declare-fun b!1440875 () Bool)

(declare-fun res!972480 () Bool)

(assert (=> b!1440875 (=> (not res!972480) (not e!812744))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97987 (_ BitVec 32)) Bool)

(assert (=> b!1440875 (= res!972480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440876 () Bool)

(declare-fun e!812745 () Bool)

(assert (=> b!1440876 (= e!812744 e!812745)))

(declare-fun res!972482 () Bool)

(assert (=> b!1440876 (=> (not res!972482) (not e!812745))))

(declare-datatypes ((SeekEntryResult!11427 0))(
  ( (MissingZero!11427 (index!48100 (_ BitVec 32))) (Found!11427 (index!48101 (_ BitVec 32))) (Intermediate!11427 (undefined!12239 Bool) (index!48102 (_ BitVec 32)) (x!130012 (_ BitVec 32))) (Undefined!11427) (MissingVacant!11427 (index!48103 (_ BitVec 32))) )
))
(declare-fun lt!633306 () SeekEntryResult!11427)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97987 (_ BitVec 32)) SeekEntryResult!11427)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440876 (= res!972482 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47278 a!2862) j!93) mask!2687) (select (arr!47278 a!2862) j!93) a!2862 mask!2687) lt!633306))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440876 (= lt!633306 (Intermediate!11427 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440877 () Bool)

(declare-fun res!972481 () Bool)

(assert (=> b!1440877 (=> (not res!972481) (not e!812745))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1440877 (= res!972481 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47278 a!2862) j!93) a!2862 mask!2687) lt!633306))))

(declare-fun b!1440878 () Bool)

(declare-fun res!972474 () Bool)

(assert (=> b!1440878 (=> (not res!972474) (not e!812744))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440878 (= res!972474 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47829 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47829 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47829 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47278 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440879 () Bool)

(declare-fun res!972479 () Bool)

(assert (=> b!1440879 (=> (not res!972479) (not e!812744))))

(assert (=> b!1440879 (= res!972479 (validKeyInArray!0 (select (arr!47278 a!2862) i!1006)))))

(declare-fun b!1440880 () Bool)

(assert (=> b!1440880 (= e!812745 false)))

(declare-fun lt!633307 () SeekEntryResult!11427)

(assert (=> b!1440880 (= lt!633307 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47278 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47278 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97988 (store (arr!47278 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47829 a!2862)) mask!2687))))

(assert (= (and start!124644 res!972476) b!1440873))

(assert (= (and b!1440873 res!972477) b!1440879))

(assert (= (and b!1440879 res!972479) b!1440874))

(assert (= (and b!1440874 res!972478) b!1440875))

(assert (= (and b!1440875 res!972480) b!1440872))

(assert (= (and b!1440872 res!972475) b!1440878))

(assert (= (and b!1440878 res!972474) b!1440876))

(assert (= (and b!1440876 res!972482) b!1440877))

(assert (= (and b!1440877 res!972481) b!1440880))

(declare-fun m!1330069 () Bool)

(assert (=> b!1440874 m!1330069))

(assert (=> b!1440874 m!1330069))

(declare-fun m!1330071 () Bool)

(assert (=> b!1440874 m!1330071))

(assert (=> b!1440877 m!1330069))

(assert (=> b!1440877 m!1330069))

(declare-fun m!1330073 () Bool)

(assert (=> b!1440877 m!1330073))

(declare-fun m!1330075 () Bool)

(assert (=> b!1440878 m!1330075))

(declare-fun m!1330077 () Bool)

(assert (=> b!1440878 m!1330077))

(declare-fun m!1330079 () Bool)

(assert (=> start!124644 m!1330079))

(declare-fun m!1330081 () Bool)

(assert (=> start!124644 m!1330081))

(assert (=> b!1440876 m!1330069))

(assert (=> b!1440876 m!1330069))

(declare-fun m!1330083 () Bool)

(assert (=> b!1440876 m!1330083))

(assert (=> b!1440876 m!1330083))

(assert (=> b!1440876 m!1330069))

(declare-fun m!1330085 () Bool)

(assert (=> b!1440876 m!1330085))

(assert (=> b!1440880 m!1330075))

(declare-fun m!1330087 () Bool)

(assert (=> b!1440880 m!1330087))

(assert (=> b!1440880 m!1330087))

(declare-fun m!1330089 () Bool)

(assert (=> b!1440880 m!1330089))

(assert (=> b!1440880 m!1330089))

(assert (=> b!1440880 m!1330087))

(declare-fun m!1330091 () Bool)

(assert (=> b!1440880 m!1330091))

(declare-fun m!1330093 () Bool)

(assert (=> b!1440875 m!1330093))

(declare-fun m!1330095 () Bool)

(assert (=> b!1440872 m!1330095))

(declare-fun m!1330097 () Bool)

(assert (=> b!1440879 m!1330097))

(assert (=> b!1440879 m!1330097))

(declare-fun m!1330099 () Bool)

(assert (=> b!1440879 m!1330099))

(check-sat (not b!1440875) (not b!1440874) (not b!1440879) (not b!1440872) (not b!1440877) (not b!1440876) (not b!1440880) (not start!124644))
(check-sat)
