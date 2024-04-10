; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128856 () Bool)

(assert start!128856)

(declare-fun b!1510105 () Bool)

(declare-fun res!1030009 () Bool)

(declare-fun e!843333 () Bool)

(assert (=> b!1510105 (=> (not res!1030009) (not e!843333))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100712 0))(
  ( (array!100713 (arr!48593 (Array (_ BitVec 32) (_ BitVec 64))) (size!49143 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100712)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1510105 (= res!1030009 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49143 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49143 a!2804))))))

(declare-fun b!1510106 () Bool)

(declare-fun res!1030014 () Bool)

(assert (=> b!1510106 (=> (not res!1030014) (not e!843333))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510106 (= res!1030014 (validKeyInArray!0 (select (arr!48593 a!2804) j!70)))))

(declare-fun res!1030016 () Bool)

(assert (=> start!128856 (=> (not res!1030016) (not e!843333))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128856 (= res!1030016 (validMask!0 mask!2512))))

(assert (=> start!128856 e!843333))

(assert (=> start!128856 true))

(declare-fun array_inv!37621 (array!100712) Bool)

(assert (=> start!128856 (array_inv!37621 a!2804)))

(declare-fun b!1510107 () Bool)

(declare-fun res!1030013 () Bool)

(declare-fun e!843334 () Bool)

(assert (=> b!1510107 (=> (not res!1030013) (not e!843334))))

(declare-fun i!961 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12764 0))(
  ( (MissingZero!12764 (index!53451 (_ BitVec 32))) (Found!12764 (index!53452 (_ BitVec 32))) (Intermediate!12764 (undefined!13576 Bool) (index!53453 (_ BitVec 32)) (x!135202 (_ BitVec 32))) (Undefined!12764) (MissingVacant!12764 (index!53454 (_ BitVec 32))) )
))
(declare-fun lt!655079 () SeekEntryResult!12764)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100712 (_ BitVec 32)) SeekEntryResult!12764)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510107 (= res!1030013 (= lt!655079 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48593 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48593 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100713 (store (arr!48593 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49143 a!2804)) mask!2512)))))

(declare-fun b!1510108 () Bool)

(declare-fun res!1030012 () Bool)

(assert (=> b!1510108 (=> (not res!1030012) (not e!843334))))

(declare-fun lt!655080 () SeekEntryResult!12764)

(assert (=> b!1510108 (= res!1030012 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48593 a!2804) j!70) a!2804 mask!2512) lt!655080))))

(declare-fun b!1510109 () Bool)

(declare-fun res!1030017 () Bool)

(assert (=> b!1510109 (=> (not res!1030017) (not e!843333))))

