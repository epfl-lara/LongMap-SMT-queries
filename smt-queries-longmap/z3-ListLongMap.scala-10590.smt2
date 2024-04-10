; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124680 () Bool)

(assert start!124680)

(declare-datatypes ((SeekEntryResult!11604 0))(
  ( (MissingZero!11604 (index!48808 (_ BitVec 32))) (Found!11604 (index!48809 (_ BitVec 32))) (Intermediate!11604 (undefined!12416 Bool) (index!48810 (_ BitVec 32)) (x!130501 (_ BitVec 32))) (Undefined!11604) (MissingVacant!11604 (index!48811 (_ BitVec 32))) )
))
(declare-fun lt!634309 () SeekEntryResult!11604)

(declare-fun lt!634307 () (_ BitVec 64))

(declare-fun b!1444796 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!813982 () Bool)

(declare-datatypes ((array!98128 0))(
  ( (array!98129 (arr!47352 (Array (_ BitVec 32) (_ BitVec 64))) (size!47902 (_ BitVec 32))) )
))
(declare-fun lt!634311 () array!98128)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98128 (_ BitVec 32)) SeekEntryResult!11604)

(assert (=> b!1444796 (= e!813982 (= lt!634309 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634307 lt!634311 mask!2687)))))

(declare-fun b!1444797 () Bool)

(declare-fun res!976745 () Bool)

(declare-fun e!813977 () Bool)

(assert (=> b!1444797 (=> (not res!976745) (not e!813977))))

(assert (=> b!1444797 (= res!976745 e!813982)))

(declare-fun c!133536 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1444797 (= c!133536 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444798 () Bool)

(declare-fun res!976749 () Bool)

(declare-fun e!813983 () Bool)

(assert (=> b!1444798 (=> (not res!976749) (not e!813983))))

(declare-fun lt!634310 () SeekEntryResult!11604)

(declare-fun a!2862 () array!98128)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1444798 (= res!976749 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47352 a!2862) j!93) a!2862 mask!2687) lt!634310))))

(declare-fun b!1444799 () Bool)

(declare-fun res!976753 () Bool)

(declare-fun e!813980 () Bool)

