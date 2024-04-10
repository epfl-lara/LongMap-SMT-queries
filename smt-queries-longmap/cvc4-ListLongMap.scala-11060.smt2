; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129196 () Bool)

(assert start!129196)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun b!1516577 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101052 0))(
  ( (array!101053 (arr!48763 (Array (_ BitVec 32) (_ BitVec 64))) (size!49313 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101052)

(declare-fun e!846218 () Bool)

(declare-datatypes ((SeekEntryResult!12934 0))(
  ( (MissingZero!12934 (index!54131 (_ BitVec 32))) (Found!12934 (index!54132 (_ BitVec 32))) (Intermediate!12934 (undefined!13746 Bool) (index!54133 (_ BitVec 32)) (x!135820 (_ BitVec 32))) (Undefined!12934) (MissingVacant!12934 (index!54134 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101052 (_ BitVec 32)) SeekEntryResult!12934)

(assert (=> b!1516577 (= e!846218 (= (seekEntry!0 (select (arr!48763 a!2804) j!70) a!2804 mask!2512) (Found!12934 j!70)))))

(declare-fun b!1516578 () Bool)

(declare-fun res!1036481 () Bool)

(declare-fun e!846215 () Bool)

(assert (=> b!1516578 (=> (not res!1036481) (not e!846215))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516578 (= res!1036481 (validKeyInArray!0 (select (arr!48763 a!2804) j!70)))))

(declare-fun b!1516579 () Bool)

(declare-fun e!846220 () Bool)

(assert (=> b!1516579 (= e!846215 e!846220)))

(declare-fun res!1036490 () Bool)

(assert (=> b!1516579 (=> (not res!1036490) (not e!846220))))

(declare-fun lt!657454 () SeekEntryResult!12934)

(declare-fun lt!657455 () SeekEntryResult!12934)

(assert (=> b!1516579 (= res!1036490 (= lt!657454 lt!657455))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1516579 (= lt!657455 (Intermediate!12934 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101052 (_ BitVec 32)) SeekEntryResult!12934)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516579 (= lt!657454 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48763 a!2804) j!70) mask!2512) (select (arr!48763 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1036489 () Bool)

(assert (=> start!129196 (=> (not res!1036489) (not e!846215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129196 (= res!1036489 (validMask!0 mask!2512))))

(assert (=> start!129196 e!846215))

(assert (=> start!129196 true))

(declare-fun array_inv!37791 (array!101052) Bool)

(assert (=> start!129196 (array_inv!37791 a!2804)))

(declare-fun b!1516580 () Bool)

(declare-fun res!1036482 () Bool)

(assert (=> b!1516580 (=> (not res!1036482) (not e!846215))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1516580 (= res!1036482 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49313 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49313 a!2804))))))

(declare-fun b!1516581 () Bool)

(declare-fun e!846217 () Bool)

(assert (=> b!1516581 (= e!846217 true)))

(declare-fun lt!657453 () (_ BitVec 32))

(declare-fun lt!657457 () SeekEntryResult!12934)

(assert (=> b!1516581 (= lt!657457 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657453 (select (arr!48763 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516582 () Bool)

(declare-fun res!1036485 () Bool)

(assert (=> b!1516582 (=> (not res!1036485) (not e!846215))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1516582 (= res!1036485 (validKeyInArray!0 (select (arr!48763 a!2804) i!961)))))

(declare-fun b!1516583 () Bool)

(declare-fun res!1036480 () Bool)

(assert (=> b!1516583 (=> (not res!1036480) (not e!846215))))

(assert (=> b!1516583 (= res!1036480 (and (= (size!49313 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49313 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49313 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516584 () Bool)

(declare-fun res!1036488 () Bool)

(assert (=> b!1516584 (=> (not res!1036488) (not e!846220))))

(assert (=> b!1516584 (= res!1036488 (= lt!657454 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48763 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48763 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101053 (store (arr!48763 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49313 a!2804)) mask!2512)))))

(declare-fun b!1516585 () Bool)

(declare-fun res!1036487 () Bool)

(assert (=> b!1516585 (=> (not res!1036487) (not e!846215))))

(declare-datatypes ((List!35246 0))(
  ( (Nil!35243) (Cons!35242 (h!36654 (_ BitVec 64)) (t!49940 List!35246)) )
))
(declare-fun arrayNoDuplicates!0 (array!101052 (_ BitVec 32) List!35246) Bool)

(assert (=> b!1516585 (= res!1036487 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35243))))

(declare-fun b!1516586 () Bool)

(declare-fun res!1036492 () Bool)

(assert (=> b!1516586 (=> (not res!1036492) (not e!846220))))

(assert (=> b!1516586 (= res!1036492 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48763 a!2804) j!70) a!2804 mask!2512) lt!657455))))

(declare-fun b!1516587 () Bool)

(declare-fun e!846219 () Bool)

(assert (=> b!1516587 (= e!846219 e!846217)))

(declare-fun res!1036484 () Bool)

(assert (=> b!1516587 (=> res!1036484 e!846217)))

(assert (=> b!1516587 (= res!1036484 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657453 #b00000000000000000000000000000000) (bvsge lt!657453 (size!49313 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516587 (= lt!657453 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1516588 () Bool)

(assert (=> b!1516588 (= e!846220 (not e!846219))))

(declare-fun res!1036486 () Bool)

(assert (=> b!1516588 (=> res!1036486 e!846219)))

(assert (=> b!1516588 (= res!1036486 (or (not (= (select (arr!48763 a!2804) j!70) (select (store (arr!48763 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1516588 e!846218))

(declare-fun res!1036491 () Bool)

(assert (=> b!1516588 (=> (not res!1036491) (not e!846218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101052 (_ BitVec 32)) Bool)

(assert (=> b!1516588 (= res!1036491 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50736 0))(
  ( (Unit!50737) )
))
(declare-fun lt!657456 () Unit!50736)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101052 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50736)

(assert (=> b!1516588 (= lt!657456 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516589 () Bool)

(declare-fun res!1036483 () Bool)

(assert (=> b!1516589 (=> (not res!1036483) (not e!846215))))

(assert (=> b!1516589 (= res!1036483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129196 res!1036489) b!1516583))

(assert (= (and b!1516583 res!1036480) b!1516582))

(assert (= (and b!1516582 res!1036485) b!1516578))

(assert (= (and b!1516578 res!1036481) b!1516589))

(assert (= (and b!1516589 res!1036483) b!1516585))

(assert (= (and b!1516585 res!1036487) b!1516580))

(assert (= (and b!1516580 res!1036482) b!1516579))

(assert (= (and b!1516579 res!1036490) b!1516586))

(assert (= (and b!1516586 res!1036492) b!1516584))

(assert (= (and b!1516584 res!1036488) b!1516588))

(assert (= (and b!1516588 res!1036491) b!1516577))

(assert (= (and b!1516588 (not res!1036486)) b!1516587))

(assert (= (and b!1516587 (not res!1036484)) b!1516581))

(declare-fun m!1399845 () Bool)

(assert (=> b!1516585 m!1399845))

(declare-fun m!1399847 () Bool)

(assert (=> b!1516588 m!1399847))

(declare-fun m!1399849 () Bool)

(assert (=> b!1516588 m!1399849))

(declare-fun m!1399851 () Bool)

(assert (=> b!1516588 m!1399851))

(declare-fun m!1399853 () Bool)

(assert (=> b!1516588 m!1399853))

(declare-fun m!1399855 () Bool)

(assert (=> b!1516588 m!1399855))

(assert (=> b!1516586 m!1399847))

(assert (=> b!1516586 m!1399847))

(declare-fun m!1399857 () Bool)

(assert (=> b!1516586 m!1399857))

(assert (=> b!1516579 m!1399847))

(assert (=> b!1516579 m!1399847))

(declare-fun m!1399859 () Bool)

(assert (=> b!1516579 m!1399859))

(assert (=> b!1516579 m!1399859))

(assert (=> b!1516579 m!1399847))

(declare-fun m!1399861 () Bool)

(assert (=> b!1516579 m!1399861))

(assert (=> b!1516584 m!1399851))

(assert (=> b!1516584 m!1399853))

(assert (=> b!1516584 m!1399853))

(declare-fun m!1399863 () Bool)

(assert (=> b!1516584 m!1399863))

(assert (=> b!1516584 m!1399863))

(assert (=> b!1516584 m!1399853))

(declare-fun m!1399865 () Bool)

(assert (=> b!1516584 m!1399865))

(declare-fun m!1399867 () Bool)

(assert (=> start!129196 m!1399867))

(declare-fun m!1399869 () Bool)

(assert (=> start!129196 m!1399869))

(declare-fun m!1399871 () Bool)

(assert (=> b!1516582 m!1399871))

(assert (=> b!1516582 m!1399871))

(declare-fun m!1399873 () Bool)

(assert (=> b!1516582 m!1399873))

(assert (=> b!1516577 m!1399847))

(assert (=> b!1516577 m!1399847))

(declare-fun m!1399875 () Bool)

(assert (=> b!1516577 m!1399875))

(declare-fun m!1399877 () Bool)

(assert (=> b!1516589 m!1399877))

(assert (=> b!1516578 m!1399847))

(assert (=> b!1516578 m!1399847))

(declare-fun m!1399879 () Bool)

(assert (=> b!1516578 m!1399879))

(declare-fun m!1399881 () Bool)

(assert (=> b!1516587 m!1399881))

(assert (=> b!1516581 m!1399847))

(assert (=> b!1516581 m!1399847))

(declare-fun m!1399883 () Bool)

(assert (=> b!1516581 m!1399883))

(push 1)

(assert (not b!1516586))

