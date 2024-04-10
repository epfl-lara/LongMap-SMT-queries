; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129274 () Bool)

(assert start!129274)

(declare-fun b!1518098 () Bool)

(declare-fun res!1038013 () Bool)

(declare-fun e!846918 () Bool)

(assert (=> b!1518098 (=> (not res!1038013) (not e!846918))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12973 0))(
  ( (MissingZero!12973 (index!54287 (_ BitVec 32))) (Found!12973 (index!54288 (_ BitVec 32))) (Intermediate!12973 (undefined!13785 Bool) (index!54289 (_ BitVec 32)) (x!135963 (_ BitVec 32))) (Undefined!12973) (MissingVacant!12973 (index!54290 (_ BitVec 32))) )
))
(declare-fun lt!658041 () SeekEntryResult!12973)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101130 0))(
  ( (array!101131 (arr!48802 (Array (_ BitVec 32) (_ BitVec 64))) (size!49352 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101130)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101130 (_ BitVec 32)) SeekEntryResult!12973)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518098 (= res!1038013 (= lt!658041 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48802 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48802 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101131 (store (arr!48802 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49352 a!2804)) mask!2512)))))

(declare-fun b!1518100 () Bool)

(declare-fun e!846922 () Bool)

(assert (=> b!1518100 (= e!846918 (not e!846922))))

(declare-fun res!1038008 () Bool)

