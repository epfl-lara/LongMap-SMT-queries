; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130524 () Bool)

(assert start!130524)

(declare-fun b!1531664 () Bool)

(declare-fun res!1048804 () Bool)

(declare-fun e!853443 () Bool)

(assert (=> b!1531664 (=> res!1048804 e!853443)))

(declare-fun lt!663319 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101703 0))(
  ( (array!101704 (arr!49072 (Array (_ BitVec 32) (_ BitVec 64))) (size!49622 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101703)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13237 0))(
  ( (MissingZero!13237 (index!55343 (_ BitVec 32))) (Found!13237 (index!55344 (_ BitVec 32))) (Intermediate!13237 (undefined!14049 Bool) (index!55345 (_ BitVec 32)) (x!137039 (_ BitVec 32))) (Undefined!13237) (MissingVacant!13237 (index!55346 (_ BitVec 32))) )
))
(declare-fun lt!663321 () SeekEntryResult!13237)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101703 (_ BitVec 32)) SeekEntryResult!13237)

(assert (=> b!1531664 (= res!1048804 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663319 (select (arr!49072 a!2804) j!70) a!2804 mask!2512) lt!663321)))))

(declare-fun b!1531665 () Bool)

(declare-fun res!1048815 () Bool)

(declare-fun e!853442 () Bool)

(assert (=> b!1531665 (=> (not res!1048815) (not e!853442))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531665 (= res!1048815 (validKeyInArray!0 (select (arr!49072 a!2804) i!961)))))

(declare-fun b!1531666 () Bool)

(declare-fun e!853446 () Bool)

(declare-fun e!853447 () Bool)

(assert (=> b!1531666 (= e!853446 (not e!853447))))

(declare-fun res!1048809 () Bool)

