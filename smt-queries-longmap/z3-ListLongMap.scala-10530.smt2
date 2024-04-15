; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124120 () Bool)

(assert start!124120)

(declare-fun b!1437010 () Bool)

(declare-fun res!970016 () Bool)

(declare-fun e!810755 () Bool)

(assert (=> b!1437010 (=> (not res!970016) (not e!810755))))

(declare-datatypes ((array!97702 0))(
  ( (array!97703 (arr!47146 (Array (_ BitVec 32) (_ BitVec 64))) (size!47698 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97702)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97702 (_ BitVec 32)) Bool)

(assert (=> b!1437010 (= res!970016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437011 () Bool)

(declare-fun e!810754 () Bool)

(assert (=> b!1437011 (= e!810755 e!810754)))

(declare-fun res!970015 () Bool)

(assert (=> b!1437011 (=> (not res!970015) (not e!810754))))

(declare-datatypes ((SeekEntryResult!11423 0))(
  ( (MissingZero!11423 (index!48084 (_ BitVec 32))) (Found!11423 (index!48085 (_ BitVec 32))) (Intermediate!11423 (undefined!12235 Bool) (index!48086 (_ BitVec 32)) (x!129811 (_ BitVec 32))) (Undefined!11423) (MissingVacant!11423 (index!48087 (_ BitVec 32))) )
))
(declare-fun lt!632016 () SeekEntryResult!11423)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97702 (_ BitVec 32)) SeekEntryResult!11423)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437011 (= res!970015 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47146 a!2862) j!93) mask!2687) (select (arr!47146 a!2862) j!93) a!2862 mask!2687) lt!632016))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1437011 (= lt!632016 (Intermediate!11423 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1437012 () Bool)

(declare-fun res!970013 () Bool)

(assert (=> b!1437012 (=> (not res!970013) (not e!810755))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437012 (= res!970013 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47698 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47698 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47698 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47146 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437013 () Bool)

(declare-fun res!970010 () Bool)

(assert (=> b!1437013 (=> (not res!970010) (not e!810755))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437013 (= res!970010 (validKeyInArray!0 (select (arr!47146 a!2862) i!1006)))))

(declare-fun b!1437014 () Bool)

(declare-fun res!970018 () Bool)

(assert (=> b!1437014 (=> (not res!970018) (not e!810755))))

(assert (=> b!1437014 (= res!970018 (and (= (size!47698 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47698 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47698 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437015 () Bool)

(declare-fun res!970014 () Bool)

(assert (=> b!1437015 (=> (not res!970014) (not e!810754))))

(assert (=> b!1437015 (= res!970014 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47146 a!2862) j!93) a!2862 mask!2687) lt!632016))))

(declare-fun b!1437016 () Bool)

(declare-fun res!970017 () Bool)

(assert (=> b!1437016 (=> (not res!970017) (not e!810755))))

(assert (=> b!1437016 (= res!970017 (validKeyInArray!0 (select (arr!47146 a!2862) j!93)))))

(declare-fun b!1437017 () Bool)

(declare-fun res!970011 () Bool)

(assert (=> b!1437017 (=> (not res!970011) (not e!810755))))

(declare-datatypes ((List!33725 0))(
  ( (Nil!33722) (Cons!33721 (h!35059 (_ BitVec 64)) (t!48411 List!33725)) )
))
(declare-fun arrayNoDuplicates!0 (array!97702 (_ BitVec 32) List!33725) Bool)

(assert (=> b!1437017 (= res!970011 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33722))))

(declare-fun b!1437018 () Bool)

(assert (=> b!1437018 (= e!810754 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun res!970012 () Bool)

(assert (=> start!124120 (=> (not res!970012) (not e!810755))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124120 (= res!970012 (validMask!0 mask!2687))))

(assert (=> start!124120 e!810755))

(assert (=> start!124120 true))

(declare-fun array_inv!36379 (array!97702) Bool)

(assert (=> start!124120 (array_inv!36379 a!2862)))

(assert (= (and start!124120 res!970012) b!1437014))

(assert (= (and b!1437014 res!970018) b!1437013))

(assert (= (and b!1437013 res!970010) b!1437016))

(assert (= (and b!1437016 res!970017) b!1437010))

(assert (= (and b!1437010 res!970016) b!1437017))

(assert (= (and b!1437017 res!970011) b!1437012))

(assert (= (and b!1437012 res!970013) b!1437011))

(assert (= (and b!1437011 res!970015) b!1437015))

(assert (= (and b!1437015 res!970014) b!1437018))

(declare-fun m!1325853 () Bool)

(assert (=> b!1437016 m!1325853))

(assert (=> b!1437016 m!1325853))

(declare-fun m!1325855 () Bool)

(assert (=> b!1437016 m!1325855))

(declare-fun m!1325857 () Bool)

(assert (=> b!1437010 m!1325857))

(assert (=> b!1437015 m!1325853))

(assert (=> b!1437015 m!1325853))

(declare-fun m!1325859 () Bool)

(assert (=> b!1437015 m!1325859))

(assert (=> b!1437011 m!1325853))

(assert (=> b!1437011 m!1325853))

(declare-fun m!1325861 () Bool)

(assert (=> b!1437011 m!1325861))

(assert (=> b!1437011 m!1325861))

(assert (=> b!1437011 m!1325853))

(declare-fun m!1325863 () Bool)

(assert (=> b!1437011 m!1325863))

(declare-fun m!1325865 () Bool)

(assert (=> start!124120 m!1325865))

(declare-fun m!1325867 () Bool)

(assert (=> start!124120 m!1325867))

(declare-fun m!1325869 () Bool)

(assert (=> b!1437017 m!1325869))

(declare-fun m!1325871 () Bool)

(assert (=> b!1437013 m!1325871))

(assert (=> b!1437013 m!1325871))

(declare-fun m!1325873 () Bool)

(assert (=> b!1437013 m!1325873))

(declare-fun m!1325875 () Bool)

(assert (=> b!1437012 m!1325875))

(declare-fun m!1325877 () Bool)

(assert (=> b!1437012 m!1325877))

(check-sat (not b!1437010) (not b!1437016) (not b!1437017) (not start!124120) (not b!1437015) (not b!1437013) (not b!1437011))
(check-sat)
