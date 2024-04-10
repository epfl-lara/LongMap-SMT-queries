; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130242 () Bool)

(assert start!130242)

(declare-fun b!1528920 () Bool)

(declare-fun res!1046631 () Bool)

(declare-fun e!852118 () Bool)

(assert (=> b!1528920 (=> (not res!1046631) (not e!852118))))

(declare-datatypes ((array!101592 0))(
  ( (array!101593 (arr!49021 (Array (_ BitVec 32) (_ BitVec 64))) (size!49571 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101592)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528920 (= res!1046631 (validKeyInArray!0 (select (arr!49021 a!2804) j!70)))))

(declare-fun b!1528921 () Bool)

(declare-fun res!1046630 () Bool)

(assert (=> b!1528921 (=> (not res!1046630) (not e!852118))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1528921 (= res!1046630 (and (= (size!49571 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49571 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49571 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1046632 () Bool)

(assert (=> start!130242 (=> (not res!1046632) (not e!852118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130242 (= res!1046632 (validMask!0 mask!2512))))

(assert (=> start!130242 e!852118))

(assert (=> start!130242 true))

(declare-fun array_inv!38049 (array!101592) Bool)

(assert (=> start!130242 (array_inv!38049 a!2804)))

(declare-fun b!1528922 () Bool)

(declare-fun e!852116 () Bool)

(assert (=> b!1528922 (= e!852116 true)))

(declare-fun lt!662262 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528922 (= lt!662262 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun e!852114 () Bool)

(declare-fun b!1528923 () Bool)

(declare-datatypes ((SeekEntryResult!13186 0))(
  ( (MissingZero!13186 (index!55139 (_ BitVec 32))) (Found!13186 (index!55140 (_ BitVec 32))) (Intermediate!13186 (undefined!13998 Bool) (index!55141 (_ BitVec 32)) (x!136825 (_ BitVec 32))) (Undefined!13186) (MissingVacant!13186 (index!55142 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101592 (_ BitVec 32)) SeekEntryResult!13186)

(assert (=> b!1528923 (= e!852114 (= (seekEntry!0 (select (arr!49021 a!2804) j!70) a!2804 mask!2512) (Found!13186 j!70)))))

(declare-fun b!1528924 () Bool)

(declare-fun res!1046627 () Bool)

(assert (=> b!1528924 (=> (not res!1046627) (not e!852118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101592 (_ BitVec 32)) Bool)

(assert (=> b!1528924 (= res!1046627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528925 () Bool)

(declare-fun res!1046633 () Bool)

(declare-fun e!852117 () Bool)

(assert (=> b!1528925 (=> (not res!1046633) (not e!852117))))

(declare-fun lt!662261 () SeekEntryResult!13186)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101592 (_ BitVec 32)) SeekEntryResult!13186)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528925 (= res!1046633 (= lt!662261 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49021 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49021 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101593 (store (arr!49021 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49571 a!2804)) mask!2512)))))

(declare-fun b!1528926 () Bool)

(declare-fun res!1046629 () Bool)

(assert (=> b!1528926 (=> (not res!1046629) (not e!852118))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1528926 (= res!1046629 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49571 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49571 a!2804))))))

(declare-fun b!1528927 () Bool)

(assert (=> b!1528927 (= e!852117 (not e!852116))))

(declare-fun res!1046637 () Bool)

(assert (=> b!1528927 (=> res!1046637 e!852116)))

(assert (=> b!1528927 (= res!1046637 (or (not (= (select (arr!49021 a!2804) j!70) (select (store (arr!49021 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1528927 e!852114))

(declare-fun res!1046635 () Bool)

(assert (=> b!1528927 (=> (not res!1046635) (not e!852114))))

(assert (=> b!1528927 (= res!1046635 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51156 0))(
  ( (Unit!51157) )
))
(declare-fun lt!662263 () Unit!51156)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101592 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51156)

(assert (=> b!1528927 (= lt!662263 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528928 () Bool)

(declare-fun res!1046628 () Bool)

(assert (=> b!1528928 (=> (not res!1046628) (not e!852118))))

(declare-datatypes ((List!35504 0))(
  ( (Nil!35501) (Cons!35500 (h!36936 (_ BitVec 64)) (t!50198 List!35504)) )
))
(declare-fun arrayNoDuplicates!0 (array!101592 (_ BitVec 32) List!35504) Bool)

(assert (=> b!1528928 (= res!1046628 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35501))))

(declare-fun b!1528929 () Bool)

(declare-fun res!1046636 () Bool)

(assert (=> b!1528929 (=> (not res!1046636) (not e!852118))))

(assert (=> b!1528929 (= res!1046636 (validKeyInArray!0 (select (arr!49021 a!2804) i!961)))))

(declare-fun b!1528930 () Bool)

(assert (=> b!1528930 (= e!852118 e!852117)))

(declare-fun res!1046638 () Bool)

(assert (=> b!1528930 (=> (not res!1046638) (not e!852117))))

(declare-fun lt!662260 () SeekEntryResult!13186)

(assert (=> b!1528930 (= res!1046638 (= lt!662261 lt!662260))))

(assert (=> b!1528930 (= lt!662260 (Intermediate!13186 false resIndex!21 resX!21))))

(assert (=> b!1528930 (= lt!662261 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49021 a!2804) j!70) mask!2512) (select (arr!49021 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528931 () Bool)

(declare-fun res!1046634 () Bool)

(assert (=> b!1528931 (=> (not res!1046634) (not e!852117))))

(assert (=> b!1528931 (= res!1046634 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49021 a!2804) j!70) a!2804 mask!2512) lt!662260))))

(assert (= (and start!130242 res!1046632) b!1528921))

(assert (= (and b!1528921 res!1046630) b!1528929))

(assert (= (and b!1528929 res!1046636) b!1528920))

(assert (= (and b!1528920 res!1046631) b!1528924))

(assert (= (and b!1528924 res!1046627) b!1528928))

(assert (= (and b!1528928 res!1046628) b!1528926))

(assert (= (and b!1528926 res!1046629) b!1528930))

(assert (= (and b!1528930 res!1046638) b!1528931))

(assert (= (and b!1528931 res!1046634) b!1528925))

(assert (= (and b!1528925 res!1046633) b!1528927))

(assert (= (and b!1528927 res!1046635) b!1528923))

(assert (= (and b!1528927 (not res!1046637)) b!1528922))

(declare-fun m!1411837 () Bool)

(assert (=> b!1528920 m!1411837))

(assert (=> b!1528920 m!1411837))

(declare-fun m!1411839 () Bool)

(assert (=> b!1528920 m!1411839))

(assert (=> b!1528923 m!1411837))

(assert (=> b!1528923 m!1411837))

(declare-fun m!1411841 () Bool)

(assert (=> b!1528923 m!1411841))

(declare-fun m!1411843 () Bool)

(assert (=> b!1528922 m!1411843))

(declare-fun m!1411845 () Bool)

(assert (=> b!1528924 m!1411845))

(declare-fun m!1411847 () Bool)

(assert (=> b!1528929 m!1411847))

(assert (=> b!1528929 m!1411847))

(declare-fun m!1411849 () Bool)

(assert (=> b!1528929 m!1411849))

(assert (=> b!1528927 m!1411837))

(declare-fun m!1411851 () Bool)

(assert (=> b!1528927 m!1411851))

(declare-fun m!1411853 () Bool)

(assert (=> b!1528927 m!1411853))

(declare-fun m!1411855 () Bool)

(assert (=> b!1528927 m!1411855))

(declare-fun m!1411857 () Bool)

(assert (=> b!1528927 m!1411857))

(assert (=> b!1528931 m!1411837))

(assert (=> b!1528931 m!1411837))

(declare-fun m!1411859 () Bool)

(assert (=> b!1528931 m!1411859))

(declare-fun m!1411861 () Bool)

(assert (=> b!1528928 m!1411861))

(assert (=> b!1528925 m!1411853))

(assert (=> b!1528925 m!1411855))

(assert (=> b!1528925 m!1411855))

(declare-fun m!1411863 () Bool)

(assert (=> b!1528925 m!1411863))

(assert (=> b!1528925 m!1411863))

(assert (=> b!1528925 m!1411855))

(declare-fun m!1411865 () Bool)

(assert (=> b!1528925 m!1411865))

(assert (=> b!1528930 m!1411837))

(assert (=> b!1528930 m!1411837))

(declare-fun m!1411867 () Bool)

(assert (=> b!1528930 m!1411867))

(assert (=> b!1528930 m!1411867))

(assert (=> b!1528930 m!1411837))

(declare-fun m!1411869 () Bool)

(assert (=> b!1528930 m!1411869))

(declare-fun m!1411871 () Bool)

(assert (=> start!130242 m!1411871))

(declare-fun m!1411873 () Bool)

(assert (=> start!130242 m!1411873))

(push 1)

(assert (not start!130242))

