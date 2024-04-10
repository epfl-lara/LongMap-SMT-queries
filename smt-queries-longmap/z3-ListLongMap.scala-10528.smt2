; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124140 () Bool)

(assert start!124140)

(declare-fun b!1437096 () Bool)

(declare-fun res!969979 () Bool)

(declare-fun e!810838 () Bool)

(assert (=> b!1437096 (=> (not res!969979) (not e!810838))))

(declare-datatypes ((array!97744 0))(
  ( (array!97745 (arr!47166 (Array (_ BitVec 32) (_ BitVec 64))) (size!47716 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97744)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437096 (= res!969979 (validKeyInArray!0 (select (arr!47166 a!2862) j!93)))))

(declare-fun b!1437097 () Bool)

(assert (=> b!1437097 (= e!810838 false)))

(declare-datatypes ((SeekEntryResult!11418 0))(
  ( (MissingZero!11418 (index!48064 (_ BitVec 32))) (Found!11418 (index!48065 (_ BitVec 32))) (Intermediate!11418 (undefined!12230 Bool) (index!48066 (_ BitVec 32)) (x!129795 (_ BitVec 32))) (Undefined!11418) (MissingVacant!11418 (index!48067 (_ BitVec 32))) )
))
(declare-fun lt!632235 () SeekEntryResult!11418)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97744 (_ BitVec 32)) SeekEntryResult!11418)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437097 (= lt!632235 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47166 a!2862) j!93) mask!2687) (select (arr!47166 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1437098 () Bool)

(declare-fun res!969985 () Bool)

(assert (=> b!1437098 (=> (not res!969985) (not e!810838))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437098 (= res!969985 (validKeyInArray!0 (select (arr!47166 a!2862) i!1006)))))

(declare-fun b!1437099 () Bool)

(declare-fun res!969983 () Bool)

(assert (=> b!1437099 (=> (not res!969983) (not e!810838))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437099 (= res!969983 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47716 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47716 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47716 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47166 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437100 () Bool)

(declare-fun res!969982 () Bool)

(assert (=> b!1437100 (=> (not res!969982) (not e!810838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97744 (_ BitVec 32)) Bool)

(assert (=> b!1437100 (= res!969982 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437101 () Bool)

(declare-fun res!969984 () Bool)

(assert (=> b!1437101 (=> (not res!969984) (not e!810838))))

(assert (=> b!1437101 (= res!969984 (and (= (size!47716 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47716 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47716 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!969980 () Bool)

(assert (=> start!124140 (=> (not res!969980) (not e!810838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124140 (= res!969980 (validMask!0 mask!2687))))

(assert (=> start!124140 e!810838))

(assert (=> start!124140 true))

(declare-fun array_inv!36194 (array!97744) Bool)

(assert (=> start!124140 (array_inv!36194 a!2862)))

(declare-fun b!1437102 () Bool)

(declare-fun res!969981 () Bool)

(assert (=> b!1437102 (=> (not res!969981) (not e!810838))))

(declare-datatypes ((List!33667 0))(
  ( (Nil!33664) (Cons!33663 (h!35001 (_ BitVec 64)) (t!48361 List!33667)) )
))
(declare-fun arrayNoDuplicates!0 (array!97744 (_ BitVec 32) List!33667) Bool)

(assert (=> b!1437102 (= res!969981 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33664))))

(assert (= (and start!124140 res!969980) b!1437101))

(assert (= (and b!1437101 res!969984) b!1437098))

(assert (= (and b!1437098 res!969985) b!1437096))

(assert (= (and b!1437096 res!969979) b!1437100))

(assert (= (and b!1437100 res!969982) b!1437102))

(assert (= (and b!1437102 res!969981) b!1437099))

(assert (= (and b!1437099 res!969983) b!1437097))

(declare-fun m!1326409 () Bool)

(assert (=> b!1437098 m!1326409))

(assert (=> b!1437098 m!1326409))

(declare-fun m!1326411 () Bool)

(assert (=> b!1437098 m!1326411))

(declare-fun m!1326413 () Bool)

(assert (=> b!1437100 m!1326413))

(declare-fun m!1326415 () Bool)

(assert (=> b!1437096 m!1326415))

(assert (=> b!1437096 m!1326415))

(declare-fun m!1326417 () Bool)

(assert (=> b!1437096 m!1326417))

(declare-fun m!1326419 () Bool)

(assert (=> start!124140 m!1326419))

(declare-fun m!1326421 () Bool)

(assert (=> start!124140 m!1326421))

(assert (=> b!1437097 m!1326415))

(assert (=> b!1437097 m!1326415))

(declare-fun m!1326423 () Bool)

(assert (=> b!1437097 m!1326423))

(assert (=> b!1437097 m!1326423))

(assert (=> b!1437097 m!1326415))

(declare-fun m!1326425 () Bool)

(assert (=> b!1437097 m!1326425))

(declare-fun m!1326427 () Bool)

(assert (=> b!1437099 m!1326427))

(declare-fun m!1326429 () Bool)

(assert (=> b!1437099 m!1326429))

(declare-fun m!1326431 () Bool)

(assert (=> b!1437102 m!1326431))

(check-sat (not b!1437100) (not start!124140) (not b!1437096) (not b!1437097) (not b!1437102) (not b!1437098))
