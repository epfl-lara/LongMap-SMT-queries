; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130294 () Bool)

(assert start!130294)

(declare-fun b!1529856 () Bool)

(declare-fun res!1047568 () Bool)

(declare-fun e!852506 () Bool)

(assert (=> b!1529856 (=> (not res!1047568) (not e!852506))))

(declare-datatypes ((array!101644 0))(
  ( (array!101645 (arr!49047 (Array (_ BitVec 32) (_ BitVec 64))) (size!49597 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101644)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529856 (= res!1047568 (validKeyInArray!0 (select (arr!49047 a!2804) i!961)))))

(declare-fun res!1047563 () Bool)

(assert (=> start!130294 (=> (not res!1047563) (not e!852506))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130294 (= res!1047563 (validMask!0 mask!2512))))

(assert (=> start!130294 e!852506))

(assert (=> start!130294 true))

(declare-fun array_inv!38075 (array!101644) Bool)

(assert (=> start!130294 (array_inv!38075 a!2804)))

(declare-fun b!1529857 () Bool)

(declare-fun res!1047564 () Bool)

(declare-fun e!852504 () Bool)

(assert (=> b!1529857 (=> (not res!1047564) (not e!852504))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13212 0))(
  ( (MissingZero!13212 (index!55243 (_ BitVec 32))) (Found!13212 (index!55244 (_ BitVec 32))) (Intermediate!13212 (undefined!14024 Bool) (index!55245 (_ BitVec 32)) (x!136923 (_ BitVec 32))) (Undefined!13212) (MissingVacant!13212 (index!55246 (_ BitVec 32))) )
))
(declare-fun lt!662572 () SeekEntryResult!13212)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101644 (_ BitVec 32)) SeekEntryResult!13212)

(assert (=> b!1529857 (= res!1047564 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49047 a!2804) j!70) a!2804 mask!2512) lt!662572))))

(declare-fun b!1529858 () Bool)

(declare-fun res!1047565 () Bool)

