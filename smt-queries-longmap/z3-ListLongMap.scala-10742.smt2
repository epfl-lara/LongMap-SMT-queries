; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125592 () Bool)

(assert start!125592)

(declare-fun b!1469684 () Bool)

(declare-fun res!998141 () Bool)

(declare-fun e!825063 () Bool)

(assert (=> b!1469684 (=> (not res!998141) (not e!825063))))

(declare-datatypes ((array!99040 0))(
  ( (array!99041 (arr!47808 (Array (_ BitVec 32) (_ BitVec 64))) (size!48358 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99040)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469684 (= res!998141 (validKeyInArray!0 (select (arr!47808 a!2862) j!93)))))

(declare-fun b!1469685 () Bool)

(declare-fun res!998152 () Bool)

(declare-fun e!825064 () Bool)

(assert (=> b!1469685 (=> (not res!998152) (not e!825064))))

(declare-fun e!825065 () Bool)

(assert (=> b!1469685 (= res!998152 e!825065)))

(declare-fun c!135282 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1469685 (= c!135282 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1469686 () Bool)

(declare-fun res!998146 () Bool)

(assert (=> b!1469686 (=> (not res!998146) (not e!825063))))

(declare-datatypes ((List!34309 0))(
  ( (Nil!34306) (Cons!34305 (h!35655 (_ BitVec 64)) (t!49003 List!34309)) )
))
(declare-fun arrayNoDuplicates!0 (array!99040 (_ BitVec 32) List!34309) Bool)

(assert (=> b!1469686 (= res!998146 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34306))))

(declare-fun b!1469687 () Bool)

(declare-fun res!998143 () Bool)

(assert (=> b!1469687 (=> (not res!998143) (not e!825063))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1469687 (= res!998143 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48358 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48358 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48358 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun lt!642638 () array!99040)

(declare-fun b!1469688 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!642637 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12048 0))(
  ( (MissingZero!12048 (index!50584 (_ BitVec 32))) (Found!12048 (index!50585 (_ BitVec 32))) (Intermediate!12048 (undefined!12860 Bool) (index!50586 (_ BitVec 32)) (x!132161 (_ BitVec 32))) (Undefined!12048) (MissingVacant!12048 (index!50587 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99040 (_ BitVec 32)) SeekEntryResult!12048)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99040 (_ BitVec 32)) SeekEntryResult!12048)

(assert (=> b!1469688 (= e!825065 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642637 lt!642638 mask!2687) (seekEntryOrOpen!0 lt!642637 lt!642638 mask!2687)))))

(declare-fun res!998144 () Bool)

(assert (=> start!125592 (=> (not res!998144) (not e!825063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125592 (= res!998144 (validMask!0 mask!2687))))

(assert (=> start!125592 e!825063))

(assert (=> start!125592 true))

(declare-fun array_inv!36836 (array!99040) Bool)

(assert (=> start!125592 (array_inv!36836 a!2862)))

(declare-fun b!1469689 () Bool)

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1469689 (= e!825064 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006) (bvsle #b00000000000000000000000000000000 (size!48358 a!2862)) (bvsgt j!93 (size!48358 a!2862))))))

(declare-fun b!1469690 () Bool)

(declare-fun e!825060 () Bool)

(assert (=> b!1469690 (= e!825063 e!825060)))

(declare-fun res!998147 () Bool)

(assert (=> b!1469690 (=> (not res!998147) (not e!825060))))

(assert (=> b!1469690 (= res!998147 (= (select (store (arr!47808 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1469690 (= lt!642638 (array!99041 (store (arr!47808 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48358 a!2862)))))

(declare-fun b!1469691 () Bool)

(declare-fun res!998142 () Bool)

(assert (=> b!1469691 (=> (not res!998142) (not e!825063))))

(assert (=> b!1469691 (= res!998142 (validKeyInArray!0 (select (arr!47808 a!2862) i!1006)))))

(declare-fun b!1469692 () Bool)

(declare-fun res!998149 () Bool)

(declare-fun e!825061 () Bool)

(assert (=> b!1469692 (=> (not res!998149) (not e!825061))))

(declare-fun lt!642636 () SeekEntryResult!12048)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99040 (_ BitVec 32)) SeekEntryResult!12048)

(assert (=> b!1469692 (= res!998149 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47808 a!2862) j!93) a!2862 mask!2687) lt!642636))))

(declare-fun b!1469693 () Bool)

(assert (=> b!1469693 (= e!825060 e!825061)))

(declare-fun res!998150 () Bool)

(assert (=> b!1469693 (=> (not res!998150) (not e!825061))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469693 (= res!998150 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47808 a!2862) j!93) mask!2687) (select (arr!47808 a!2862) j!93) a!2862 mask!2687) lt!642636))))