(assert (=> b!1444799 (=> (not res!976753) (not e!813980))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1444799 (= res!976753 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47902 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47902 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47902 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1444800 () Bool)

(declare-fun res!976748 () Bool)

(declare-fun e!813981 () Bool)

(assert (=> b!1444800 (=> (not res!976748) (not e!813981))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98128 (_ BitVec 32)) SeekEntryResult!11604)

(assert (=> b!1444800 (= res!976748 (= (seekEntryOrOpen!0 (select (arr!47352 a!2862) j!93) a!2862 mask!2687) (Found!11604 j!93)))))

(declare-fun b!1444801 () Bool)

(declare-fun res!976750 () Bool)

(assert (=> b!1444801 (=> (not res!976750) (not e!813977))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1444801 (= res!976750 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1444802 () Bool)

(declare-fun res!976752 () Bool)

(assert (=> b!1444802 (=> (not res!976752) (not e!813980))))

(declare-datatypes ((List!33853 0))(
  ( (Nil!33850) (Cons!33849 (h!35199 (_ BitVec 64)) (t!48547 List!33853)) )
))
(declare-fun arrayNoDuplicates!0 (array!98128 (_ BitVec 32) List!33853) Bool)

(assert (=> b!1444802 (= res!976752 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33850))))

(declare-fun b!1444803 () Bool)

(assert (=> b!1444803 (= e!813981 (or (= (select (arr!47352 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47352 a!2862) intermediateBeforeIndex!19) (select (arr!47352 a!2862) j!93))))))

(declare-fun b!1444805 () Bool)

(declare-fun res!976758 () Bool)

(assert (=> b!1444805 (=> (not res!976758) (not e!813980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444805 (= res!976758 (validKeyInArray!0 (select (arr!47352 a!2862) j!93)))))

(declare-fun b!1444806 () Bool)

(declare-fun res!976754 () Bool)

(assert (=> b!1444806 (=> (not res!976754) (not e!813980))))

(assert (=> b!1444806 (= res!976754 (and (= (size!47902 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47902 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47902 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1444807 () Bool)

(declare-fun e!813979 () Bool)

(assert (=> b!1444807 (= e!813979 e!813983)))

(declare-fun res!976759 () Bool)

(assert (=> b!1444807 (=> (not res!976759) (not e!813983))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444807 (= res!976759 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47352 a!2862) j!93) mask!2687) (select (arr!47352 a!2862) j!93) a!2862 mask!2687) lt!634310))))

(assert (=> b!1444807 (= lt!634310 (Intermediate!11604 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1444808 () Bool)

(assert (=> b!1444808 (= e!813977 (not (or (and (= (select (arr!47352 a!2862) index!646) (select (store (arr!47352 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47352 a!2862) index!646) (select (arr!47352 a!2862) j!93))) (not (= (select (arr!47352 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(assert (=> b!1444808 e!813981))

(declare-fun res!976757 () Bool)

(assert (=> b!1444808 (=> (not res!976757) (not e!813981))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98128 (_ BitVec 32)) Bool)

(assert (=> b!1444808 (= res!976757 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48704 0))(
  ( (Unit!48705) )
))
(declare-fun lt!634308 () Unit!48704)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98128 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48704)

(assert (=> b!1444808 (= lt!634308 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!976746 () Bool)

(assert (=> start!124680 (=> (not res!976746) (not e!813980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124680 (= res!976746 (validMask!0 mask!2687))))

(assert (=> start!124680 e!813980))

(assert (=> start!124680 true))

(declare-fun array_inv!36380 (array!98128) Bool)

(assert (=> start!124680 (array_inv!36380 a!2862)))

(declare-fun b!1444804 () Bool)

(declare-fun res!976756 () Bool)

(assert (=> b!1444804 (=> (not res!976756) (not e!813980))))

(assert (=> b!1444804 (= res!976756 (validKeyInArray!0 (select (arr!47352 a!2862) i!1006)))))

(declare-fun b!1444809 () Bool)

(assert (=> b!1444809 (= e!813980 e!813979)))

(declare-fun res!976751 () Bool)

(assert (=> b!1444809 (=> (not res!976751) (not e!813979))))

(assert (=> b!1444809 (= res!976751 (= (select (store (arr!47352 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1444809 (= lt!634311 (array!98129 (store (arr!47352 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47902 a!2862)))))

(declare-fun b!1444810 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98128 (_ BitVec 32)) SeekEntryResult!11604)

(assert (=> b!1444810 (= e!813982 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634307 lt!634311 mask!2687) (seekEntryOrOpen!0 lt!634307 lt!634311 mask!2687)))))

(declare-fun b!1444811 () Bool)

(assert (=> b!1444811 (= e!813983 e!813977)))

(declare-fun res!976755 () Bool)

(assert (=> b!1444811 (=> (not res!976755) (not e!813977))))

(assert (=> b!1444811 (= res!976755 (= lt!634309 (Intermediate!11604 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1444811 (= lt!634309 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634307 mask!2687) lt!634307 lt!634311 mask!2687))))

(assert (=> b!1444811 (= lt!634307 (select (store (arr!47352 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1444812 () Bool)

(declare-fun res!976747 () Bool)

(assert (=> b!1444812 (=> (not res!976747) (not e!813980))))

(assert (=> b!1444812 (= res!976747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124680 res!976746) b!1444806))

(assert (= (and b!1444806 res!976754) b!1444804))

(assert (= (and b!1444804 res!976756) b!1444805))

(assert (= (and b!1444805 res!976758) b!1444812))

(assert (= (and b!1444812 res!976747) b!1444802))

(assert (= (and b!1444802 res!976752) b!1444799))

(assert (= (and b!1444799 res!976753) b!1444809))

(assert (= (and b!1444809 res!976751) b!1444807))

(assert (= (and b!1444807 res!976759) b!1444798))

(assert (= (and b!1444798 res!976749) b!1444811))

(assert (= (and b!1444811 res!976755) b!1444797))

(assert (= (and b!1444797 c!133536) b!1444796))

(assert (= (and b!1444797 (not c!133536)) b!1444810))

(assert (= (and b!1444797 res!976745) b!1444801))

(assert (= (and b!1444801 res!976750) b!1444808))

(assert (= (and b!1444808 res!976757) b!1444800))

(assert (= (and b!1444800 res!976748) b!1444803))

(declare-fun m!1333797 () Bool)

(assert (=> b!1444808 m!1333797))

(declare-fun m!1333799 () Bool)

(assert (=> b!1444808 m!1333799))

(declare-fun m!1333801 () Bool)

(assert (=> b!1444808 m!1333801))

(declare-fun m!1333803 () Bool)

(assert (=> b!1444808 m!1333803))

(declare-fun m!1333805 () Bool)

(assert (=> b!1444808 m!1333805))

(declare-fun m!1333807 () Bool)

(assert (=> b!1444808 m!1333807))

(declare-fun m!1333809 () Bool)

(assert (=> b!1444810 m!1333809))

(declare-fun m!1333811 () Bool)

(assert (=> b!1444810 m!1333811))

(assert (=> b!1444805 m!1333807))

(assert (=> b!1444805 m!1333807))

(declare-fun m!1333813 () Bool)

(assert (=> b!1444805 m!1333813))

(declare-fun m!1333815 () Bool)

(assert (=> b!1444802 m!1333815))

(declare-fun m!1333817 () Bool)

(assert (=> b!1444796 m!1333817))

(declare-fun m!1333819 () Bool)

(assert (=> b!1444812 m!1333819))

(declare-fun m!1333821 () Bool)

(assert (=> b!1444804 m!1333821))

(assert (=> b!1444804 m!1333821))

(declare-fun m!1333823 () Bool)

(assert (=> b!1444804 m!1333823))

(assert (=> b!1444800 m!1333807))

(assert (=> b!1444800 m!1333807))

(declare-fun m!1333825 () Bool)

(assert (=> b!1444800 m!1333825))

(declare-fun m!1333827 () Bool)

(assert (=> start!124680 m!1333827))

(declare-fun m!1333829 () Bool)

(assert (=> start!124680 m!1333829))

(declare-fun m!1333831 () Bool)

(assert (=> b!1444803 m!1333831))

(assert (=> b!1444803 m!1333807))

(assert (=> b!1444809 m!1333799))

(declare-fun m!1333833 () Bool)

(assert (=> b!1444809 m!1333833))

(assert (=> b!1444807 m!1333807))

(assert (=> b!1444807 m!1333807))

(declare-fun m!1333835 () Bool)

(assert (=> b!1444807 m!1333835))

(assert (=> b!1444807 m!1333835))

(assert (=> b!1444807 m!1333807))

(declare-fun m!1333837 () Bool)

(assert (=> b!1444807 m!1333837))

(assert (=> b!1444798 m!1333807))

(assert (=> b!1444798 m!1333807))

(declare-fun m!1333839 () Bool)

(assert (=> b!1444798 m!1333839))

(declare-fun m!1333841 () Bool)

(assert (=> b!1444811 m!1333841))

(assert (=> b!1444811 m!1333841))

(declare-fun m!1333843 () Bool)

(assert (=> b!1444811 m!1333843))

(assert (=> b!1444811 m!1333799))

(declare-fun m!1333845 () Bool)

(assert (=> b!1444811 m!1333845))

(check-sat (not start!124680) (not b!1444800) (not b!1444811) (not b!1444807) (not b!1444802) (not b!1444804) (not b!1444812) (not b!1444798) (not b!1444805) (not b!1444810) (not b!1444808) (not b!1444796))
(check-sat)
