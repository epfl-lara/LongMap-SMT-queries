; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126432 () Bool)

(assert start!126432)

(declare-fun b!1478846 () Bool)

(declare-fun res!1003910 () Bool)

(declare-fun e!829760 () Bool)

(assert (=> b!1478846 (=> (not res!1003910) (not e!829760))))

(declare-datatypes ((array!99376 0))(
  ( (array!99377 (arr!47962 (Array (_ BitVec 32) (_ BitVec 64))) (size!48513 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99376)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478846 (= res!1003910 (validKeyInArray!0 (select (arr!47962 a!2862) j!93)))))

(declare-fun b!1478847 () Bool)

(declare-fun res!1003908 () Bool)

(declare-fun e!829763 () Bool)

(assert (=> b!1478847 (=> (not res!1003908) (not e!829763))))

(declare-fun e!829764 () Bool)

(assert (=> b!1478847 (= res!1003908 e!829764)))

(declare-fun c!136999 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1478847 (= c!136999 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1478849 () Bool)

(declare-fun e!829761 () Bool)

(declare-fun e!829759 () Bool)

(assert (=> b!1478849 (= e!829761 e!829759)))

(declare-fun res!1003917 () Bool)

(assert (=> b!1478849 (=> (not res!1003917) (not e!829759))))

(declare-datatypes ((SeekEntryResult!12099 0))(
  ( (MissingZero!12099 (index!50788 (_ BitVec 32))) (Found!12099 (index!50789 (_ BitVec 32))) (Intermediate!12099 (undefined!12911 Bool) (index!50790 (_ BitVec 32)) (x!132571 (_ BitVec 32))) (Undefined!12099) (MissingVacant!12099 (index!50791 (_ BitVec 32))) )
))
(declare-fun lt!645888 () SeekEntryResult!12099)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99376 (_ BitVec 32)) SeekEntryResult!12099)

(assert (=> b!1478849 (= res!1003917 (= lt!645888 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47962 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478850 () Bool)

(assert (=> b!1478850 (= e!829763 (not true))))

(declare-fun e!829758 () Bool)

(assert (=> b!1478850 e!829758))

(declare-fun res!1003921 () Bool)

(assert (=> b!1478850 (=> (not res!1003921) (not e!829758))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1478850 (= res!1003921 (and (= lt!645888 (Found!12099 j!93)) (or (= (select (arr!47962 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47962 a!2862) intermediateBeforeIndex!19) (select (arr!47962 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99376 (_ BitVec 32)) SeekEntryResult!12099)

(assert (=> b!1478850 (= lt!645888 (seekEntryOrOpen!0 (select (arr!47962 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99376 (_ BitVec 32)) Bool)

(assert (=> b!1478850 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49571 0))(
  ( (Unit!49572) )
))
(declare-fun lt!645889 () Unit!49571)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49571)

(assert (=> b!1478850 (= lt!645889 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!645885 () SeekEntryResult!12099)

(declare-fun b!1478851 () Bool)

(declare-fun lt!645886 () array!99376)

(declare-fun lt!645884 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99376 (_ BitVec 32)) SeekEntryResult!12099)

(assert (=> b!1478851 (= e!829764 (= lt!645885 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645884 lt!645886 mask!2687)))))

(declare-fun b!1478852 () Bool)

(declare-fun e!829756 () Bool)

(assert (=> b!1478852 (= e!829756 e!829763)))

(declare-fun res!1003918 () Bool)

(assert (=> b!1478852 (=> (not res!1003918) (not e!829763))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1478852 (= res!1003918 (= lt!645885 (Intermediate!12099 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478852 (= lt!645885 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645884 mask!2687) lt!645884 lt!645886 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1478852 (= lt!645884 (select (store (arr!47962 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1478853 () Bool)

(assert (=> b!1478853 (= e!829764 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645884 lt!645886 mask!2687) (seekEntryOrOpen!0 lt!645884 lt!645886 mask!2687)))))

(declare-fun b!1478854 () Bool)

(declare-fun res!1003915 () Bool)

(assert (=> b!1478854 (=> (not res!1003915) (not e!829763))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1478854 (= res!1003915 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1478855 () Bool)

(declare-fun res!1003911 () Bool)

(assert (=> b!1478855 (=> (not res!1003911) (not e!829760))))

(assert (=> b!1478855 (= res!1003911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478848 () Bool)

(assert (=> b!1478848 (= e!829758 e!829761)))

(declare-fun res!1003922 () Bool)

(assert (=> b!1478848 (=> res!1003922 e!829761)))

(assert (=> b!1478848 (= res!1003922 (or (and (= (select (arr!47962 a!2862) index!646) (select (store (arr!47962 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47962 a!2862) index!646) (select (arr!47962 a!2862) j!93))) (not (= (select (arr!47962 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1003920 () Bool)

(assert (=> start!126432 (=> (not res!1003920) (not e!829760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126432 (= res!1003920 (validMask!0 mask!2687))))

(assert (=> start!126432 e!829760))

(assert (=> start!126432 true))

(declare-fun array_inv!37243 (array!99376) Bool)

(assert (=> start!126432 (array_inv!37243 a!2862)))

(declare-fun b!1478856 () Bool)

(declare-fun res!1003913 () Bool)

(assert (=> b!1478856 (=> (not res!1003913) (not e!829760))))

(assert (=> b!1478856 (= res!1003913 (and (= (size!48513 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48513 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48513 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1478857 () Bool)

(declare-fun e!829757 () Bool)

(assert (=> b!1478857 (= e!829757 e!829756)))

(declare-fun res!1003916 () Bool)

(assert (=> b!1478857 (=> (not res!1003916) (not e!829756))))

(declare-fun lt!645887 () SeekEntryResult!12099)

(assert (=> b!1478857 (= res!1003916 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47962 a!2862) j!93) mask!2687) (select (arr!47962 a!2862) j!93) a!2862 mask!2687) lt!645887))))

(assert (=> b!1478857 (= lt!645887 (Intermediate!12099 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478858 () Bool)

(declare-fun res!1003919 () Bool)

(assert (=> b!1478858 (=> (not res!1003919) (not e!829760))))

(declare-datatypes ((List!34450 0))(
  ( (Nil!34447) (Cons!34446 (h!35828 (_ BitVec 64)) (t!49136 List!34450)) )
))
(declare-fun arrayNoDuplicates!0 (array!99376 (_ BitVec 32) List!34450) Bool)

(assert (=> b!1478858 (= res!1003919 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34447))))

(declare-fun b!1478859 () Bool)

(assert (=> b!1478859 (= e!829760 e!829757)))

(declare-fun res!1003907 () Bool)

(assert (=> b!1478859 (=> (not res!1003907) (not e!829757))))

(assert (=> b!1478859 (= res!1003907 (= (select (store (arr!47962 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1478859 (= lt!645886 (array!99377 (store (arr!47962 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48513 a!2862)))))

(declare-fun b!1478860 () Bool)

(declare-fun res!1003914 () Bool)

(assert (=> b!1478860 (=> (not res!1003914) (not e!829760))))

(assert (=> b!1478860 (= res!1003914 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48513 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48513 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48513 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1478861 () Bool)

(declare-fun res!1003912 () Bool)

(assert (=> b!1478861 (=> (not res!1003912) (not e!829760))))

(assert (=> b!1478861 (= res!1003912 (validKeyInArray!0 (select (arr!47962 a!2862) i!1006)))))

(declare-fun b!1478862 () Bool)

(declare-fun res!1003909 () Bool)

(assert (=> b!1478862 (=> (not res!1003909) (not e!829756))))

(assert (=> b!1478862 (= res!1003909 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47962 a!2862) j!93) a!2862 mask!2687) lt!645887))))

(declare-fun b!1478863 () Bool)

(assert (=> b!1478863 (= e!829759 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(assert (= (and start!126432 res!1003920) b!1478856))

(assert (= (and b!1478856 res!1003913) b!1478861))

(assert (= (and b!1478861 res!1003912) b!1478846))

(assert (= (and b!1478846 res!1003910) b!1478855))

(assert (= (and b!1478855 res!1003911) b!1478858))

(assert (= (and b!1478858 res!1003919) b!1478860))

(assert (= (and b!1478860 res!1003914) b!1478859))

(assert (= (and b!1478859 res!1003907) b!1478857))

(assert (= (and b!1478857 res!1003916) b!1478862))

(assert (= (and b!1478862 res!1003909) b!1478852))

(assert (= (and b!1478852 res!1003918) b!1478847))

(assert (= (and b!1478847 c!136999) b!1478851))

(assert (= (and b!1478847 (not c!136999)) b!1478853))

(assert (= (and b!1478847 res!1003908) b!1478854))

(assert (= (and b!1478854 res!1003915) b!1478850))

(assert (= (and b!1478850 res!1003921) b!1478848))

(assert (= (and b!1478848 (not res!1003922)) b!1478849))

(assert (= (and b!1478849 res!1003917) b!1478863))

(declare-fun m!1364785 () Bool)

(assert (=> b!1478851 m!1364785))

(declare-fun m!1364787 () Bool)

(assert (=> b!1478855 m!1364787))

(declare-fun m!1364789 () Bool)

(assert (=> b!1478853 m!1364789))

(declare-fun m!1364791 () Bool)

(assert (=> b!1478853 m!1364791))

(declare-fun m!1364793 () Bool)

(assert (=> b!1478848 m!1364793))

(declare-fun m!1364795 () Bool)

(assert (=> b!1478848 m!1364795))

(declare-fun m!1364797 () Bool)

(assert (=> b!1478848 m!1364797))

(declare-fun m!1364799 () Bool)

(assert (=> b!1478848 m!1364799))

(declare-fun m!1364801 () Bool)

(assert (=> b!1478850 m!1364801))

(declare-fun m!1364803 () Bool)

(assert (=> b!1478850 m!1364803))

(assert (=> b!1478850 m!1364799))

(declare-fun m!1364805 () Bool)

(assert (=> b!1478850 m!1364805))

(declare-fun m!1364807 () Bool)

(assert (=> b!1478850 m!1364807))

(assert (=> b!1478850 m!1364799))

(declare-fun m!1364809 () Bool)

(assert (=> b!1478861 m!1364809))

(assert (=> b!1478861 m!1364809))

(declare-fun m!1364811 () Bool)

(assert (=> b!1478861 m!1364811))

(assert (=> b!1478859 m!1364795))

(declare-fun m!1364813 () Bool)

(assert (=> b!1478859 m!1364813))

(assert (=> b!1478846 m!1364799))

(assert (=> b!1478846 m!1364799))

(declare-fun m!1364815 () Bool)

(assert (=> b!1478846 m!1364815))

(assert (=> b!1478849 m!1364799))

(assert (=> b!1478849 m!1364799))

(declare-fun m!1364817 () Bool)

(assert (=> b!1478849 m!1364817))

(declare-fun m!1364819 () Bool)

(assert (=> b!1478858 m!1364819))

(assert (=> b!1478857 m!1364799))

(assert (=> b!1478857 m!1364799))

(declare-fun m!1364821 () Bool)

(assert (=> b!1478857 m!1364821))

(assert (=> b!1478857 m!1364821))

(assert (=> b!1478857 m!1364799))

(declare-fun m!1364823 () Bool)

(assert (=> b!1478857 m!1364823))

(declare-fun m!1364825 () Bool)

(assert (=> b!1478852 m!1364825))

(assert (=> b!1478852 m!1364825))

(declare-fun m!1364827 () Bool)

(assert (=> b!1478852 m!1364827))

(assert (=> b!1478852 m!1364795))

(declare-fun m!1364829 () Bool)

(assert (=> b!1478852 m!1364829))

(declare-fun m!1364831 () Bool)

(assert (=> start!126432 m!1364831))

(declare-fun m!1364833 () Bool)

(assert (=> start!126432 m!1364833))

(assert (=> b!1478862 m!1364799))

(assert (=> b!1478862 m!1364799))

(declare-fun m!1364835 () Bool)

(assert (=> b!1478862 m!1364835))

(check-sat (not b!1478850) (not b!1478852) (not b!1478861) (not b!1478858) (not start!126432) (not b!1478862) (not b!1478855) (not b!1478857) (not b!1478846) (not b!1478853) (not b!1478851) (not b!1478849))
(check-sat)