(assert (=> b!1469693 (= lt!642636 (Intermediate!12048 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!642639 () SeekEntryResult!12048)

(declare-fun b!1469694 () Bool)

(assert (=> b!1469694 (= e!825065 (= lt!642639 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642637 lt!642638 mask!2687)))))

(declare-fun b!1469695 () Bool)

(assert (=> b!1469695 (= e!825061 e!825064)))

(declare-fun res!998145 () Bool)

(assert (=> b!1469695 (=> (not res!998145) (not e!825064))))

(assert (=> b!1469695 (= res!998145 (= lt!642639 (Intermediate!12048 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1469695 (= lt!642639 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642637 mask!2687) lt!642637 lt!642638 mask!2687))))

(assert (=> b!1469695 (= lt!642637 (select (store (arr!47808 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1469696 () Bool)

(declare-fun res!998151 () Bool)

(assert (=> b!1469696 (=> (not res!998151) (not e!825063))))

(assert (=> b!1469696 (= res!998151 (and (= (size!48358 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48358 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48358 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469697 () Bool)

(declare-fun res!998148 () Bool)

(assert (=> b!1469697 (=> (not res!998148) (not e!825063))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99040 (_ BitVec 32)) Bool)

(assert (=> b!1469697 (= res!998148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125592 res!998144) b!1469696))

(assert (= (and b!1469696 res!998151) b!1469691))

(assert (= (and b!1469691 res!998142) b!1469684))

(assert (= (and b!1469684 res!998141) b!1469697))

(assert (= (and b!1469697 res!998148) b!1469686))

(assert (= (and b!1469686 res!998146) b!1469687))

(assert (= (and b!1469687 res!998143) b!1469690))

(assert (= (and b!1469690 res!998147) b!1469693))

(assert (= (and b!1469693 res!998150) b!1469692))

(assert (= (and b!1469692 res!998149) b!1469695))

(assert (= (and b!1469695 res!998145) b!1469685))

(assert (= (and b!1469685 c!135282) b!1469694))

(assert (= (and b!1469685 (not c!135282)) b!1469688))

(assert (= (and b!1469685 res!998152) b!1469689))

(declare-fun m!1356843 () Bool)

(assert (=> b!1469684 m!1356843))

(assert (=> b!1469684 m!1356843))

(declare-fun m!1356845 () Bool)

(assert (=> b!1469684 m!1356845))

(declare-fun m!1356847 () Bool)

(assert (=> start!125592 m!1356847))

(declare-fun m!1356849 () Bool)

(assert (=> start!125592 m!1356849))

(declare-fun m!1356851 () Bool)

(assert (=> b!1469688 m!1356851))

(declare-fun m!1356853 () Bool)

(assert (=> b!1469688 m!1356853))

(declare-fun m!1356855 () Bool)

(assert (=> b!1469694 m!1356855))

(assert (=> b!1469693 m!1356843))

(assert (=> b!1469693 m!1356843))

(declare-fun m!1356857 () Bool)

(assert (=> b!1469693 m!1356857))

(assert (=> b!1469693 m!1356857))

(assert (=> b!1469693 m!1356843))

(declare-fun m!1356859 () Bool)

(assert (=> b!1469693 m!1356859))

(declare-fun m!1356861 () Bool)

(assert (=> b!1469691 m!1356861))

(assert (=> b!1469691 m!1356861))

(declare-fun m!1356863 () Bool)

(assert (=> b!1469691 m!1356863))

(declare-fun m!1356865 () Bool)

(assert (=> b!1469695 m!1356865))

(assert (=> b!1469695 m!1356865))

(declare-fun m!1356867 () Bool)

(assert (=> b!1469695 m!1356867))

(declare-fun m!1356869 () Bool)

(assert (=> b!1469695 m!1356869))

(declare-fun m!1356871 () Bool)

(assert (=> b!1469695 m!1356871))

(assert (=> b!1469692 m!1356843))

(assert (=> b!1469692 m!1356843))

(declare-fun m!1356873 () Bool)

(assert (=> b!1469692 m!1356873))

(assert (=> b!1469690 m!1356869))

(declare-fun m!1356875 () Bool)

(assert (=> b!1469690 m!1356875))

(declare-fun m!1356877 () Bool)

(assert (=> b!1469697 m!1356877))

(declare-fun m!1356879 () Bool)

(assert (=> b!1469686 m!1356879))

(check-sat (not b!1469692) (not start!125592) (not b!1469697) (not b!1469694) (not b!1469684) (not b!1469691) (not b!1469688) (not b!1469686) (not b!1469695) (not b!1469693))
(check-sat)
