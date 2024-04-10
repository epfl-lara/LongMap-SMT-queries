; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124208 () Bool)

(assert start!124208)

(declare-fun b!1437610 () Bool)

(declare-fun e!811065 () Bool)

(declare-fun e!811066 () Bool)

(assert (=> b!1437610 (= e!811065 e!811066)))

(declare-fun res!970391 () Bool)

(assert (=> b!1437610 (=> (not res!970391) (not e!811066))))

(declare-datatypes ((SeekEntryResult!11431 0))(
  ( (MissingZero!11431 (index!48116 (_ BitVec 32))) (Found!11431 (index!48117 (_ BitVec 32))) (Intermediate!11431 (undefined!12243 Bool) (index!48118 (_ BitVec 32)) (x!129846 (_ BitVec 32))) (Undefined!11431) (MissingVacant!11431 (index!48119 (_ BitVec 32))) )
))
(declare-fun lt!632351 () SeekEntryResult!11431)

(declare-datatypes ((array!97773 0))(
  ( (array!97774 (arr!47179 (Array (_ BitVec 32) (_ BitVec 64))) (size!47729 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97773)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97773 (_ BitVec 32)) SeekEntryResult!11431)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437610 (= res!970391 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47179 a!2862) j!93) mask!2687) (select (arr!47179 a!2862) j!93) a!2862 mask!2687) lt!632351))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1437610 (= lt!632351 (Intermediate!11431 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1437611 () Bool)

(assert (=> b!1437611 (= e!811066 false)))

(declare-fun lt!632352 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437611 (= lt!632352 (toIndex!0 (select (store (arr!47179 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1437612 () Bool)

(declare-fun res!970393 () Bool)

(assert (=> b!1437612 (=> (not res!970393) (not e!811065))))

(declare-datatypes ((List!33680 0))(
  ( (Nil!33677) (Cons!33676 (h!35017 (_ BitVec 64)) (t!48374 List!33680)) )
))
(declare-fun arrayNoDuplicates!0 (array!97773 (_ BitVec 32) List!33680) Bool)

(assert (=> b!1437612 (= res!970393 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33677))))

(declare-fun res!970388 () Bool)

(assert (=> start!124208 (=> (not res!970388) (not e!811065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124208 (= res!970388 (validMask!0 mask!2687))))

(assert (=> start!124208 e!811065))

(assert (=> start!124208 true))

(declare-fun array_inv!36207 (array!97773) Bool)

(assert (=> start!124208 (array_inv!36207 a!2862)))

(declare-fun b!1437613 () Bool)

(declare-fun res!970394 () Bool)

(assert (=> b!1437613 (=> (not res!970394) (not e!811065))))

(assert (=> b!1437613 (= res!970394 (and (= (size!47729 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47729 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47729 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437614 () Bool)

(declare-fun res!970390 () Bool)

(assert (=> b!1437614 (=> (not res!970390) (not e!811065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97773 (_ BitVec 32)) Bool)

(assert (=> b!1437614 (= res!970390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437615 () Bool)

(declare-fun res!970395 () Bool)

(assert (=> b!1437615 (=> (not res!970395) (not e!811066))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1437615 (= res!970395 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47179 a!2862) j!93) a!2862 mask!2687) lt!632351))))

(declare-fun b!1437616 () Bool)

(declare-fun res!970392 () Bool)

(assert (=> b!1437616 (=> (not res!970392) (not e!811065))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437616 (= res!970392 (validKeyInArray!0 (select (arr!47179 a!2862) j!93)))))

(declare-fun b!1437617 () Bool)

(declare-fun res!970396 () Bool)

(assert (=> b!1437617 (=> (not res!970396) (not e!811065))))

(assert (=> b!1437617 (= res!970396 (validKeyInArray!0 (select (arr!47179 a!2862) i!1006)))))

(declare-fun b!1437618 () Bool)

(declare-fun res!970389 () Bool)

(assert (=> b!1437618 (=> (not res!970389) (not e!811065))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437618 (= res!970389 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47729 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47729 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47729 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47179 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124208 res!970388) b!1437613))

(assert (= (and b!1437613 res!970394) b!1437617))

(assert (= (and b!1437617 res!970396) b!1437616))

(assert (= (and b!1437616 res!970392) b!1437614))

(assert (= (and b!1437614 res!970390) b!1437612))

(assert (= (and b!1437612 res!970393) b!1437618))

(assert (= (and b!1437618 res!970389) b!1437610))

(assert (= (and b!1437610 res!970391) b!1437615))

(assert (= (and b!1437615 res!970395) b!1437611))

(declare-fun m!1326841 () Bool)

(assert (=> b!1437614 m!1326841))

(declare-fun m!1326843 () Bool)

(assert (=> b!1437610 m!1326843))

(assert (=> b!1437610 m!1326843))

(declare-fun m!1326845 () Bool)

(assert (=> b!1437610 m!1326845))

(assert (=> b!1437610 m!1326845))

(assert (=> b!1437610 m!1326843))

(declare-fun m!1326847 () Bool)

(assert (=> b!1437610 m!1326847))

(assert (=> b!1437616 m!1326843))

(assert (=> b!1437616 m!1326843))

(declare-fun m!1326849 () Bool)

(assert (=> b!1437616 m!1326849))

(declare-fun m!1326851 () Bool)

(assert (=> b!1437617 m!1326851))

(assert (=> b!1437617 m!1326851))

(declare-fun m!1326853 () Bool)

(assert (=> b!1437617 m!1326853))

(declare-fun m!1326855 () Bool)

(assert (=> start!124208 m!1326855))

(declare-fun m!1326857 () Bool)

(assert (=> start!124208 m!1326857))

(declare-fun m!1326859 () Bool)

(assert (=> b!1437611 m!1326859))

(declare-fun m!1326861 () Bool)

(assert (=> b!1437611 m!1326861))

(assert (=> b!1437611 m!1326861))

(declare-fun m!1326863 () Bool)

(assert (=> b!1437611 m!1326863))

(assert (=> b!1437615 m!1326843))

(assert (=> b!1437615 m!1326843))

(declare-fun m!1326865 () Bool)

(assert (=> b!1437615 m!1326865))

(declare-fun m!1326867 () Bool)

(assert (=> b!1437612 m!1326867))

(assert (=> b!1437618 m!1326859))

(declare-fun m!1326869 () Bool)

(assert (=> b!1437618 m!1326869))

(push 1)

(assert (not start!124208))

(assert (not b!1437616))

(assert (not b!1437614))

(assert (not b!1437617))

(assert (not b!1437612))

(assert (not b!1437611))

(assert (not b!1437615))

(assert (not b!1437610))

(check-sat)