(assert (=> b!1510109 (= res!1030017 (and (= (size!49143 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49143 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49143 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510110 () Bool)

(declare-fun res!1030010 () Bool)

(assert (=> b!1510110 (=> (not res!1030010) (not e!843333))))

(declare-datatypes ((List!35076 0))(
  ( (Nil!35073) (Cons!35072 (h!36484 (_ BitVec 64)) (t!49770 List!35076)) )
))
(declare-fun arrayNoDuplicates!0 (array!100712 (_ BitVec 32) List!35076) Bool)

(assert (=> b!1510110 (= res!1030010 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35073))))

(declare-fun b!1510111 () Bool)

(declare-fun res!1030018 () Bool)

(assert (=> b!1510111 (=> (not res!1030018) (not e!843333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100712 (_ BitVec 32)) Bool)

(assert (=> b!1510111 (= res!1030018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510112 () Bool)

(assert (=> b!1510112 (= e!843333 e!843334)))

(declare-fun res!1030008 () Bool)

(assert (=> b!1510112 (=> (not res!1030008) (not e!843334))))

(assert (=> b!1510112 (= res!1030008 (= lt!655079 lt!655080))))

(assert (=> b!1510112 (= lt!655080 (Intermediate!12764 false resIndex!21 resX!21))))

(assert (=> b!1510112 (= lt!655079 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48593 a!2804) j!70) mask!2512) (select (arr!48593 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510113 () Bool)

(assert (=> b!1510113 (= e!843334 (not (or (not (= (select (arr!48593 a!2804) j!70) (select (store (arr!48593 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (not (= (select (arr!48593 a!2804) index!487) (select (arr!48593 a!2804) j!70))) (not (= j!70 index!487)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(declare-fun e!843332 () Bool)

(assert (=> b!1510113 e!843332))

(declare-fun res!1030015 () Bool)

(assert (=> b!1510113 (=> (not res!1030015) (not e!843332))))

(assert (=> b!1510113 (= res!1030015 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50396 0))(
  ( (Unit!50397) )
))
(declare-fun lt!655081 () Unit!50396)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100712 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50396)

(assert (=> b!1510113 (= lt!655081 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510114 () Bool)

(declare-fun res!1030011 () Bool)

(assert (=> b!1510114 (=> (not res!1030011) (not e!843333))))

(assert (=> b!1510114 (= res!1030011 (validKeyInArray!0 (select (arr!48593 a!2804) i!961)))))

(declare-fun b!1510115 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100712 (_ BitVec 32)) SeekEntryResult!12764)

(assert (=> b!1510115 (= e!843332 (= (seekEntry!0 (select (arr!48593 a!2804) j!70) a!2804 mask!2512) (Found!12764 j!70)))))

(assert (= (and start!128856 res!1030016) b!1510109))

(assert (= (and b!1510109 res!1030017) b!1510114))

(assert (= (and b!1510114 res!1030011) b!1510106))

(assert (= (and b!1510106 res!1030014) b!1510111))

(assert (= (and b!1510111 res!1030018) b!1510110))

(assert (= (and b!1510110 res!1030010) b!1510105))

(assert (= (and b!1510105 res!1030009) b!1510112))

(assert (= (and b!1510112 res!1030008) b!1510108))

(assert (= (and b!1510108 res!1030012) b!1510107))

(assert (= (and b!1510107 res!1030013) b!1510113))

(assert (= (and b!1510113 res!1030015) b!1510115))

(declare-fun m!1392655 () Bool)

(assert (=> b!1510113 m!1392655))

(declare-fun m!1392657 () Bool)

(assert (=> b!1510113 m!1392657))

(declare-fun m!1392659 () Bool)

(assert (=> b!1510113 m!1392659))

(declare-fun m!1392661 () Bool)

(assert (=> b!1510113 m!1392661))

(declare-fun m!1392663 () Bool)

(assert (=> b!1510113 m!1392663))

(declare-fun m!1392665 () Bool)

(assert (=> b!1510113 m!1392665))

(declare-fun m!1392667 () Bool)

(assert (=> b!1510111 m!1392667))

(declare-fun m!1392669 () Bool)

(assert (=> b!1510110 m!1392669))

(declare-fun m!1392671 () Bool)

(assert (=> start!128856 m!1392671))

(declare-fun m!1392673 () Bool)

(assert (=> start!128856 m!1392673))

(assert (=> b!1510112 m!1392655))

(assert (=> b!1510112 m!1392655))

(declare-fun m!1392675 () Bool)

(assert (=> b!1510112 m!1392675))

(assert (=> b!1510112 m!1392675))

(assert (=> b!1510112 m!1392655))

(declare-fun m!1392677 () Bool)

(assert (=> b!1510112 m!1392677))

(assert (=> b!1510106 m!1392655))

(assert (=> b!1510106 m!1392655))

(declare-fun m!1392679 () Bool)

(assert (=> b!1510106 m!1392679))

(assert (=> b!1510108 m!1392655))

(assert (=> b!1510108 m!1392655))

(declare-fun m!1392681 () Bool)

(assert (=> b!1510108 m!1392681))

(assert (=> b!1510115 m!1392655))

(assert (=> b!1510115 m!1392655))

(declare-fun m!1392683 () Bool)

(assert (=> b!1510115 m!1392683))

(assert (=> b!1510107 m!1392659))

(assert (=> b!1510107 m!1392663))

(assert (=> b!1510107 m!1392663))

(declare-fun m!1392685 () Bool)

(assert (=> b!1510107 m!1392685))

(assert (=> b!1510107 m!1392685))

(assert (=> b!1510107 m!1392663))

(declare-fun m!1392687 () Bool)

(assert (=> b!1510107 m!1392687))

(declare-fun m!1392689 () Bool)

(assert (=> b!1510114 m!1392689))

(assert (=> b!1510114 m!1392689))

(declare-fun m!1392691 () Bool)

(assert (=> b!1510114 m!1392691))

(push 1)

