; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125128 () Bool)

(assert start!125128)

(declare-fun b!1457868 () Bool)

(declare-fun res!988106 () Bool)

(declare-fun e!820083 () Bool)

(assert (=> b!1457868 (=> res!988106 e!820083)))

(declare-datatypes ((array!98576 0))(
  ( (array!98577 (arr!47576 (Array (_ BitVec 32) (_ BitVec 64))) (size!48126 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98576)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!638834 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11828 0))(
  ( (MissingZero!11828 (index!49704 (_ BitVec 32))) (Found!11828 (index!49705 (_ BitVec 32))) (Intermediate!11828 (undefined!12640 Bool) (index!49706 (_ BitVec 32)) (x!131325 (_ BitVec 32))) (Undefined!11828) (MissingVacant!11828 (index!49707 (_ BitVec 32))) )
))
(declare-fun lt!638841 () SeekEntryResult!11828)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98576 (_ BitVec 32)) SeekEntryResult!11828)

(assert (=> b!1457868 (= res!988106 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638834 (select (arr!47576 a!2862) j!93) a!2862 mask!2687) lt!638841)))))

(declare-fun b!1457869 () Bool)

(declare-fun res!988098 () Bool)

(declare-fun e!820090 () Bool)

(assert (=> b!1457869 (=> (not res!988098) (not e!820090))))

(declare-fun e!820091 () Bool)

(assert (=> b!1457869 (= res!988098 e!820091)))

(declare-fun c!134399 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1457869 (= c!134399 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1457870 () Bool)

(assert (=> b!1457870 (= e!820083 true)))

(declare-fun lt!638840 () Bool)

(declare-fun e!820085 () Bool)

(assert (=> b!1457870 (= lt!638840 e!820085)))

(declare-fun c!134400 () Bool)

(assert (=> b!1457870 (= c!134400 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1457871 () Bool)

(declare-fun res!988099 () Bool)

(declare-fun e!820087 () Bool)

(assert (=> b!1457871 (=> (not res!988099) (not e!820087))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1457871 (= res!988099 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47576 a!2862) j!93) a!2862 mask!2687) lt!638841))))

(declare-fun b!1457872 () Bool)

(declare-fun res!988092 () Bool)

(declare-fun e!820086 () Bool)

(assert (=> b!1457872 (=> (not res!988092) (not e!820086))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1457872 (= res!988092 (validKeyInArray!0 (select (arr!47576 a!2862) j!93)))))

(declare-fun b!1457873 () Bool)

(assert (=> b!1457873 (= e!820087 e!820090)))

(declare-fun res!988107 () Bool)

(assert (=> b!1457873 (=> (not res!988107) (not e!820090))))

