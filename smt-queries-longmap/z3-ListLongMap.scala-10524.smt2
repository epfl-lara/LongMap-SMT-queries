; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124116 () Bool)

(assert start!124116)

(declare-fun b!1436826 () Bool)

(declare-fun res!969715 () Bool)

(declare-fun e!810766 () Bool)

(assert (=> b!1436826 (=> (not res!969715) (not e!810766))))

(declare-datatypes ((array!97720 0))(
  ( (array!97721 (arr!47154 (Array (_ BitVec 32) (_ BitVec 64))) (size!47704 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97720)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436826 (= res!969715 (validKeyInArray!0 (select (arr!47154 a!2862) i!1006)))))

(declare-fun res!969711 () Bool)

(assert (=> start!124116 (=> (not res!969711) (not e!810766))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124116 (= res!969711 (validMask!0 mask!2687))))

(assert (=> start!124116 e!810766))

(assert (=> start!124116 true))

(declare-fun array_inv!36182 (array!97720) Bool)

(assert (=> start!124116 (array_inv!36182 a!2862)))

(declare-fun b!1436827 () Bool)

(declare-fun res!969710 () Bool)

(assert (=> b!1436827 (=> (not res!969710) (not e!810766))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1436827 (= res!969710 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47704 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47704 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47704 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47154 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436828 () Bool)

(declare-fun res!969714 () Bool)

(assert (=> b!1436828 (=> (not res!969714) (not e!810766))))

(declare-datatypes ((List!33655 0))(
  ( (Nil!33652) (Cons!33651 (h!34989 (_ BitVec 64)) (t!48349 List!33655)) )
))
(declare-fun arrayNoDuplicates!0 (array!97720 (_ BitVec 32) List!33655) Bool)

(assert (=> b!1436828 (= res!969714 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33652))))

(declare-fun b!1436829 () Bool)

(declare-fun res!969712 () Bool)

(assert (=> b!1436829 (=> (not res!969712) (not e!810766))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1436829 (= res!969712 (validKeyInArray!0 (select (arr!47154 a!2862) j!93)))))

(declare-fun b!1436830 () Bool)

(declare-fun res!969713 () Bool)

(assert (=> b!1436830 (=> (not res!969713) (not e!810766))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97720 (_ BitVec 32)) Bool)

(assert (=> b!1436830 (= res!969713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436831 () Bool)

(declare-fun res!969709 () Bool)

(assert (=> b!1436831 (=> (not res!969709) (not e!810766))))

(assert (=> b!1436831 (= res!969709 (and (= (size!47704 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47704 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47704 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436832 () Bool)

(assert (=> b!1436832 (= e!810766 false)))

(declare-datatypes ((SeekEntryResult!11406 0))(
  ( (MissingZero!11406 (index!48016 (_ BitVec 32))) (Found!11406 (index!48017 (_ BitVec 32))) (Intermediate!11406 (undefined!12218 Bool) (index!48018 (_ BitVec 32)) (x!129751 (_ BitVec 32))) (Undefined!11406) (MissingVacant!11406 (index!48019 (_ BitVec 32))) )
))
(declare-fun lt!632217 () SeekEntryResult!11406)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97720 (_ BitVec 32)) SeekEntryResult!11406)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436832 (= lt!632217 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47154 a!2862) j!93) mask!2687) (select (arr!47154 a!2862) j!93) a!2862 mask!2687))))

(assert (= (and start!124116 res!969711) b!1436831))

(assert (= (and b!1436831 res!969709) b!1436826))

(assert (= (and b!1436826 res!969715) b!1436829))

(assert (= (and b!1436829 res!969712) b!1436830))

(assert (= (and b!1436830 res!969713) b!1436828))

(assert (= (and b!1436828 res!969714) b!1436827))

(assert (= (and b!1436827 res!969710) b!1436832))

(declare-fun m!1326121 () Bool)

(assert (=> b!1436830 m!1326121))

(declare-fun m!1326123 () Bool)

(assert (=> b!1436826 m!1326123))

(assert (=> b!1436826 m!1326123))

(declare-fun m!1326125 () Bool)

(assert (=> b!1436826 m!1326125))

(declare-fun m!1326127 () Bool)

(assert (=> start!124116 m!1326127))

(declare-fun m!1326129 () Bool)

(assert (=> start!124116 m!1326129))

(declare-fun m!1326131 () Bool)

(assert (=> b!1436828 m!1326131))

(declare-fun m!1326133 () Bool)

(assert (=> b!1436829 m!1326133))

(assert (=> b!1436829 m!1326133))

(declare-fun m!1326135 () Bool)

(assert (=> b!1436829 m!1326135))

(declare-fun m!1326137 () Bool)

(assert (=> b!1436827 m!1326137))

(declare-fun m!1326139 () Bool)

(assert (=> b!1436827 m!1326139))

(assert (=> b!1436832 m!1326133))

(assert (=> b!1436832 m!1326133))

(declare-fun m!1326141 () Bool)

(assert (=> b!1436832 m!1326141))

(assert (=> b!1436832 m!1326141))

(assert (=> b!1436832 m!1326133))

(declare-fun m!1326143 () Bool)

(assert (=> b!1436832 m!1326143))

(check-sat (not b!1436829) (not start!124116) (not b!1436828) (not b!1436826) (not b!1436832) (not b!1436830))