(assert (=> b!1531666 (=> res!1048809 e!853447)))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1531666 (= res!1048809 (or (not (= (select (arr!49072 a!2804) j!70) (select (store (arr!49072 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!853444 () Bool)

(assert (=> b!1531666 e!853444))

(declare-fun res!1048816 () Bool)

(assert (=> b!1531666 (=> (not res!1048816) (not e!853444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101703 (_ BitVec 32)) Bool)

(assert (=> b!1531666 (= res!1048816 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51258 0))(
  ( (Unit!51259) )
))
(declare-fun lt!663320 () Unit!51258)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51258)

(assert (=> b!1531666 (= lt!663320 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531667 () Bool)

(declare-fun res!1048813 () Bool)

(assert (=> b!1531667 (=> (not res!1048813) (not e!853442))))

(assert (=> b!1531667 (= res!1048813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531668 () Bool)

(declare-fun res!1048810 () Bool)

(assert (=> b!1531668 (=> (not res!1048810) (not e!853446))))

(declare-fun lt!663322 () SeekEntryResult!13237)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531668 (= res!1048810 (= lt!663322 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49072 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49072 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101704 (store (arr!49072 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49622 a!2804)) mask!2512)))))

(declare-fun b!1531669 () Bool)

(declare-fun res!1048806 () Bool)

(assert (=> b!1531669 (=> (not res!1048806) (not e!853446))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1531669 (= res!1048806 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49072 a!2804) j!70) a!2804 mask!2512) lt!663321))))

(declare-fun b!1531670 () Bool)

(assert (=> b!1531670 (= e!853447 e!853443)))

(declare-fun res!1048812 () Bool)

(assert (=> b!1531670 (=> res!1048812 e!853443)))

(assert (=> b!1531670 (= res!1048812 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663319 #b00000000000000000000000000000000) (bvsge lt!663319 (size!49622 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531670 (= lt!663319 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1531671 () Bool)

(declare-fun res!1048803 () Bool)

(assert (=> b!1531671 (=> (not res!1048803) (not e!853442))))

(assert (=> b!1531671 (= res!1048803 (validKeyInArray!0 (select (arr!49072 a!2804) j!70)))))

(declare-fun b!1531672 () Bool)

(declare-fun res!1048807 () Bool)

(assert (=> b!1531672 (=> (not res!1048807) (not e!853442))))

(assert (=> b!1531672 (= res!1048807 (and (= (size!49622 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49622 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49622 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531673 () Bool)

(assert (=> b!1531673 (= e!853442 e!853446)))

(declare-fun res!1048805 () Bool)

(assert (=> b!1531673 (=> (not res!1048805) (not e!853446))))

(assert (=> b!1531673 (= res!1048805 (= lt!663322 lt!663321))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1531673 (= lt!663321 (Intermediate!13237 false resIndex!21 resX!21))))

(assert (=> b!1531673 (= lt!663322 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49072 a!2804) j!70) mask!2512) (select (arr!49072 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531674 () Bool)

(declare-fun res!1048814 () Bool)

(assert (=> b!1531674 (=> (not res!1048814) (not e!853442))))

(assert (=> b!1531674 (= res!1048814 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49622 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49622 a!2804))))))

(declare-fun b!1531675 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101703 (_ BitVec 32)) SeekEntryResult!13237)

(assert (=> b!1531675 (= e!853444 (= (seekEntry!0 (select (arr!49072 a!2804) j!70) a!2804 mask!2512) (Found!13237 j!70)))))

(declare-fun b!1531676 () Bool)

(declare-fun res!1048811 () Bool)

(assert (=> b!1531676 (=> (not res!1048811) (not e!853442))))

(declare-datatypes ((List!35555 0))(
  ( (Nil!35552) (Cons!35551 (h!36996 (_ BitVec 64)) (t!50249 List!35555)) )
))
(declare-fun arrayNoDuplicates!0 (array!101703 (_ BitVec 32) List!35555) Bool)

(assert (=> b!1531676 (= res!1048811 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35552))))

(declare-fun b!1531663 () Bool)

(assert (=> b!1531663 (= e!853443 (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!534)) (bvsub #b01111111111111111111111111111110 x!534)))))

(declare-fun res!1048808 () Bool)

(assert (=> start!130524 (=> (not res!1048808) (not e!853442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130524 (= res!1048808 (validMask!0 mask!2512))))

(assert (=> start!130524 e!853442))

(assert (=> start!130524 true))

(declare-fun array_inv!38100 (array!101703) Bool)

(assert (=> start!130524 (array_inv!38100 a!2804)))

(assert (= (and start!130524 res!1048808) b!1531672))

(assert (= (and b!1531672 res!1048807) b!1531665))

(assert (= (and b!1531665 res!1048815) b!1531671))

(assert (= (and b!1531671 res!1048803) b!1531667))

(assert (= (and b!1531667 res!1048813) b!1531676))

(assert (= (and b!1531676 res!1048811) b!1531674))

(assert (= (and b!1531674 res!1048814) b!1531673))

(assert (= (and b!1531673 res!1048805) b!1531669))

(assert (= (and b!1531669 res!1048806) b!1531668))

(assert (= (and b!1531668 res!1048810) b!1531666))

(assert (= (and b!1531666 res!1048816) b!1531675))

(assert (= (and b!1531666 (not res!1048809)) b!1531670))

(assert (= (and b!1531670 (not res!1048812)) b!1531664))

(assert (= (and b!1531664 (not res!1048804)) b!1531663))

(declare-fun m!1414319 () Bool)

(assert (=> b!1531665 m!1414319))

(assert (=> b!1531665 m!1414319))

(declare-fun m!1414321 () Bool)

(assert (=> b!1531665 m!1414321))

(declare-fun m!1414323 () Bool)

(assert (=> b!1531666 m!1414323))

(declare-fun m!1414325 () Bool)

(assert (=> b!1531666 m!1414325))

(declare-fun m!1414327 () Bool)

(assert (=> b!1531666 m!1414327))

(declare-fun m!1414329 () Bool)

(assert (=> b!1531666 m!1414329))

(declare-fun m!1414331 () Bool)

(assert (=> b!1531666 m!1414331))

(assert (=> b!1531671 m!1414323))

(assert (=> b!1531671 m!1414323))

(declare-fun m!1414333 () Bool)

(assert (=> b!1531671 m!1414333))

(declare-fun m!1414335 () Bool)

(assert (=> b!1531676 m!1414335))

(assert (=> b!1531675 m!1414323))

(assert (=> b!1531675 m!1414323))

(declare-fun m!1414337 () Bool)

(assert (=> b!1531675 m!1414337))

(declare-fun m!1414339 () Bool)

(assert (=> start!130524 m!1414339))

(declare-fun m!1414341 () Bool)

(assert (=> start!130524 m!1414341))

(assert (=> b!1531664 m!1414323))

(assert (=> b!1531664 m!1414323))

(declare-fun m!1414343 () Bool)

(assert (=> b!1531664 m!1414343))

(declare-fun m!1414345 () Bool)

(assert (=> b!1531667 m!1414345))

(assert (=> b!1531668 m!1414327))

(assert (=> b!1531668 m!1414329))

(assert (=> b!1531668 m!1414329))

(declare-fun m!1414347 () Bool)

(assert (=> b!1531668 m!1414347))

(assert (=> b!1531668 m!1414347))

(assert (=> b!1531668 m!1414329))

(declare-fun m!1414349 () Bool)

(assert (=> b!1531668 m!1414349))

(assert (=> b!1531673 m!1414323))

(assert (=> b!1531673 m!1414323))

(declare-fun m!1414351 () Bool)

(assert (=> b!1531673 m!1414351))

(assert (=> b!1531673 m!1414351))

(assert (=> b!1531673 m!1414323))

(declare-fun m!1414353 () Bool)

(assert (=> b!1531673 m!1414353))

(declare-fun m!1414355 () Bool)

(assert (=> b!1531670 m!1414355))

(assert (=> b!1531669 m!1414323))

(assert (=> b!1531669 m!1414323))

(declare-fun m!1414357 () Bool)

(assert (=> b!1531669 m!1414357))

(push 1)

(assert (not start!130524))

(assert (not b!1531667))

(assert (not b!1531675))

(assert (not b!1531671))

(assert (not b!1531664))

(assert (not b!1531665))

(assert (not b!1531676))

(assert (not b!1531668))

(assert (not b!1531669))

(assert (not b!1531666))

(assert (not b!1531670))

(assert (not b!1531673))

(check-sat)

(pop 1)

(push 1)

(check-sat)

