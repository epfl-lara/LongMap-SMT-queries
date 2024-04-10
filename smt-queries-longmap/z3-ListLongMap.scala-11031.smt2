; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129020 () Bool)

(assert start!129020)

(declare-fun e!844485 () Bool)

(declare-fun lt!655845 () (_ BitVec 64))

(declare-fun b!1513069 () Bool)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((array!100876 0))(
  ( (array!100877 (arr!48675 (Array (_ BitVec 32) (_ BitVec 64))) (size!49225 (_ BitVec 32))) )
))
(declare-fun lt!655847 () array!100876)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12846 0))(
  ( (MissingZero!12846 (index!53779 (_ BitVec 32))) (Found!12846 (index!53780 (_ BitVec 32))) (Intermediate!12846 (undefined!13658 Bool) (index!53781 (_ BitVec 32)) (x!135500 (_ BitVec 32))) (Undefined!12846) (MissingVacant!12846 (index!53782 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100876 (_ BitVec 32)) SeekEntryResult!12846)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100876 (_ BitVec 32)) SeekEntryResult!12846)

(assert (=> b!1513069 (= e!844485 (= (seekEntryOrOpen!0 lt!655845 lt!655847 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!655845 lt!655847 mask!2512)))))

(declare-fun b!1513070 () Bool)

(declare-fun e!844486 () Bool)

(declare-fun e!844484 () Bool)

(assert (=> b!1513070 (= e!844486 e!844484)))

(declare-fun res!1032981 () Bool)

