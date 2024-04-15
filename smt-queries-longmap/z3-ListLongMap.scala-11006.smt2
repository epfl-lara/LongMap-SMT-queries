; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128816 () Bool)

(assert start!128816)

(declare-fun b!1509965 () Bool)

(declare-fun res!1030075 () Bool)

(declare-fun e!843193 () Bool)

(assert (=> b!1509965 (=> (not res!1030075) (not e!843193))))

(declare-datatypes ((array!100672 0))(
  ( (array!100673 (arr!48574 (Array (_ BitVec 32) (_ BitVec 64))) (size!49126 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100672)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100672 (_ BitVec 32)) Bool)

(assert (=> b!1509965 (= res!1030075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509966 () Bool)

(declare-fun res!1030077 () Bool)

(assert (=> b!1509966 (=> (not res!1030077) (not e!843193))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509966 (= res!1030077 (validKeyInArray!0 (select (arr!48574 a!2804) j!70)))))

(declare-fun b!1509967 () Bool)

(declare-fun res!1030085 () Bool)

(assert (=> b!1509967 (=> (not res!1030085) (not e!843193))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1509967 (= res!1030085 (validKeyInArray!0 (select (arr!48574 a!2804) i!961)))))

(declare-fun b!1509968 () Bool)

(declare-fun res!1030078 () Bool)

(assert (=> b!1509968 (=> (not res!1030078) (not e!843193))))

(declare-datatypes ((List!35135 0))(
  ( (Nil!35132) (Cons!35131 (h!36544 (_ BitVec 64)) (t!49821 List!35135)) )
))
(declare-fun arrayNoDuplicates!0 (array!100672 (_ BitVec 32) List!35135) Bool)

(assert (=> b!1509968 (= res!1030078 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35132))))

(declare-fun b!1509969 () Bool)

(declare-fun e!843194 () Bool)

(declare-fun e!843191 () Bool)

(assert (=> b!1509969 (= e!843194 (not e!843191))))

(declare-fun res!1030074 () Bool)

(assert (=> b!1509969 (=> res!1030074 e!843191)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1509969 (= res!1030074 (or (not (= (select (arr!48574 a!2804) j!70) (select (store (arr!48574 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (not (= (select (arr!48574 a!2804) index!487) (select (arr!48574 a!2804) j!70))) (not (= j!70 index!487)) (bvslt mask!2512 #b00000000000000000000000000000000)))))

(declare-fun e!843192 () Bool)

(assert (=> b!1509969 e!843192))

(declare-fun res!1030080 () Bool)

(assert (=> b!1509969 (=> (not res!1030080) (not e!843192))))

(assert (=> b!1509969 (= res!1030080 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50243 0))(
  ( (Unit!50244) )
))
(declare-fun lt!654840 () Unit!50243)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100672 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50243)

(assert (=> b!1509969 (= lt!654840 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1509970 () Bool)

(declare-fun res!1030083 () Bool)

(assert (=> b!1509970 (=> (not res!1030083) (not e!843194))))

(declare-datatypes ((SeekEntryResult!12768 0))(
  ( (MissingZero!12768 (index!53467 (_ BitVec 32))) (Found!12768 (index!53468 (_ BitVec 32))) (Intermediate!12768 (undefined!13580 Bool) (index!53469 (_ BitVec 32)) (x!135216 (_ BitVec 32))) (Undefined!12768) (MissingVacant!12768 (index!53470 (_ BitVec 32))) )
))
(declare-fun lt!654838 () SeekEntryResult!12768)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100672 (_ BitVec 32)) SeekEntryResult!12768)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509970 (= res!1030083 (= lt!654838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48574 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48574 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100673 (store (arr!48574 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49126 a!2804)) mask!2512)))))

(declare-fun b!1509971 () Bool)

(declare-fun res!1030079 () Bool)

(assert (=> b!1509971 (=> (not res!1030079) (not e!843193))))

(assert (=> b!1509971 (= res!1030079 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49126 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49126 a!2804))))))

(declare-fun b!1509972 () Bool)

(declare-fun res!1030082 () Bool)

(assert (=> b!1509972 (=> (not res!1030082) (not e!843194))))

(declare-fun lt!654839 () SeekEntryResult!12768)

(assert (=> b!1509972 (= res!1030082 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48574 a!2804) j!70) a!2804 mask!2512) lt!654839))))

(declare-fun b!1509973 () Bool)

(assert (=> b!1509973 (= e!843193 e!843194)))

(declare-fun res!1030081 () Bool)

(assert (=> b!1509973 (=> (not res!1030081) (not e!843194))))

(assert (=> b!1509973 (= res!1030081 (= lt!654838 lt!654839))))

(assert (=> b!1509973 (= lt!654839 (Intermediate!12768 false resIndex!21 resX!21))))

(assert (=> b!1509973 (= lt!654838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48574 a!2804) j!70) mask!2512) (select (arr!48574 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1030084 () Bool)

(assert (=> start!128816 (=> (not res!1030084) (not e!843193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128816 (= res!1030084 (validMask!0 mask!2512))))

(assert (=> start!128816 e!843193))

(assert (=> start!128816 true))

(declare-fun array_inv!37807 (array!100672) Bool)

(assert (=> start!128816 (array_inv!37807 a!2804)))

(declare-fun b!1509974 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100672 (_ BitVec 32)) SeekEntryResult!12768)

(assert (=> b!1509974 (= e!843192 (= (seekEntry!0 (select (arr!48574 a!2804) j!70) a!2804 mask!2512) (Found!12768 j!70)))))

(declare-fun b!1509975 () Bool)

(declare-fun res!1030076 () Bool)

(assert (=> b!1509975 (=> (not res!1030076) (not e!843193))))

(assert (=> b!1509975 (= res!1030076 (and (= (size!49126 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49126 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49126 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509976 () Bool)

(assert (=> b!1509976 (= e!843191 (validKeyInArray!0 (select (store (arr!48574 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (= (and start!128816 res!1030084) b!1509975))

(assert (= (and b!1509975 res!1030076) b!1509967))

(assert (= (and b!1509967 res!1030085) b!1509966))

(assert (= (and b!1509966 res!1030077) b!1509965))

(assert (= (and b!1509965 res!1030075) b!1509968))

(assert (= (and b!1509968 res!1030078) b!1509971))

(assert (= (and b!1509971 res!1030079) b!1509973))

(assert (= (and b!1509973 res!1030081) b!1509972))

(assert (= (and b!1509972 res!1030082) b!1509970))

(assert (= (and b!1509970 res!1030083) b!1509969))

(assert (= (and b!1509969 res!1030080) b!1509974))

(assert (= (and b!1509969 (not res!1030074)) b!1509976))

(declare-fun m!1391969 () Bool)

(assert (=> b!1509967 m!1391969))

(assert (=> b!1509967 m!1391969))

(declare-fun m!1391971 () Bool)

(assert (=> b!1509967 m!1391971))

(declare-fun m!1391973 () Bool)

(assert (=> b!1509969 m!1391973))

(declare-fun m!1391975 () Bool)

(assert (=> b!1509969 m!1391975))

(declare-fun m!1391977 () Bool)

(assert (=> b!1509969 m!1391977))

(declare-fun m!1391979 () Bool)

(assert (=> b!1509969 m!1391979))

(declare-fun m!1391981 () Bool)

(assert (=> b!1509969 m!1391981))

(declare-fun m!1391983 () Bool)

(assert (=> b!1509969 m!1391983))

(assert (=> b!1509970 m!1391977))

(assert (=> b!1509970 m!1391981))

(assert (=> b!1509970 m!1391981))

(declare-fun m!1391985 () Bool)

(assert (=> b!1509970 m!1391985))

(assert (=> b!1509970 m!1391985))

(assert (=> b!1509970 m!1391981))

(declare-fun m!1391987 () Bool)

(assert (=> b!1509970 m!1391987))

(declare-fun m!1391989 () Bool)

(assert (=> b!1509965 m!1391989))

(assert (=> b!1509972 m!1391973))

(assert (=> b!1509972 m!1391973))

(declare-fun m!1391991 () Bool)

(assert (=> b!1509972 m!1391991))

(assert (=> b!1509974 m!1391973))

(assert (=> b!1509974 m!1391973))

(declare-fun m!1391993 () Bool)

(assert (=> b!1509974 m!1391993))

(declare-fun m!1391995 () Bool)

(assert (=> b!1509968 m!1391995))

(assert (=> b!1509966 m!1391973))

(assert (=> b!1509966 m!1391973))

(declare-fun m!1391997 () Bool)

(assert (=> b!1509966 m!1391997))

(declare-fun m!1391999 () Bool)

(assert (=> start!128816 m!1391999))

(declare-fun m!1392001 () Bool)

(assert (=> start!128816 m!1392001))

(assert (=> b!1509976 m!1391977))

(assert (=> b!1509976 m!1391981))

(assert (=> b!1509976 m!1391981))

(declare-fun m!1392003 () Bool)

(assert (=> b!1509976 m!1392003))

(assert (=> b!1509973 m!1391973))

(assert (=> b!1509973 m!1391973))

(declare-fun m!1392005 () Bool)

(assert (=> b!1509973 m!1392005))

(assert (=> b!1509973 m!1392005))

(assert (=> b!1509973 m!1391973))

(declare-fun m!1392007 () Bool)

(assert (=> b!1509973 m!1392007))

(check-sat (not b!1509967) (not b!1509970) (not b!1509966) (not b!1509969) (not b!1509968) (not b!1509972) (not start!128816) (not b!1509965) (not b!1509976) (not b!1509973) (not b!1509974))
(check-sat)
