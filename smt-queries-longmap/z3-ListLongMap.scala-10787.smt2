; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126222 () Bool)

(assert start!126222)

(declare-fun b!1478974 () Bool)

(declare-fun e!829616 () Bool)

(declare-fun e!829611 () Bool)

(assert (=> b!1478974 (= e!829616 e!829611)))

(declare-fun res!1004942 () Bool)

(assert (=> b!1478974 (=> (not res!1004942) (not e!829611))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99328 0))(
  ( (array!99329 (arr!47943 (Array (_ BitVec 32) (_ BitVec 64))) (size!48493 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99328)

(assert (=> b!1478974 (= res!1004942 (= (select (store (arr!47943 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!645859 () array!99328)

(assert (=> b!1478974 (= lt!645859 (array!99329 (store (arr!47943 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48493 a!2862)))))

(declare-fun b!1478975 () Bool)

(declare-fun e!829615 () Bool)

(declare-fun e!829617 () Bool)

(assert (=> b!1478975 (= e!829615 e!829617)))

(declare-fun res!1004929 () Bool)

(assert (=> b!1478975 (=> (not res!1004929) (not e!829617))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12183 0))(
  ( (MissingZero!12183 (index!51124 (_ BitVec 32))) (Found!12183 (index!51125 (_ BitVec 32))) (Intermediate!12183 (undefined!12995 Bool) (index!51126 (_ BitVec 32)) (x!132710 (_ BitVec 32))) (Undefined!12183) (MissingVacant!12183 (index!51127 (_ BitVec 32))) )
))
(declare-fun lt!645864 () SeekEntryResult!12183)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99328 (_ BitVec 32)) SeekEntryResult!12183)

(assert (=> b!1478975 (= res!1004929 (= lt!645864 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47943 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478976 () Bool)

(declare-fun e!829613 () Bool)

(assert (=> b!1478976 (= e!829613 (not true))))

(declare-fun e!829618 () Bool)

(assert (=> b!1478976 e!829618))

(declare-fun res!1004930 () Bool)

(assert (=> b!1478976 (=> (not res!1004930) (not e!829618))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1478976 (= res!1004930 (and (= lt!645864 (Found!12183 j!93)) (or (= (select (arr!47943 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47943 a!2862) intermediateBeforeIndex!19) (select (arr!47943 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99328 (_ BitVec 32)) SeekEntryResult!12183)

(assert (=> b!1478976 (= lt!645864 (seekEntryOrOpen!0 (select (arr!47943 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99328 (_ BitVec 32)) Bool)

(assert (=> b!1478976 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49706 0))(
  ( (Unit!49707) )
))
(declare-fun lt!645863 () Unit!49706)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99328 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49706)

(assert (=> b!1478976 (= lt!645863 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1478977 () Bool)

(declare-fun e!829619 () Bool)

(assert (=> b!1478977 (= e!829619 e!829613)))

(declare-fun res!1004941 () Bool)

(assert (=> b!1478977 (=> (not res!1004941) (not e!829613))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!645861 () SeekEntryResult!12183)

(assert (=> b!1478977 (= res!1004941 (= lt!645861 (Intermediate!12183 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645860 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99328 (_ BitVec 32)) SeekEntryResult!12183)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478977 (= lt!645861 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645860 mask!2687) lt!645860 lt!645859 mask!2687))))

(assert (=> b!1478977 (= lt!645860 (select (store (arr!47943 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1478978 () Bool)

(declare-fun res!1004935 () Bool)

(assert (=> b!1478978 (=> (not res!1004935) (not e!829613))))

(declare-fun e!829612 () Bool)

(assert (=> b!1478978 (= res!1004935 e!829612)))

(declare-fun c!136542 () Bool)

(assert (=> b!1478978 (= c!136542 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1478979 () Bool)

(declare-fun res!1004937 () Bool)

(assert (=> b!1478979 (=> (not res!1004937) (not e!829616))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478979 (= res!1004937 (validKeyInArray!0 (select (arr!47943 a!2862) j!93)))))

(declare-fun b!1478980 () Bool)

(assert (=> b!1478980 (= e!829618 e!829615)))

(declare-fun res!1004940 () Bool)

(assert (=> b!1478980 (=> res!1004940 e!829615)))

(assert (=> b!1478980 (= res!1004940 (or (and (= (select (arr!47943 a!2862) index!646) (select (store (arr!47943 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47943 a!2862) index!646) (select (arr!47943 a!2862) j!93))) (not (= (select (arr!47943 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1004936 () Bool)

(assert (=> start!126222 (=> (not res!1004936) (not e!829616))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126222 (= res!1004936 (validMask!0 mask!2687))))

(assert (=> start!126222 e!829616))

(assert (=> start!126222 true))

(declare-fun array_inv!36971 (array!99328) Bool)

(assert (=> start!126222 (array_inv!36971 a!2862)))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1478981 () Bool)

(assert (=> b!1478981 (= e!829617 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1478982 () Bool)

(declare-fun res!1004939 () Bool)

(assert (=> b!1478982 (=> (not res!1004939) (not e!829616))))

(assert (=> b!1478982 (= res!1004939 (and (= (size!48493 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48493 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48493 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1478983 () Bool)

(declare-fun res!1004943 () Bool)

(assert (=> b!1478983 (=> (not res!1004943) (not e!829613))))

(assert (=> b!1478983 (= res!1004943 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1478984 () Bool)

(declare-fun res!1004933 () Bool)

(assert (=> b!1478984 (=> (not res!1004933) (not e!829616))))

(assert (=> b!1478984 (= res!1004933 (validKeyInArray!0 (select (arr!47943 a!2862) i!1006)))))

(declare-fun b!1478985 () Bool)

(assert (=> b!1478985 (= e!829612 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645860 lt!645859 mask!2687) (seekEntryOrOpen!0 lt!645860 lt!645859 mask!2687)))))

(declare-fun b!1478986 () Bool)

(declare-fun res!1004938 () Bool)

(assert (=> b!1478986 (=> (not res!1004938) (not e!829619))))

(declare-fun lt!645862 () SeekEntryResult!12183)

(assert (=> b!1478986 (= res!1004938 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47943 a!2862) j!93) a!2862 mask!2687) lt!645862))))

(declare-fun b!1478987 () Bool)

(declare-fun res!1004934 () Bool)

(assert (=> b!1478987 (=> (not res!1004934) (not e!829616))))

(assert (=> b!1478987 (= res!1004934 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48493 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48493 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48493 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1478988 () Bool)

(declare-fun res!1004931 () Bool)

(assert (=> b!1478988 (=> (not res!1004931) (not e!829616))))

(assert (=> b!1478988 (= res!1004931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478989 () Bool)

(declare-fun res!1004932 () Bool)

(assert (=> b!1478989 (=> (not res!1004932) (not e!829616))))

(declare-datatypes ((List!34444 0))(
  ( (Nil!34441) (Cons!34440 (h!35808 (_ BitVec 64)) (t!49138 List!34444)) )
))
(declare-fun arrayNoDuplicates!0 (array!99328 (_ BitVec 32) List!34444) Bool)

(assert (=> b!1478989 (= res!1004932 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34441))))

(declare-fun b!1478990 () Bool)

(assert (=> b!1478990 (= e!829612 (= lt!645861 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645860 lt!645859 mask!2687)))))

(declare-fun b!1478991 () Bool)

(assert (=> b!1478991 (= e!829611 e!829619)))

(declare-fun res!1004944 () Bool)

(assert (=> b!1478991 (=> (not res!1004944) (not e!829619))))

(assert (=> b!1478991 (= res!1004944 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47943 a!2862) j!93) mask!2687) (select (arr!47943 a!2862) j!93) a!2862 mask!2687) lt!645862))))

(assert (=> b!1478991 (= lt!645862 (Intermediate!12183 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!126222 res!1004936) b!1478982))

(assert (= (and b!1478982 res!1004939) b!1478984))

(assert (= (and b!1478984 res!1004933) b!1478979))

(assert (= (and b!1478979 res!1004937) b!1478988))

(assert (= (and b!1478988 res!1004931) b!1478989))

(assert (= (and b!1478989 res!1004932) b!1478987))

(assert (= (and b!1478987 res!1004934) b!1478974))

(assert (= (and b!1478974 res!1004942) b!1478991))

(assert (= (and b!1478991 res!1004944) b!1478986))

(assert (= (and b!1478986 res!1004938) b!1478977))

(assert (= (and b!1478977 res!1004941) b!1478978))

(assert (= (and b!1478978 c!136542) b!1478990))

(assert (= (and b!1478978 (not c!136542)) b!1478985))

(assert (= (and b!1478978 res!1004935) b!1478983))

(assert (= (and b!1478983 res!1004943) b!1478976))

(assert (= (and b!1478976 res!1004930) b!1478980))

(assert (= (and b!1478980 (not res!1004940)) b!1478975))

(assert (= (and b!1478975 res!1004929) b!1478981))

(declare-fun m!1364867 () Bool)

(assert (=> b!1478986 m!1364867))

(assert (=> b!1478986 m!1364867))

(declare-fun m!1364869 () Bool)

(assert (=> b!1478986 m!1364869))

(assert (=> b!1478979 m!1364867))

(assert (=> b!1478979 m!1364867))

(declare-fun m!1364871 () Bool)

(assert (=> b!1478979 m!1364871))

(assert (=> b!1478991 m!1364867))

(assert (=> b!1478991 m!1364867))

(declare-fun m!1364873 () Bool)

(assert (=> b!1478991 m!1364873))

(assert (=> b!1478991 m!1364873))

(assert (=> b!1478991 m!1364867))

(declare-fun m!1364875 () Bool)

(assert (=> b!1478991 m!1364875))

(declare-fun m!1364877 () Bool)

(assert (=> b!1478985 m!1364877))

(declare-fun m!1364879 () Bool)

(assert (=> b!1478985 m!1364879))

(declare-fun m!1364881 () Bool)

(assert (=> b!1478980 m!1364881))

(declare-fun m!1364883 () Bool)

(assert (=> b!1478980 m!1364883))

(declare-fun m!1364885 () Bool)

(assert (=> b!1478980 m!1364885))

(assert (=> b!1478980 m!1364867))

(assert (=> b!1478974 m!1364883))

(declare-fun m!1364887 () Bool)

(assert (=> b!1478974 m!1364887))

(declare-fun m!1364889 () Bool)

(assert (=> b!1478988 m!1364889))

(assert (=> b!1478975 m!1364867))

(assert (=> b!1478975 m!1364867))

(declare-fun m!1364891 () Bool)

(assert (=> b!1478975 m!1364891))

(declare-fun m!1364893 () Bool)

(assert (=> b!1478984 m!1364893))

(assert (=> b!1478984 m!1364893))

(declare-fun m!1364895 () Bool)

(assert (=> b!1478984 m!1364895))

(declare-fun m!1364897 () Bool)

(assert (=> b!1478977 m!1364897))

(assert (=> b!1478977 m!1364897))

(declare-fun m!1364899 () Bool)

(assert (=> b!1478977 m!1364899))

(assert (=> b!1478977 m!1364883))

(declare-fun m!1364901 () Bool)

(assert (=> b!1478977 m!1364901))

(declare-fun m!1364903 () Bool)

(assert (=> start!126222 m!1364903))

(declare-fun m!1364905 () Bool)

(assert (=> start!126222 m!1364905))

(declare-fun m!1364907 () Bool)

(assert (=> b!1478990 m!1364907))

(declare-fun m!1364909 () Bool)

(assert (=> b!1478989 m!1364909))

(declare-fun m!1364911 () Bool)

(assert (=> b!1478976 m!1364911))

(declare-fun m!1364913 () Bool)

(assert (=> b!1478976 m!1364913))

(assert (=> b!1478976 m!1364867))

(declare-fun m!1364915 () Bool)

(assert (=> b!1478976 m!1364915))

(declare-fun m!1364917 () Bool)

(assert (=> b!1478976 m!1364917))

(assert (=> b!1478976 m!1364867))

(check-sat (not b!1478977) (not b!1478975) (not b!1478986) (not b!1478991) (not b!1478988) (not start!126222) (not b!1478990) (not b!1478985) (not b!1478976) (not b!1478989) (not b!1478984) (not b!1478979))
(check-sat)
