; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125274 () Bool)

(assert start!125274)

(declare-fun b!1456819 () Bool)

(declare-fun e!819845 () Bool)

(declare-fun e!819846 () Bool)

(assert (=> b!1456819 (= e!819845 (not e!819846))))

(declare-fun res!986664 () Bool)

(assert (=> b!1456819 (=> res!986664 e!819846)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98617 0))(
  ( (array!98618 (arr!47593 (Array (_ BitVec 32) (_ BitVec 64))) (size!48144 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98617)

(assert (=> b!1456819 (= res!986664 (or (and (= (select (arr!47593 a!2862) index!646) (select (store (arr!47593 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47593 a!2862) index!646) (select (arr!47593 a!2862) j!93))) (= (select (arr!47593 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!819844 () Bool)

(assert (=> b!1456819 e!819844))

(declare-fun res!986659 () Bool)

(assert (=> b!1456819 (=> (not res!986659) (not e!819844))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98617 (_ BitVec 32)) Bool)

(assert (=> b!1456819 (= res!986659 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49013 0))(
  ( (Unit!49014) )
))
(declare-fun lt!638455 () Unit!49013)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98617 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49013)

(assert (=> b!1456819 (= lt!638455 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1456820 () Bool)

(declare-fun res!986661 () Bool)

(declare-fun e!819849 () Bool)

(assert (=> b!1456820 (=> (not res!986661) (not e!819849))))

(declare-datatypes ((List!34081 0))(
  ( (Nil!34078) (Cons!34077 (h!35438 (_ BitVec 64)) (t!48767 List!34081)) )
))
(declare-fun arrayNoDuplicates!0 (array!98617 (_ BitVec 32) List!34081) Bool)

(assert (=> b!1456820 (= res!986661 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34078))))

(declare-fun b!1456821 () Bool)

(declare-fun res!986658 () Bool)

(assert (=> b!1456821 (=> (not res!986658) (not e!819849))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1456821 (= res!986658 (validKeyInArray!0 (select (arr!47593 a!2862) j!93)))))

(declare-fun b!1456822 () Bool)

(declare-fun res!986651 () Bool)

(assert (=> b!1456822 (=> (not res!986651) (not e!819849))))

(assert (=> b!1456822 (= res!986651 (validKeyInArray!0 (select (arr!47593 a!2862) i!1006)))))

(declare-fun b!1456823 () Bool)

(declare-fun e!819841 () Bool)

(assert (=> b!1456823 (= e!819841 e!819845)))

(declare-fun res!986663 () Bool)

(assert (=> b!1456823 (=> (not res!986663) (not e!819845))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11742 0))(
  ( (MissingZero!11742 (index!49360 (_ BitVec 32))) (Found!11742 (index!49361 (_ BitVec 32))) (Intermediate!11742 (undefined!12554 Bool) (index!49362 (_ BitVec 32)) (x!131167 (_ BitVec 32))) (Undefined!11742) (MissingVacant!11742 (index!49363 (_ BitVec 32))) )
))
(declare-fun lt!638450 () SeekEntryResult!11742)

(assert (=> b!1456823 (= res!986663 (= lt!638450 (Intermediate!11742 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!638449 () array!98617)

(declare-fun lt!638451 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98617 (_ BitVec 32)) SeekEntryResult!11742)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456823 (= lt!638450 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638451 mask!2687) lt!638451 lt!638449 mask!2687))))

(assert (=> b!1456823 (= lt!638451 (select (store (arr!47593 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1456824 () Bool)

(declare-fun res!986657 () Bool)

(assert (=> b!1456824 (=> (not res!986657) (not e!819845))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1456824 (= res!986657 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun e!819847 () Bool)

(declare-fun b!1456825 () Bool)

(assert (=> b!1456825 (= e!819847 (= lt!638450 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638451 lt!638449 mask!2687)))))

(declare-fun b!1456826 () Bool)

(declare-fun e!819842 () Bool)

(assert (=> b!1456826 (= e!819842 true)))

(declare-fun lt!638448 () Bool)

(declare-fun e!819843 () Bool)

(assert (=> b!1456826 (= lt!638448 e!819843)))

(declare-fun c!134605 () Bool)

(assert (=> b!1456826 (= c!134605 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1456827 () Bool)

(declare-fun res!986653 () Bool)

(assert (=> b!1456827 (=> (not res!986653) (not e!819849))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1456827 (= res!986653 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48144 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48144 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48144 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1456828 () Bool)

(declare-fun e!819840 () Bool)

(assert (=> b!1456828 (= e!819849 e!819840)))

(declare-fun res!986665 () Bool)

(assert (=> b!1456828 (=> (not res!986665) (not e!819840))))

(assert (=> b!1456828 (= res!986665 (= (select (store (arr!47593 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1456828 (= lt!638449 (array!98618 (store (arr!47593 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48144 a!2862)))))

(declare-fun b!1456829 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98617 (_ BitVec 32)) SeekEntryResult!11742)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98617 (_ BitVec 32)) SeekEntryResult!11742)

(assert (=> b!1456829 (= e!819847 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638451 lt!638449 mask!2687) (seekEntryOrOpen!0 lt!638451 lt!638449 mask!2687)))))

(declare-fun b!1456830 () Bool)

(assert (=> b!1456830 (= e!819846 e!819842)))

(declare-fun res!986660 () Bool)

(assert (=> b!1456830 (=> res!986660 e!819842)))

(declare-fun lt!638453 () (_ BitVec 32))

(assert (=> b!1456830 (= res!986660 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638453 #b00000000000000000000000000000000) (bvsge lt!638453 (size!48144 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1456830 (= lt!638453 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun lt!638454 () SeekEntryResult!11742)

(assert (=> b!1456830 (= lt!638454 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638451 lt!638449 mask!2687))))

(assert (=> b!1456830 (= lt!638454 (seekEntryOrOpen!0 lt!638451 lt!638449 mask!2687))))

(declare-fun b!1456831 () Bool)

(assert (=> b!1456831 (= e!819840 e!819841)))

(declare-fun res!986662 () Bool)

(assert (=> b!1456831 (=> (not res!986662) (not e!819841))))

(declare-fun lt!638452 () SeekEntryResult!11742)

(assert (=> b!1456831 (= res!986662 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47593 a!2862) j!93) mask!2687) (select (arr!47593 a!2862) j!93) a!2862 mask!2687) lt!638452))))

(assert (=> b!1456831 (= lt!638452 (Intermediate!11742 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!986666 () Bool)

(assert (=> start!125274 (=> (not res!986666) (not e!819849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125274 (= res!986666 (validMask!0 mask!2687))))

(assert (=> start!125274 e!819849))

(assert (=> start!125274 true))

(declare-fun array_inv!36874 (array!98617) Bool)

(assert (=> start!125274 (array_inv!36874 a!2862)))

(declare-fun b!1456832 () Bool)

(assert (=> b!1456832 (= e!819843 (not (= lt!638450 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638453 lt!638451 lt!638449 mask!2687))))))

(declare-fun b!1456833 () Bool)

(declare-fun res!986655 () Bool)

(assert (=> b!1456833 (=> (not res!986655) (not e!819849))))

(assert (=> b!1456833 (= res!986655 (and (= (size!48144 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48144 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48144 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1456834 () Bool)

(declare-fun res!986652 () Bool)

(assert (=> b!1456834 (=> (not res!986652) (not e!819849))))

(assert (=> b!1456834 (= res!986652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1456835 () Bool)

(assert (=> b!1456835 (= e!819844 (and (or (= (select (arr!47593 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47593 a!2862) intermediateBeforeIndex!19) (select (arr!47593 a!2862) j!93))) (let ((bdg!53162 (select (store (arr!47593 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47593 a!2862) index!646) bdg!53162) (= (select (arr!47593 a!2862) index!646) (select (arr!47593 a!2862) j!93))) (= (select (arr!47593 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53162 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1456836 () Bool)

(declare-fun res!986654 () Bool)

(assert (=> b!1456836 (=> res!986654 e!819842)))

(assert (=> b!1456836 (= res!986654 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638453 (select (arr!47593 a!2862) j!93) a!2862 mask!2687) lt!638452)))))

(declare-fun b!1456837 () Bool)

(declare-fun res!986650 () Bool)

(assert (=> b!1456837 (=> (not res!986650) (not e!819841))))

(assert (=> b!1456837 (= res!986650 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47593 a!2862) j!93) a!2862 mask!2687) lt!638452))))

(declare-fun b!1456838 () Bool)

(declare-fun res!986656 () Bool)

(assert (=> b!1456838 (=> (not res!986656) (not e!819845))))

(assert (=> b!1456838 (= res!986656 e!819847)))

(declare-fun c!134604 () Bool)

(assert (=> b!1456838 (= c!134604 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1456839 () Bool)

(assert (=> b!1456839 (= e!819843 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638453 intermediateAfterIndex!19 lt!638451 lt!638449 mask!2687) lt!638454)))))

(declare-fun b!1456840 () Bool)

(declare-fun res!986649 () Bool)

(assert (=> b!1456840 (=> (not res!986649) (not e!819844))))

(assert (=> b!1456840 (= res!986649 (= (seekEntryOrOpen!0 (select (arr!47593 a!2862) j!93) a!2862 mask!2687) (Found!11742 j!93)))))

(assert (= (and start!125274 res!986666) b!1456833))

(assert (= (and b!1456833 res!986655) b!1456822))

(assert (= (and b!1456822 res!986651) b!1456821))

(assert (= (and b!1456821 res!986658) b!1456834))

(assert (= (and b!1456834 res!986652) b!1456820))

(assert (= (and b!1456820 res!986661) b!1456827))

(assert (= (and b!1456827 res!986653) b!1456828))

(assert (= (and b!1456828 res!986665) b!1456831))

(assert (= (and b!1456831 res!986662) b!1456837))

(assert (= (and b!1456837 res!986650) b!1456823))

(assert (= (and b!1456823 res!986663) b!1456838))

(assert (= (and b!1456838 c!134604) b!1456825))

(assert (= (and b!1456838 (not c!134604)) b!1456829))

(assert (= (and b!1456838 res!986656) b!1456824))

(assert (= (and b!1456824 res!986657) b!1456819))

(assert (= (and b!1456819 res!986659) b!1456840))

(assert (= (and b!1456840 res!986649) b!1456835))

(assert (= (and b!1456819 (not res!986664)) b!1456830))

(assert (= (and b!1456830 (not res!986660)) b!1456836))

(assert (= (and b!1456836 (not res!986654)) b!1456826))

(assert (= (and b!1456826 c!134605) b!1456832))

(assert (= (and b!1456826 (not c!134605)) b!1456839))

(declare-fun m!1345147 () Bool)

(assert (=> b!1456825 m!1345147))

(declare-fun m!1345149 () Bool)

(assert (=> b!1456834 m!1345149))

(declare-fun m!1345151 () Bool)

(assert (=> b!1456830 m!1345151))

(declare-fun m!1345153 () Bool)

(assert (=> b!1456830 m!1345153))

(declare-fun m!1345155 () Bool)

(assert (=> b!1456830 m!1345155))

(declare-fun m!1345157 () Bool)

(assert (=> b!1456837 m!1345157))

(assert (=> b!1456837 m!1345157))

(declare-fun m!1345159 () Bool)

(assert (=> b!1456837 m!1345159))

(assert (=> b!1456821 m!1345157))

(assert (=> b!1456821 m!1345157))

(declare-fun m!1345161 () Bool)

(assert (=> b!1456821 m!1345161))

(declare-fun m!1345163 () Bool)

(assert (=> b!1456819 m!1345163))

(declare-fun m!1345165 () Bool)

(assert (=> b!1456819 m!1345165))

(declare-fun m!1345167 () Bool)

(assert (=> b!1456819 m!1345167))

(declare-fun m!1345169 () Bool)

(assert (=> b!1456819 m!1345169))

(declare-fun m!1345171 () Bool)

(assert (=> b!1456819 m!1345171))

(assert (=> b!1456819 m!1345157))

(declare-fun m!1345173 () Bool)

(assert (=> b!1456822 m!1345173))

(assert (=> b!1456822 m!1345173))

(declare-fun m!1345175 () Bool)

(assert (=> b!1456822 m!1345175))

(assert (=> b!1456828 m!1345165))

(declare-fun m!1345177 () Bool)

(assert (=> b!1456828 m!1345177))

(declare-fun m!1345179 () Bool)

(assert (=> start!125274 m!1345179))

(declare-fun m!1345181 () Bool)

(assert (=> start!125274 m!1345181))

(declare-fun m!1345183 () Bool)

(assert (=> b!1456820 m!1345183))

(declare-fun m!1345185 () Bool)

(assert (=> b!1456839 m!1345185))

(declare-fun m!1345187 () Bool)

(assert (=> b!1456823 m!1345187))

(assert (=> b!1456823 m!1345187))

(declare-fun m!1345189 () Bool)

(assert (=> b!1456823 m!1345189))

(assert (=> b!1456823 m!1345165))

(declare-fun m!1345191 () Bool)

(assert (=> b!1456823 m!1345191))

(declare-fun m!1345193 () Bool)

(assert (=> b!1456832 m!1345193))

(assert (=> b!1456831 m!1345157))

(assert (=> b!1456831 m!1345157))

(declare-fun m!1345195 () Bool)

(assert (=> b!1456831 m!1345195))

(assert (=> b!1456831 m!1345195))

(assert (=> b!1456831 m!1345157))

(declare-fun m!1345197 () Bool)

(assert (=> b!1456831 m!1345197))

(assert (=> b!1456835 m!1345165))

(declare-fun m!1345199 () Bool)

(assert (=> b!1456835 m!1345199))

(assert (=> b!1456835 m!1345167))

(assert (=> b!1456835 m!1345169))

(assert (=> b!1456835 m!1345157))

(assert (=> b!1456836 m!1345157))

(assert (=> b!1456836 m!1345157))

(declare-fun m!1345201 () Bool)

(assert (=> b!1456836 m!1345201))

(assert (=> b!1456829 m!1345153))

(assert (=> b!1456829 m!1345155))

(assert (=> b!1456840 m!1345157))

(assert (=> b!1456840 m!1345157))

(declare-fun m!1345203 () Bool)

(assert (=> b!1456840 m!1345203))

(check-sat (not b!1456819) (not b!1456840) (not b!1456836) (not b!1456832) (not start!125274) (not b!1456831) (not b!1456829) (not b!1456825) (not b!1456837) (not b!1456823) (not b!1456839) (not b!1456822) (not b!1456821) (not b!1456830) (not b!1456820) (not b!1456834))
(check-sat)