(assert (=> b!1529858 (=> (not res!1047565) (not e!852506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101644 (_ BitVec 32)) Bool)

(assert (=> b!1529858 (= res!1047565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529859 () Bool)

(declare-fun e!852507 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101644 (_ BitVec 32)) SeekEntryResult!13212)

(assert (=> b!1529859 (= e!852507 (= (seekEntry!0 (select (arr!49047 a!2804) j!70) a!2804 mask!2512) (Found!13212 j!70)))))

(declare-fun b!1529860 () Bool)

(declare-fun e!852505 () Bool)

(assert (=> b!1529860 (= e!852505 true)))

(declare-fun lt!662573 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529860 (= lt!662573 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1529861 () Bool)

(declare-fun res!1047566 () Bool)

(assert (=> b!1529861 (=> (not res!1047566) (not e!852506))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529861 (= res!1047566 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49597 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49597 a!2804))))))

(declare-fun b!1529862 () Bool)

(assert (=> b!1529862 (= e!852504 (not e!852505))))

(declare-fun res!1047571 () Bool)

(assert (=> b!1529862 (=> res!1047571 e!852505)))

(assert (=> b!1529862 (= res!1047571 (or (not (= (select (arr!49047 a!2804) j!70) (select (store (arr!49047 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1529862 e!852507))

(declare-fun res!1047574 () Bool)

(assert (=> b!1529862 (=> (not res!1047574) (not e!852507))))

(assert (=> b!1529862 (= res!1047574 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51208 0))(
  ( (Unit!51209) )
))
(declare-fun lt!662575 () Unit!51208)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101644 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51208)

(assert (=> b!1529862 (= lt!662575 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529863 () Bool)

(declare-fun res!1047570 () Bool)

(assert (=> b!1529863 (=> (not res!1047570) (not e!852504))))

(declare-fun lt!662574 () SeekEntryResult!13212)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529863 (= res!1047570 (= lt!662574 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49047 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49047 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101645 (store (arr!49047 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49597 a!2804)) mask!2512)))))

(declare-fun b!1529864 () Bool)

(assert (=> b!1529864 (= e!852506 e!852504)))

(declare-fun res!1047569 () Bool)

(assert (=> b!1529864 (=> (not res!1047569) (not e!852504))))

(assert (=> b!1529864 (= res!1047569 (= lt!662574 lt!662572))))

(assert (=> b!1529864 (= lt!662572 (Intermediate!13212 false resIndex!21 resX!21))))

(assert (=> b!1529864 (= lt!662574 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49047 a!2804) j!70) mask!2512) (select (arr!49047 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529865 () Bool)

(declare-fun res!1047572 () Bool)

(assert (=> b!1529865 (=> (not res!1047572) (not e!852506))))

(assert (=> b!1529865 (= res!1047572 (and (= (size!49597 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49597 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49597 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529866 () Bool)

(declare-fun res!1047567 () Bool)

(assert (=> b!1529866 (=> (not res!1047567) (not e!852506))))

(declare-datatypes ((List!35530 0))(
  ( (Nil!35527) (Cons!35526 (h!36962 (_ BitVec 64)) (t!50224 List!35530)) )
))
(declare-fun arrayNoDuplicates!0 (array!101644 (_ BitVec 32) List!35530) Bool)

(assert (=> b!1529866 (= res!1047567 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35527))))

(declare-fun b!1529867 () Bool)

(declare-fun res!1047573 () Bool)

(assert (=> b!1529867 (=> (not res!1047573) (not e!852506))))

(assert (=> b!1529867 (= res!1047573 (validKeyInArray!0 (select (arr!49047 a!2804) j!70)))))

(assert (= (and start!130294 res!1047563) b!1529865))

(assert (= (and b!1529865 res!1047572) b!1529856))

(assert (= (and b!1529856 res!1047568) b!1529867))

(assert (= (and b!1529867 res!1047573) b!1529858))

(assert (= (and b!1529858 res!1047565) b!1529866))

(assert (= (and b!1529866 res!1047567) b!1529861))

(assert (= (and b!1529861 res!1047566) b!1529864))

(assert (= (and b!1529864 res!1047569) b!1529857))

(assert (= (and b!1529857 res!1047564) b!1529863))

(assert (= (and b!1529863 res!1047570) b!1529862))

(assert (= (and b!1529862 res!1047574) b!1529859))

(assert (= (and b!1529862 (not res!1047571)) b!1529860))

(declare-fun m!1412825 () Bool)

(assert (=> b!1529867 m!1412825))

(assert (=> b!1529867 m!1412825))

(declare-fun m!1412827 () Bool)

(assert (=> b!1529867 m!1412827))

(assert (=> b!1529859 m!1412825))

(assert (=> b!1529859 m!1412825))

(declare-fun m!1412829 () Bool)

(assert (=> b!1529859 m!1412829))

(assert (=> b!1529857 m!1412825))

(assert (=> b!1529857 m!1412825))

(declare-fun m!1412831 () Bool)

(assert (=> b!1529857 m!1412831))

(declare-fun m!1412833 () Bool)

(assert (=> start!130294 m!1412833))

(declare-fun m!1412835 () Bool)

(assert (=> start!130294 m!1412835))

(declare-fun m!1412837 () Bool)

(assert (=> b!1529858 m!1412837))

(assert (=> b!1529862 m!1412825))

(declare-fun m!1412839 () Bool)

(assert (=> b!1529862 m!1412839))

(declare-fun m!1412841 () Bool)

(assert (=> b!1529862 m!1412841))

(declare-fun m!1412843 () Bool)

(assert (=> b!1529862 m!1412843))

(declare-fun m!1412845 () Bool)

(assert (=> b!1529862 m!1412845))

(declare-fun m!1412847 () Bool)

(assert (=> b!1529866 m!1412847))

(declare-fun m!1412849 () Bool)

(assert (=> b!1529856 m!1412849))

(assert (=> b!1529856 m!1412849))

(declare-fun m!1412851 () Bool)

(assert (=> b!1529856 m!1412851))

(declare-fun m!1412853 () Bool)

(assert (=> b!1529860 m!1412853))

(assert (=> b!1529863 m!1412841))

(assert (=> b!1529863 m!1412843))

(assert (=> b!1529863 m!1412843))

(declare-fun m!1412855 () Bool)

(assert (=> b!1529863 m!1412855))

(assert (=> b!1529863 m!1412855))

(assert (=> b!1529863 m!1412843))

(declare-fun m!1412857 () Bool)

(assert (=> b!1529863 m!1412857))

(assert (=> b!1529864 m!1412825))

(assert (=> b!1529864 m!1412825))

(declare-fun m!1412859 () Bool)

(assert (=> b!1529864 m!1412859))

(assert (=> b!1529864 m!1412859))

(assert (=> b!1529864 m!1412825))

(declare-fun m!1412861 () Bool)

(assert (=> b!1529864 m!1412861))

(check-sat (not b!1529857) (not b!1529864) (not b!1529858) (not b!1529862) (not b!1529860) (not b!1529859) (not start!130294) (not b!1529863) (not b!1529866) (not b!1529856) (not b!1529867))
(check-sat)