(assert (=> b!1513070 (=> res!1032981 e!844484)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun a!2804 () array!100876)

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1513070 (= res!1032981 (or (not (= (select (arr!48675 a!2804) j!70) lt!655845)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48675 a!2804) index!487) (select (arr!48675 a!2804) j!70)) (not (= (select (arr!48675 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1513071 () Bool)

(declare-fun res!1032985 () Bool)

(declare-fun e!844488 () Bool)

(assert (=> b!1513071 (=> (not res!1032985) (not e!844488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100876 (_ BitVec 32)) Bool)

(assert (=> b!1513071 (= res!1032985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513072 () Bool)

(assert (=> b!1513072 (= e!844484 e!844485)))

(declare-fun res!1032974 () Bool)

(assert (=> b!1513072 (=> (not res!1032974) (not e!844485))))

(assert (=> b!1513072 (= res!1032974 (= (seekEntryOrOpen!0 (select (arr!48675 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48675 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513073 () Bool)

(declare-fun res!1032982 () Bool)

(assert (=> b!1513073 (=> (not res!1032982) (not e!844488))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1513073 (= res!1032982 (and (= (size!49225 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49225 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49225 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513074 () Bool)

(declare-fun res!1032978 () Bool)

(assert (=> b!1513074 (=> (not res!1032978) (not e!844488))))

(assert (=> b!1513074 (= res!1032978 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49225 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49225 a!2804))))))

(declare-fun b!1513075 () Bool)

(declare-fun e!844489 () Bool)

(declare-fun e!844487 () Bool)

(assert (=> b!1513075 (= e!844489 e!844487)))

(declare-fun res!1032983 () Bool)

(assert (=> b!1513075 (=> (not res!1032983) (not e!844487))))

(declare-fun lt!655849 () SeekEntryResult!12846)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100876 (_ BitVec 32)) SeekEntryResult!12846)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513075 (= res!1032983 (= lt!655849 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655845 mask!2512) lt!655845 lt!655847 mask!2512)))))

(assert (=> b!1513075 (= lt!655845 (select (store (arr!48675 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513075 (= lt!655847 (array!100877 (store (arr!48675 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49225 a!2804)))))

(declare-fun b!1513077 () Bool)

(declare-fun res!1032975 () Bool)

(assert (=> b!1513077 (=> (not res!1032975) (not e!844489))))

(declare-fun lt!655846 () SeekEntryResult!12846)

(assert (=> b!1513077 (= res!1032975 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48675 a!2804) j!70) a!2804 mask!2512) lt!655846))))

(declare-fun b!1513078 () Bool)

(declare-fun res!1032973 () Bool)

(assert (=> b!1513078 (=> (not res!1032973) (not e!844486))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100876 (_ BitVec 32)) SeekEntryResult!12846)

(assert (=> b!1513078 (= res!1032973 (= (seekEntry!0 (select (arr!48675 a!2804) j!70) a!2804 mask!2512) (Found!12846 j!70)))))

(declare-fun b!1513079 () Bool)

(assert (=> b!1513079 (= e!844488 e!844489)))

(declare-fun res!1032980 () Bool)

(assert (=> b!1513079 (=> (not res!1032980) (not e!844489))))

(assert (=> b!1513079 (= res!1032980 (= lt!655849 lt!655846))))

(assert (=> b!1513079 (= lt!655846 (Intermediate!12846 false resIndex!21 resX!21))))

(assert (=> b!1513079 (= lt!655849 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48675 a!2804) j!70) mask!2512) (select (arr!48675 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513080 () Bool)

(declare-fun res!1032979 () Bool)

(assert (=> b!1513080 (=> (not res!1032979) (not e!844488))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513080 (= res!1032979 (validKeyInArray!0 (select (arr!48675 a!2804) j!70)))))

(declare-fun b!1513081 () Bool)

(declare-fun res!1032972 () Bool)

(assert (=> b!1513081 (=> (not res!1032972) (not e!844488))))

(declare-datatypes ((List!35158 0))(
  ( (Nil!35155) (Cons!35154 (h!36566 (_ BitVec 64)) (t!49852 List!35158)) )
))
(declare-fun arrayNoDuplicates!0 (array!100876 (_ BitVec 32) List!35158) Bool)

(assert (=> b!1513081 (= res!1032972 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35155))))

(declare-fun b!1513082 () Bool)

(assert (=> b!1513082 (= e!844487 (not true))))

(assert (=> b!1513082 e!844486))

(declare-fun res!1032984 () Bool)

(assert (=> b!1513082 (=> (not res!1032984) (not e!844486))))

(assert (=> b!1513082 (= res!1032984 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50560 0))(
  ( (Unit!50561) )
))
(declare-fun lt!655848 () Unit!50560)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100876 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50560)

(assert (=> b!1513082 (= lt!655848 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513076 () Bool)

(declare-fun res!1032976 () Bool)

(assert (=> b!1513076 (=> (not res!1032976) (not e!844488))))

(assert (=> b!1513076 (= res!1032976 (validKeyInArray!0 (select (arr!48675 a!2804) i!961)))))

(declare-fun res!1032977 () Bool)

(assert (=> start!129020 (=> (not res!1032977) (not e!844488))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129020 (= res!1032977 (validMask!0 mask!2512))))

(assert (=> start!129020 e!844488))

(assert (=> start!129020 true))

(declare-fun array_inv!37703 (array!100876) Bool)

(assert (=> start!129020 (array_inv!37703 a!2804)))

(assert (= (and start!129020 res!1032977) b!1513073))

(assert (= (and b!1513073 res!1032982) b!1513076))

(assert (= (and b!1513076 res!1032976) b!1513080))

(assert (= (and b!1513080 res!1032979) b!1513071))

(assert (= (and b!1513071 res!1032985) b!1513081))

(assert (= (and b!1513081 res!1032972) b!1513074))

(assert (= (and b!1513074 res!1032978) b!1513079))

(assert (= (and b!1513079 res!1032980) b!1513077))

(assert (= (and b!1513077 res!1032975) b!1513075))

(assert (= (and b!1513075 res!1032983) b!1513082))

(assert (= (and b!1513082 res!1032984) b!1513078))

(assert (= (and b!1513078 res!1032973) b!1513070))

(assert (= (and b!1513070 (not res!1032981)) b!1513072))

(assert (= (and b!1513072 res!1032974) b!1513069))

(declare-fun m!1395893 () Bool)

(assert (=> b!1513075 m!1395893))

(assert (=> b!1513075 m!1395893))

(declare-fun m!1395895 () Bool)

(assert (=> b!1513075 m!1395895))

(declare-fun m!1395897 () Bool)

(assert (=> b!1513075 m!1395897))

(declare-fun m!1395899 () Bool)

(assert (=> b!1513075 m!1395899))

(declare-fun m!1395901 () Bool)

(assert (=> b!1513071 m!1395901))

(declare-fun m!1395903 () Bool)

(assert (=> b!1513078 m!1395903))

(assert (=> b!1513078 m!1395903))

(declare-fun m!1395905 () Bool)

(assert (=> b!1513078 m!1395905))

(assert (=> b!1513072 m!1395903))

(assert (=> b!1513072 m!1395903))

(declare-fun m!1395907 () Bool)

(assert (=> b!1513072 m!1395907))

(assert (=> b!1513072 m!1395903))

(declare-fun m!1395909 () Bool)

(assert (=> b!1513072 m!1395909))

(assert (=> b!1513077 m!1395903))

(assert (=> b!1513077 m!1395903))

(declare-fun m!1395911 () Bool)

(assert (=> b!1513077 m!1395911))

(assert (=> b!1513080 m!1395903))

(assert (=> b!1513080 m!1395903))

(declare-fun m!1395913 () Bool)

(assert (=> b!1513080 m!1395913))

(declare-fun m!1395915 () Bool)

(assert (=> start!129020 m!1395915))

(declare-fun m!1395917 () Bool)

(assert (=> start!129020 m!1395917))

(declare-fun m!1395919 () Bool)

(assert (=> b!1513069 m!1395919))

(declare-fun m!1395921 () Bool)

(assert (=> b!1513069 m!1395921))

(assert (=> b!1513070 m!1395903))

(declare-fun m!1395923 () Bool)

(assert (=> b!1513070 m!1395923))

(declare-fun m!1395925 () Bool)

(assert (=> b!1513081 m!1395925))

(declare-fun m!1395927 () Bool)

(assert (=> b!1513082 m!1395927))

(declare-fun m!1395929 () Bool)

(assert (=> b!1513082 m!1395929))

(assert (=> b!1513079 m!1395903))

(assert (=> b!1513079 m!1395903))

(declare-fun m!1395931 () Bool)

(assert (=> b!1513079 m!1395931))

(assert (=> b!1513079 m!1395931))

(assert (=> b!1513079 m!1395903))

(declare-fun m!1395933 () Bool)

(assert (=> b!1513079 m!1395933))

(declare-fun m!1395935 () Bool)

(assert (=> b!1513076 m!1395935))

(assert (=> b!1513076 m!1395935))

(declare-fun m!1395937 () Bool)

(assert (=> b!1513076 m!1395937))

(check-sat (not b!1513072) (not b!1513075) (not b!1513081) (not b!1513080) (not b!1513077) (not b!1513069) (not b!1513076) (not b!1513078) (not b!1513071) (not b!1513079) (not start!129020) (not b!1513082))
(check-sat)
