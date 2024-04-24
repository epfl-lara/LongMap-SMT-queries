; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129266 () Bool)

(assert start!129266)

(declare-fun b!1513788 () Bool)

(declare-fun e!845156 () Bool)

(declare-fun e!845159 () Bool)

(assert (=> b!1513788 (= e!845156 e!845159)))

(declare-fun res!1032524 () Bool)

(assert (=> b!1513788 (=> (not res!1032524) (not e!845159))))

(declare-datatypes ((SeekEntryResult!12764 0))(
  ( (MissingZero!12764 (index!53451 (_ BitVec 32))) (Found!12764 (index!53452 (_ BitVec 32))) (Intermediate!12764 (undefined!13576 Bool) (index!53453 (_ BitVec 32)) (x!135383 (_ BitVec 32))) (Undefined!12764) (MissingVacant!12764 (index!53454 (_ BitVec 32))) )
))
(declare-fun lt!656228 () SeekEntryResult!12764)

(declare-fun lt!656229 () SeekEntryResult!12764)

(assert (=> b!1513788 (= res!1032524 (= lt!656228 lt!656229))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1513788 (= lt!656229 (Intermediate!12764 false resIndex!21 resX!21))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!100936 0))(
  ( (array!100937 (arr!48700 (Array (_ BitVec 32) (_ BitVec 64))) (size!49251 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100936)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100936 (_ BitVec 32)) SeekEntryResult!12764)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513788 (= lt!656228 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48700 a!2804) j!70) mask!2512) (select (arr!48700 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513789 () Bool)

(declare-fun res!1032521 () Bool)

(assert (=> b!1513789 (=> (not res!1032521) (not e!845156))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513789 (= res!1032521 (validKeyInArray!0 (select (arr!48700 a!2804) i!961)))))

(declare-fun b!1513790 () Bool)

(declare-fun res!1032523 () Bool)

(assert (=> b!1513790 (=> (not res!1032523) (not e!845156))))

(assert (=> b!1513790 (= res!1032523 (and (= (size!49251 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49251 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49251 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513791 () Bool)

(declare-fun e!845155 () Bool)

(declare-fun e!845158 () Bool)

(assert (=> b!1513791 (= e!845155 e!845158)))

(declare-fun res!1032517 () Bool)

(assert (=> b!1513791 (=> res!1032517 e!845158)))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1513791 (= res!1032517 (or (not (= (select (arr!48700 a!2804) j!70) (select (store (arr!48700 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48700 a!2804) index!487) (select (arr!48700 a!2804) j!70)) (not (= (select (arr!48700 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1032518 () Bool)

(assert (=> start!129266 (=> (not res!1032518) (not e!845156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129266 (= res!1032518 (validMask!0 mask!2512))))

(assert (=> start!129266 e!845156))

(assert (=> start!129266 true))

(declare-fun array_inv!37981 (array!100936) Bool)

(assert (=> start!129266 (array_inv!37981 a!2804)))

(declare-fun b!1513792 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100936 (_ BitVec 32)) SeekEntryResult!12764)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100936 (_ BitVec 32)) SeekEntryResult!12764)

(assert (=> b!1513792 (= e!845158 (= (seekEntryOrOpen!0 (select (arr!48700 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48700 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513793 () Bool)

(declare-fun e!845160 () Bool)

(assert (=> b!1513793 (= e!845160 (validKeyInArray!0 (select (store (arr!48700 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(declare-fun b!1513794 () Bool)

(declare-fun res!1032520 () Bool)

(assert (=> b!1513794 (=> (not res!1032520) (not e!845155))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100936 (_ BitVec 32)) SeekEntryResult!12764)

(assert (=> b!1513794 (= res!1032520 (= (seekEntry!0 (select (arr!48700 a!2804) j!70) a!2804 mask!2512) (Found!12764 j!70)))))

(declare-fun b!1513795 () Bool)

(assert (=> b!1513795 (= e!845159 (not e!845160))))

(declare-fun res!1032514 () Bool)

(assert (=> b!1513795 (=> res!1032514 e!845160)))

(assert (=> b!1513795 (= res!1032514 (or (not (= (select (arr!48700 a!2804) j!70) (select (store (arr!48700 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48700 a!2804) index!487) (select (arr!48700 a!2804) j!70)) (not (= (select (arr!48700 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2512 #b00000000000000000000000000000000)))))

(assert (=> b!1513795 e!845155))

(declare-fun res!1032516 () Bool)

(assert (=> b!1513795 (=> (not res!1032516) (not e!845155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100936 (_ BitVec 32)) Bool)

(assert (=> b!1513795 (= res!1032516 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50431 0))(
  ( (Unit!50432) )
))
(declare-fun lt!656230 () Unit!50431)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100936 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50431)

(assert (=> b!1513795 (= lt!656230 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513796 () Bool)

(declare-fun res!1032519 () Bool)

(assert (=> b!1513796 (=> (not res!1032519) (not e!845156))))

(assert (=> b!1513796 (= res!1032519 (validKeyInArray!0 (select (arr!48700 a!2804) j!70)))))

(declare-fun b!1513797 () Bool)

(declare-fun res!1032527 () Bool)

(assert (=> b!1513797 (=> (not res!1032527) (not e!845156))))

(declare-datatypes ((List!35170 0))(
  ( (Nil!35167) (Cons!35166 (h!36593 (_ BitVec 64)) (t!49856 List!35170)) )
))
(declare-fun arrayNoDuplicates!0 (array!100936 (_ BitVec 32) List!35170) Bool)

(assert (=> b!1513797 (= res!1032527 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35167))))

(declare-fun b!1513798 () Bool)

(declare-fun res!1032522 () Bool)

(assert (=> b!1513798 (=> (not res!1032522) (not e!845156))))

(assert (=> b!1513798 (= res!1032522 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49251 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49251 a!2804))))))

(declare-fun b!1513799 () Bool)

(declare-fun res!1032515 () Bool)

(assert (=> b!1513799 (=> (not res!1032515) (not e!845156))))

(assert (=> b!1513799 (= res!1032515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513800 () Bool)

(declare-fun res!1032526 () Bool)

(assert (=> b!1513800 (=> (not res!1032526) (not e!845159))))

(assert (=> b!1513800 (= res!1032526 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48700 a!2804) j!70) a!2804 mask!2512) lt!656229))))

(declare-fun b!1513801 () Bool)

(declare-fun res!1032525 () Bool)

(assert (=> b!1513801 (=> (not res!1032525) (not e!845159))))

(assert (=> b!1513801 (= res!1032525 (= lt!656228 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48700 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48700 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100937 (store (arr!48700 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49251 a!2804)) mask!2512)))))

(assert (= (and start!129266 res!1032518) b!1513790))

(assert (= (and b!1513790 res!1032523) b!1513789))

(assert (= (and b!1513789 res!1032521) b!1513796))

(assert (= (and b!1513796 res!1032519) b!1513799))

(assert (= (and b!1513799 res!1032515) b!1513797))

(assert (= (and b!1513797 res!1032527) b!1513798))

(assert (= (and b!1513798 res!1032522) b!1513788))

(assert (= (and b!1513788 res!1032524) b!1513800))

(assert (= (and b!1513800 res!1032526) b!1513801))

(assert (= (and b!1513801 res!1032525) b!1513795))

(assert (= (and b!1513795 res!1032516) b!1513794))

(assert (= (and b!1513794 res!1032520) b!1513791))

(assert (= (and b!1513791 (not res!1032517)) b!1513792))

(assert (= (and b!1513795 (not res!1032514)) b!1513793))

(declare-fun m!1396485 () Bool)

(assert (=> start!129266 m!1396485))

(declare-fun m!1396487 () Bool)

(assert (=> start!129266 m!1396487))

(declare-fun m!1396489 () Bool)

(assert (=> b!1513791 m!1396489))

(declare-fun m!1396491 () Bool)

(assert (=> b!1513791 m!1396491))

(declare-fun m!1396493 () Bool)

(assert (=> b!1513791 m!1396493))

(declare-fun m!1396495 () Bool)

(assert (=> b!1513791 m!1396495))

(assert (=> b!1513801 m!1396491))

(assert (=> b!1513801 m!1396493))

(assert (=> b!1513801 m!1396493))

(declare-fun m!1396497 () Bool)

(assert (=> b!1513801 m!1396497))

(assert (=> b!1513801 m!1396497))

(assert (=> b!1513801 m!1396493))

(declare-fun m!1396499 () Bool)

(assert (=> b!1513801 m!1396499))

(assert (=> b!1513796 m!1396489))

(assert (=> b!1513796 m!1396489))

(declare-fun m!1396501 () Bool)

(assert (=> b!1513796 m!1396501))

(assert (=> b!1513793 m!1396491))

(assert (=> b!1513793 m!1396493))

(assert (=> b!1513793 m!1396493))

(declare-fun m!1396503 () Bool)

(assert (=> b!1513793 m!1396503))

(assert (=> b!1513794 m!1396489))

(assert (=> b!1513794 m!1396489))

(declare-fun m!1396505 () Bool)

(assert (=> b!1513794 m!1396505))

(declare-fun m!1396507 () Bool)

(assert (=> b!1513799 m!1396507))

(assert (=> b!1513792 m!1396489))

(assert (=> b!1513792 m!1396489))

(declare-fun m!1396509 () Bool)

(assert (=> b!1513792 m!1396509))

(assert (=> b!1513792 m!1396489))

(declare-fun m!1396511 () Bool)

(assert (=> b!1513792 m!1396511))

(assert (=> b!1513795 m!1396489))

(declare-fun m!1396513 () Bool)

(assert (=> b!1513795 m!1396513))

(assert (=> b!1513795 m!1396491))

(assert (=> b!1513795 m!1396495))

(assert (=> b!1513795 m!1396493))

(declare-fun m!1396515 () Bool)

(assert (=> b!1513795 m!1396515))

(assert (=> b!1513788 m!1396489))

(assert (=> b!1513788 m!1396489))

(declare-fun m!1396517 () Bool)

(assert (=> b!1513788 m!1396517))

(assert (=> b!1513788 m!1396517))

(assert (=> b!1513788 m!1396489))

(declare-fun m!1396519 () Bool)

(assert (=> b!1513788 m!1396519))

(declare-fun m!1396521 () Bool)

(assert (=> b!1513789 m!1396521))

(assert (=> b!1513789 m!1396521))

(declare-fun m!1396523 () Bool)

(assert (=> b!1513789 m!1396523))

(assert (=> b!1513800 m!1396489))

(assert (=> b!1513800 m!1396489))

(declare-fun m!1396525 () Bool)

(assert (=> b!1513800 m!1396525))

(declare-fun m!1396527 () Bool)

(assert (=> b!1513797 m!1396527))

(check-sat (not b!1513792) (not b!1513797) (not b!1513794) (not b!1513793) (not b!1513789) (not b!1513800) (not b!1513796) (not b!1513788) (not b!1513801) (not b!1513799) (not b!1513795) (not start!129266))
(check-sat)
