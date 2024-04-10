; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129066 () Bool)

(assert start!129066)

(declare-fun b!1514036 () Bool)

(declare-fun res!1033941 () Bool)

(declare-fun e!844968 () Bool)

(assert (=> b!1514036 (=> (not res!1033941) (not e!844968))))

(declare-datatypes ((array!100922 0))(
  ( (array!100923 (arr!48698 (Array (_ BitVec 32) (_ BitVec 64))) (size!49248 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100922)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100922 (_ BitVec 32)) Bool)

(assert (=> b!1514036 (= res!1033941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514037 () Bool)

(declare-fun e!844969 () Bool)

(declare-fun e!844970 () Bool)

(assert (=> b!1514037 (= e!844969 e!844970)))

(declare-fun res!1033945 () Bool)

(assert (=> b!1514037 (=> (not res!1033945) (not e!844970))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12869 0))(
  ( (MissingZero!12869 (index!53871 (_ BitVec 32))) (Found!12869 (index!53872 (_ BitVec 32))) (Intermediate!12869 (undefined!13681 Bool) (index!53873 (_ BitVec 32)) (x!135587 (_ BitVec 32))) (Undefined!12869) (MissingVacant!12869 (index!53874 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100922 (_ BitVec 32)) SeekEntryResult!12869)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100922 (_ BitVec 32)) SeekEntryResult!12869)

(assert (=> b!1514037 (= res!1033945 (= (seekEntryOrOpen!0 (select (arr!48698 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48698 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514038 () Bool)

(declare-fun res!1033950 () Bool)

(assert (=> b!1514038 (=> (not res!1033950) (not e!844968))))

(declare-datatypes ((List!35181 0))(
  ( (Nil!35178) (Cons!35177 (h!36589 (_ BitVec 64)) (t!49875 List!35181)) )
))
(declare-fun arrayNoDuplicates!0 (array!100922 (_ BitVec 32) List!35181) Bool)

(assert (=> b!1514038 (= res!1033950 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35178))))

(declare-fun b!1514039 () Bool)

(declare-fun res!1033946 () Bool)

(assert (=> b!1514039 (=> (not res!1033946) (not e!844968))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514039 (= res!1033946 (validKeyInArray!0 (select (arr!48698 a!2804) j!70)))))

(declare-fun b!1514040 () Bool)

(declare-fun res!1033939 () Bool)

(declare-fun e!844972 () Bool)

(assert (=> b!1514040 (=> (not res!1033939) (not e!844972))))

(declare-fun lt!656194 () SeekEntryResult!12869)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100922 (_ BitVec 32)) SeekEntryResult!12869)

(assert (=> b!1514040 (= res!1033939 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48698 a!2804) j!70) a!2804 mask!2512) lt!656194))))

(declare-fun b!1514041 () Bool)

(declare-fun res!1033951 () Bool)

(assert (=> b!1514041 (=> (not res!1033951) (not e!844968))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1514041 (= res!1033951 (and (= (size!49248 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49248 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49248 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514042 () Bool)

(assert (=> b!1514042 (= e!844968 e!844972)))

(declare-fun res!1033942 () Bool)

(assert (=> b!1514042 (=> (not res!1033942) (not e!844972))))

(declare-fun lt!656192 () SeekEntryResult!12869)

(assert (=> b!1514042 (= res!1033942 (= lt!656192 lt!656194))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1514042 (= lt!656194 (Intermediate!12869 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514042 (= lt!656192 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48698 a!2804) j!70) mask!2512) (select (arr!48698 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514043 () Bool)

(declare-fun res!1033949 () Bool)

(assert (=> b!1514043 (=> (not res!1033949) (not e!844968))))

(assert (=> b!1514043 (= res!1033949 (validKeyInArray!0 (select (arr!48698 a!2804) i!961)))))

(declare-fun b!1514044 () Bool)

(declare-fun e!844966 () Bool)

(assert (=> b!1514044 (= e!844966 (not true))))

(declare-fun e!844971 () Bool)

(assert (=> b!1514044 e!844971))

(declare-fun res!1033938 () Bool)

(assert (=> b!1514044 (=> (not res!1033938) (not e!844971))))

(assert (=> b!1514044 (= res!1033938 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50606 0))(
  ( (Unit!50607) )
))
(declare-fun lt!656193 () Unit!50606)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100922 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50606)

(assert (=> b!1514044 (= lt!656193 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514045 () Bool)

(assert (=> b!1514045 (= e!844971 e!844969)))

(declare-fun res!1033944 () Bool)

(assert (=> b!1514045 (=> res!1033944 e!844969)))

(declare-fun lt!656190 () (_ BitVec 64))

(assert (=> b!1514045 (= res!1033944 (or (not (= (select (arr!48698 a!2804) j!70) lt!656190)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48698 a!2804) index!487) (select (arr!48698 a!2804) j!70)) (not (= (select (arr!48698 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514046 () Bool)

(declare-fun res!1033943 () Bool)

(assert (=> b!1514046 (=> (not res!1033943) (not e!844971))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100922 (_ BitVec 32)) SeekEntryResult!12869)

(assert (=> b!1514046 (= res!1033943 (= (seekEntry!0 (select (arr!48698 a!2804) j!70) a!2804 mask!2512) (Found!12869 j!70)))))

(declare-fun b!1514047 () Bool)

(assert (=> b!1514047 (= e!844972 e!844966)))

(declare-fun res!1033940 () Bool)

(assert (=> b!1514047 (=> (not res!1033940) (not e!844966))))

(declare-fun lt!656191 () array!100922)

(assert (=> b!1514047 (= res!1033940 (= lt!656192 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656190 mask!2512) lt!656190 lt!656191 mask!2512)))))

(assert (=> b!1514047 (= lt!656190 (select (store (arr!48698 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514047 (= lt!656191 (array!100923 (store (arr!48698 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49248 a!2804)))))

(declare-fun b!1514048 () Bool)

(declare-fun res!1033947 () Bool)

(assert (=> b!1514048 (=> (not res!1033947) (not e!844968))))

(assert (=> b!1514048 (= res!1033947 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49248 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49248 a!2804))))))

(declare-fun res!1033948 () Bool)

(assert (=> start!129066 (=> (not res!1033948) (not e!844968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129066 (= res!1033948 (validMask!0 mask!2512))))

(assert (=> start!129066 e!844968))

(assert (=> start!129066 true))

(declare-fun array_inv!37726 (array!100922) Bool)

(assert (=> start!129066 (array_inv!37726 a!2804)))

(declare-fun b!1514035 () Bool)

(assert (=> b!1514035 (= e!844970 (= (seekEntryOrOpen!0 lt!656190 lt!656191 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656190 lt!656191 mask!2512)))))

(assert (= (and start!129066 res!1033948) b!1514041))

(assert (= (and b!1514041 res!1033951) b!1514043))

(assert (= (and b!1514043 res!1033949) b!1514039))

(assert (= (and b!1514039 res!1033946) b!1514036))

(assert (= (and b!1514036 res!1033941) b!1514038))

(assert (= (and b!1514038 res!1033950) b!1514048))

(assert (= (and b!1514048 res!1033947) b!1514042))

(assert (= (and b!1514042 res!1033942) b!1514040))

(assert (= (and b!1514040 res!1033939) b!1514047))

(assert (= (and b!1514047 res!1033940) b!1514044))

(assert (= (and b!1514044 res!1033938) b!1514046))

(assert (= (and b!1514046 res!1033943) b!1514045))

(assert (= (and b!1514045 (not res!1033944)) b!1514037))

(assert (= (and b!1514037 res!1033945) b!1514035))

(declare-fun m!1396951 () Bool)

(assert (=> b!1514037 m!1396951))

(assert (=> b!1514037 m!1396951))

(declare-fun m!1396953 () Bool)

(assert (=> b!1514037 m!1396953))

(assert (=> b!1514037 m!1396951))

(declare-fun m!1396955 () Bool)

(assert (=> b!1514037 m!1396955))

(declare-fun m!1396957 () Bool)

(assert (=> b!1514044 m!1396957))

(declare-fun m!1396959 () Bool)

(assert (=> b!1514044 m!1396959))

(assert (=> b!1514040 m!1396951))

(assert (=> b!1514040 m!1396951))

(declare-fun m!1396961 () Bool)

(assert (=> b!1514040 m!1396961))

(assert (=> b!1514039 m!1396951))

(assert (=> b!1514039 m!1396951))

(declare-fun m!1396963 () Bool)

(assert (=> b!1514039 m!1396963))

(assert (=> b!1514046 m!1396951))

(assert (=> b!1514046 m!1396951))

(declare-fun m!1396965 () Bool)

(assert (=> b!1514046 m!1396965))

(declare-fun m!1396967 () Bool)

(assert (=> start!129066 m!1396967))

(declare-fun m!1396969 () Bool)

(assert (=> start!129066 m!1396969))

(declare-fun m!1396971 () Bool)

(assert (=> b!1514047 m!1396971))

(assert (=> b!1514047 m!1396971))

(declare-fun m!1396973 () Bool)

(assert (=> b!1514047 m!1396973))

(declare-fun m!1396975 () Bool)

(assert (=> b!1514047 m!1396975))

(declare-fun m!1396977 () Bool)

(assert (=> b!1514047 m!1396977))

(declare-fun m!1396979 () Bool)

(assert (=> b!1514035 m!1396979))

(declare-fun m!1396981 () Bool)

(assert (=> b!1514035 m!1396981))

(assert (=> b!1514045 m!1396951))

(declare-fun m!1396983 () Bool)

(assert (=> b!1514045 m!1396983))

(declare-fun m!1396985 () Bool)

(assert (=> b!1514043 m!1396985))

(assert (=> b!1514043 m!1396985))

(declare-fun m!1396987 () Bool)

(assert (=> b!1514043 m!1396987))

(assert (=> b!1514042 m!1396951))

(assert (=> b!1514042 m!1396951))

(declare-fun m!1396989 () Bool)

(assert (=> b!1514042 m!1396989))

(assert (=> b!1514042 m!1396989))

(assert (=> b!1514042 m!1396951))

(declare-fun m!1396991 () Bool)

(assert (=> b!1514042 m!1396991))

(declare-fun m!1396993 () Bool)

(assert (=> b!1514036 m!1396993))

(declare-fun m!1396995 () Bool)

(assert (=> b!1514038 m!1396995))

(push 1)

