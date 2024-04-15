; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124948 () Bool)

(assert start!124948)

(declare-fun b!1452791 () Bool)

(declare-fun e!817757 () Bool)

(assert (=> b!1452791 (= e!817757 (not true))))

(declare-fun e!817755 () Bool)

(assert (=> b!1452791 e!817755))

(declare-fun res!983973 () Bool)

(assert (=> b!1452791 (=> (not res!983973) (not e!817755))))

(declare-datatypes ((array!98374 0))(
  ( (array!98375 (arr!47476 (Array (_ BitVec 32) (_ BitVec 64))) (size!48028 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98374)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98374 (_ BitVec 32)) Bool)

(assert (=> b!1452791 (= res!983973 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48843 0))(
  ( (Unit!48844) )
))
(declare-fun lt!636872 () Unit!48843)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98374 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48843)

(assert (=> b!1452791 (= lt!636872 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452792 () Bool)

(declare-fun res!983978 () Bool)

(declare-fun e!817758 () Bool)

(assert (=> b!1452792 (=> (not res!983978) (not e!817758))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11753 0))(
  ( (MissingZero!11753 (index!49404 (_ BitVec 32))) (Found!11753 (index!49405 (_ BitVec 32))) (Intermediate!11753 (undefined!12565 Bool) (index!49406 (_ BitVec 32)) (x!131045 (_ BitVec 32))) (Undefined!11753) (MissingVacant!11753 (index!49407 (_ BitVec 32))) )
))
(declare-fun lt!636873 () SeekEntryResult!11753)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98374 (_ BitVec 32)) SeekEntryResult!11753)

(assert (=> b!1452792 (= res!983978 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47476 a!2862) j!93) a!2862 mask!2687) lt!636873))))

(declare-fun b!1452793 () Bool)

(declare-fun res!983976 () Bool)

(declare-fun e!817753 () Bool)