(assert (=> b!1518100 (=> res!1038008 e!846922)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1518100 (= res!1038008 (or (not (= (select (arr!48802 a!2804) j!70) (select (store (arr!48802 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846917 () Bool)

(assert (=> b!1518100 e!846917))

(declare-fun res!1038002 () Bool)

(assert (=> b!1518100 (=> (not res!1038002) (not e!846917))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101130 (_ BitVec 32)) Bool)

(assert (=> b!1518100 (= res!1038002 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50814 0))(
  ( (Unit!50815) )
))
(declare-fun lt!658038 () Unit!50814)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101130 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50814)

(assert (=> b!1518100 (= lt!658038 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518101 () Bool)

(declare-fun res!1038006 () Bool)

(assert (=> b!1518101 (=> (not res!1038006) (not e!846918))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!658042 () SeekEntryResult!12973)

(assert (=> b!1518101 (= res!1038006 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48802 a!2804) j!70) a!2804 mask!2512) lt!658042))))

(declare-fun b!1518102 () Bool)

(declare-fun res!1038001 () Bool)

(declare-fun e!846920 () Bool)

(assert (=> b!1518102 (=> (not res!1038001) (not e!846920))))

(assert (=> b!1518102 (= res!1038001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518103 () Bool)

(declare-fun res!1038003 () Bool)

(assert (=> b!1518103 (=> (not res!1038003) (not e!846920))))

(assert (=> b!1518103 (= res!1038003 (and (= (size!49352 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49352 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49352 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518104 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101130 (_ BitVec 32)) SeekEntryResult!12973)

(assert (=> b!1518104 (= e!846917 (= (seekEntry!0 (select (arr!48802 a!2804) j!70) a!2804 mask!2512) (Found!12973 j!70)))))

(declare-fun b!1518105 () Bool)

(declare-fun res!1038004 () Bool)

(assert (=> b!1518105 (=> (not res!1038004) (not e!846920))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518105 (= res!1038004 (validKeyInArray!0 (select (arr!48802 a!2804) j!70)))))

(declare-fun b!1518106 () Bool)

(declare-fun e!846921 () Bool)

(assert (=> b!1518106 (= e!846922 e!846921)))

(declare-fun res!1038012 () Bool)

(assert (=> b!1518106 (=> res!1038012 e!846921)))

(declare-fun lt!658040 () (_ BitVec 32))

(assert (=> b!1518106 (= res!1038012 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658040 #b00000000000000000000000000000000) (bvsge lt!658040 (size!49352 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518106 (= lt!658040 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518107 () Bool)

(declare-fun res!1038010 () Bool)

(assert (=> b!1518107 (=> (not res!1038010) (not e!846920))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1518107 (= res!1038010 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49352 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49352 a!2804))))))

(declare-fun b!1518108 () Bool)

(assert (=> b!1518108 (= e!846920 e!846918)))

(declare-fun res!1038007 () Bool)

(assert (=> b!1518108 (=> (not res!1038007) (not e!846918))))

(assert (=> b!1518108 (= res!1038007 (= lt!658041 lt!658042))))

(assert (=> b!1518108 (= lt!658042 (Intermediate!12973 false resIndex!21 resX!21))))

(assert (=> b!1518108 (= lt!658041 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48802 a!2804) j!70) mask!2512) (select (arr!48802 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518099 () Bool)

(declare-fun res!1038011 () Bool)

(assert (=> b!1518099 (=> (not res!1038011) (not e!846920))))

(declare-datatypes ((List!35285 0))(
  ( (Nil!35282) (Cons!35281 (h!36693 (_ BitVec 64)) (t!49979 List!35285)) )
))
(declare-fun arrayNoDuplicates!0 (array!101130 (_ BitVec 32) List!35285) Bool)

(assert (=> b!1518099 (= res!1038011 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35282))))

(declare-fun res!1038005 () Bool)

(assert (=> start!129274 (=> (not res!1038005) (not e!846920))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129274 (= res!1038005 (validMask!0 mask!2512))))

(assert (=> start!129274 e!846920))

(assert (=> start!129274 true))

(declare-fun array_inv!37830 (array!101130) Bool)

(assert (=> start!129274 (array_inv!37830 a!2804)))

(declare-fun b!1518109 () Bool)

(declare-fun res!1038009 () Bool)

(assert (=> b!1518109 (=> (not res!1038009) (not e!846920))))

(assert (=> b!1518109 (= res!1038009 (validKeyInArray!0 (select (arr!48802 a!2804) i!961)))))

(declare-fun b!1518110 () Bool)

(assert (=> b!1518110 (= e!846921 true)))

(declare-fun lt!658039 () SeekEntryResult!12973)

(assert (=> b!1518110 (= lt!658039 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658040 (select (arr!48802 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129274 res!1038005) b!1518103))

(assert (= (and b!1518103 res!1038003) b!1518109))

(assert (= (and b!1518109 res!1038009) b!1518105))

(assert (= (and b!1518105 res!1038004) b!1518102))

(assert (= (and b!1518102 res!1038001) b!1518099))

(assert (= (and b!1518099 res!1038011) b!1518107))

(assert (= (and b!1518107 res!1038010) b!1518108))

(assert (= (and b!1518108 res!1038007) b!1518101))

(assert (= (and b!1518101 res!1038006) b!1518098))

(assert (= (and b!1518098 res!1038013) b!1518100))

(assert (= (and b!1518100 res!1038002) b!1518104))

(assert (= (and b!1518100 (not res!1038008)) b!1518106))

(assert (= (and b!1518106 (not res!1038012)) b!1518110))

(declare-fun m!1401405 () Bool)

(assert (=> b!1518098 m!1401405))

(declare-fun m!1401407 () Bool)

(assert (=> b!1518098 m!1401407))

(assert (=> b!1518098 m!1401407))

(declare-fun m!1401409 () Bool)

(assert (=> b!1518098 m!1401409))

(assert (=> b!1518098 m!1401409))

(assert (=> b!1518098 m!1401407))

(declare-fun m!1401411 () Bool)

(assert (=> b!1518098 m!1401411))

(declare-fun m!1401413 () Bool)

(assert (=> b!1518100 m!1401413))

(declare-fun m!1401415 () Bool)

(assert (=> b!1518100 m!1401415))

(assert (=> b!1518100 m!1401405))

(assert (=> b!1518100 m!1401407))

(declare-fun m!1401417 () Bool)

(assert (=> b!1518100 m!1401417))

(declare-fun m!1401419 () Bool)

(assert (=> b!1518109 m!1401419))

(assert (=> b!1518109 m!1401419))

(declare-fun m!1401421 () Bool)

(assert (=> b!1518109 m!1401421))

(declare-fun m!1401423 () Bool)

(assert (=> b!1518099 m!1401423))

(assert (=> b!1518104 m!1401413))

(assert (=> b!1518104 m!1401413))

(declare-fun m!1401425 () Bool)

(assert (=> b!1518104 m!1401425))

(assert (=> b!1518110 m!1401413))

(assert (=> b!1518110 m!1401413))

(declare-fun m!1401427 () Bool)

(assert (=> b!1518110 m!1401427))

(assert (=> b!1518101 m!1401413))

(assert (=> b!1518101 m!1401413))

(declare-fun m!1401429 () Bool)

(assert (=> b!1518101 m!1401429))

(declare-fun m!1401431 () Bool)

(assert (=> b!1518102 m!1401431))

(assert (=> b!1518105 m!1401413))

(assert (=> b!1518105 m!1401413))

(declare-fun m!1401433 () Bool)

(assert (=> b!1518105 m!1401433))

(declare-fun m!1401435 () Bool)

(assert (=> b!1518106 m!1401435))

(declare-fun m!1401437 () Bool)

(assert (=> start!129274 m!1401437))

(declare-fun m!1401439 () Bool)

(assert (=> start!129274 m!1401439))

(assert (=> b!1518108 m!1401413))

(assert (=> b!1518108 m!1401413))

(declare-fun m!1401441 () Bool)

(assert (=> b!1518108 m!1401441))

(assert (=> b!1518108 m!1401441))

(assert (=> b!1518108 m!1401413))

(declare-fun m!1401443 () Bool)

(assert (=> b!1518108 m!1401443))

(push 1)

