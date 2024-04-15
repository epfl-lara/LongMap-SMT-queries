; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124090 () Bool)

(assert start!124090)

(declare-fun b!1436675 () Bool)

(declare-fun res!969675 () Bool)

(declare-fun e!810662 () Bool)

(assert (=> b!1436675 (=> (not res!969675) (not e!810662))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97672 0))(
  ( (array!97673 (arr!47131 (Array (_ BitVec 32) (_ BitVec 64))) (size!47683 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97672)

(assert (=> b!1436675 (= res!969675 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47683 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47683 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47683 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47131 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436676 () Bool)

(declare-fun res!969677 () Bool)

(assert (=> b!1436676 (=> (not res!969677) (not e!810662))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436676 (= res!969677 (validKeyInArray!0 (select (arr!47131 a!2862) j!93)))))

(declare-fun res!969682 () Bool)

(assert (=> start!124090 (=> (not res!969682) (not e!810662))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124090 (= res!969682 (validMask!0 mask!2687))))

(assert (=> start!124090 e!810662))

(assert (=> start!124090 true))

(declare-fun array_inv!36364 (array!97672) Bool)

(assert (=> start!124090 (array_inv!36364 a!2862)))

(declare-fun b!1436677 () Bool)

(assert (=> b!1436677 (= e!810662 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun b!1436678 () Bool)

(declare-fun res!969680 () Bool)

(assert (=> b!1436678 (=> (not res!969680) (not e!810662))))

(declare-datatypes ((List!33710 0))(
  ( (Nil!33707) (Cons!33706 (h!35044 (_ BitVec 64)) (t!48396 List!33710)) )
))
(declare-fun arrayNoDuplicates!0 (array!97672 (_ BitVec 32) List!33710) Bool)

(assert (=> b!1436678 (= res!969680 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33707))))

(declare-fun b!1436679 () Bool)

(declare-fun res!969678 () Bool)

(assert (=> b!1436679 (=> (not res!969678) (not e!810662))))

(assert (=> b!1436679 (= res!969678 (and (= (size!47683 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47683 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47683 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436680 () Bool)

(declare-fun res!969679 () Bool)

(assert (=> b!1436680 (=> (not res!969679) (not e!810662))))

(assert (=> b!1436680 (= res!969679 (validKeyInArray!0 (select (arr!47131 a!2862) i!1006)))))

(declare-fun b!1436681 () Bool)

(declare-fun res!969681 () Bool)

(assert (=> b!1436681 (=> (not res!969681) (not e!810662))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97672 (_ BitVec 32)) Bool)

(assert (=> b!1436681 (= res!969681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436682 () Bool)

(declare-fun res!969676 () Bool)

(assert (=> b!1436682 (=> (not res!969676) (not e!810662))))

(declare-datatypes ((SeekEntryResult!11408 0))(
  ( (MissingZero!11408 (index!48024 (_ BitVec 32))) (Found!11408 (index!48025 (_ BitVec 32))) (Intermediate!11408 (undefined!12220 Bool) (index!48026 (_ BitVec 32)) (x!129756 (_ BitVec 32))) (Undefined!11408) (MissingVacant!11408 (index!48027 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97672 (_ BitVec 32)) SeekEntryResult!11408)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436682 (= res!969676 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47131 a!2862) j!93) mask!2687) (select (arr!47131 a!2862) j!93) a!2862 mask!2687) (Intermediate!11408 false intermediateBeforeIndex!19 intermediateBeforeX!19)))))

(assert (= (and start!124090 res!969682) b!1436679))

(assert (= (and b!1436679 res!969678) b!1436680))

(assert (= (and b!1436680 res!969679) b!1436676))

(assert (= (and b!1436676 res!969677) b!1436681))

(assert (= (and b!1436681 res!969681) b!1436678))

(assert (= (and b!1436678 res!969680) b!1436675))

(assert (= (and b!1436675 res!969675) b!1436682))

(assert (= (and b!1436682 res!969676) b!1436677))

(declare-fun m!1325493 () Bool)

(assert (=> b!1436678 m!1325493))

(declare-fun m!1325495 () Bool)

(assert (=> start!124090 m!1325495))

(declare-fun m!1325497 () Bool)

(assert (=> start!124090 m!1325497))

(declare-fun m!1325499 () Bool)

(assert (=> b!1436675 m!1325499))

(declare-fun m!1325501 () Bool)

(assert (=> b!1436675 m!1325501))

(declare-fun m!1325503 () Bool)

(assert (=> b!1436682 m!1325503))

(assert (=> b!1436682 m!1325503))

(declare-fun m!1325505 () Bool)

(assert (=> b!1436682 m!1325505))

(assert (=> b!1436682 m!1325505))

(assert (=> b!1436682 m!1325503))

(declare-fun m!1325507 () Bool)

(assert (=> b!1436682 m!1325507))

(declare-fun m!1325509 () Bool)

(assert (=> b!1436680 m!1325509))

(assert (=> b!1436680 m!1325509))

(declare-fun m!1325511 () Bool)

(assert (=> b!1436680 m!1325511))

(declare-fun m!1325513 () Bool)

(assert (=> b!1436681 m!1325513))

(assert (=> b!1436676 m!1325503))

(assert (=> b!1436676 m!1325503))

(declare-fun m!1325515 () Bool)

(assert (=> b!1436676 m!1325515))

(check-sat (not b!1436682) (not b!1436681) (not b!1436678) (not start!124090) (not b!1436676) (not b!1436680))
(check-sat)
