; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124766 () Bool)

(assert start!124766)

(declare-fun res!978752 () Bool)

(declare-fun e!814988 () Bool)

(assert (=> start!124766 (=> (not res!978752) (not e!814988))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124766 (= res!978752 (validMask!0 mask!2687))))

(assert (=> start!124766 e!814988))

(assert (=> start!124766 true))

(declare-datatypes ((array!98214 0))(
  ( (array!98215 (arr!47395 (Array (_ BitVec 32) (_ BitVec 64))) (size!47945 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98214)

(declare-fun array_inv!36423 (array!98214) Bool)

(assert (=> start!124766 (array_inv!36423 a!2862)))

(declare-fun b!1447059 () Bool)

(declare-fun res!978755 () Bool)

(assert (=> b!1447059 (=> (not res!978755) (not e!814988))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447059 (= res!978755 (validKeyInArray!0 (select (arr!47395 a!2862) j!93)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!814987 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1447060 () Bool)

(assert (=> b!1447060 (= e!814987 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1447061 () Bool)

(declare-fun e!814990 () Bool)

(assert (=> b!1447061 (= e!814988 e!814990)))

(declare-fun res!978757 () Bool)

(assert (=> b!1447061 (=> (not res!978757) (not e!814990))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1447061 (= res!978757 (= (select (store (arr!47395 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!635022 () array!98214)

(assert (=> b!1447061 (= lt!635022 (array!98215 (store (arr!47395 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47945 a!2862)))))

(declare-fun b!1447062 () Bool)

(declare-datatypes ((SeekEntryResult!11647 0))(
  ( (MissingZero!11647 (index!48980 (_ BitVec 32))) (Found!11647 (index!48981 (_ BitVec 32))) (Intermediate!11647 (undefined!12459 Bool) (index!48982 (_ BitVec 32)) (x!130656 (_ BitVec 32))) (Undefined!11647) (MissingVacant!11647 (index!48983 (_ BitVec 32))) )
))
(declare-fun lt!635024 () SeekEntryResult!11647)

(declare-fun e!814992 () Bool)

(declare-fun lt!635026 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98214 (_ BitVec 32)) SeekEntryResult!11647)

(assert (=> b!1447062 (= e!814992 (= lt!635024 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635026 lt!635022 mask!2687)))))

(declare-fun b!1447063 () Bool)

(declare-fun e!814985 () Bool)

(declare-fun e!814991 () Bool)

(assert (=> b!1447063 (= e!814985 (not e!814991))))

(declare-fun res!978758 () Bool)

(assert (=> b!1447063 (=> res!978758 e!814991)))

(assert (=> b!1447063 (= res!978758 (or (and (= (select (arr!47395 a!2862) index!646) (select (store (arr!47395 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47395 a!2862) index!646) (select (arr!47395 a!2862) j!93))) (not (= (select (arr!47395 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47395 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!814989 () Bool)

(assert (=> b!1447063 e!814989))

(declare-fun res!978761 () Bool)

(assert (=> b!1447063 (=> (not res!978761) (not e!814989))))

(declare-fun lt!635028 () SeekEntryResult!11647)

(assert (=> b!1447063 (= res!978761 (and (= lt!635028 (Found!11647 j!93)) (or (= (select (arr!47395 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47395 a!2862) intermediateBeforeIndex!19) (select (arr!47395 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98214 (_ BitVec 32)) SeekEntryResult!11647)

(assert (=> b!1447063 (= lt!635028 (seekEntryOrOpen!0 (select (arr!47395 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98214 (_ BitVec 32)) Bool)

(assert (=> b!1447063 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48790 0))(
  ( (Unit!48791) )
))
(declare-fun lt!635025 () Unit!48790)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98214 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48790)

(assert (=> b!1447063 (= lt!635025 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447064 () Bool)

(assert (=> b!1447064 (= e!814991 true)))

(declare-fun lt!635023 () SeekEntryResult!11647)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98214 (_ BitVec 32)) SeekEntryResult!11647)

(assert (=> b!1447064 (= lt!635023 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47395 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1447065 () Bool)

(declare-fun e!814993 () Bool)

(assert (=> b!1447065 (= e!814990 e!814993)))

(declare-fun res!978766 () Bool)

(assert (=> b!1447065 (=> (not res!978766) (not e!814993))))

(declare-fun lt!635027 () SeekEntryResult!11647)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447065 (= res!978766 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47395 a!2862) j!93) mask!2687) (select (arr!47395 a!2862) j!93) a!2862 mask!2687) lt!635027))))

(assert (=> b!1447065 (= lt!635027 (Intermediate!11647 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1447066 () Bool)

(assert (=> b!1447066 (= e!814993 e!814985)))

(declare-fun res!978764 () Bool)

(assert (=> b!1447066 (=> (not res!978764) (not e!814985))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1447066 (= res!978764 (= lt!635024 (Intermediate!11647 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1447066 (= lt!635024 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635026 mask!2687) lt!635026 lt!635022 mask!2687))))

(assert (=> b!1447066 (= lt!635026 (select (store (arr!47395 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1447067 () Bool)

(declare-fun res!978762 () Bool)

(assert (=> b!1447067 (=> (not res!978762) (not e!814988))))

(assert (=> b!1447067 (= res!978762 (and (= (size!47945 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47945 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47945 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1447068 () Bool)

(declare-fun res!978753 () Bool)

(assert (=> b!1447068 (=> (not res!978753) (not e!814988))))

(assert (=> b!1447068 (= res!978753 (validKeyInArray!0 (select (arr!47395 a!2862) i!1006)))))

(declare-fun b!1447069 () Bool)

(declare-fun res!978751 () Bool)

(assert (=> b!1447069 (=> (not res!978751) (not e!814985))))

(assert (=> b!1447069 (= res!978751 e!814992)))

(declare-fun c!133665 () Bool)

(assert (=> b!1447069 (= c!133665 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1447070 () Bool)

(declare-fun res!978750 () Bool)

(assert (=> b!1447070 (=> (not res!978750) (not e!814988))))

(assert (=> b!1447070 (= res!978750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447071 () Bool)

(declare-fun e!814994 () Bool)

(assert (=> b!1447071 (= e!814989 e!814994)))

(declare-fun res!978763 () Bool)

(assert (=> b!1447071 (=> res!978763 e!814994)))

(assert (=> b!1447071 (= res!978763 (or (and (= (select (arr!47395 a!2862) index!646) (select (store (arr!47395 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47395 a!2862) index!646) (select (arr!47395 a!2862) j!93))) (not (= (select (arr!47395 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1447072 () Bool)

(assert (=> b!1447072 (= e!814994 e!814987)))

(declare-fun res!978765 () Bool)

(assert (=> b!1447072 (=> (not res!978765) (not e!814987))))

(assert (=> b!1447072 (= res!978765 (= lt!635028 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47395 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1447073 () Bool)

(declare-fun res!978759 () Bool)

(assert (=> b!1447073 (=> (not res!978759) (not e!814988))))

(assert (=> b!1447073 (= res!978759 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47945 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47945 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47945 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1447074 () Bool)

(declare-fun res!978760 () Bool)

(assert (=> b!1447074 (=> (not res!978760) (not e!814988))))

(declare-datatypes ((List!33896 0))(
  ( (Nil!33893) (Cons!33892 (h!35242 (_ BitVec 64)) (t!48590 List!33896)) )
))
(declare-fun arrayNoDuplicates!0 (array!98214 (_ BitVec 32) List!33896) Bool)

(assert (=> b!1447074 (= res!978760 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33893))))

(declare-fun b!1447075 () Bool)

(assert (=> b!1447075 (= e!814992 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635026 lt!635022 mask!2687) (seekEntryOrOpen!0 lt!635026 lt!635022 mask!2687)))))

(declare-fun b!1447076 () Bool)

(declare-fun res!978754 () Bool)

(assert (=> b!1447076 (=> (not res!978754) (not e!814993))))

(assert (=> b!1447076 (= res!978754 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47395 a!2862) j!93) a!2862 mask!2687) lt!635027))))

(declare-fun b!1447077 () Bool)

(declare-fun res!978756 () Bool)

(assert (=> b!1447077 (=> (not res!978756) (not e!814985))))

(assert (=> b!1447077 (= res!978756 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!124766 res!978752) b!1447067))

(assert (= (and b!1447067 res!978762) b!1447068))

(assert (= (and b!1447068 res!978753) b!1447059))

(assert (= (and b!1447059 res!978755) b!1447070))

(assert (= (and b!1447070 res!978750) b!1447074))

(assert (= (and b!1447074 res!978760) b!1447073))

(assert (= (and b!1447073 res!978759) b!1447061))

(assert (= (and b!1447061 res!978757) b!1447065))

(assert (= (and b!1447065 res!978766) b!1447076))

(assert (= (and b!1447076 res!978754) b!1447066))

(assert (= (and b!1447066 res!978764) b!1447069))

(assert (= (and b!1447069 c!133665) b!1447062))

(assert (= (and b!1447069 (not c!133665)) b!1447075))

(assert (= (and b!1447069 res!978751) b!1447077))

(assert (= (and b!1447077 res!978756) b!1447063))

(assert (= (and b!1447063 res!978761) b!1447071))

(assert (= (and b!1447071 (not res!978763)) b!1447072))

(assert (= (and b!1447072 res!978765) b!1447060))

(assert (= (and b!1447063 (not res!978758)) b!1447064))

(declare-fun m!1335895 () Bool)

(assert (=> b!1447065 m!1335895))

(assert (=> b!1447065 m!1335895))

(declare-fun m!1335897 () Bool)

(assert (=> b!1447065 m!1335897))

(assert (=> b!1447065 m!1335897))

(assert (=> b!1447065 m!1335895))

(declare-fun m!1335899 () Bool)

(assert (=> b!1447065 m!1335899))

(declare-fun m!1335901 () Bool)

(assert (=> b!1447062 m!1335901))

(declare-fun m!1335903 () Bool)

(assert (=> start!124766 m!1335903))

(declare-fun m!1335905 () Bool)

(assert (=> start!124766 m!1335905))

(assert (=> b!1447059 m!1335895))

(assert (=> b!1447059 m!1335895))

(declare-fun m!1335907 () Bool)

(assert (=> b!1447059 m!1335907))

(declare-fun m!1335909 () Bool)

(assert (=> b!1447068 m!1335909))

(assert (=> b!1447068 m!1335909))

(declare-fun m!1335911 () Bool)

(assert (=> b!1447068 m!1335911))

(declare-fun m!1335913 () Bool)

(assert (=> b!1447074 m!1335913))

(declare-fun m!1335915 () Bool)

(assert (=> b!1447063 m!1335915))

(declare-fun m!1335917 () Bool)

(assert (=> b!1447063 m!1335917))

(declare-fun m!1335919 () Bool)

(assert (=> b!1447063 m!1335919))

(declare-fun m!1335921 () Bool)

(assert (=> b!1447063 m!1335921))

(declare-fun m!1335923 () Bool)

(assert (=> b!1447063 m!1335923))

(assert (=> b!1447063 m!1335895))

(declare-fun m!1335925 () Bool)

(assert (=> b!1447063 m!1335925))

(declare-fun m!1335927 () Bool)

(assert (=> b!1447063 m!1335927))

(assert (=> b!1447063 m!1335895))

(assert (=> b!1447072 m!1335895))

(assert (=> b!1447072 m!1335895))

(declare-fun m!1335929 () Bool)

(assert (=> b!1447072 m!1335929))

(assert (=> b!1447071 m!1335923))

(assert (=> b!1447071 m!1335917))

(assert (=> b!1447071 m!1335921))

(assert (=> b!1447071 m!1335895))

(declare-fun m!1335931 () Bool)

(assert (=> b!1447066 m!1335931))

(assert (=> b!1447066 m!1335931))

(declare-fun m!1335933 () Bool)

(assert (=> b!1447066 m!1335933))

(assert (=> b!1447066 m!1335917))

(declare-fun m!1335935 () Bool)

(assert (=> b!1447066 m!1335935))

(assert (=> b!1447061 m!1335917))

(declare-fun m!1335937 () Bool)

(assert (=> b!1447061 m!1335937))

(assert (=> b!1447064 m!1335895))

(assert (=> b!1447064 m!1335895))

(declare-fun m!1335939 () Bool)

(assert (=> b!1447064 m!1335939))

(assert (=> b!1447076 m!1335895))

(assert (=> b!1447076 m!1335895))

(declare-fun m!1335941 () Bool)

(assert (=> b!1447076 m!1335941))

(declare-fun m!1335943 () Bool)

(assert (=> b!1447070 m!1335943))

(declare-fun m!1335945 () Bool)

(assert (=> b!1447075 m!1335945))

(declare-fun m!1335947 () Bool)

(assert (=> b!1447075 m!1335947))

(push 1)

