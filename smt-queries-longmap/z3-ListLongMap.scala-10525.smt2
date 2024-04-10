; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124122 () Bool)

(assert start!124122)

(declare-fun b!1436894 () Bool)

(declare-fun res!969780 () Bool)

(declare-fun e!810784 () Bool)

(assert (=> b!1436894 (=> (not res!969780) (not e!810784))))

(declare-datatypes ((array!97726 0))(
  ( (array!97727 (arr!47157 (Array (_ BitVec 32) (_ BitVec 64))) (size!47707 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97726)

(declare-datatypes ((List!33658 0))(
  ( (Nil!33655) (Cons!33654 (h!34992 (_ BitVec 64)) (t!48352 List!33658)) )
))
(declare-fun arrayNoDuplicates!0 (array!97726 (_ BitVec 32) List!33658) Bool)

(assert (=> b!1436894 (= res!969780 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33655))))

(declare-fun b!1436895 () Bool)

(declare-fun res!969784 () Bool)

(assert (=> b!1436895 (=> (not res!969784) (not e!810784))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1436895 (= res!969784 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47707 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47707 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47707 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47157 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!969782 () Bool)

(assert (=> start!124122 (=> (not res!969782) (not e!810784))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124122 (= res!969782 (validMask!0 mask!2687))))

(assert (=> start!124122 e!810784))

(assert (=> start!124122 true))

(declare-fun array_inv!36185 (array!97726) Bool)

(assert (=> start!124122 (array_inv!36185 a!2862)))

(declare-fun b!1436896 () Bool)

(declare-fun res!969778 () Bool)

(assert (=> b!1436896 (=> (not res!969778) (not e!810784))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436896 (= res!969778 (validKeyInArray!0 (select (arr!47157 a!2862) i!1006)))))

(declare-fun b!1436897 () Bool)

(assert (=> b!1436897 (= e!810784 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun b!1436898 () Bool)

(declare-fun res!969779 () Bool)

(assert (=> b!1436898 (=> (not res!969779) (not e!810784))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1436898 (= res!969779 (validKeyInArray!0 (select (arr!47157 a!2862) j!93)))))

(declare-fun b!1436899 () Bool)

(declare-fun res!969781 () Bool)

(assert (=> b!1436899 (=> (not res!969781) (not e!810784))))

(declare-datatypes ((SeekEntryResult!11409 0))(
  ( (MissingZero!11409 (index!48028 (_ BitVec 32))) (Found!11409 (index!48029 (_ BitVec 32))) (Intermediate!11409 (undefined!12221 Bool) (index!48030 (_ BitVec 32)) (x!129762 (_ BitVec 32))) (Undefined!11409) (MissingVacant!11409 (index!48031 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97726 (_ BitVec 32)) SeekEntryResult!11409)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436899 (= res!969781 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47157 a!2862) j!93) mask!2687) (select (arr!47157 a!2862) j!93) a!2862 mask!2687) (Intermediate!11409 false intermediateBeforeIndex!19 intermediateBeforeX!19)))))

(declare-fun b!1436900 () Bool)

(declare-fun res!969783 () Bool)

(assert (=> b!1436900 (=> (not res!969783) (not e!810784))))

(assert (=> b!1436900 (= res!969783 (and (= (size!47707 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47707 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47707 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436901 () Bool)

(declare-fun res!969777 () Bool)

(assert (=> b!1436901 (=> (not res!969777) (not e!810784))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97726 (_ BitVec 32)) Bool)

(assert (=> b!1436901 (= res!969777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124122 res!969782) b!1436900))

(assert (= (and b!1436900 res!969783) b!1436896))

(assert (= (and b!1436896 res!969778) b!1436898))

(assert (= (and b!1436898 res!969779) b!1436901))

(assert (= (and b!1436901 res!969777) b!1436894))

(assert (= (and b!1436894 res!969780) b!1436895))

(assert (= (and b!1436895 res!969784) b!1436899))

(assert (= (and b!1436899 res!969781) b!1436897))

(declare-fun m!1326193 () Bool)

(assert (=> b!1436901 m!1326193))

(declare-fun m!1326195 () Bool)

(assert (=> b!1436898 m!1326195))

(assert (=> b!1436898 m!1326195))

(declare-fun m!1326197 () Bool)

(assert (=> b!1436898 m!1326197))

(assert (=> b!1436899 m!1326195))

(assert (=> b!1436899 m!1326195))

(declare-fun m!1326199 () Bool)

(assert (=> b!1436899 m!1326199))

(assert (=> b!1436899 m!1326199))

(assert (=> b!1436899 m!1326195))

(declare-fun m!1326201 () Bool)

(assert (=> b!1436899 m!1326201))

(declare-fun m!1326203 () Bool)

(assert (=> b!1436896 m!1326203))

(assert (=> b!1436896 m!1326203))

(declare-fun m!1326205 () Bool)

(assert (=> b!1436896 m!1326205))

(declare-fun m!1326207 () Bool)

(assert (=> start!124122 m!1326207))

(declare-fun m!1326209 () Bool)

(assert (=> start!124122 m!1326209))

(declare-fun m!1326211 () Bool)

(assert (=> b!1436895 m!1326211))

(declare-fun m!1326213 () Bool)

(assert (=> b!1436895 m!1326213))

(declare-fun m!1326215 () Bool)

(assert (=> b!1436894 m!1326215))

(check-sat (not b!1436898) (not start!124122) (not b!1436901) (not b!1436894) (not b!1436896) (not b!1436899))
(check-sat)
