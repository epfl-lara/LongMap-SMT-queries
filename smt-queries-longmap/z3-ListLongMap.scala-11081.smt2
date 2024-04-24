; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129674 () Bool)

(assert start!129674)

(declare-fun res!1039657 () Bool)

(declare-fun e!848664 () Bool)

(assert (=> start!129674 (=> (not res!1039657) (not e!848664))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129674 (= res!1039657 (validMask!0 mask!2512))))

(assert (=> start!129674 e!848664))

(assert (=> start!129674 true))

(declare-datatypes ((array!101293 0))(
  ( (array!101294 (arr!48877 (Array (_ BitVec 32) (_ BitVec 64))) (size!49428 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101293)

(declare-fun array_inv!38158 (array!101293) Bool)

(assert (=> start!129674 (array_inv!38158 a!2804)))

(declare-fun b!1521108 () Bool)

(declare-fun e!848666 () Bool)

(assert (=> b!1521108 (= e!848664 e!848666)))

(declare-fun res!1039660 () Bool)

(assert (=> b!1521108 (=> (not res!1039660) (not e!848666))))

(declare-datatypes ((SeekEntryResult!12941 0))(
  ( (MissingZero!12941 (index!54159 (_ BitVec 32))) (Found!12941 (index!54160 (_ BitVec 32))) (Intermediate!12941 (undefined!13753 Bool) (index!54161 (_ BitVec 32)) (x!136038 (_ BitVec 32))) (Undefined!12941) (MissingVacant!12941 (index!54162 (_ BitVec 32))) )
))
(declare-fun lt!659246 () SeekEntryResult!12941)

(declare-fun lt!659244 () SeekEntryResult!12941)

(assert (=> b!1521108 (= res!1039660 (= lt!659246 lt!659244))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1521108 (= lt!659244 (Intermediate!12941 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101293 (_ BitVec 32)) SeekEntryResult!12941)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521108 (= lt!659246 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48877 a!2804) j!70) mask!2512) (select (arr!48877 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521109 () Bool)

(declare-fun e!848661 () Bool)

(assert (=> b!1521109 (= e!848661 true)))

(declare-fun lt!659247 () array!101293)

(declare-fun lt!659248 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101293 (_ BitVec 32)) SeekEntryResult!12941)

(assert (=> b!1521109 (= (seekEntryOrOpen!0 (select (arr!48877 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!659248 lt!659247 mask!2512))))

(declare-fun lt!659245 () (_ BitVec 32))

(declare-datatypes ((Unit!50785 0))(
  ( (Unit!50786) )
))
(declare-fun lt!659242 () Unit!50785)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101293 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50785)

(assert (=> b!1521109 (= lt!659242 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!659245 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1521110 () Bool)

(declare-fun res!1039653 () Bool)

(assert (=> b!1521110 (=> (not res!1039653) (not e!848666))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1521110 (= res!1039653 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48877 a!2804) j!70) a!2804 mask!2512) lt!659244))))

(declare-fun b!1521111 () Bool)

(declare-fun res!1039661 () Bool)

(assert (=> b!1521111 (=> (not res!1039661) (not e!848664))))

(assert (=> b!1521111 (= res!1039661 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49428 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49428 a!2804))))))

(declare-fun b!1521112 () Bool)

(declare-fun res!1039663 () Bool)

(assert (=> b!1521112 (=> (not res!1039663) (not e!848664))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521112 (= res!1039663 (validKeyInArray!0 (select (arr!48877 a!2804) j!70)))))

(declare-fun b!1521113 () Bool)

(declare-fun e!848665 () Bool)

(declare-fun e!848667 () Bool)

(assert (=> b!1521113 (= e!848665 (not e!848667))))

(declare-fun res!1039652 () Bool)

(assert (=> b!1521113 (=> res!1039652 e!848667)))

(assert (=> b!1521113 (= res!1039652 (or (not (= (select (arr!48877 a!2804) j!70) lt!659248)) (= x!534 resX!21)))))

(declare-fun e!848662 () Bool)

(assert (=> b!1521113 e!848662))

(declare-fun res!1039664 () Bool)

(assert (=> b!1521113 (=> (not res!1039664) (not e!848662))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101293 (_ BitVec 32)) Bool)

(assert (=> b!1521113 (= res!1039664 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!659243 () Unit!50785)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101293 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50785)

(assert (=> b!1521113 (= lt!659243 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1521114 () Bool)

(declare-fun res!1039656 () Bool)

(assert (=> b!1521114 (=> res!1039656 e!848661)))

(assert (=> b!1521114 (= res!1039656 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!659245 (select (arr!48877 a!2804) j!70) a!2804 mask!2512) lt!659244)))))

(declare-fun b!1521115 () Bool)

(assert (=> b!1521115 (= e!848666 e!848665)))

(declare-fun res!1039659 () Bool)

(assert (=> b!1521115 (=> (not res!1039659) (not e!848665))))

(assert (=> b!1521115 (= res!1039659 (= lt!659246 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!659248 mask!2512) lt!659248 lt!659247 mask!2512)))))

