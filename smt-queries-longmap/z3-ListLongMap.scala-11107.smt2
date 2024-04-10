; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129748 () Bool)

(assert start!129748)

(declare-fun b!1522819 () Bool)

(declare-fun res!1041734 () Bool)

(declare-fun e!849115 () Bool)

(assert (=> b!1522819 (=> (not res!1041734) (not e!849115))))

(declare-datatypes ((SeekEntryResult!13068 0))(
  ( (MissingZero!13068 (index!54667 (_ BitVec 32))) (Found!13068 (index!54668 (_ BitVec 32))) (Intermediate!13068 (undefined!13880 Bool) (index!54669 (_ BitVec 32)) (x!136362 (_ BitVec 32))) (Undefined!13068) (MissingVacant!13068 (index!54670 (_ BitVec 32))) )
))
(declare-fun lt!659783 () SeekEntryResult!13068)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101344 0))(
  ( (array!101345 (arr!48903 (Array (_ BitVec 32) (_ BitVec 64))) (size!49453 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101344)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101344 (_ BitVec 32)) SeekEntryResult!13068)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522819 (= res!1041734 (= lt!659783 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48903 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48903 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101345 (store (arr!48903 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49453 a!2804)) mask!2512)))))

(declare-fun b!1522820 () Bool)

(declare-fun e!849113 () Bool)

(assert (=> b!1522820 (= e!849113 e!849115)))

(declare-fun res!1041732 () Bool)

(assert (=> b!1522820 (=> (not res!1041732) (not e!849115))))

(declare-fun lt!659784 () SeekEntryResult!13068)

(assert (=> b!1522820 (= res!1041732 (= lt!659783 lt!659784))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1522820 (= lt!659784 (Intermediate!13068 false resIndex!21 resX!21))))

(assert (=> b!1522820 (= lt!659783 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48903 a!2804) j!70) mask!2512) (select (arr!48903 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522821 () Bool)

(declare-fun res!1041727 () Bool)

(assert (=> b!1522821 (=> (not res!1041727) (not e!849113))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1522821 (= res!1041727 (validKeyInArray!0 (select (arr!48903 a!2804) i!961)))))

(declare-fun b!1522822 () Bool)

(declare-fun res!1041728 () Bool)

(assert (=> b!1522822 (=> (not res!1041728) (not e!849113))))

(assert (=> b!1522822 (= res!1041728 (validKeyInArray!0 (select (arr!48903 a!2804) j!70)))))

(declare-fun res!1041735 () Bool)

(assert (=> start!129748 (=> (not res!1041735) (not e!849113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129748 (= res!1041735 (validMask!0 mask!2512))))

(assert (=> start!129748 e!849113))

(assert (=> start!129748 true))

(declare-fun array_inv!37931 (array!101344) Bool)

(assert (=> start!129748 (array_inv!37931 a!2804)))

(declare-fun b!1522823 () Bool)

(declare-fun res!1041731 () Bool)

(assert (=> b!1522823 (=> (not res!1041731) (not e!849113))))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1522823 (= res!1041731 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49453 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49453 a!2804))))))

(declare-fun b!1522824 () Bool)

(declare-fun res!1041736 () Bool)

(assert (=> b!1522824 (=> (not res!1041736) (not e!849113))))

(assert (=> b!1522824 (= res!1041736 (and (= (size!49453 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49453 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49453 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1522825 () Bool)

(declare-fun res!1041726 () Bool)

(assert (=> b!1522825 (=> (not res!1041726) (not e!849115))))

(assert (=> b!1522825 (= res!1041726 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48903 a!2804) j!70) a!2804 mask!2512) lt!659784))))

(declare-fun b!1522826 () Bool)

(declare-fun res!1041730 () Bool)

(assert (=> b!1522826 (=> (not res!1041730) (not e!849113))))

(declare-datatypes ((List!35386 0))(
  ( (Nil!35383) (Cons!35382 (h!36806 (_ BitVec 64)) (t!50080 List!35386)) )
))
(declare-fun arrayNoDuplicates!0 (array!101344 (_ BitVec 32) List!35386) Bool)

(assert (=> b!1522826 (= res!1041730 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35383))))

(declare-fun b!1522827 () Bool)

