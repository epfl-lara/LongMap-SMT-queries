; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126224 () Bool)

(assert start!126224)

(declare-fun b!1479028 () Bool)

(declare-fun res!1004989 () Bool)

(declare-fun e!829643 () Bool)

(assert (=> b!1479028 (=> (not res!1004989) (not e!829643))))

(declare-datatypes ((array!99330 0))(
  ( (array!99331 (arr!47944 (Array (_ BitVec 32) (_ BitVec 64))) (size!48494 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99330)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479028 (= res!1004989 (validKeyInArray!0 (select (arr!47944 a!2862) j!93)))))

(declare-fun b!1479029 () Bool)

(declare-fun e!829642 () Bool)

(assert (=> b!1479029 (= e!829643 e!829642)))

(declare-fun res!1004986 () Bool)

(assert (=> b!1479029 (=> (not res!1004986) (not e!829642))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1479029 (= res!1004986 (= (select (store (arr!47944 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!645879 () array!99330)

(assert (=> b!1479029 (= lt!645879 (array!99331 (store (arr!47944 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48494 a!2862)))))

(declare-fun b!1479030 () Bool)

(declare-fun res!1004992 () Bool)

(assert (=> b!1479030 (=> (not res!1004992) (not e!829643))))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1479030 (= res!1004992 (and (= (size!48494 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48494 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48494 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1479031 () Bool)

(declare-fun res!1004988 () Bool)

(declare-fun e!829644 () Bool)

(assert (=> b!1479031 (=> (not res!1004988) (not e!829644))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12184 0))(
  ( (MissingZero!12184 (index!51128 (_ BitVec 32))) (Found!12184 (index!51129 (_ BitVec 32))) (Intermediate!12184 (undefined!12996 Bool) (index!51130 (_ BitVec 32)) (x!132711 (_ BitVec 32))) (Undefined!12184) (MissingVacant!12184 (index!51131 (_ BitVec 32))) )
))
(declare-fun lt!645882 () SeekEntryResult!12184)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99330 (_ BitVec 32)) SeekEntryResult!12184)

(assert (=> b!1479031 (= res!1004988 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47944 a!2862) j!93) a!2862 mask!2687) lt!645882))))

(declare-fun b!1479032 () Bool)

(declare-fun res!1004983 () Bool)

(assert (=> b!1479032 (=> (not res!1004983) (not e!829643))))

(declare-datatypes ((List!34445 0))(
  ( (Nil!34442) (Cons!34441 (h!35809 (_ BitVec 64)) (t!49139 List!34445)) )
))
(declare-fun arrayNoDuplicates!0 (array!99330 (_ BitVec 32) List!34445) Bool)

(assert (=> b!1479032 (= res!1004983 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34442))))

(declare-fun b!1479033 () Bool)

(assert (=> b!1479033 (= e!829642 e!829644)))

(declare-fun res!1004984 () Bool)

(assert (=> b!1479033 (=> (not res!1004984) (not e!829644))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479033 (= res!1004984 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47944 a!2862) j!93) mask!2687) (select (arr!47944 a!2862) j!93) a!2862 mask!2687) lt!645882))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1479033 (= lt!645882 (Intermediate!12184 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1479034 () Bool)

(declare-fun e!829646 () Bool)

(assert (=> b!1479034 (= e!829644 e!829646)))

(declare-fun res!1004985 () Bool)

(assert (=> b!1479034 (=> (not res!1004985) (not e!829646))))

(declare-fun lt!645881 () SeekEntryResult!12184)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1479034 (= res!1004985 (= lt!645881 (Intermediate!12184 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!645878 () (_ BitVec 64))

(assert (=> b!1479034 (= lt!645881 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645878 mask!2687) lt!645878 lt!645879 mask!2687))))

(assert (=> b!1479034 (= lt!645878 (select (store (arr!47944 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1479035 () Bool)

(declare-fun e!829645 () Bool)

(declare-fun e!829638 () Bool)

(assert (=> b!1479035 (= e!829645 e!829638)))

(declare-fun res!1004987 () Bool)

(assert (=> b!1479035 (=> res!1004987 e!829638)))

(assert (=> b!1479035 (= res!1004987 (or (and (= (select (arr!47944 a!2862) index!646) (select (store (arr!47944 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47944 a!2862) index!646) (select (arr!47944 a!2862) j!93))) (not (= (select (arr!47944 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1479036 () Bool)

(declare-fun res!1004982 () Bool)

(assert (=> b!1479036 (=> (not res!1004982) (not e!829646))))

(assert (=> b!1479036 (= res!1004982 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!1004981 () Bool)

(assert (=> start!126224 (=> (not res!1004981) (not e!829643))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126224 (= res!1004981 (validMask!0 mask!2687))))

(assert (=> start!126224 e!829643))

(assert (=> start!126224 true))

(declare-fun array_inv!36972 (array!99330) Bool)

(assert (=> start!126224 (array_inv!36972 a!2862)))

(declare-fun e!829639 () Bool)

(declare-fun b!1479037 () Bool)

(assert (=> b!1479037 (= e!829639 (= lt!645881 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645878 lt!645879 mask!2687)))))

(declare-fun b!1479038 () Bool)

(declare-fun res!1004978 () Bool)

(assert (=> b!1479038 (=> (not res!1004978) (not e!829643))))

(assert (=> b!1479038 (= res!1004978 (validKeyInArray!0 (select (arr!47944 a!2862) i!1006)))))

(declare-fun b!1479039 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99330 (_ BitVec 32)) SeekEntryResult!12184)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99330 (_ BitVec 32)) SeekEntryResult!12184)

(assert (=> b!1479039 (= e!829639 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645878 lt!645879 mask!2687) (seekEntryOrOpen!0 lt!645878 lt!645879 mask!2687)))))

(declare-fun b!1479040 () Bool)

(declare-fun res!1004977 () Bool)

(assert (=> b!1479040 (=> (not res!1004977) (not e!829643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99330 (_ BitVec 32)) Bool)

(assert (=> b!1479040 (= res!1004977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1479041 () Bool)

(declare-fun e!829641 () Bool)

(assert (=> b!1479041 (= e!829641 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1479042 () Bool)

(assert (=> b!1479042 (= e!829638 e!829641)))

(declare-fun res!1004980 () Bool)

(assert (=> b!1479042 (=> (not res!1004980) (not e!829641))))

(declare-fun lt!645880 () SeekEntryResult!12184)

(assert (=> b!1479042 (= res!1004980 (= lt!645880 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47944 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1479043 () Bool)

(declare-fun res!1004991 () Bool)

(assert (=> b!1479043 (=> (not res!1004991) (not e!829646))))

(assert (=> b!1479043 (= res!1004991 e!829639)))

(declare-fun c!136545 () Bool)

(assert (=> b!1479043 (= c!136545 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1479044 () Bool)

(assert (=> b!1479044 (= e!829646 (not true))))

(assert (=> b!1479044 e!829645))

(declare-fun res!1004990 () Bool)

(assert (=> b!1479044 (=> (not res!1004990) (not e!829645))))

(assert (=> b!1479044 (= res!1004990 (and (= lt!645880 (Found!12184 j!93)) (or (= (select (arr!47944 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47944 a!2862) intermediateBeforeIndex!19) (select (arr!47944 a!2862) j!93)))))))

(assert (=> b!1479044 (= lt!645880 (seekEntryOrOpen!0 (select (arr!47944 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1479044 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49708 0))(
  ( (Unit!49709) )
))
(declare-fun lt!645877 () Unit!49708)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99330 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49708)

(assert (=> b!1479044 (= lt!645877 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1479045 () Bool)

(declare-fun res!1004979 () Bool)

(assert (=> b!1479045 (=> (not res!1004979) (not e!829643))))

(assert (=> b!1479045 (= res!1004979 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48494 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48494 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48494 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126224 res!1004981) b!1479030))

(assert (= (and b!1479030 res!1004992) b!1479038))

(assert (= (and b!1479038 res!1004978) b!1479028))

(assert (= (and b!1479028 res!1004989) b!1479040))

(assert (= (and b!1479040 res!1004977) b!1479032))

(assert (= (and b!1479032 res!1004983) b!1479045))

(assert (= (and b!1479045 res!1004979) b!1479029))

(assert (= (and b!1479029 res!1004986) b!1479033))

(assert (= (and b!1479033 res!1004984) b!1479031))

(assert (= (and b!1479031 res!1004988) b!1479034))

(assert (= (and b!1479034 res!1004985) b!1479043))

(assert (= (and b!1479043 c!136545) b!1479037))

(assert (= (and b!1479043 (not c!136545)) b!1479039))

(assert (= (and b!1479043 res!1004991) b!1479036))

(assert (= (and b!1479036 res!1004982) b!1479044))

(assert (= (and b!1479044 res!1004990) b!1479035))

(assert (= (and b!1479035 (not res!1004987)) b!1479042))

(assert (= (and b!1479042 res!1004980) b!1479041))

(declare-fun m!1364919 () Bool)

(assert (=> b!1479033 m!1364919))

(assert (=> b!1479033 m!1364919))

(declare-fun m!1364921 () Bool)

(assert (=> b!1479033 m!1364921))

(assert (=> b!1479033 m!1364921))

(assert (=> b!1479033 m!1364919))

(declare-fun m!1364923 () Bool)

(assert (=> b!1479033 m!1364923))

(declare-fun m!1364925 () Bool)

(assert (=> b!1479029 m!1364925))

(declare-fun m!1364927 () Bool)

(assert (=> b!1479029 m!1364927))

(declare-fun m!1364929 () Bool)

(assert (=> b!1479034 m!1364929))

(assert (=> b!1479034 m!1364929))

(declare-fun m!1364931 () Bool)

(assert (=> b!1479034 m!1364931))

(assert (=> b!1479034 m!1364925))

(declare-fun m!1364933 () Bool)

(assert (=> b!1479034 m!1364933))

(declare-fun m!1364935 () Bool)

(assert (=> b!1479040 m!1364935))

(declare-fun m!1364937 () Bool)

(assert (=> b!1479037 m!1364937))

(assert (=> b!1479031 m!1364919))

(assert (=> b!1479031 m!1364919))

(declare-fun m!1364939 () Bool)

(assert (=> b!1479031 m!1364939))

(declare-fun m!1364941 () Bool)

(assert (=> start!126224 m!1364941))

(declare-fun m!1364943 () Bool)

(assert (=> start!126224 m!1364943))

(declare-fun m!1364945 () Bool)

(assert (=> b!1479044 m!1364945))

(declare-fun m!1364947 () Bool)

(assert (=> b!1479044 m!1364947))

(assert (=> b!1479044 m!1364919))

(declare-fun m!1364949 () Bool)

(assert (=> b!1479044 m!1364949))

(declare-fun m!1364951 () Bool)

(assert (=> b!1479044 m!1364951))

(assert (=> b!1479044 m!1364919))

(assert (=> b!1479042 m!1364919))

(assert (=> b!1479042 m!1364919))

(declare-fun m!1364953 () Bool)

(assert (=> b!1479042 m!1364953))

(declare-fun m!1364955 () Bool)

(assert (=> b!1479038 m!1364955))

(assert (=> b!1479038 m!1364955))

(declare-fun m!1364957 () Bool)

(assert (=> b!1479038 m!1364957))

(declare-fun m!1364959 () Bool)

(assert (=> b!1479035 m!1364959))

(assert (=> b!1479035 m!1364925))

(declare-fun m!1364961 () Bool)

(assert (=> b!1479035 m!1364961))

(assert (=> b!1479035 m!1364919))

(assert (=> b!1479028 m!1364919))

(assert (=> b!1479028 m!1364919))

(declare-fun m!1364963 () Bool)

(assert (=> b!1479028 m!1364963))

(declare-fun m!1364965 () Bool)

(assert (=> b!1479032 m!1364965))

(declare-fun m!1364967 () Bool)

(assert (=> b!1479039 m!1364967))

(declare-fun m!1364969 () Bool)

(assert (=> b!1479039 m!1364969))

(push 1)

