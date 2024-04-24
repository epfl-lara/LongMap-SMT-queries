; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124350 () Bool)

(assert start!124350)

(declare-fun res!970394 () Bool)

(declare-fun e!811652 () Bool)

(assert (=> start!124350 (=> (not res!970394) (not e!811652))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124350 (= res!970394 (validMask!0 mask!2687))))

(assert (=> start!124350 e!811652))

(assert (=> start!124350 true))

(declare-datatypes ((array!97849 0))(
  ( (array!97850 (arr!47215 (Array (_ BitVec 32) (_ BitVec 64))) (size!47766 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97849)

(declare-fun array_inv!36496 (array!97849) Bool)

(assert (=> start!124350 (array_inv!36496 a!2862)))

(declare-fun b!1438332 () Bool)

(declare-fun res!970391 () Bool)

(assert (=> b!1438332 (=> (not res!970391) (not e!811652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97849 (_ BitVec 32)) Bool)

(assert (=> b!1438332 (= res!970391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438333 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1438333 (= e!811652 (and (bvsge mask!2687 #b00000000000000000000000000000000) (bvsge index!646 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1438334 () Bool)

(declare-fun res!970392 () Bool)

(assert (=> b!1438334 (=> (not res!970392) (not e!811652))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438334 (= res!970392 (validKeyInArray!0 (select (arr!47215 a!2862) i!1006)))))

(declare-fun b!1438335 () Bool)

(declare-fun res!970396 () Bool)

(assert (=> b!1438335 (=> (not res!970396) (not e!811652))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11364 0))(
  ( (MissingZero!11364 (index!47848 (_ BitVec 32))) (Found!11364 (index!47849 (_ BitVec 32))) (Intermediate!11364 (undefined!12176 Bool) (index!47850 (_ BitVec 32)) (x!129757 (_ BitVec 32))) (Undefined!11364) (MissingVacant!11364 (index!47851 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97849 (_ BitVec 32)) SeekEntryResult!11364)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438335 (= res!970396 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47215 a!2862) j!93) mask!2687) (select (arr!47215 a!2862) j!93) a!2862 mask!2687) (Intermediate!11364 false intermediateBeforeIndex!19 intermediateBeforeX!19)))))

(declare-fun b!1438336 () Bool)

(declare-fun res!970397 () Bool)

(assert (=> b!1438336 (=> (not res!970397) (not e!811652))))

(assert (=> b!1438336 (= res!970397 (validKeyInArray!0 (select (arr!47215 a!2862) j!93)))))

(declare-fun b!1438337 () Bool)

(declare-fun res!970395 () Bool)

(assert (=> b!1438337 (=> (not res!970395) (not e!811652))))

(assert (=> b!1438337 (= res!970395 (and (= (size!47766 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47766 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47766 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438338 () Bool)

(declare-fun res!970390 () Bool)

(assert (=> b!1438338 (=> (not res!970390) (not e!811652))))

(declare-datatypes ((List!33703 0))(
  ( (Nil!33700) (Cons!33699 (h!35048 (_ BitVec 64)) (t!48389 List!33703)) )
))
(declare-fun arrayNoDuplicates!0 (array!97849 (_ BitVec 32) List!33703) Bool)

(assert (=> b!1438338 (= res!970390 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33700))))

(declare-fun b!1438339 () Bool)

(declare-fun res!970393 () Bool)

(assert (=> b!1438339 (=> (not res!970393) (not e!811652))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1438339 (= res!970393 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47766 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47766 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47766 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47215 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124350 res!970394) b!1438337))

(assert (= (and b!1438337 res!970395) b!1438334))

(assert (= (and b!1438334 res!970392) b!1438336))

(assert (= (and b!1438336 res!970397) b!1438332))

(assert (= (and b!1438332 res!970391) b!1438338))

(assert (= (and b!1438338 res!970390) b!1438339))

(assert (= (and b!1438339 res!970393) b!1438335))

(assert (= (and b!1438335 res!970396) b!1438333))

(declare-fun m!1327753 () Bool)

(assert (=> b!1438334 m!1327753))

(assert (=> b!1438334 m!1327753))

(declare-fun m!1327755 () Bool)

(assert (=> b!1438334 m!1327755))

(declare-fun m!1327757 () Bool)

(assert (=> b!1438332 m!1327757))

(declare-fun m!1327759 () Bool)

(assert (=> b!1438338 m!1327759))

(declare-fun m!1327761 () Bool)

(assert (=> b!1438339 m!1327761))

(declare-fun m!1327763 () Bool)

(assert (=> b!1438339 m!1327763))

(declare-fun m!1327765 () Bool)

(assert (=> start!124350 m!1327765))

(declare-fun m!1327767 () Bool)

(assert (=> start!124350 m!1327767))

(declare-fun m!1327769 () Bool)

(assert (=> b!1438336 m!1327769))

(assert (=> b!1438336 m!1327769))

(declare-fun m!1327771 () Bool)

(assert (=> b!1438336 m!1327771))

(assert (=> b!1438335 m!1327769))

(assert (=> b!1438335 m!1327769))

(declare-fun m!1327773 () Bool)

(assert (=> b!1438335 m!1327773))

(assert (=> b!1438335 m!1327773))

(assert (=> b!1438335 m!1327769))

(declare-fun m!1327775 () Bool)

(assert (=> b!1438335 m!1327775))

(check-sat (not b!1438338) (not b!1438335) (not b!1438334) (not start!124350) (not b!1438332) (not b!1438336))
(check-sat)
