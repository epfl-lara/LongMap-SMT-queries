; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124120 () Bool)

(assert start!124120)

(declare-fun b!1436870 () Bool)

(declare-fun res!969754 () Bool)

(declare-fun e!810778 () Bool)

(assert (=> b!1436870 (=> (not res!969754) (not e!810778))))

(declare-datatypes ((array!97724 0))(
  ( (array!97725 (arr!47156 (Array (_ BitVec 32) (_ BitVec 64))) (size!47706 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97724)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97724 (_ BitVec 32)) Bool)

(assert (=> b!1436870 (= res!969754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436871 () Bool)

(declare-fun res!969758 () Bool)

(assert (=> b!1436871 (=> (not res!969758) (not e!810778))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436871 (= res!969758 (validKeyInArray!0 (select (arr!47156 a!2862) j!93)))))

(declare-fun b!1436872 () Bool)

(declare-fun res!969759 () Bool)

(assert (=> b!1436872 (=> (not res!969759) (not e!810778))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1436872 (= res!969759 (and (= (size!47706 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47706 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47706 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436873 () Bool)

(assert (=> b!1436873 (= e!810778 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun b!1436874 () Bool)

(declare-fun res!969753 () Bool)

(assert (=> b!1436874 (=> (not res!969753) (not e!810778))))

(assert (=> b!1436874 (= res!969753 (validKeyInArray!0 (select (arr!47156 a!2862) i!1006)))))

(declare-fun res!969757 () Bool)

(assert (=> start!124120 (=> (not res!969757) (not e!810778))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124120 (= res!969757 (validMask!0 mask!2687))))

(assert (=> start!124120 e!810778))

(assert (=> start!124120 true))

(declare-fun array_inv!36184 (array!97724) Bool)

(assert (=> start!124120 (array_inv!36184 a!2862)))

(declare-fun b!1436875 () Bool)

(declare-fun res!969755 () Bool)

(assert (=> b!1436875 (=> (not res!969755) (not e!810778))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11408 0))(
  ( (MissingZero!11408 (index!48024 (_ BitVec 32))) (Found!11408 (index!48025 (_ BitVec 32))) (Intermediate!11408 (undefined!12220 Bool) (index!48026 (_ BitVec 32)) (x!129761 (_ BitVec 32))) (Undefined!11408) (MissingVacant!11408 (index!48027 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97724 (_ BitVec 32)) SeekEntryResult!11408)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436875 (= res!969755 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47156 a!2862) j!93) mask!2687) (select (arr!47156 a!2862) j!93) a!2862 mask!2687) (Intermediate!11408 false intermediateBeforeIndex!19 intermediateBeforeX!19)))))

(declare-fun b!1436876 () Bool)

(declare-fun res!969756 () Bool)

(assert (=> b!1436876 (=> (not res!969756) (not e!810778))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1436876 (= res!969756 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47706 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47706 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47706 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47156 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436877 () Bool)

(declare-fun res!969760 () Bool)

(assert (=> b!1436877 (=> (not res!969760) (not e!810778))))

(declare-datatypes ((List!33657 0))(
  ( (Nil!33654) (Cons!33653 (h!34991 (_ BitVec 64)) (t!48351 List!33657)) )
))
(declare-fun arrayNoDuplicates!0 (array!97724 (_ BitVec 32) List!33657) Bool)

(assert (=> b!1436877 (= res!969760 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33654))))

(assert (= (and start!124120 res!969757) b!1436872))

(assert (= (and b!1436872 res!969759) b!1436874))

(assert (= (and b!1436874 res!969753) b!1436871))

(assert (= (and b!1436871 res!969758) b!1436870))

(assert (= (and b!1436870 res!969754) b!1436877))

(assert (= (and b!1436877 res!969760) b!1436876))

(assert (= (and b!1436876 res!969756) b!1436875))

(assert (= (and b!1436875 res!969755) b!1436873))

(declare-fun m!1326169 () Bool)

(assert (=> b!1436877 m!1326169))

(declare-fun m!1326171 () Bool)

(assert (=> b!1436870 m!1326171))

(declare-fun m!1326173 () Bool)

(assert (=> b!1436876 m!1326173))

(declare-fun m!1326175 () Bool)

(assert (=> b!1436876 m!1326175))

(declare-fun m!1326177 () Bool)

(assert (=> start!124120 m!1326177))

(declare-fun m!1326179 () Bool)

(assert (=> start!124120 m!1326179))

(declare-fun m!1326181 () Bool)

(assert (=> b!1436875 m!1326181))

(assert (=> b!1436875 m!1326181))

(declare-fun m!1326183 () Bool)

(assert (=> b!1436875 m!1326183))

(assert (=> b!1436875 m!1326183))

(assert (=> b!1436875 m!1326181))

(declare-fun m!1326185 () Bool)

(assert (=> b!1436875 m!1326185))

(assert (=> b!1436871 m!1326181))

(assert (=> b!1436871 m!1326181))

(declare-fun m!1326187 () Bool)

(assert (=> b!1436871 m!1326187))

(declare-fun m!1326189 () Bool)

(assert (=> b!1436874 m!1326189))

(assert (=> b!1436874 m!1326189))

(declare-fun m!1326191 () Bool)

(assert (=> b!1436874 m!1326191))

(push 1)

(assert (not start!124120))

(assert (not b!1436870))

(assert (not b!1436871))

(assert (not b!1436874))

(assert (not b!1436877))

(assert (not b!1436875))

(check-sat)

(pop 1)

