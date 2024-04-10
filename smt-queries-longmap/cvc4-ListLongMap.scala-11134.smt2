; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130104 () Bool)

(assert start!130104)

(declare-fun b!1527070 () Bool)

(declare-fun e!851149 () Bool)

(declare-fun e!851152 () Bool)

(assert (=> b!1527070 (= e!851149 e!851152)))

(declare-fun res!1045110 () Bool)

(assert (=> b!1527070 (=> (not res!1045110) (not e!851152))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101517 0))(
  ( (array!101518 (arr!48985 (Array (_ BitVec 32) (_ BitVec 64))) (size!49535 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101517)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13150 0))(
  ( (MissingZero!13150 (index!54995 (_ BitVec 32))) (Found!13150 (index!54996 (_ BitVec 32))) (Intermediate!13150 (undefined!13962 Bool) (index!54997 (_ BitVec 32)) (x!136684 (_ BitVec 32))) (Undefined!13150) (MissingVacant!13150 (index!54998 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101517 (_ BitVec 32)) SeekEntryResult!13150)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101517 (_ BitVec 32)) SeekEntryResult!13150)

(assert (=> b!1527070 (= res!1045110 (= (seekEntryOrOpen!0 (select (arr!48985 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48985 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1527071 () Bool)

(declare-fun e!851151 () Bool)

(assert (=> b!1527071 (= e!851151 (not true))))

(declare-fun e!851148 () Bool)

(assert (=> b!1527071 e!851148))

(declare-fun res!1045113 () Bool)

(assert (=> b!1527071 (=> (not res!1045113) (not e!851148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101517 (_ BitVec 32)) Bool)

(assert (=> b!1527071 (= res!1045113 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51084 0))(
  ( (Unit!51085) )
))
(declare-fun lt!661302 () Unit!51084)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101517 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51084)

(assert (=> b!1527071 (= lt!661302 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1527072 () Bool)

(declare-fun res!1045106 () Bool)

(assert (=> b!1527072 (=> (not res!1045106) (not e!851148))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101517 (_ BitVec 32)) SeekEntryResult!13150)

(assert (=> b!1527072 (= res!1045106 (= (seekEntry!0 (select (arr!48985 a!2804) j!70) a!2804 mask!2512) (Found!13150 j!70)))))

(declare-fun lt!661299 () (_ BitVec 64))

(declare-fun b!1527073 () Bool)

(declare-fun lt!661303 () array!101517)

(assert (=> b!1527073 (= e!851152 (= (seekEntryOrOpen!0 lt!661299 lt!661303 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661299 lt!661303 mask!2512)))))

(declare-fun b!1527074 () Bool)

(declare-fun e!851150 () Bool)

(assert (=> b!1527074 (= e!851150 e!851151)))

(declare-fun res!1045114 () Bool)

(assert (=> b!1527074 (=> (not res!1045114) (not e!851151))))

(declare-fun lt!661301 () SeekEntryResult!13150)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101517 (_ BitVec 32)) SeekEntryResult!13150)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527074 (= res!1045114 (= lt!661301 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661299 mask!2512) lt!661299 lt!661303 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1527074 (= lt!661299 (select (store (arr!48985 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1527074 (= lt!661303 (array!101518 (store (arr!48985 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49535 a!2804)))))

(declare-fun b!1527075 () Bool)

(declare-fun e!851146 () Bool)

(assert (=> b!1527075 (= e!851146 e!851150)))

(declare-fun res!1045107 () Bool)

(assert (=> b!1527075 (=> (not res!1045107) (not e!851150))))

(declare-fun lt!661300 () SeekEntryResult!13150)

(assert (=> b!1527075 (= res!1045107 (= lt!661301 lt!661300))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1527075 (= lt!661300 (Intermediate!13150 false resIndex!21 resX!21))))

(assert (=> b!1527075 (= lt!661301 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48985 a!2804) j!70) mask!2512) (select (arr!48985 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527076 () Bool)

(declare-fun res!1045112 () Bool)

(assert (=> b!1527076 (=> (not res!1045112) (not e!851146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1527076 (= res!1045112 (validKeyInArray!0 (select (arr!48985 a!2804) i!961)))))

(declare-fun b!1527078 () Bool)

(declare-fun res!1045105 () Bool)

(assert (=> b!1527078 (=> (not res!1045105) (not e!851146))))

(declare-datatypes ((List!35468 0))(
  ( (Nil!35465) (Cons!35464 (h!36897 (_ BitVec 64)) (t!50162 List!35468)) )
))
(declare-fun arrayNoDuplicates!0 (array!101517 (_ BitVec 32) List!35468) Bool)

(assert (=> b!1527078 (= res!1045105 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35465))))

(declare-fun b!1527079 () Bool)

(declare-fun res!1045104 () Bool)

(assert (=> b!1527079 (=> (not res!1045104) (not e!851146))))

(assert (=> b!1527079 (= res!1045104 (validKeyInArray!0 (select (arr!48985 a!2804) j!70)))))

(declare-fun b!1527080 () Bool)

(declare-fun res!1045116 () Bool)

(assert (=> b!1527080 (=> (not res!1045116) (not e!851150))))

(assert (=> b!1527080 (= res!1045116 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48985 a!2804) j!70) a!2804 mask!2512) lt!661300))))

(declare-fun b!1527081 () Bool)

(assert (=> b!1527081 (= e!851148 e!851149)))

(declare-fun res!1045117 () Bool)

(assert (=> b!1527081 (=> res!1045117 e!851149)))

(assert (=> b!1527081 (= res!1045117 (or (not (= (select (arr!48985 a!2804) j!70) lt!661299)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48985 a!2804) index!487) (select (arr!48985 a!2804) j!70)) (not (= (select (arr!48985 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1527082 () Bool)

(declare-fun res!1045115 () Bool)

(assert (=> b!1527082 (=> (not res!1045115) (not e!851146))))

(assert (=> b!1527082 (= res!1045115 (and (= (size!49535 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49535 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49535 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1527083 () Bool)

(declare-fun res!1045109 () Bool)

(assert (=> b!1527083 (=> (not res!1045109) (not e!851146))))

(assert (=> b!1527083 (= res!1045109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1527077 () Bool)

(declare-fun res!1045111 () Bool)

(assert (=> b!1527077 (=> (not res!1045111) (not e!851146))))

(assert (=> b!1527077 (= res!1045111 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49535 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49535 a!2804))))))

(declare-fun res!1045108 () Bool)

(assert (=> start!130104 (=> (not res!1045108) (not e!851146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130104 (= res!1045108 (validMask!0 mask!2512))))

(assert (=> start!130104 e!851146))

(assert (=> start!130104 true))

(declare-fun array_inv!38013 (array!101517) Bool)

(assert (=> start!130104 (array_inv!38013 a!2804)))

(assert (= (and start!130104 res!1045108) b!1527082))

(assert (= (and b!1527082 res!1045115) b!1527076))

(assert (= (and b!1527076 res!1045112) b!1527079))

(assert (= (and b!1527079 res!1045104) b!1527083))

(assert (= (and b!1527083 res!1045109) b!1527078))

(assert (= (and b!1527078 res!1045105) b!1527077))

(assert (= (and b!1527077 res!1045111) b!1527075))

(assert (= (and b!1527075 res!1045107) b!1527080))

(assert (= (and b!1527080 res!1045116) b!1527074))

(assert (= (and b!1527074 res!1045114) b!1527071))

(assert (= (and b!1527071 res!1045113) b!1527072))

(assert (= (and b!1527072 res!1045106) b!1527081))

(assert (= (and b!1527081 (not res!1045117)) b!1527070))

(assert (= (and b!1527070 res!1045110) b!1527073))

(declare-fun m!1409933 () Bool)

(assert (=> b!1527071 m!1409933))

(declare-fun m!1409935 () Bool)

(assert (=> b!1527071 m!1409935))

(declare-fun m!1409937 () Bool)

(assert (=> b!1527070 m!1409937))

(assert (=> b!1527070 m!1409937))

(declare-fun m!1409939 () Bool)

(assert (=> b!1527070 m!1409939))

(assert (=> b!1527070 m!1409937))

(declare-fun m!1409941 () Bool)

(assert (=> b!1527070 m!1409941))

(assert (=> b!1527079 m!1409937))

(assert (=> b!1527079 m!1409937))

(declare-fun m!1409943 () Bool)

(assert (=> b!1527079 m!1409943))

(declare-fun m!1409945 () Bool)

(assert (=> start!130104 m!1409945))

(declare-fun m!1409947 () Bool)

(assert (=> start!130104 m!1409947))

(assert (=> b!1527072 m!1409937))

(assert (=> b!1527072 m!1409937))

(declare-fun m!1409949 () Bool)

(assert (=> b!1527072 m!1409949))

(declare-fun m!1409951 () Bool)

(assert (=> b!1527074 m!1409951))

(assert (=> b!1527074 m!1409951))

(declare-fun m!1409953 () Bool)

(assert (=> b!1527074 m!1409953))

(declare-fun m!1409955 () Bool)

(assert (=> b!1527074 m!1409955))

(declare-fun m!1409957 () Bool)

(assert (=> b!1527074 m!1409957))

(declare-fun m!1409959 () Bool)

(assert (=> b!1527078 m!1409959))

(assert (=> b!1527080 m!1409937))

(assert (=> b!1527080 m!1409937))

(declare-fun m!1409961 () Bool)

(assert (=> b!1527080 m!1409961))

(assert (=> b!1527075 m!1409937))

(assert (=> b!1527075 m!1409937))

(declare-fun m!1409963 () Bool)

(assert (=> b!1527075 m!1409963))

(assert (=> b!1527075 m!1409963))

(assert (=> b!1527075 m!1409937))

(declare-fun m!1409965 () Bool)

(assert (=> b!1527075 m!1409965))

(declare-fun m!1409967 () Bool)

(assert (=> b!1527073 m!1409967))

(declare-fun m!1409969 () Bool)

(assert (=> b!1527073 m!1409969))

(declare-fun m!1409971 () Bool)

(assert (=> b!1527076 m!1409971))

(assert (=> b!1527076 m!1409971))

(declare-fun m!1409973 () Bool)

(assert (=> b!1527076 m!1409973))

(declare-fun m!1409975 () Bool)

(assert (=> b!1527083 m!1409975))

(assert (=> b!1527081 m!1409937))

(declare-fun m!1409977 () Bool)

(assert (=> b!1527081 m!1409977))

(push 1)

