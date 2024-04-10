; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129194 () Bool)

(assert start!129194)

(declare-fun b!1516538 () Bool)

(declare-fun res!1036449 () Bool)

(declare-fun e!846197 () Bool)

(assert (=> b!1516538 (=> (not res!1036449) (not e!846197))))

(declare-datatypes ((array!101050 0))(
  ( (array!101051 (arr!48762 (Array (_ BitVec 32) (_ BitVec 64))) (size!49312 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101050)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516538 (= res!1036449 (validKeyInArray!0 (select (arr!48762 a!2804) j!70)))))

(declare-fun b!1516539 () Bool)

(declare-fun res!1036445 () Bool)

(assert (=> b!1516539 (=> (not res!1036445) (not e!846197))))

(declare-datatypes ((List!35245 0))(
  ( (Nil!35242) (Cons!35241 (h!36653 (_ BitVec 64)) (t!49939 List!35245)) )
))
(declare-fun arrayNoDuplicates!0 (array!101050 (_ BitVec 32) List!35245) Bool)

(assert (=> b!1516539 (= res!1036445 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35242))))

(declare-fun b!1516540 () Bool)

(declare-fun res!1036452 () Bool)

(assert (=> b!1516540 (=> (not res!1036452) (not e!846197))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101050 (_ BitVec 32)) Bool)

(assert (=> b!1516540 (= res!1036452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516541 () Bool)

(declare-fun e!846199 () Bool)

(declare-fun e!846198 () Bool)

(assert (=> b!1516541 (= e!846199 e!846198)))

(declare-fun res!1036453 () Bool)

(assert (=> b!1516541 (=> res!1036453 e!846198)))

(declare-fun lt!657442 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1516541 (= res!1036453 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657442 #b00000000000000000000000000000000) (bvsge lt!657442 (size!49312 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516541 (= lt!657442 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1516542 () Bool)

(declare-fun res!1036450 () Bool)

(assert (=> b!1516542 (=> (not res!1036450) (not e!846197))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1516542 (= res!1036450 (and (= (size!49312 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49312 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49312 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1036443 () Bool)

(assert (=> start!129194 (=> (not res!1036443) (not e!846197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129194 (= res!1036443 (validMask!0 mask!2512))))

(assert (=> start!129194 e!846197))

(assert (=> start!129194 true))

(declare-fun array_inv!37790 (array!101050) Bool)

(assert (=> start!129194 (array_inv!37790 a!2804)))

(declare-fun e!846202 () Bool)

(declare-fun b!1516543 () Bool)

(declare-datatypes ((SeekEntryResult!12933 0))(
  ( (MissingZero!12933 (index!54127 (_ BitVec 32))) (Found!12933 (index!54128 (_ BitVec 32))) (Intermediate!12933 (undefined!13745 Bool) (index!54129 (_ BitVec 32)) (x!135819 (_ BitVec 32))) (Undefined!12933) (MissingVacant!12933 (index!54130 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101050 (_ BitVec 32)) SeekEntryResult!12933)

(assert (=> b!1516543 (= e!846202 (= (seekEntry!0 (select (arr!48762 a!2804) j!70) a!2804 mask!2512) (Found!12933 j!70)))))

(declare-fun b!1516544 () Bool)

(declare-fun res!1036441 () Bool)

(assert (=> b!1516544 (=> (not res!1036441) (not e!846197))))

(assert (=> b!1516544 (= res!1036441 (validKeyInArray!0 (select (arr!48762 a!2804) i!961)))))

(declare-fun b!1516545 () Bool)

(declare-fun res!1036447 () Bool)

(declare-fun e!846200 () Bool)

(assert (=> b!1516545 (=> (not res!1036447) (not e!846200))))

(declare-fun lt!657441 () SeekEntryResult!12933)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101050 (_ BitVec 32)) SeekEntryResult!12933)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516545 (= res!1036447 (= lt!657441 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48762 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48762 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101051 (store (arr!48762 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49312 a!2804)) mask!2512)))))

(declare-fun b!1516546 () Bool)

(declare-fun res!1036448 () Bool)

(assert (=> b!1516546 (=> (not res!1036448) (not e!846200))))

(declare-fun lt!657439 () SeekEntryResult!12933)

(assert (=> b!1516546 (= res!1036448 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48762 a!2804) j!70) a!2804 mask!2512) lt!657439))))

(declare-fun b!1516547 () Bool)

(declare-fun res!1036446 () Bool)

(assert (=> b!1516547 (=> (not res!1036446) (not e!846197))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1516547 (= res!1036446 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49312 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49312 a!2804))))))

(declare-fun b!1516548 () Bool)

(assert (=> b!1516548 (= e!846198 true)))

(declare-fun lt!657440 () SeekEntryResult!12933)

(assert (=> b!1516548 (= lt!657440 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657442 (select (arr!48762 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516549 () Bool)

(assert (=> b!1516549 (= e!846200 (not e!846199))))

(declare-fun res!1036444 () Bool)

(assert (=> b!1516549 (=> res!1036444 e!846199)))

(assert (=> b!1516549 (= res!1036444 (or (not (= (select (arr!48762 a!2804) j!70) (select (store (arr!48762 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1516549 e!846202))

(declare-fun res!1036442 () Bool)

(assert (=> b!1516549 (=> (not res!1036442) (not e!846202))))

(assert (=> b!1516549 (= res!1036442 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50734 0))(
  ( (Unit!50735) )
))
(declare-fun lt!657438 () Unit!50734)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101050 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50734)

(assert (=> b!1516549 (= lt!657438 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516550 () Bool)

(assert (=> b!1516550 (= e!846197 e!846200)))

(declare-fun res!1036451 () Bool)

(assert (=> b!1516550 (=> (not res!1036451) (not e!846200))))

(assert (=> b!1516550 (= res!1036451 (= lt!657441 lt!657439))))

(assert (=> b!1516550 (= lt!657439 (Intermediate!12933 false resIndex!21 resX!21))))

(assert (=> b!1516550 (= lt!657441 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48762 a!2804) j!70) mask!2512) (select (arr!48762 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129194 res!1036443) b!1516542))

(assert (= (and b!1516542 res!1036450) b!1516544))

(assert (= (and b!1516544 res!1036441) b!1516538))

(assert (= (and b!1516538 res!1036449) b!1516540))

(assert (= (and b!1516540 res!1036452) b!1516539))

(assert (= (and b!1516539 res!1036445) b!1516547))

(assert (= (and b!1516547 res!1036446) b!1516550))

(assert (= (and b!1516550 res!1036451) b!1516546))

(assert (= (and b!1516546 res!1036448) b!1516545))

(assert (= (and b!1516545 res!1036447) b!1516549))

(assert (= (and b!1516549 res!1036442) b!1516543))

(assert (= (and b!1516549 (not res!1036444)) b!1516541))

(assert (= (and b!1516541 (not res!1036453)) b!1516548))

(declare-fun m!1399805 () Bool)

(assert (=> b!1516550 m!1399805))

(assert (=> b!1516550 m!1399805))

(declare-fun m!1399807 () Bool)

(assert (=> b!1516550 m!1399807))

(assert (=> b!1516550 m!1399807))

(assert (=> b!1516550 m!1399805))

(declare-fun m!1399809 () Bool)

(assert (=> b!1516550 m!1399809))

(assert (=> b!1516549 m!1399805))

(declare-fun m!1399811 () Bool)

(assert (=> b!1516549 m!1399811))

(declare-fun m!1399813 () Bool)

(assert (=> b!1516549 m!1399813))

(declare-fun m!1399815 () Bool)

(assert (=> b!1516549 m!1399815))

(declare-fun m!1399817 () Bool)

(assert (=> b!1516549 m!1399817))

(declare-fun m!1399819 () Bool)

(assert (=> start!129194 m!1399819))

(declare-fun m!1399821 () Bool)

(assert (=> start!129194 m!1399821))

(assert (=> b!1516538 m!1399805))

(assert (=> b!1516538 m!1399805))

(declare-fun m!1399823 () Bool)

(assert (=> b!1516538 m!1399823))

(declare-fun m!1399825 () Bool)

(assert (=> b!1516541 m!1399825))

(assert (=> b!1516546 m!1399805))

(assert (=> b!1516546 m!1399805))

(declare-fun m!1399827 () Bool)

(assert (=> b!1516546 m!1399827))

(declare-fun m!1399829 () Bool)

(assert (=> b!1516540 m!1399829))

(assert (=> b!1516543 m!1399805))

(assert (=> b!1516543 m!1399805))

(declare-fun m!1399831 () Bool)

(assert (=> b!1516543 m!1399831))

(declare-fun m!1399833 () Bool)

(assert (=> b!1516539 m!1399833))

(declare-fun m!1399835 () Bool)

(assert (=> b!1516544 m!1399835))

(assert (=> b!1516544 m!1399835))

(declare-fun m!1399837 () Bool)

(assert (=> b!1516544 m!1399837))

(assert (=> b!1516548 m!1399805))

(assert (=> b!1516548 m!1399805))

(declare-fun m!1399839 () Bool)

(assert (=> b!1516548 m!1399839))

(assert (=> b!1516545 m!1399813))

(assert (=> b!1516545 m!1399815))

(assert (=> b!1516545 m!1399815))

(declare-fun m!1399841 () Bool)

(assert (=> b!1516545 m!1399841))

(assert (=> b!1516545 m!1399841))

(assert (=> b!1516545 m!1399815))

(declare-fun m!1399843 () Bool)

(assert (=> b!1516545 m!1399843))

(check-sat (not b!1516544) (not b!1516538) (not b!1516546) (not b!1516548) (not start!129194) (not b!1516549) (not b!1516539) (not b!1516543) (not b!1516541) (not b!1516545) (not b!1516550) (not b!1516540))
(check-sat)
