; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130292 () Bool)

(assert start!130292)

(declare-fun b!1529820 () Bool)

(declare-fun e!852490 () Bool)

(declare-fun e!852493 () Bool)

(assert (=> b!1529820 (= e!852490 e!852493)))

(declare-fun res!1047530 () Bool)

(assert (=> b!1529820 (=> (not res!1047530) (not e!852493))))

(declare-datatypes ((SeekEntryResult!13211 0))(
  ( (MissingZero!13211 (index!55239 (_ BitVec 32))) (Found!13211 (index!55240 (_ BitVec 32))) (Intermediate!13211 (undefined!14023 Bool) (index!55241 (_ BitVec 32)) (x!136922 (_ BitVec 32))) (Undefined!13211) (MissingVacant!13211 (index!55242 (_ BitVec 32))) )
))
(declare-fun lt!662560 () SeekEntryResult!13211)

(declare-fun lt!662561 () SeekEntryResult!13211)

(assert (=> b!1529820 (= res!1047530 (= lt!662560 lt!662561))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1529820 (= lt!662561 (Intermediate!13211 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101642 0))(
  ( (array!101643 (arr!49046 (Array (_ BitVec 32) (_ BitVec 64))) (size!49596 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101642)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101642 (_ BitVec 32)) SeekEntryResult!13211)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529820 (= lt!662560 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49046 a!2804) j!70) mask!2512) (select (arr!49046 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529821 () Bool)

(declare-fun res!1047536 () Bool)

(assert (=> b!1529821 (=> (not res!1047536) (not e!852490))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529821 (= res!1047536 (validKeyInArray!0 (select (arr!49046 a!2804) i!961)))))

(declare-fun b!1529822 () Bool)

(declare-fun e!852489 () Bool)

(assert (=> b!1529822 (= e!852493 (not e!852489))))

(declare-fun res!1047529 () Bool)

(assert (=> b!1529822 (=> res!1047529 e!852489)))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1529822 (= res!1047529 (or (not (= (select (arr!49046 a!2804) j!70) (select (store (arr!49046 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852492 () Bool)

(assert (=> b!1529822 e!852492))

(declare-fun res!1047532 () Bool)

(assert (=> b!1529822 (=> (not res!1047532) (not e!852492))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101642 (_ BitVec 32)) Bool)

(assert (=> b!1529822 (= res!1047532 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51206 0))(
  ( (Unit!51207) )
))
(declare-fun lt!662562 () Unit!51206)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101642 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51206)

(assert (=> b!1529822 (= lt!662562 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529823 () Bool)

(assert (=> b!1529823 (= e!852489 true)))

(declare-fun lt!662563 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529823 (= lt!662563 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1529824 () Bool)

(declare-fun res!1047528 () Bool)

(assert (=> b!1529824 (=> (not res!1047528) (not e!852493))))

(assert (=> b!1529824 (= res!1047528 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49046 a!2804) j!70) a!2804 mask!2512) lt!662561))))

(declare-fun res!1047527 () Bool)

(assert (=> start!130292 (=> (not res!1047527) (not e!852490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130292 (= res!1047527 (validMask!0 mask!2512))))

(assert (=> start!130292 e!852490))

(assert (=> start!130292 true))

(declare-fun array_inv!38074 (array!101642) Bool)

(assert (=> start!130292 (array_inv!38074 a!2804)))

(declare-fun b!1529825 () Bool)

(declare-fun res!1047534 () Bool)

(assert (=> b!1529825 (=> (not res!1047534) (not e!852490))))

(declare-datatypes ((List!35529 0))(
  ( (Nil!35526) (Cons!35525 (h!36961 (_ BitVec 64)) (t!50223 List!35529)) )
))
(declare-fun arrayNoDuplicates!0 (array!101642 (_ BitVec 32) List!35529) Bool)

(assert (=> b!1529825 (= res!1047534 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35526))))

(declare-fun b!1529826 () Bool)

(declare-fun res!1047533 () Bool)

(assert (=> b!1529826 (=> (not res!1047533) (not e!852490))))

(assert (=> b!1529826 (= res!1047533 (and (= (size!49596 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49596 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49596 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529827 () Bool)

(declare-fun res!1047538 () Bool)

(assert (=> b!1529827 (=> (not res!1047538) (not e!852490))))

(assert (=> b!1529827 (= res!1047538 (validKeyInArray!0 (select (arr!49046 a!2804) j!70)))))

(declare-fun b!1529828 () Bool)

(declare-fun res!1047535 () Bool)

(assert (=> b!1529828 (=> (not res!1047535) (not e!852490))))

(assert (=> b!1529828 (= res!1047535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529829 () Bool)

(declare-fun res!1047531 () Bool)

(assert (=> b!1529829 (=> (not res!1047531) (not e!852493))))

(assert (=> b!1529829 (= res!1047531 (= lt!662560 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49046 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49046 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101643 (store (arr!49046 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49596 a!2804)) mask!2512)))))

(declare-fun b!1529830 () Bool)

(declare-fun res!1047537 () Bool)

(assert (=> b!1529830 (=> (not res!1047537) (not e!852490))))

(assert (=> b!1529830 (= res!1047537 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49596 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49596 a!2804))))))

(declare-fun b!1529831 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101642 (_ BitVec 32)) SeekEntryResult!13211)

(assert (=> b!1529831 (= e!852492 (= (seekEntry!0 (select (arr!49046 a!2804) j!70) a!2804 mask!2512) (Found!13211 j!70)))))

(assert (= (and start!130292 res!1047527) b!1529826))

(assert (= (and b!1529826 res!1047533) b!1529821))

(assert (= (and b!1529821 res!1047536) b!1529827))

(assert (= (and b!1529827 res!1047538) b!1529828))

(assert (= (and b!1529828 res!1047535) b!1529825))

(assert (= (and b!1529825 res!1047534) b!1529830))

(assert (= (and b!1529830 res!1047537) b!1529820))

(assert (= (and b!1529820 res!1047530) b!1529824))

(assert (= (and b!1529824 res!1047528) b!1529829))

(assert (= (and b!1529829 res!1047531) b!1529822))

(assert (= (and b!1529822 res!1047532) b!1529831))

(assert (= (and b!1529822 (not res!1047529)) b!1529823))

(declare-fun m!1412787 () Bool)

(assert (=> b!1529829 m!1412787))

(declare-fun m!1412789 () Bool)

(assert (=> b!1529829 m!1412789))

(assert (=> b!1529829 m!1412789))

(declare-fun m!1412791 () Bool)

(assert (=> b!1529829 m!1412791))

(assert (=> b!1529829 m!1412791))

(assert (=> b!1529829 m!1412789))

(declare-fun m!1412793 () Bool)

(assert (=> b!1529829 m!1412793))

(declare-fun m!1412795 () Bool)

(assert (=> start!130292 m!1412795))

(declare-fun m!1412797 () Bool)

(assert (=> start!130292 m!1412797))

(declare-fun m!1412799 () Bool)

(assert (=> b!1529822 m!1412799))

(declare-fun m!1412801 () Bool)

(assert (=> b!1529822 m!1412801))

(assert (=> b!1529822 m!1412787))

(assert (=> b!1529822 m!1412789))

(declare-fun m!1412803 () Bool)

(assert (=> b!1529822 m!1412803))

(assert (=> b!1529831 m!1412799))

(assert (=> b!1529831 m!1412799))

(declare-fun m!1412805 () Bool)

(assert (=> b!1529831 m!1412805))

(declare-fun m!1412807 () Bool)

(assert (=> b!1529825 m!1412807))

(declare-fun m!1412809 () Bool)

(assert (=> b!1529821 m!1412809))

(assert (=> b!1529821 m!1412809))

(declare-fun m!1412811 () Bool)

(assert (=> b!1529821 m!1412811))

(declare-fun m!1412813 () Bool)

(assert (=> b!1529828 m!1412813))

(declare-fun m!1412815 () Bool)

(assert (=> b!1529823 m!1412815))

(assert (=> b!1529824 m!1412799))

(assert (=> b!1529824 m!1412799))

(declare-fun m!1412817 () Bool)

(assert (=> b!1529824 m!1412817))

(assert (=> b!1529820 m!1412799))

(assert (=> b!1529820 m!1412799))

(declare-fun m!1412819 () Bool)

(assert (=> b!1529820 m!1412819))

(assert (=> b!1529820 m!1412819))

(assert (=> b!1529820 m!1412799))

(declare-fun m!1412821 () Bool)

(assert (=> b!1529820 m!1412821))

(assert (=> b!1529827 m!1412799))

(assert (=> b!1529827 m!1412799))

(declare-fun m!1412823 () Bool)

(assert (=> b!1529827 m!1412823))

(push 1)

