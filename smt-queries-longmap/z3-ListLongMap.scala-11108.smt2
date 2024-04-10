; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129754 () Bool)

(assert start!129754)

(declare-fun b!1522918 () Bool)

(declare-fun res!1041826 () Bool)

(declare-fun e!849151 () Bool)

(assert (=> b!1522918 (=> (not res!1041826) (not e!849151))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101350 0))(
  ( (array!101351 (arr!48906 (Array (_ BitVec 32) (_ BitVec 64))) (size!49456 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101350)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13071 0))(
  ( (MissingZero!13071 (index!54679 (_ BitVec 32))) (Found!13071 (index!54680 (_ BitVec 32))) (Intermediate!13071 (undefined!13883 Bool) (index!54681 (_ BitVec 32)) (x!136373 (_ BitVec 32))) (Undefined!13071) (MissingVacant!13071 (index!54682 (_ BitVec 32))) )
))
(declare-fun lt!659811 () SeekEntryResult!13071)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101350 (_ BitVec 32)) SeekEntryResult!13071)

(assert (=> b!1522918 (= res!1041826 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48906 a!2804) j!70) a!2804 mask!2512) lt!659811))))

(declare-fun b!1522919 () Bool)

(declare-fun res!1041835 () Bool)

(assert (=> b!1522919 (=> (not res!1041835) (not e!849151))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lt!659812 () SeekEntryResult!13071)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522919 (= res!1041835 (= lt!659812 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48906 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48906 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101351 (store (arr!48906 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49456 a!2804)) mask!2512)))))

(declare-fun b!1522920 () Bool)

(declare-fun res!1041830 () Bool)

(declare-fun e!849149 () Bool)

(assert (=> b!1522920 (=> (not res!1041830) (not e!849149))))

(declare-datatypes ((List!35389 0))(
  ( (Nil!35386) (Cons!35385 (h!36809 (_ BitVec 64)) (t!50083 List!35389)) )
))
(declare-fun arrayNoDuplicates!0 (array!101350 (_ BitVec 32) List!35389) Bool)

(assert (=> b!1522920 (= res!1041830 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35386))))

(declare-fun b!1522921 () Bool)

(assert (=> b!1522921 (= e!849149 e!849151)))

(declare-fun res!1041832 () Bool)

(assert (=> b!1522921 (=> (not res!1041832) (not e!849151))))

(assert (=> b!1522921 (= res!1041832 (= lt!659812 lt!659811))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1522921 (= lt!659811 (Intermediate!13071 false resIndex!21 resX!21))))

(assert (=> b!1522921 (= lt!659812 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48906 a!2804) j!70) mask!2512) (select (arr!48906 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522922 () Bool)

(declare-fun e!849148 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101350 (_ BitVec 32)) SeekEntryResult!13071)

(assert (=> b!1522922 (= e!849148 (= (seekEntry!0 (select (arr!48906 a!2804) j!70) a!2804 mask!2512) (Found!13071 j!70)))))

(declare-fun b!1522923 () Bool)

(assert (=> b!1522923 (= e!849151 (not true))))

(assert (=> b!1522923 e!849148))

(declare-fun res!1041827 () Bool)