(assert (=> b!1521115 (= lt!659248 (select (store (arr!48877 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1521115 (= lt!659247 (array!101294 (store (arr!48877 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49428 a!2804)))))

(declare-fun b!1521116 () Bool)

(declare-fun res!1039662 () Bool)

(assert (=> b!1521116 (=> (not res!1039662) (not e!848664))))

(assert (=> b!1521116 (= res!1039662 (validKeyInArray!0 (select (arr!48877 a!2804) i!961)))))

(declare-fun b!1521117 () Bool)

(declare-fun res!1039651 () Bool)

(assert (=> b!1521117 (=> (not res!1039651) (not e!848664))))

(assert (=> b!1521117 (= res!1039651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1521118 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101293 (_ BitVec 32)) SeekEntryResult!12941)

(assert (=> b!1521118 (= e!848662 (= (seekEntry!0 (select (arr!48877 a!2804) j!70) a!2804 mask!2512) (Found!12941 j!70)))))

(declare-fun b!1521119 () Bool)

(assert (=> b!1521119 (= e!848667 e!848661)))

(declare-fun res!1039658 () Bool)

(assert (=> b!1521119 (=> res!1039658 e!848661)))

(assert (=> b!1521119 (= res!1039658 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!659245 #b00000000000000000000000000000000) (bvsge lt!659245 (size!49428 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521119 (= lt!659245 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1521120 () Bool)

(declare-fun res!1039655 () Bool)

(assert (=> b!1521120 (=> (not res!1039655) (not e!848664))))

(assert (=> b!1521120 (= res!1039655 (and (= (size!49428 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49428 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49428 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521121 () Bool)

(declare-fun res!1039654 () Bool)

(assert (=> b!1521121 (=> (not res!1039654) (not e!848664))))

(declare-datatypes ((List!35347 0))(
  ( (Nil!35344) (Cons!35343 (h!36773 (_ BitVec 64)) (t!50033 List!35347)) )
))
(declare-fun arrayNoDuplicates!0 (array!101293 (_ BitVec 32) List!35347) Bool)

(assert (=> b!1521121 (= res!1039654 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35344))))

(assert (= (and start!129674 res!1039657) b!1521120))

(assert (= (and b!1521120 res!1039655) b!1521116))

(assert (= (and b!1521116 res!1039662) b!1521112))

(assert (= (and b!1521112 res!1039663) b!1521117))

(assert (= (and b!1521117 res!1039651) b!1521121))

(assert (= (and b!1521121 res!1039654) b!1521111))

(assert (= (and b!1521111 res!1039661) b!1521108))

(assert (= (and b!1521108 res!1039660) b!1521110))

(assert (= (and b!1521110 res!1039653) b!1521115))

(assert (= (and b!1521115 res!1039659) b!1521113))

(assert (= (and b!1521113 res!1039664) b!1521118))

(assert (= (and b!1521113 (not res!1039652)) b!1521119))

(assert (= (and b!1521119 (not res!1039658)) b!1521114))

(assert (= (and b!1521114 (not res!1039656)) b!1521109))

(declare-fun m!1404321 () Bool)

(assert (=> b!1521119 m!1404321))

(declare-fun m!1404323 () Bool)

(assert (=> b!1521118 m!1404323))

(assert (=> b!1521118 m!1404323))

(declare-fun m!1404325 () Bool)

(assert (=> b!1521118 m!1404325))

(declare-fun m!1404327 () Bool)

(assert (=> b!1521116 m!1404327))

(assert (=> b!1521116 m!1404327))

(declare-fun m!1404329 () Bool)

(assert (=> b!1521116 m!1404329))

(declare-fun m!1404331 () Bool)

(assert (=> b!1521117 m!1404331))

(assert (=> b!1521109 m!1404323))

(assert (=> b!1521109 m!1404323))

(declare-fun m!1404333 () Bool)

(assert (=> b!1521109 m!1404333))

(declare-fun m!1404335 () Bool)

(assert (=> b!1521109 m!1404335))

(declare-fun m!1404337 () Bool)

(assert (=> b!1521109 m!1404337))

(declare-fun m!1404339 () Bool)

(assert (=> start!129674 m!1404339))

(declare-fun m!1404341 () Bool)

(assert (=> start!129674 m!1404341))

(declare-fun m!1404343 () Bool)

(assert (=> b!1521121 m!1404343))

(assert (=> b!1521112 m!1404323))

(assert (=> b!1521112 m!1404323))

(declare-fun m!1404345 () Bool)

(assert (=> b!1521112 m!1404345))

(assert (=> b!1521113 m!1404323))

(declare-fun m!1404347 () Bool)

(assert (=> b!1521113 m!1404347))

(declare-fun m!1404349 () Bool)

(assert (=> b!1521113 m!1404349))

(assert (=> b!1521110 m!1404323))

(assert (=> b!1521110 m!1404323))

(declare-fun m!1404351 () Bool)

(assert (=> b!1521110 m!1404351))

(assert (=> b!1521114 m!1404323))

(assert (=> b!1521114 m!1404323))

(declare-fun m!1404353 () Bool)

(assert (=> b!1521114 m!1404353))

(assert (=> b!1521108 m!1404323))

(assert (=> b!1521108 m!1404323))

(declare-fun m!1404355 () Bool)

(assert (=> b!1521108 m!1404355))

(assert (=> b!1521108 m!1404355))

(assert (=> b!1521108 m!1404323))

(declare-fun m!1404357 () Bool)

(assert (=> b!1521108 m!1404357))

(declare-fun m!1404359 () Bool)

(assert (=> b!1521115 m!1404359))

(assert (=> b!1521115 m!1404359))

(declare-fun m!1404361 () Bool)

(assert (=> b!1521115 m!1404361))

(declare-fun m!1404363 () Bool)

(assert (=> b!1521115 m!1404363))

(declare-fun m!1404365 () Bool)

(assert (=> b!1521115 m!1404365))

(check-sat (not b!1521113) (not b!1521119) (not b!1521110) (not b!1521108) (not b!1521118) (not start!129674) (not b!1521121) (not b!1521114) (not b!1521117) (not b!1521116) (not b!1521115) (not b!1521109) (not b!1521112))
(check-sat)
