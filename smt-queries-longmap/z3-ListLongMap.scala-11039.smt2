; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129068 () Bool)

(assert start!129068)

(declare-fun b!1514077 () Bool)

(declare-fun e!844988 () Bool)

(assert (=> b!1514077 (= e!844988 (not true))))

(declare-fun e!844987 () Bool)

(assert (=> b!1514077 e!844987))

(declare-fun res!1033993 () Bool)

(assert (=> b!1514077 (=> (not res!1033993) (not e!844987))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100924 0))(
  ( (array!100925 (arr!48699 (Array (_ BitVec 32) (_ BitVec 64))) (size!49249 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100924)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100924 (_ BitVec 32)) Bool)

(assert (=> b!1514077 (= res!1033993 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50608 0))(
  ( (Unit!50609) )
))
(declare-fun lt!656206 () Unit!50608)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50608)

(assert (=> b!1514077 (= lt!656206 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1514078 () Bool)

(declare-fun e!844990 () Bool)

(assert (=> b!1514078 (= e!844987 e!844990)))

(declare-fun res!1033988 () Bool)

(assert (=> b!1514078 (=> res!1033988 e!844990)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!656205 () (_ BitVec 64))

(assert (=> b!1514078 (= res!1033988 (or (not (= (select (arr!48699 a!2804) j!70) lt!656205)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48699 a!2804) index!487) (select (arr!48699 a!2804) j!70)) (not (= (select (arr!48699 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1514079 () Bool)

(declare-fun res!1033983 () Bool)

(declare-fun e!844991 () Bool)

(assert (=> b!1514079 (=> (not res!1033983) (not e!844991))))

(declare-datatypes ((SeekEntryResult!12870 0))(
  ( (MissingZero!12870 (index!53875 (_ BitVec 32))) (Found!12870 (index!53876 (_ BitVec 32))) (Intermediate!12870 (undefined!13682 Bool) (index!53877 (_ BitVec 32)) (x!135588 (_ BitVec 32))) (Undefined!12870) (MissingVacant!12870 (index!53878 (_ BitVec 32))) )
))
(declare-fun lt!656207 () SeekEntryResult!12870)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100924 (_ BitVec 32)) SeekEntryResult!12870)

(assert (=> b!1514079 (= res!1033983 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48699 a!2804) j!70) a!2804 mask!2512) lt!656207))))

(declare-fun b!1514080 () Bool)

(declare-fun res!1033986 () Bool)

(assert (=> b!1514080 (=> (not res!1033986) (not e!844987))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100924 (_ BitVec 32)) SeekEntryResult!12870)

(assert (=> b!1514080 (= res!1033986 (= (seekEntry!0 (select (arr!48699 a!2804) j!70) a!2804 mask!2512) (Found!12870 j!70)))))

(declare-fun b!1514081 () Bool)

(declare-fun res!1033991 () Bool)

(declare-fun e!844989 () Bool)

(assert (=> b!1514081 (=> (not res!1033991) (not e!844989))))

(assert (=> b!1514081 (= res!1033991 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49249 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49249 a!2804))))))

(declare-fun b!1514082 () Bool)

(assert (=> b!1514082 (= e!844991 e!844988)))

(declare-fun res!1033992 () Bool)

(assert (=> b!1514082 (=> (not res!1033992) (not e!844988))))

(declare-fun lt!656208 () array!100924)