(assert (=> b!1522827 (= e!849115 (not true))))

(declare-fun e!849114 () Bool)

(assert (=> b!1522827 e!849114))

(declare-fun res!1041733 () Bool)

(assert (=> b!1522827 (=> (not res!1041733) (not e!849114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101344 (_ BitVec 32)) Bool)

(assert (=> b!1522827 (= res!1041733 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50920 0))(
  ( (Unit!50921) )
))
(declare-fun lt!659785 () Unit!50920)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101344 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50920)

(assert (=> b!1522827 (= lt!659785 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1522828 () Bool)

(declare-fun res!1041729 () Bool)

(assert (=> b!1522828 (=> (not res!1041729) (not e!849113))))

(assert (=> b!1522828 (= res!1041729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1522829 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101344 (_ BitVec 32)) SeekEntryResult!13068)

(assert (=> b!1522829 (= e!849114 (= (seekEntry!0 (select (arr!48903 a!2804) j!70) a!2804 mask!2512) (Found!13068 j!70)))))

(assert (= (and start!129748 res!1041735) b!1522824))

(assert (= (and b!1522824 res!1041736) b!1522821))

(assert (= (and b!1522821 res!1041727) b!1522822))

(assert (= (and b!1522822 res!1041728) b!1522828))

(assert (= (and b!1522828 res!1041729) b!1522826))

(assert (= (and b!1522826 res!1041730) b!1522823))

(assert (= (and b!1522823 res!1041731) b!1522820))

(assert (= (and b!1522820 res!1041732) b!1522825))

(assert (= (and b!1522825 res!1041726) b!1522819))

(assert (= (and b!1522819 res!1041734) b!1522827))

(assert (= (and b!1522827 res!1041733) b!1522829))

(declare-fun m!1405881 () Bool)

(assert (=> b!1522827 m!1405881))

(declare-fun m!1405883 () Bool)

(assert (=> b!1522827 m!1405883))

(declare-fun m!1405885 () Bool)

(assert (=> b!1522828 m!1405885))

(declare-fun m!1405887 () Bool)

(assert (=> b!1522826 m!1405887))

(declare-fun m!1405889 () Bool)

(assert (=> b!1522829 m!1405889))

(assert (=> b!1522829 m!1405889))

(declare-fun m!1405891 () Bool)

(assert (=> b!1522829 m!1405891))

(declare-fun m!1405893 () Bool)

(assert (=> b!1522819 m!1405893))

(declare-fun m!1405895 () Bool)

(assert (=> b!1522819 m!1405895))

(assert (=> b!1522819 m!1405895))

(declare-fun m!1405897 () Bool)

(assert (=> b!1522819 m!1405897))

(assert (=> b!1522819 m!1405897))

(assert (=> b!1522819 m!1405895))

(declare-fun m!1405899 () Bool)

(assert (=> b!1522819 m!1405899))

(declare-fun m!1405901 () Bool)

(assert (=> b!1522821 m!1405901))

(assert (=> b!1522821 m!1405901))

(declare-fun m!1405903 () Bool)

(assert (=> b!1522821 m!1405903))

(declare-fun m!1405905 () Bool)

(assert (=> start!129748 m!1405905))

(declare-fun m!1405907 () Bool)

(assert (=> start!129748 m!1405907))

(assert (=> b!1522822 m!1405889))

(assert (=> b!1522822 m!1405889))

(declare-fun m!1405909 () Bool)

(assert (=> b!1522822 m!1405909))

(assert (=> b!1522820 m!1405889))

(assert (=> b!1522820 m!1405889))

(declare-fun m!1405911 () Bool)

(assert (=> b!1522820 m!1405911))

(assert (=> b!1522820 m!1405911))

(assert (=> b!1522820 m!1405889))

(declare-fun m!1405913 () Bool)

(assert (=> b!1522820 m!1405913))

(assert (=> b!1522825 m!1405889))

(assert (=> b!1522825 m!1405889))

(declare-fun m!1405915 () Bool)

(assert (=> b!1522825 m!1405915))

(check-sat (not b!1522822) (not b!1522821) (not b!1522829) (not b!1522825) (not b!1522826) (not b!1522819) (not start!129748) (not b!1522827) (not b!1522828) (not b!1522820))
(check-sat)