(assert (=> b!1452793 (=> (not res!983976) (not e!817753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452793 (= res!983976 (validKeyInArray!0 (select (arr!47476 a!2862) j!93)))))

(declare-fun b!1452794 () Bool)

(assert (=> b!1452794 (= e!817758 e!817757)))

(declare-fun res!983974 () Bool)

(assert (=> b!1452794 (=> (not res!983974) (not e!817757))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!636871 () SeekEntryResult!11753)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1452794 (= res!983974 (= lt!636871 (Intermediate!11753 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!636870 () array!98374)

(declare-fun lt!636869 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452794 (= lt!636871 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636869 mask!2687) lt!636869 lt!636870 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1452794 (= lt!636869 (select (store (arr!47476 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452795 () Bool)

(declare-fun res!983977 () Bool)

(assert (=> b!1452795 (=> (not res!983977) (not e!817757))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1452795 (= res!983977 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452796 () Bool)

(declare-fun res!983971 () Bool)

(assert (=> b!1452796 (=> (not res!983971) (not e!817757))))

(declare-fun e!817752 () Bool)

(assert (=> b!1452796 (= res!983971 e!817752)))

(declare-fun c!133927 () Bool)

(assert (=> b!1452796 (= c!133927 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1452797 () Bool)

(declare-fun e!817754 () Bool)

(assert (=> b!1452797 (= e!817754 e!817758)))

(declare-fun res!983970 () Bool)

(assert (=> b!1452797 (=> (not res!983970) (not e!817758))))

(assert (=> b!1452797 (= res!983970 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47476 a!2862) j!93) mask!2687) (select (arr!47476 a!2862) j!93) a!2862 mask!2687) lt!636873))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1452797 (= lt!636873 (Intermediate!11753 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1452798 () Bool)

(declare-fun res!983969 () Bool)

(assert (=> b!1452798 (=> (not res!983969) (not e!817753))))

(assert (=> b!1452798 (= res!983969 (and (= (size!48028 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48028 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48028 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452799 () Bool)

(declare-fun res!983975 () Bool)

(assert (=> b!1452799 (=> (not res!983975) (not e!817753))))

(assert (=> b!1452799 (= res!983975 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48028 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48028 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48028 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1452800 () Bool)

(declare-fun res!983968 () Bool)

(assert (=> b!1452800 (=> (not res!983968) (not e!817753))))

(declare-datatypes ((List!34055 0))(
  ( (Nil!34052) (Cons!34051 (h!35401 (_ BitVec 64)) (t!48741 List!34055)) )
))
(declare-fun arrayNoDuplicates!0 (array!98374 (_ BitVec 32) List!34055) Bool)

(assert (=> b!1452800 (= res!983968 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34052))))

(declare-fun b!1452801 () Bool)

(declare-fun res!983972 () Bool)

(assert (=> b!1452801 (=> (not res!983972) (not e!817755))))

(assert (=> b!1452801 (= res!983972 (or (= (select (arr!47476 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47476 a!2862) intermediateBeforeIndex!19) (select (arr!47476 a!2862) j!93))))))

(declare-fun b!1452802 () Bool)

(declare-fun res!983980 () Bool)

(assert (=> b!1452802 (=> (not res!983980) (not e!817753))))

(assert (=> b!1452802 (= res!983980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1452803 () Bool)

(declare-fun e!817750 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98374 (_ BitVec 32)) SeekEntryResult!11753)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98374 (_ BitVec 32)) SeekEntryResult!11753)

(assert (=> b!1452803 (= e!817750 (= (seekEntryOrOpen!0 lt!636869 lt!636870 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636869 lt!636870 mask!2687)))))

(declare-fun b!1452804 () Bool)

(declare-fun res!983967 () Bool)

(assert (=> b!1452804 (=> (not res!983967) (not e!817755))))

(assert (=> b!1452804 (= res!983967 (= (seekEntryOrOpen!0 (select (arr!47476 a!2862) j!93) a!2862 mask!2687) (Found!11753 j!93)))))

(declare-fun b!1452805 () Bool)

(assert (=> b!1452805 (= e!817753 e!817754)))

(declare-fun res!983979 () Bool)

(assert (=> b!1452805 (=> (not res!983979) (not e!817754))))

(assert (=> b!1452805 (= res!983979 (= (select (store (arr!47476 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1452805 (= lt!636870 (array!98375 (store (arr!47476 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48028 a!2862)))))

(declare-fun b!1452806 () Bool)

(assert (=> b!1452806 (= e!817752 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636869 lt!636870 mask!2687) (seekEntryOrOpen!0 lt!636869 lt!636870 mask!2687)))))

(declare-fun res!983966 () Bool)

(assert (=> start!124948 (=> (not res!983966) (not e!817753))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124948 (= res!983966 (validMask!0 mask!2687))))

(assert (=> start!124948 e!817753))

(assert (=> start!124948 true))

(declare-fun array_inv!36709 (array!98374) Bool)

(assert (=> start!124948 (array_inv!36709 a!2862)))

(declare-fun b!1452807 () Bool)

(declare-fun e!817751 () Bool)

(assert (=> b!1452807 (= e!817755 e!817751)))

(declare-fun res!983965 () Bool)

(assert (=> b!1452807 (=> res!983965 e!817751)))

(declare-fun lt!636868 () (_ BitVec 64))

(assert (=> b!1452807 (= res!983965 (or (and (= (select (arr!47476 a!2862) index!646) lt!636868) (= (select (arr!47476 a!2862) index!646) (select (arr!47476 a!2862) j!93))) (= (select (arr!47476 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1452807 (= lt!636868 (select (store (arr!47476 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1452808 () Bool)

(assert (=> b!1452808 (= e!817752 (= lt!636871 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636869 lt!636870 mask!2687)))))

(declare-fun b!1452809 () Bool)

(assert (=> b!1452809 (= e!817751 e!817750)))

(declare-fun res!983963 () Bool)

(assert (=> b!1452809 (=> (not res!983963) (not e!817750))))

(assert (=> b!1452809 (= res!983963 (and (= index!646 intermediateAfterIndex!19) (= lt!636868 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1452810 () Bool)

(declare-fun res!983964 () Bool)

(assert (=> b!1452810 (=> (not res!983964) (not e!817753))))

(assert (=> b!1452810 (= res!983964 (validKeyInArray!0 (select (arr!47476 a!2862) i!1006)))))

(assert (= (and start!124948 res!983966) b!1452798))

(assert (= (and b!1452798 res!983969) b!1452810))

(assert (= (and b!1452810 res!983964) b!1452793))

(assert (= (and b!1452793 res!983976) b!1452802))

(assert (= (and b!1452802 res!983980) b!1452800))

(assert (= (and b!1452800 res!983968) b!1452799))

(assert (= (and b!1452799 res!983975) b!1452805))

(assert (= (and b!1452805 res!983979) b!1452797))

(assert (= (and b!1452797 res!983970) b!1452792))

(assert (= (and b!1452792 res!983978) b!1452794))

(assert (= (and b!1452794 res!983974) b!1452796))

(assert (= (and b!1452796 c!133927) b!1452808))

(assert (= (and b!1452796 (not c!133927)) b!1452806))

(assert (= (and b!1452796 res!983971) b!1452795))

(assert (= (and b!1452795 res!983977) b!1452791))

(assert (= (and b!1452791 res!983973) b!1452804))

(assert (= (and b!1452804 res!983967) b!1452801))

(assert (= (and b!1452801 res!983972) b!1452807))

(assert (= (and b!1452807 (not res!983965)) b!1452809))

(assert (= (and b!1452809 res!983963) b!1452803))

(declare-fun m!1340865 () Bool)

(assert (=> b!1452804 m!1340865))

(assert (=> b!1452804 m!1340865))

(declare-fun m!1340867 () Bool)

(assert (=> b!1452804 m!1340867))

(declare-fun m!1340869 () Bool)

(assert (=> b!1452802 m!1340869))

(declare-fun m!1340871 () Bool)

(assert (=> b!1452808 m!1340871))

(declare-fun m!1340873 () Bool)

(assert (=> b!1452794 m!1340873))

(assert (=> b!1452794 m!1340873))

(declare-fun m!1340875 () Bool)

(assert (=> b!1452794 m!1340875))

(declare-fun m!1340877 () Bool)

(assert (=> b!1452794 m!1340877))

(declare-fun m!1340879 () Bool)

(assert (=> b!1452794 m!1340879))

(declare-fun m!1340881 () Bool)

(assert (=> start!124948 m!1340881))

(declare-fun m!1340883 () Bool)

(assert (=> start!124948 m!1340883))

(declare-fun m!1340885 () Bool)

(assert (=> b!1452806 m!1340885))

(declare-fun m!1340887 () Bool)

(assert (=> b!1452806 m!1340887))

(declare-fun m!1340889 () Bool)

(assert (=> b!1452810 m!1340889))

(assert (=> b!1452810 m!1340889))

(declare-fun m!1340891 () Bool)

(assert (=> b!1452810 m!1340891))

(declare-fun m!1340893 () Bool)

(assert (=> b!1452791 m!1340893))

(declare-fun m!1340895 () Bool)

(assert (=> b!1452791 m!1340895))

(assert (=> b!1452805 m!1340877))

(declare-fun m!1340897 () Bool)

(assert (=> b!1452805 m!1340897))

(declare-fun m!1340899 () Bool)

(assert (=> b!1452807 m!1340899))

(assert (=> b!1452807 m!1340865))

(assert (=> b!1452807 m!1340877))

(declare-fun m!1340901 () Bool)

(assert (=> b!1452807 m!1340901))

(declare-fun m!1340903 () Bool)

(assert (=> b!1452800 m!1340903))

(assert (=> b!1452792 m!1340865))

(assert (=> b!1452792 m!1340865))

(declare-fun m!1340905 () Bool)

(assert (=> b!1452792 m!1340905))

(declare-fun m!1340907 () Bool)

(assert (=> b!1452801 m!1340907))

(assert (=> b!1452801 m!1340865))

(assert (=> b!1452797 m!1340865))

(assert (=> b!1452797 m!1340865))

(declare-fun m!1340909 () Bool)

(assert (=> b!1452797 m!1340909))

(assert (=> b!1452797 m!1340909))

(assert (=> b!1452797 m!1340865))

(declare-fun m!1340911 () Bool)

(assert (=> b!1452797 m!1340911))

(assert (=> b!1452803 m!1340887))

(assert (=> b!1452803 m!1340885))

(assert (=> b!1452793 m!1340865))

(assert (=> b!1452793 m!1340865))

(declare-fun m!1340913 () Bool)

(assert (=> b!1452793 m!1340913))

(check-sat (not b!1452791) (not b!1452794) (not b!1452806) (not b!1452802) (not b!1452793) (not b!1452792) (not start!124948) (not b!1452803) (not b!1452800) (not b!1452797) (not b!1452808) (not b!1452810) (not b!1452804))
(check-sat)
