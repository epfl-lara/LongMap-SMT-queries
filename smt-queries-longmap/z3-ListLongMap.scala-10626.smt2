; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125112 () Bool)

(assert start!125112)

(declare-fun b!1452090 () Bool)

(declare-fun e!817743 () Bool)

(declare-fun e!817751 () Bool)

(assert (=> b!1452090 (= e!817743 e!817751)))

(declare-fun res!982583 () Bool)

(assert (=> b!1452090 (=> (not res!982583) (not e!817751))))

(declare-datatypes ((array!98455 0))(
  ( (array!98456 (arr!47512 (Array (_ BitVec 32) (_ BitVec 64))) (size!48063 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98455)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11661 0))(
  ( (MissingZero!11661 (index!49036 (_ BitVec 32))) (Found!11661 (index!49037 (_ BitVec 32))) (Intermediate!11661 (undefined!12473 Bool) (index!49038 (_ BitVec 32)) (x!130870 (_ BitVec 32))) (Undefined!11661) (MissingVacant!11661 (index!49039 (_ BitVec 32))) )
))
(declare-fun lt!636906 () SeekEntryResult!11661)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98455 (_ BitVec 32)) SeekEntryResult!11661)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452090 (= res!982583 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47512 a!2862) j!93) mask!2687) (select (arr!47512 a!2862) j!93) a!2862 mask!2687) lt!636906))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1452090 (= lt!636906 (Intermediate!11661 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1452091 () Bool)

(declare-fun e!817746 () Bool)

(assert (=> b!1452091 (= e!817746 e!817743)))

(declare-fun res!982586 () Bool)

(assert (=> b!1452091 (=> (not res!982586) (not e!817743))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1452091 (= res!982586 (= (select (store (arr!47512 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!636903 () array!98455)

(assert (=> b!1452091 (= lt!636903 (array!98456 (store (arr!47512 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48063 a!2862)))))

(declare-fun e!817744 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1452092 () Bool)

(assert (=> b!1452092 (= e!817744 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1452093 () Bool)

(declare-fun res!982579 () Bool)

(assert (=> b!1452093 (=> (not res!982579) (not e!817746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98455 (_ BitVec 32)) Bool)

(assert (=> b!1452093 (= res!982579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1452094 () Bool)

(declare-fun res!982584 () Bool)

(assert (=> b!1452094 (=> (not res!982584) (not e!817746))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1452094 (= res!982584 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48063 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48063 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48063 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1452095 () Bool)

(declare-fun e!817745 () Bool)

(assert (=> b!1452095 (= e!817745 true)))

(declare-fun lt!636902 () (_ BitVec 64))

(declare-fun lt!636905 () SeekEntryResult!11661)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98455 (_ BitVec 32)) SeekEntryResult!11661)

(assert (=> b!1452095 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636902 lt!636903 mask!2687) lt!636905)))

(declare-datatypes ((Unit!48851 0))(
  ( (Unit!48852) )
))
(declare-fun lt!636904 () Unit!48851)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98455 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48851)

(assert (=> b!1452095 (= lt!636904 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1452096 () Bool)

(declare-fun res!982574 () Bool)

(declare-fun e!817748 () Bool)

(assert (=> b!1452096 (=> (not res!982574) (not e!817748))))

(declare-fun e!817750 () Bool)

(assert (=> b!1452096 (= res!982574 e!817750)))

(declare-fun c!134278 () Bool)

(assert (=> b!1452096 (= c!134278 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1452097 () Bool)

(declare-fun lt!636900 () SeekEntryResult!11661)

(assert (=> b!1452097 (= e!817750 (= lt!636900 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636902 lt!636903 mask!2687)))))

(declare-fun b!1452098 () Bool)

(declare-fun res!982581 () Bool)

(assert (=> b!1452098 (=> res!982581 e!817745)))

(assert (=> b!1452098 (= res!982581 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47512 a!2862) j!93) a!2862 mask!2687) lt!636905)))))

(declare-fun b!1452099 () Bool)

(declare-fun e!817752 () Bool)

(assert (=> b!1452099 (= e!817752 e!817744)))

(declare-fun res!982578 () Bool)

(assert (=> b!1452099 (=> (not res!982578) (not e!817744))))

(declare-fun lt!636907 () SeekEntryResult!11661)

(assert (=> b!1452099 (= res!982578 (= lt!636907 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47512 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun res!982585 () Bool)

(assert (=> start!125112 (=> (not res!982585) (not e!817746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125112 (= res!982585 (validMask!0 mask!2687))))

(assert (=> start!125112 e!817746))

(assert (=> start!125112 true))

(declare-fun array_inv!36793 (array!98455) Bool)

(assert (=> start!125112 (array_inv!36793 a!2862)))

(declare-fun b!1452100 () Bool)

(declare-fun res!982572 () Bool)

(assert (=> b!1452100 (=> (not res!982572) (not e!817748))))

(assert (=> b!1452100 (= res!982572 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452101 () Bool)

(declare-fun res!982587 () Bool)

(assert (=> b!1452101 (=> (not res!982587) (not e!817746))))

(assert (=> b!1452101 (= res!982587 (and (= (size!48063 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48063 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48063 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452102 () Bool)

(declare-fun e!817749 () Bool)

(assert (=> b!1452102 (= e!817749 e!817752)))

(declare-fun res!982582 () Bool)

(assert (=> b!1452102 (=> res!982582 e!817752)))

(assert (=> b!1452102 (= res!982582 (or (and (= (select (arr!47512 a!2862) index!646) (select (store (arr!47512 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47512 a!2862) index!646) (select (arr!47512 a!2862) j!93))) (not (= (select (arr!47512 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1452103 () Bool)

(declare-fun res!982577 () Bool)

(assert (=> b!1452103 (=> (not res!982577) (not e!817746))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452103 (= res!982577 (validKeyInArray!0 (select (arr!47512 a!2862) i!1006)))))

(declare-fun b!1452104 () Bool)

(assert (=> b!1452104 (= e!817751 e!817748)))

(declare-fun res!982575 () Bool)

(assert (=> b!1452104 (=> (not res!982575) (not e!817748))))

(assert (=> b!1452104 (= res!982575 (= lt!636900 (Intermediate!11661 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1452104 (= lt!636900 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636902 mask!2687) lt!636902 lt!636903 mask!2687))))

(assert (=> b!1452104 (= lt!636902 (select (store (arr!47512 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452105 () Bool)

(declare-fun res!982580 () Bool)

(assert (=> b!1452105 (=> (not res!982580) (not e!817746))))

(declare-datatypes ((List!34000 0))(
  ( (Nil!33997) (Cons!33996 (h!35357 (_ BitVec 64)) (t!48686 List!34000)) )
))
(declare-fun arrayNoDuplicates!0 (array!98455 (_ BitVec 32) List!34000) Bool)

(assert (=> b!1452105 (= res!982580 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33997))))

(declare-fun b!1452106 () Bool)

(declare-fun res!982589 () Bool)

(assert (=> b!1452106 (=> (not res!982589) (not e!817751))))

(assert (=> b!1452106 (= res!982589 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47512 a!2862) j!93) a!2862 mask!2687) lt!636906))))

(declare-fun b!1452107 () Bool)

(declare-fun res!982576 () Bool)

(assert (=> b!1452107 (=> (not res!982576) (not e!817746))))

(assert (=> b!1452107 (= res!982576 (validKeyInArray!0 (select (arr!47512 a!2862) j!93)))))

(declare-fun b!1452108 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98455 (_ BitVec 32)) SeekEntryResult!11661)

(assert (=> b!1452108 (= e!817750 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636902 lt!636903 mask!2687) (seekEntryOrOpen!0 lt!636902 lt!636903 mask!2687)))))

(declare-fun b!1452109 () Bool)

(assert (=> b!1452109 (= e!817748 (not e!817745))))

(declare-fun res!982573 () Bool)

(assert (=> b!1452109 (=> res!982573 e!817745)))

(assert (=> b!1452109 (= res!982573 (or (and (= (select (arr!47512 a!2862) index!646) (select (store (arr!47512 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47512 a!2862) index!646) (select (arr!47512 a!2862) j!93))) (not (= (select (arr!47512 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47512 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1452109 e!817749))

(declare-fun res!982588 () Bool)

(assert (=> b!1452109 (=> (not res!982588) (not e!817749))))

(assert (=> b!1452109 (= res!982588 (and (= lt!636907 lt!636905) (or (= (select (arr!47512 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47512 a!2862) intermediateBeforeIndex!19) (select (arr!47512 a!2862) j!93)))))))

(assert (=> b!1452109 (= lt!636905 (Found!11661 j!93))))

(assert (=> b!1452109 (= lt!636907 (seekEntryOrOpen!0 (select (arr!47512 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1452109 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!636901 () Unit!48851)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98455 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48851)

(assert (=> b!1452109 (= lt!636901 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!125112 res!982585) b!1452101))

(assert (= (and b!1452101 res!982587) b!1452103))

(assert (= (and b!1452103 res!982577) b!1452107))

(assert (= (and b!1452107 res!982576) b!1452093))

(assert (= (and b!1452093 res!982579) b!1452105))

(assert (= (and b!1452105 res!982580) b!1452094))

(assert (= (and b!1452094 res!982584) b!1452091))

(assert (= (and b!1452091 res!982586) b!1452090))

(assert (= (and b!1452090 res!982583) b!1452106))

(assert (= (and b!1452106 res!982589) b!1452104))

(assert (= (and b!1452104 res!982575) b!1452096))

(assert (= (and b!1452096 c!134278) b!1452097))

(assert (= (and b!1452096 (not c!134278)) b!1452108))

(assert (= (and b!1452096 res!982574) b!1452100))

(assert (= (and b!1452100 res!982572) b!1452109))

(assert (= (and b!1452109 res!982588) b!1452102))

(assert (= (and b!1452102 (not res!982582)) b!1452099))

(assert (= (and b!1452099 res!982578) b!1452092))

(assert (= (and b!1452109 (not res!982573)) b!1452098))

(assert (= (and b!1452098 (not res!982581)) b!1452095))

(declare-fun m!1340827 () Bool)

(assert (=> b!1452099 m!1340827))

(assert (=> b!1452099 m!1340827))

(declare-fun m!1340829 () Bool)

(assert (=> b!1452099 m!1340829))

(declare-fun m!1340831 () Bool)

(assert (=> b!1452095 m!1340831))

(declare-fun m!1340833 () Bool)

(assert (=> b!1452095 m!1340833))

(declare-fun m!1340835 () Bool)

(assert (=> b!1452097 m!1340835))

(declare-fun m!1340837 () Bool)

(assert (=> b!1452103 m!1340837))

(assert (=> b!1452103 m!1340837))

(declare-fun m!1340839 () Bool)

(assert (=> b!1452103 m!1340839))

(assert (=> b!1452108 m!1340831))

(declare-fun m!1340841 () Bool)

(assert (=> b!1452108 m!1340841))

(assert (=> b!1452098 m!1340827))

(assert (=> b!1452098 m!1340827))

(declare-fun m!1340843 () Bool)

(assert (=> b!1452098 m!1340843))

(declare-fun m!1340845 () Bool)

(assert (=> b!1452105 m!1340845))

(assert (=> b!1452090 m!1340827))

(assert (=> b!1452090 m!1340827))

(declare-fun m!1340847 () Bool)

(assert (=> b!1452090 m!1340847))

(assert (=> b!1452090 m!1340847))

(assert (=> b!1452090 m!1340827))

(declare-fun m!1340849 () Bool)

(assert (=> b!1452090 m!1340849))

(declare-fun m!1340851 () Bool)

(assert (=> b!1452091 m!1340851))

(declare-fun m!1340853 () Bool)

(assert (=> b!1452091 m!1340853))

(assert (=> b!1452107 m!1340827))

(assert (=> b!1452107 m!1340827))

(declare-fun m!1340855 () Bool)

(assert (=> b!1452107 m!1340855))

(declare-fun m!1340857 () Bool)

(assert (=> b!1452093 m!1340857))

(declare-fun m!1340859 () Bool)

(assert (=> b!1452102 m!1340859))

(assert (=> b!1452102 m!1340851))

(declare-fun m!1340861 () Bool)

(assert (=> b!1452102 m!1340861))

(assert (=> b!1452102 m!1340827))

(declare-fun m!1340863 () Bool)

(assert (=> b!1452104 m!1340863))

(assert (=> b!1452104 m!1340863))

(declare-fun m!1340865 () Bool)

(assert (=> b!1452104 m!1340865))

(assert (=> b!1452104 m!1340851))

(declare-fun m!1340867 () Bool)

(assert (=> b!1452104 m!1340867))

(declare-fun m!1340869 () Bool)

(assert (=> start!125112 m!1340869))

(declare-fun m!1340871 () Bool)

(assert (=> start!125112 m!1340871))

(declare-fun m!1340873 () Bool)

(assert (=> b!1452109 m!1340873))

(assert (=> b!1452109 m!1340851))

(declare-fun m!1340875 () Bool)

(assert (=> b!1452109 m!1340875))

(assert (=> b!1452109 m!1340861))

(assert (=> b!1452109 m!1340859))

(assert (=> b!1452109 m!1340827))

(declare-fun m!1340877 () Bool)

(assert (=> b!1452109 m!1340877))

(declare-fun m!1340879 () Bool)

(assert (=> b!1452109 m!1340879))

(assert (=> b!1452109 m!1340827))

(assert (=> b!1452106 m!1340827))

(assert (=> b!1452106 m!1340827))

(declare-fun m!1340881 () Bool)

(assert (=> b!1452106 m!1340881))

(check-sat (not b!1452105) (not b!1452109) (not b!1452097) (not b!1452093) (not b!1452106) (not b!1452098) (not b!1452095) (not b!1452090) (not start!125112) (not b!1452107) (not b!1452108) (not b!1452104) (not b!1452099) (not b!1452103))
(check-sat)
