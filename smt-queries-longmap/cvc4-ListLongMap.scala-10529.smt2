; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124148 () Bool)

(assert start!124148)

(declare-fun b!1437180 () Bool)

(declare-fun res!970066 () Bool)

(declare-fun e!810862 () Bool)

(assert (=> b!1437180 (=> (not res!970066) (not e!810862))))

(declare-datatypes ((array!97752 0))(
  ( (array!97753 (arr!47170 (Array (_ BitVec 32) (_ BitVec 64))) (size!47720 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97752)

(declare-datatypes ((List!33671 0))(
  ( (Nil!33668) (Cons!33667 (h!35005 (_ BitVec 64)) (t!48365 List!33671)) )
))
(declare-fun arrayNoDuplicates!0 (array!97752 (_ BitVec 32) List!33671) Bool)

(assert (=> b!1437180 (= res!970066 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33668))))

(declare-fun b!1437181 () Bool)

(declare-fun res!970064 () Bool)

(assert (=> b!1437181 (=> (not res!970064) (not e!810862))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437181 (= res!970064 (validKeyInArray!0 (select (arr!47170 a!2862) j!93)))))

(declare-fun b!1437182 () Bool)

(declare-fun res!970068 () Bool)

(assert (=> b!1437182 (=> (not res!970068) (not e!810862))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437182 (= res!970068 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47720 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47720 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47720 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47170 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!970069 () Bool)

(assert (=> start!124148 (=> (not res!970069) (not e!810862))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124148 (= res!970069 (validMask!0 mask!2687))))

(assert (=> start!124148 e!810862))

(assert (=> start!124148 true))

(declare-fun array_inv!36198 (array!97752) Bool)

(assert (=> start!124148 (array_inv!36198 a!2862)))

(declare-fun b!1437183 () Bool)

(declare-fun res!970065 () Bool)

(assert (=> b!1437183 (=> (not res!970065) (not e!810862))))

(assert (=> b!1437183 (= res!970065 (validKeyInArray!0 (select (arr!47170 a!2862) i!1006)))))

(declare-fun b!1437184 () Bool)

(declare-fun res!970067 () Bool)

(assert (=> b!1437184 (=> (not res!970067) (not e!810862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97752 (_ BitVec 32)) Bool)

(assert (=> b!1437184 (= res!970067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437185 () Bool)

(assert (=> b!1437185 (= e!810862 false)))

(declare-datatypes ((SeekEntryResult!11422 0))(
  ( (MissingZero!11422 (index!48080 (_ BitVec 32))) (Found!11422 (index!48081 (_ BitVec 32))) (Intermediate!11422 (undefined!12234 Bool) (index!48082 (_ BitVec 32)) (x!129807 (_ BitVec 32))) (Undefined!11422) (MissingVacant!11422 (index!48083 (_ BitVec 32))) )
))
(declare-fun lt!632247 () SeekEntryResult!11422)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97752 (_ BitVec 32)) SeekEntryResult!11422)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437185 (= lt!632247 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47170 a!2862) j!93) mask!2687) (select (arr!47170 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1437186 () Bool)

(declare-fun res!970063 () Bool)

(assert (=> b!1437186 (=> (not res!970063) (not e!810862))))

(assert (=> b!1437186 (= res!970063 (and (= (size!47720 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47720 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47720 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124148 res!970069) b!1437186))

(assert (= (and b!1437186 res!970063) b!1437183))

(assert (= (and b!1437183 res!970065) b!1437181))

(assert (= (and b!1437181 res!970064) b!1437184))

(assert (= (and b!1437184 res!970067) b!1437180))

(assert (= (and b!1437180 res!970066) b!1437182))

(assert (= (and b!1437182 res!970068) b!1437185))

(declare-fun m!1326505 () Bool)

(assert (=> b!1437184 m!1326505))

(declare-fun m!1326507 () Bool)

(assert (=> b!1437185 m!1326507))

(assert (=> b!1437185 m!1326507))

(declare-fun m!1326509 () Bool)

(assert (=> b!1437185 m!1326509))

(assert (=> b!1437185 m!1326509))

(assert (=> b!1437185 m!1326507))

(declare-fun m!1326511 () Bool)

(assert (=> b!1437185 m!1326511))

(declare-fun m!1326513 () Bool)

(assert (=> b!1437180 m!1326513))

(declare-fun m!1326515 () Bool)

(assert (=> b!1437182 m!1326515))

(declare-fun m!1326517 () Bool)

(assert (=> b!1437182 m!1326517))

(declare-fun m!1326519 () Bool)

(assert (=> start!124148 m!1326519))

(declare-fun m!1326521 () Bool)

(assert (=> start!124148 m!1326521))

(assert (=> b!1437181 m!1326507))

(assert (=> b!1437181 m!1326507))

(declare-fun m!1326523 () Bool)

(assert (=> b!1437181 m!1326523))

(declare-fun m!1326525 () Bool)

(assert (=> b!1437183 m!1326525))

(assert (=> b!1437183 m!1326525))

(declare-fun m!1326527 () Bool)

(assert (=> b!1437183 m!1326527))

(push 1)

(assert (not b!1437185))

(assert (not b!1437184))

(assert (not b!1437180))

(assert (not b!1437183))

(assert (not b!1437181))

(assert (not start!124148))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