(assert (=> b!1522923 (=> (not res!1041827) (not e!849148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101350 (_ BitVec 32)) Bool)

(assert (=> b!1522923 (= res!1041827 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50926 0))(
  ( (Unit!50927) )
))
(declare-fun lt!659810 () Unit!50926)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101350 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50926)

(assert (=> b!1522923 (= lt!659810 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1041833 () Bool)

(assert (=> start!129754 (=> (not res!1041833) (not e!849149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129754 (= res!1041833 (validMask!0 mask!2512))))

(assert (=> start!129754 e!849149))

(assert (=> start!129754 true))

(declare-fun array_inv!37934 (array!101350) Bool)

(assert (=> start!129754 (array_inv!37934 a!2804)))

(declare-fun b!1522924 () Bool)

(declare-fun res!1041831 () Bool)

(assert (=> b!1522924 (=> (not res!1041831) (not e!849149))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1522924 (= res!1041831 (validKeyInArray!0 (select (arr!48906 a!2804) j!70)))))

(declare-fun b!1522925 () Bool)

(declare-fun res!1041828 () Bool)

(assert (=> b!1522925 (=> (not res!1041828) (not e!849149))))

(assert (=> b!1522925 (= res!1041828 (and (= (size!49456 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49456 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49456 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1522926 () Bool)

(declare-fun res!1041834 () Bool)

(assert (=> b!1522926 (=> (not res!1041834) (not e!849149))))

(assert (=> b!1522926 (= res!1041834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1522927 () Bool)

(declare-fun res!1041829 () Bool)

(assert (=> b!1522927 (=> (not res!1041829) (not e!849149))))

(assert (=> b!1522927 (= res!1041829 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49456 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49456 a!2804))))))

(declare-fun b!1522928 () Bool)

(declare-fun res!1041825 () Bool)

(assert (=> b!1522928 (=> (not res!1041825) (not e!849149))))

(assert (=> b!1522928 (= res!1041825 (validKeyInArray!0 (select (arr!48906 a!2804) i!961)))))

(assert (= (and start!129754 res!1041833) b!1522925))

(assert (= (and b!1522925 res!1041828) b!1522928))

(assert (= (and b!1522928 res!1041825) b!1522924))

(assert (= (and b!1522924 res!1041831) b!1522926))

(assert (= (and b!1522926 res!1041834) b!1522920))

(assert (= (and b!1522920 res!1041830) b!1522927))

(assert (= (and b!1522927 res!1041829) b!1522921))

(assert (= (and b!1522921 res!1041832) b!1522918))

(assert (= (and b!1522918 res!1041826) b!1522919))

(assert (= (and b!1522919 res!1041835) b!1522923))

(assert (= (and b!1522923 res!1041827) b!1522922))

(declare-fun m!1405989 () Bool)

(assert (=> b!1522920 m!1405989))

(declare-fun m!1405991 () Bool)

(assert (=> start!129754 m!1405991))

(declare-fun m!1405993 () Bool)

(assert (=> start!129754 m!1405993))

(declare-fun m!1405995 () Bool)

(assert (=> b!1522919 m!1405995))

(declare-fun m!1405997 () Bool)

(assert (=> b!1522919 m!1405997))

(assert (=> b!1522919 m!1405997))

(declare-fun m!1405999 () Bool)

(assert (=> b!1522919 m!1405999))

(assert (=> b!1522919 m!1405999))

(assert (=> b!1522919 m!1405997))

(declare-fun m!1406001 () Bool)

(assert (=> b!1522919 m!1406001))

(declare-fun m!1406003 () Bool)

(assert (=> b!1522921 m!1406003))

(assert (=> b!1522921 m!1406003))

(declare-fun m!1406005 () Bool)

(assert (=> b!1522921 m!1406005))

(assert (=> b!1522921 m!1406005))

(assert (=> b!1522921 m!1406003))

(declare-fun m!1406007 () Bool)

(assert (=> b!1522921 m!1406007))

(declare-fun m!1406009 () Bool)

(assert (=> b!1522923 m!1406009))

(declare-fun m!1406011 () Bool)

(assert (=> b!1522923 m!1406011))

(assert (=> b!1522922 m!1406003))

(assert (=> b!1522922 m!1406003))

(declare-fun m!1406013 () Bool)

(assert (=> b!1522922 m!1406013))

(assert (=> b!1522918 m!1406003))

(assert (=> b!1522918 m!1406003))

(declare-fun m!1406015 () Bool)

(assert (=> b!1522918 m!1406015))

(assert (=> b!1522924 m!1406003))

(assert (=> b!1522924 m!1406003))

(declare-fun m!1406017 () Bool)

(assert (=> b!1522924 m!1406017))

(declare-fun m!1406019 () Bool)

(assert (=> b!1522926 m!1406019))

(declare-fun m!1406021 () Bool)

(assert (=> b!1522928 m!1406021))

(assert (=> b!1522928 m!1406021))

(declare-fun m!1406023 () Bool)

(assert (=> b!1522928 m!1406023))

(check-sat (not start!129754) (not b!1522918) (not b!1522922) (not b!1522920) (not b!1522928) (not b!1522923) (not b!1522924) (not b!1522926) (not b!1522919) (not b!1522921))
(check-sat)