(declare-fun lt!638837 () SeekEntryResult!11828)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1457873 (= res!988107 (= lt!638837 (Intermediate!11828 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!638839 () array!98576)

(declare-fun lt!638835 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457873 (= lt!638837 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638835 mask!2687) lt!638835 lt!638839 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1457873 (= lt!638835 (select (store (arr!47576 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1457874 () Bool)

(declare-fun res!988091 () Bool)

(assert (=> b!1457874 (=> (not res!988091) (not e!820086))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1457874 (= res!988091 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48126 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48126 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48126 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1457875 () Bool)

(declare-fun res!988104 () Bool)

(assert (=> b!1457875 (=> (not res!988104) (not e!820086))))

(declare-datatypes ((List!34077 0))(
  ( (Nil!34074) (Cons!34073 (h!35423 (_ BitVec 64)) (t!48771 List!34077)) )
))
(declare-fun arrayNoDuplicates!0 (array!98576 (_ BitVec 32) List!34077) Bool)

(assert (=> b!1457875 (= res!988104 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34074))))

(declare-fun b!1457876 () Bool)

(declare-fun e!820082 () Bool)

(assert (=> b!1457876 (= e!820086 e!820082)))

(declare-fun res!988101 () Bool)

(assert (=> b!1457876 (=> (not res!988101) (not e!820082))))

(assert (=> b!1457876 (= res!988101 (= (select (store (arr!47576 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1457876 (= lt!638839 (array!98577 (store (arr!47576 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48126 a!2862)))))

(declare-fun b!1457877 () Bool)

(declare-fun res!988094 () Bool)

(assert (=> b!1457877 (=> (not res!988094) (not e!820086))))

(assert (=> b!1457877 (= res!988094 (and (= (size!48126 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48126 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48126 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1457878 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98576 (_ BitVec 32)) SeekEntryResult!11828)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98576 (_ BitVec 32)) SeekEntryResult!11828)

(assert (=> b!1457878 (= e!820091 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638835 lt!638839 mask!2687) (seekEntryOrOpen!0 lt!638835 lt!638839 mask!2687)))))

(declare-fun b!1457879 () Bool)

(declare-fun res!988097 () Bool)

(assert (=> b!1457879 (=> (not res!988097) (not e!820086))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98576 (_ BitVec 32)) Bool)

(assert (=> b!1457879 (= res!988097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1457880 () Bool)

(assert (=> b!1457880 (= e!820091 (= lt!638837 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638835 lt!638839 mask!2687)))))

(declare-fun b!1457881 () Bool)

(declare-fun e!820089 () Bool)

(assert (=> b!1457881 (= e!820090 (not e!820089))))

(declare-fun res!988103 () Bool)

(assert (=> b!1457881 (=> res!988103 e!820089)))

(assert (=> b!1457881 (= res!988103 (or (and (= (select (arr!47576 a!2862) index!646) (select (store (arr!47576 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47576 a!2862) index!646) (select (arr!47576 a!2862) j!93))) (= (select (arr!47576 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun e!820084 () Bool)

(assert (=> b!1457881 e!820084))

(declare-fun res!988096 () Bool)

(assert (=> b!1457881 (=> (not res!988096) (not e!820084))))

(assert (=> b!1457881 (= res!988096 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49152 0))(
  ( (Unit!49153) )
))
(declare-fun lt!638838 () Unit!49152)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98576 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49152)

(assert (=> b!1457881 (= lt!638838 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1457882 () Bool)

(assert (=> b!1457882 (= e!820084 (and (or (= (select (arr!47576 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47576 a!2862) intermediateBeforeIndex!19) (select (arr!47576 a!2862) j!93))) (let ((bdg!53377 (select (store (arr!47576 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47576 a!2862) index!646) bdg!53377) (= (select (arr!47576 a!2862) index!646) (select (arr!47576 a!2862) j!93))) (= (select (arr!47576 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53377 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1457883 () Bool)

(declare-fun lt!638836 () SeekEntryResult!11828)

(assert (=> b!1457883 (= e!820085 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638834 intermediateAfterIndex!19 lt!638835 lt!638839 mask!2687) lt!638836)))))

(declare-fun b!1457884 () Bool)

(assert (=> b!1457884 (= e!820082 e!820087)))

(declare-fun res!988102 () Bool)

(assert (=> b!1457884 (=> (not res!988102) (not e!820087))))

(assert (=> b!1457884 (= res!988102 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47576 a!2862) j!93) mask!2687) (select (arr!47576 a!2862) j!93) a!2862 mask!2687) lt!638841))))

(assert (=> b!1457884 (= lt!638841 (Intermediate!11828 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1457885 () Bool)

(declare-fun res!988100 () Bool)

(assert (=> b!1457885 (=> (not res!988100) (not e!820084))))

(assert (=> b!1457885 (= res!988100 (= (seekEntryOrOpen!0 (select (arr!47576 a!2862) j!93) a!2862 mask!2687) (Found!11828 j!93)))))

(declare-fun b!1457886 () Bool)

(declare-fun res!988093 () Bool)

(assert (=> b!1457886 (=> (not res!988093) (not e!820086))))

(assert (=> b!1457886 (= res!988093 (validKeyInArray!0 (select (arr!47576 a!2862) i!1006)))))

(declare-fun res!988108 () Bool)

(assert (=> start!125128 (=> (not res!988108) (not e!820086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125128 (= res!988108 (validMask!0 mask!2687))))

(assert (=> start!125128 e!820086))

(assert (=> start!125128 true))

(declare-fun array_inv!36604 (array!98576) Bool)

(assert (=> start!125128 (array_inv!36604 a!2862)))

(declare-fun b!1457887 () Bool)

(declare-fun res!988095 () Bool)

(assert (=> b!1457887 (=> (not res!988095) (not e!820090))))

(assert (=> b!1457887 (= res!988095 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1457888 () Bool)

(assert (=> b!1457888 (= e!820089 e!820083)))

(declare-fun res!988105 () Bool)

(assert (=> b!1457888 (=> res!988105 e!820083)))

(assert (=> b!1457888 (= res!988105 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638834 #b00000000000000000000000000000000) (bvsge lt!638834 (size!48126 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457888 (= lt!638834 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1457888 (= lt!638836 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638835 lt!638839 mask!2687))))

(assert (=> b!1457888 (= lt!638836 (seekEntryOrOpen!0 lt!638835 lt!638839 mask!2687))))

(declare-fun b!1457889 () Bool)

(assert (=> b!1457889 (= e!820085 (not (= lt!638837 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638834 lt!638835 lt!638839 mask!2687))))))

(assert (= (and start!125128 res!988108) b!1457877))

(assert (= (and b!1457877 res!988094) b!1457886))

(assert (= (and b!1457886 res!988093) b!1457872))

(assert (= (and b!1457872 res!988092) b!1457879))

(assert (= (and b!1457879 res!988097) b!1457875))

(assert (= (and b!1457875 res!988104) b!1457874))

(assert (= (and b!1457874 res!988091) b!1457876))

(assert (= (and b!1457876 res!988101) b!1457884))

(assert (= (and b!1457884 res!988102) b!1457871))

(assert (= (and b!1457871 res!988099) b!1457873))

(assert (= (and b!1457873 res!988107) b!1457869))

(assert (= (and b!1457869 c!134399) b!1457880))

(assert (= (and b!1457869 (not c!134399)) b!1457878))

(assert (= (and b!1457869 res!988098) b!1457887))

(assert (= (and b!1457887 res!988095) b!1457881))

(assert (= (and b!1457881 res!988096) b!1457885))

(assert (= (and b!1457885 res!988100) b!1457882))

(assert (= (and b!1457881 (not res!988103)) b!1457888))

(assert (= (and b!1457888 (not res!988105)) b!1457868))

(assert (= (and b!1457868 (not res!988106)) b!1457870))

(assert (= (and b!1457870 c!134400) b!1457889))

(assert (= (and b!1457870 (not c!134400)) b!1457883))

(declare-fun m!1345795 () Bool)

(assert (=> b!1457873 m!1345795))

(assert (=> b!1457873 m!1345795))

(declare-fun m!1345797 () Bool)

(assert (=> b!1457873 m!1345797))

(declare-fun m!1345799 () Bool)

(assert (=> b!1457873 m!1345799))

(declare-fun m!1345801 () Bool)

(assert (=> b!1457873 m!1345801))

(declare-fun m!1345803 () Bool)

(assert (=> start!125128 m!1345803))

(declare-fun m!1345805 () Bool)

(assert (=> start!125128 m!1345805))

(assert (=> b!1457882 m!1345799))

(declare-fun m!1345807 () Bool)

(assert (=> b!1457882 m!1345807))

(declare-fun m!1345809 () Bool)

(assert (=> b!1457882 m!1345809))

(declare-fun m!1345811 () Bool)

(assert (=> b!1457882 m!1345811))

(declare-fun m!1345813 () Bool)

(assert (=> b!1457882 m!1345813))

(declare-fun m!1345815 () Bool)

(assert (=> b!1457879 m!1345815))

(assert (=> b!1457885 m!1345813))

(assert (=> b!1457885 m!1345813))

(declare-fun m!1345817 () Bool)

(assert (=> b!1457885 m!1345817))

(declare-fun m!1345819 () Bool)

(assert (=> b!1457875 m!1345819))

(declare-fun m!1345821 () Bool)

(assert (=> b!1457881 m!1345821))

(assert (=> b!1457881 m!1345799))

(assert (=> b!1457881 m!1345809))

(assert (=> b!1457881 m!1345811))

(declare-fun m!1345823 () Bool)

(assert (=> b!1457881 m!1345823))

(assert (=> b!1457881 m!1345813))

(declare-fun m!1345825 () Bool)

(assert (=> b!1457888 m!1345825))

(declare-fun m!1345827 () Bool)

(assert (=> b!1457888 m!1345827))

(declare-fun m!1345829 () Bool)

(assert (=> b!1457888 m!1345829))

(assert (=> b!1457878 m!1345827))

(assert (=> b!1457878 m!1345829))

(assert (=> b!1457876 m!1345799))

(declare-fun m!1345831 () Bool)

(assert (=> b!1457876 m!1345831))

(assert (=> b!1457884 m!1345813))

(assert (=> b!1457884 m!1345813))

(declare-fun m!1345833 () Bool)

(assert (=> b!1457884 m!1345833))

(assert (=> b!1457884 m!1345833))

(assert (=> b!1457884 m!1345813))

(declare-fun m!1345835 () Bool)

(assert (=> b!1457884 m!1345835))

(declare-fun m!1345837 () Bool)

(assert (=> b!1457880 m!1345837))

(declare-fun m!1345839 () Bool)

(assert (=> b!1457883 m!1345839))

(assert (=> b!1457872 m!1345813))

(assert (=> b!1457872 m!1345813))

(declare-fun m!1345841 () Bool)

(assert (=> b!1457872 m!1345841))

(declare-fun m!1345843 () Bool)

(assert (=> b!1457889 m!1345843))

(assert (=> b!1457868 m!1345813))

(assert (=> b!1457868 m!1345813))

(declare-fun m!1345845 () Bool)

(assert (=> b!1457868 m!1345845))

(declare-fun m!1345847 () Bool)

(assert (=> b!1457886 m!1345847))

(assert (=> b!1457886 m!1345847))

(declare-fun m!1345849 () Bool)

(assert (=> b!1457886 m!1345849))

(assert (=> b!1457871 m!1345813))

(assert (=> b!1457871 m!1345813))

(declare-fun m!1345851 () Bool)

(assert (=> b!1457871 m!1345851))

(push 1)

