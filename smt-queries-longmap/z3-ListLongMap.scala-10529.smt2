; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124146 () Bool)

(assert start!124146)

(declare-fun b!1437159 () Bool)

(declare-fun res!970042 () Bool)

(declare-fun e!810856 () Bool)

(assert (=> b!1437159 (=> (not res!970042) (not e!810856))))

(declare-datatypes ((array!97750 0))(
  ( (array!97751 (arr!47169 (Array (_ BitVec 32) (_ BitVec 64))) (size!47719 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97750)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97750 (_ BitVec 32)) Bool)

(assert (=> b!1437159 (= res!970042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437160 () Bool)

(declare-fun res!970048 () Bool)

(assert (=> b!1437160 (=> (not res!970048) (not e!810856))))

(declare-datatypes ((List!33670 0))(
  ( (Nil!33667) (Cons!33666 (h!35004 (_ BitVec 64)) (t!48364 List!33670)) )
))
(declare-fun arrayNoDuplicates!0 (array!97750 (_ BitVec 32) List!33670) Bool)

(assert (=> b!1437160 (= res!970048 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33667))))

(declare-fun b!1437161 () Bool)

(declare-fun res!970043 () Bool)

(assert (=> b!1437161 (=> (not res!970043) (not e!810856))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437161 (= res!970043 (and (= (size!47719 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47719 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47719 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!970046 () Bool)

(assert (=> start!124146 (=> (not res!970046) (not e!810856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124146 (= res!970046 (validMask!0 mask!2687))))

(assert (=> start!124146 e!810856))

(assert (=> start!124146 true))

(declare-fun array_inv!36197 (array!97750) Bool)

(assert (=> start!124146 (array_inv!36197 a!2862)))

(declare-fun b!1437162 () Bool)

(declare-fun res!970047 () Bool)

(assert (=> b!1437162 (=> (not res!970047) (not e!810856))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437162 (= res!970047 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47719 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47719 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47719 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47169 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437163 () Bool)

(declare-fun res!970044 () Bool)

(assert (=> b!1437163 (=> (not res!970044) (not e!810856))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437163 (= res!970044 (validKeyInArray!0 (select (arr!47169 a!2862) j!93)))))

(declare-fun b!1437164 () Bool)

(declare-fun res!970045 () Bool)

(assert (=> b!1437164 (=> (not res!970045) (not e!810856))))

(assert (=> b!1437164 (= res!970045 (validKeyInArray!0 (select (arr!47169 a!2862) i!1006)))))

(declare-fun b!1437165 () Bool)

(assert (=> b!1437165 (= e!810856 false)))

(declare-datatypes ((SeekEntryResult!11421 0))(
  ( (MissingZero!11421 (index!48076 (_ BitVec 32))) (Found!11421 (index!48077 (_ BitVec 32))) (Intermediate!11421 (undefined!12233 Bool) (index!48078 (_ BitVec 32)) (x!129806 (_ BitVec 32))) (Undefined!11421) (MissingVacant!11421 (index!48079 (_ BitVec 32))) )
))
(declare-fun lt!632244 () SeekEntryResult!11421)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97750 (_ BitVec 32)) SeekEntryResult!11421)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437165 (= lt!632244 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47169 a!2862) j!93) mask!2687) (select (arr!47169 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and start!124146 res!970046) b!1437161))

(assert (= (and b!1437161 res!970043) b!1437164))

(assert (= (and b!1437164 res!970045) b!1437163))

(assert (= (and b!1437163 res!970044) b!1437159))

(assert (= (and b!1437159 res!970042) b!1437160))

(assert (= (and b!1437160 res!970048) b!1437162))

(assert (= (and b!1437162 res!970047) b!1437165))

(declare-fun m!1326481 () Bool)

(assert (=> b!1437159 m!1326481))

(declare-fun m!1326483 () Bool)

(assert (=> b!1437163 m!1326483))

(assert (=> b!1437163 m!1326483))

(declare-fun m!1326485 () Bool)

(assert (=> b!1437163 m!1326485))

(declare-fun m!1326487 () Bool)

(assert (=> start!124146 m!1326487))

(declare-fun m!1326489 () Bool)

(assert (=> start!124146 m!1326489))

(assert (=> b!1437165 m!1326483))

(assert (=> b!1437165 m!1326483))

(declare-fun m!1326491 () Bool)

(assert (=> b!1437165 m!1326491))

(assert (=> b!1437165 m!1326491))

(assert (=> b!1437165 m!1326483))

(declare-fun m!1326493 () Bool)

(assert (=> b!1437165 m!1326493))

(declare-fun m!1326495 () Bool)

(assert (=> b!1437160 m!1326495))

(declare-fun m!1326497 () Bool)

(assert (=> b!1437164 m!1326497))

(assert (=> b!1437164 m!1326497))

(declare-fun m!1326499 () Bool)

(assert (=> b!1437164 m!1326499))

(declare-fun m!1326501 () Bool)

(assert (=> b!1437162 m!1326501))

(declare-fun m!1326503 () Bool)

(assert (=> b!1437162 m!1326503))

(check-sat (not start!124146) (not b!1437164) (not b!1437160) (not b!1437159) (not b!1437163) (not b!1437165))
