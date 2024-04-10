; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124436 () Bool)

(assert start!124436)

(declare-fun res!972123 () Bool)

(declare-fun e!811951 () Bool)

(assert (=> start!124436 (=> (not res!972123) (not e!811951))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124436 (= res!972123 (validMask!0 mask!2687))))

(assert (=> start!124436 e!811951))

(assert (=> start!124436 true))

(declare-datatypes ((array!97884 0))(
  ( (array!97885 (arr!47230 (Array (_ BitVec 32) (_ BitVec 64))) (size!47780 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97884)

(declare-fun array_inv!36258 (array!97884) Bool)

(assert (=> start!124436 (array_inv!36258 a!2862)))

(declare-fun b!1439688 () Bool)

(declare-fun res!972120 () Bool)

(assert (=> b!1439688 (=> (not res!972120) (not e!811951))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439688 (= res!972120 (validKeyInArray!0 (select (arr!47230 a!2862) i!1006)))))

(declare-fun b!1439689 () Bool)

(declare-fun res!972117 () Bool)

(declare-fun e!811952 () Bool)

(assert (=> b!1439689 (=> (not res!972117) (not e!811952))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11482 0))(
  ( (MissingZero!11482 (index!48320 (_ BitVec 32))) (Found!11482 (index!48321 (_ BitVec 32))) (Intermediate!11482 (undefined!12294 Bool) (index!48322 (_ BitVec 32)) (x!130051 (_ BitVec 32))) (Undefined!11482) (MissingVacant!11482 (index!48323 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97884 (_ BitVec 32)) SeekEntryResult!11482)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439689 (= res!972117 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47230 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47230 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97885 (store (arr!47230 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47780 a!2862)) mask!2687) (Intermediate!11482 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1439690 () Bool)

(declare-fun res!972122 () Bool)

(assert (=> b!1439690 (=> (not res!972122) (not e!811951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97884 (_ BitVec 32)) Bool)

(assert (=> b!1439690 (= res!972122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439691 () Bool)

(declare-fun res!972115 () Bool)

(assert (=> b!1439691 (=> (not res!972115) (not e!811951))))

(assert (=> b!1439691 (= res!972115 (and (= (size!47780 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47780 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47780 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439692 () Bool)

(declare-fun res!972118 () Bool)

(assert (=> b!1439692 (=> (not res!972118) (not e!811951))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1439692 (= res!972118 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47780 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47780 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47780 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47230 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439693 () Bool)

(assert (=> b!1439693 (= e!811951 e!811952)))

(declare-fun res!972124 () Bool)

(assert (=> b!1439693 (=> (not res!972124) (not e!811952))))

(declare-fun lt!632850 () SeekEntryResult!11482)

(assert (=> b!1439693 (= res!972124 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47230 a!2862) j!93) mask!2687) (select (arr!47230 a!2862) j!93) a!2862 mask!2687) lt!632850))))

(assert (=> b!1439693 (= lt!632850 (Intermediate!11482 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439694 () Bool)

(declare-fun res!972116 () Bool)

(assert (=> b!1439694 (=> (not res!972116) (not e!811951))))

(declare-datatypes ((List!33731 0))(
  ( (Nil!33728) (Cons!33727 (h!35077 (_ BitVec 64)) (t!48425 List!33731)) )
))
(declare-fun arrayNoDuplicates!0 (array!97884 (_ BitVec 32) List!33731) Bool)

(assert (=> b!1439694 (= res!972116 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33728))))

(declare-fun b!1439695 () Bool)

(declare-fun res!972121 () Bool)

(assert (=> b!1439695 (=> (not res!972121) (not e!811952))))

(assert (=> b!1439695 (= res!972121 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47230 a!2862) j!93) a!2862 mask!2687) lt!632850))))

(declare-fun b!1439696 () Bool)

(declare-fun res!972119 () Bool)

(assert (=> b!1439696 (=> (not res!972119) (not e!811951))))

(assert (=> b!1439696 (= res!972119 (validKeyInArray!0 (select (arr!47230 a!2862) j!93)))))

(declare-fun b!1439697 () Bool)

(assert (=> b!1439697 (= e!811952 (and (bvsle x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvsge index!646 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(assert (= (and start!124436 res!972123) b!1439691))

(assert (= (and b!1439691 res!972115) b!1439688))

(assert (= (and b!1439688 res!972120) b!1439696))

(assert (= (and b!1439696 res!972119) b!1439690))

(assert (= (and b!1439690 res!972122) b!1439694))

(assert (= (and b!1439694 res!972116) b!1439692))

(assert (= (and b!1439692 res!972118) b!1439693))

(assert (= (and b!1439693 res!972124) b!1439695))

(assert (= (and b!1439695 res!972121) b!1439689))

(assert (= (and b!1439689 res!972117) b!1439697))

(declare-fun m!1328789 () Bool)

(assert (=> b!1439690 m!1328789))

(declare-fun m!1328791 () Bool)

(assert (=> b!1439692 m!1328791))

(declare-fun m!1328793 () Bool)

(assert (=> b!1439692 m!1328793))

(declare-fun m!1328795 () Bool)

(assert (=> b!1439694 m!1328795))

(declare-fun m!1328797 () Bool)

(assert (=> b!1439695 m!1328797))

(assert (=> b!1439695 m!1328797))

(declare-fun m!1328799 () Bool)

(assert (=> b!1439695 m!1328799))

(assert (=> b!1439693 m!1328797))

(assert (=> b!1439693 m!1328797))

(declare-fun m!1328801 () Bool)

(assert (=> b!1439693 m!1328801))

(assert (=> b!1439693 m!1328801))

(assert (=> b!1439693 m!1328797))

(declare-fun m!1328803 () Bool)

(assert (=> b!1439693 m!1328803))

(assert (=> b!1439696 m!1328797))

(assert (=> b!1439696 m!1328797))

(declare-fun m!1328805 () Bool)

(assert (=> b!1439696 m!1328805))

(assert (=> b!1439689 m!1328791))

(declare-fun m!1328807 () Bool)

(assert (=> b!1439689 m!1328807))

(assert (=> b!1439689 m!1328807))

(declare-fun m!1328809 () Bool)

(assert (=> b!1439689 m!1328809))

(assert (=> b!1439689 m!1328809))

(assert (=> b!1439689 m!1328807))

(declare-fun m!1328811 () Bool)

(assert (=> b!1439689 m!1328811))

(declare-fun m!1328813 () Bool)

(assert (=> b!1439688 m!1328813))

(assert (=> b!1439688 m!1328813))

(declare-fun m!1328815 () Bool)

(assert (=> b!1439688 m!1328815))

(declare-fun m!1328817 () Bool)

(assert (=> start!124436 m!1328817))

(declare-fun m!1328819 () Bool)

(assert (=> start!124436 m!1328819))

(push 1)

(assert (not start!124436))

(assert (not b!1439688))

(assert (not b!1439695))

(assert (not b!1439696))

(assert (not b!1439694))

(assert (not b!1439689))

(assert (not b!1439690))

(assert (not b!1439693))

(check-sat)

(pop 1)

(push 1)

(check-sat)