(declare-fun lt!656209 () SeekEntryResult!12870)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1514082 (= res!1033992 (= lt!656209 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656205 mask!2512) lt!656205 lt!656208 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1514082 (= lt!656205 (select (store (arr!48699 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1514082 (= lt!656208 (array!100925 (store (arr!48699 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49249 a!2804)))))

(declare-fun b!1514083 () Bool)

(declare-fun res!1033980 () Bool)

(assert (=> b!1514083 (=> (not res!1033980) (not e!844989))))

(assert (=> b!1514083 (= res!1033980 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1514084 () Bool)

(declare-fun res!1033989 () Bool)

(assert (=> b!1514084 (=> (not res!1033989) (not e!844989))))

(assert (=> b!1514084 (= res!1033989 (and (= (size!49249 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49249 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49249 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1514085 () Bool)

(assert (=> b!1514085 (= e!844989 e!844991)))

(declare-fun res!1033984 () Bool)

(assert (=> b!1514085 (=> (not res!1033984) (not e!844991))))

(assert (=> b!1514085 (= res!1033984 (= lt!656209 lt!656207))))

(assert (=> b!1514085 (= lt!656207 (Intermediate!12870 false resIndex!21 resX!21))))

(assert (=> b!1514085 (= lt!656209 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48699 a!2804) j!70) mask!2512) (select (arr!48699 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1514086 () Bool)

(declare-fun e!844993 () Bool)

(assert (=> b!1514086 (= e!844990 e!844993)))

(declare-fun res!1033981 () Bool)

(assert (=> b!1514086 (=> (not res!1033981) (not e!844993))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100924 (_ BitVec 32)) SeekEntryResult!12870)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100924 (_ BitVec 32)) SeekEntryResult!12870)

(assert (=> b!1514086 (= res!1033981 (= (seekEntryOrOpen!0 (select (arr!48699 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48699 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1514087 () Bool)

(assert (=> b!1514087 (= e!844993 (= (seekEntryOrOpen!0 lt!656205 lt!656208 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656205 lt!656208 mask!2512)))))

(declare-fun b!1514088 () Bool)

(declare-fun res!1033982 () Bool)

(assert (=> b!1514088 (=> (not res!1033982) (not e!844989))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1514088 (= res!1033982 (validKeyInArray!0 (select (arr!48699 a!2804) i!961)))))

(declare-fun b!1514089 () Bool)

(declare-fun res!1033985 () Bool)

(assert (=> b!1514089 (=> (not res!1033985) (not e!844989))))

(declare-datatypes ((List!35182 0))(
  ( (Nil!35179) (Cons!35178 (h!36590 (_ BitVec 64)) (t!49876 List!35182)) )
))
(declare-fun arrayNoDuplicates!0 (array!100924 (_ BitVec 32) List!35182) Bool)

(assert (=> b!1514089 (= res!1033985 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35179))))

(declare-fun b!1514090 () Bool)

(declare-fun res!1033987 () Bool)

(assert (=> b!1514090 (=> (not res!1033987) (not e!844989))))

(assert (=> b!1514090 (= res!1033987 (validKeyInArray!0 (select (arr!48699 a!2804) j!70)))))

(declare-fun res!1033990 () Bool)

(assert (=> start!129068 (=> (not res!1033990) (not e!844989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129068 (= res!1033990 (validMask!0 mask!2512))))

(assert (=> start!129068 e!844989))

(assert (=> start!129068 true))

(declare-fun array_inv!37727 (array!100924) Bool)

(assert (=> start!129068 (array_inv!37727 a!2804)))

(assert (= (and start!129068 res!1033990) b!1514084))

(assert (= (and b!1514084 res!1033989) b!1514088))

(assert (= (and b!1514088 res!1033982) b!1514090))

(assert (= (and b!1514090 res!1033987) b!1514083))

(assert (= (and b!1514083 res!1033980) b!1514089))

(assert (= (and b!1514089 res!1033985) b!1514081))

(assert (= (and b!1514081 res!1033991) b!1514085))

(assert (= (and b!1514085 res!1033984) b!1514079))

(assert (= (and b!1514079 res!1033983) b!1514082))

(assert (= (and b!1514082 res!1033992) b!1514077))

(assert (= (and b!1514077 res!1033993) b!1514080))

(assert (= (and b!1514080 res!1033986) b!1514078))

(assert (= (and b!1514078 (not res!1033988)) b!1514086))

(assert (= (and b!1514086 res!1033981) b!1514087))

(declare-fun m!1396997 () Bool)

(assert (=> b!1514087 m!1396997))

(declare-fun m!1396999 () Bool)

(assert (=> b!1514087 m!1396999))

(declare-fun m!1397001 () Bool)

(assert (=> b!1514083 m!1397001))

(declare-fun m!1397003 () Bool)

(assert (=> b!1514085 m!1397003))

(assert (=> b!1514085 m!1397003))

(declare-fun m!1397005 () Bool)

(assert (=> b!1514085 m!1397005))

(assert (=> b!1514085 m!1397005))

(assert (=> b!1514085 m!1397003))

(declare-fun m!1397007 () Bool)

(assert (=> b!1514085 m!1397007))

(assert (=> b!1514080 m!1397003))

(assert (=> b!1514080 m!1397003))

(declare-fun m!1397009 () Bool)

(assert (=> b!1514080 m!1397009))

(declare-fun m!1397011 () Bool)

(assert (=> b!1514077 m!1397011))

(declare-fun m!1397013 () Bool)

(assert (=> b!1514077 m!1397013))

(assert (=> b!1514086 m!1397003))

(assert (=> b!1514086 m!1397003))

(declare-fun m!1397015 () Bool)

(assert (=> b!1514086 m!1397015))

(assert (=> b!1514086 m!1397003))

(declare-fun m!1397017 () Bool)

(assert (=> b!1514086 m!1397017))

(declare-fun m!1397019 () Bool)

(assert (=> b!1514089 m!1397019))

(assert (=> b!1514079 m!1397003))

(assert (=> b!1514079 m!1397003))

(declare-fun m!1397021 () Bool)

(assert (=> b!1514079 m!1397021))

(assert (=> b!1514078 m!1397003))

(declare-fun m!1397023 () Bool)

(assert (=> b!1514078 m!1397023))

(assert (=> b!1514090 m!1397003))

(assert (=> b!1514090 m!1397003))

(declare-fun m!1397025 () Bool)

(assert (=> b!1514090 m!1397025))

(declare-fun m!1397027 () Bool)

(assert (=> b!1514082 m!1397027))

(assert (=> b!1514082 m!1397027))

(declare-fun m!1397029 () Bool)

(assert (=> b!1514082 m!1397029))

(declare-fun m!1397031 () Bool)

(assert (=> b!1514082 m!1397031))

(declare-fun m!1397033 () Bool)

(assert (=> b!1514082 m!1397033))

(declare-fun m!1397035 () Bool)

(assert (=> start!129068 m!1397035))

(declare-fun m!1397037 () Bool)

(assert (=> start!129068 m!1397037))

(declare-fun m!1397039 () Bool)

(assert (=> b!1514088 m!1397039))

(assert (=> b!1514088 m!1397039))

(declare-fun m!1397041 () Bool)

(assert (=> b!1514088 m!1397041))

(check-sat (not b!1514083) (not b!1514077) (not b!1514087) (not start!129068) (not b!1514085) (not b!1514090) (not b!1514080) (not b!1514079) (not b!1514088) (not b!1514082) (not b!1514089) (not b!1514086))
(check-sat)
