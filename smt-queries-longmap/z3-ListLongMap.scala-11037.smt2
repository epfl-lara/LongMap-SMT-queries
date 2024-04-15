; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129002 () Bool)

(assert start!129002)

(declare-fun b!1513443 () Bool)

(declare-fun res!1033552 () Bool)

(declare-fun e!844626 () Bool)

(assert (=> b!1513443 (=> (not res!1033552) (not e!844626))))

(declare-datatypes ((array!100858 0))(
  ( (array!100859 (arr!48667 (Array (_ BitVec 32) (_ BitVec 64))) (size!49219 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100858)

(declare-datatypes ((List!35228 0))(
  ( (Nil!35225) (Cons!35224 (h!36637 (_ BitVec 64)) (t!49914 List!35228)) )
))
(declare-fun arrayNoDuplicates!0 (array!100858 (_ BitVec 32) List!35228) Bool)

(assert (=> b!1513443 (= res!1033552 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35225))))

(declare-fun b!1513444 () Bool)

(declare-fun e!844630 () Bool)

(declare-fun e!844628 () Bool)

(assert (=> b!1513444 (= e!844630 e!844628)))

(declare-fun res!1033555 () Bool)

(assert (=> b!1513444 (=> (not res!1033555) (not e!844628))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12861 0))(
  ( (MissingZero!12861 (index!53839 (_ BitVec 32))) (Found!12861 (index!53840 (_ BitVec 32))) (Intermediate!12861 (undefined!13673 Bool) (index!53841 (_ BitVec 32)) (x!135557 (_ BitVec 32))) (Undefined!12861) (MissingVacant!12861 (index!53842 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100858 (_ BitVec 32)) SeekEntryResult!12861)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100858 (_ BitVec 32)) SeekEntryResult!12861)

(assert (=> b!1513444 (= res!1033555 (= (seekEntryOrOpen!0 (select (arr!48667 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48667 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1513445 () Bool)

(declare-fun res!1033558 () Bool)

(declare-fun e!844631 () Bool)

(assert (=> b!1513445 (=> (not res!1033558) (not e!844631))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100858 (_ BitVec 32)) SeekEntryResult!12861)

(assert (=> b!1513445 (= res!1033558 (= (seekEntry!0 (select (arr!48667 a!2804) j!70) a!2804 mask!2512) (Found!12861 j!70)))))

(declare-fun res!1033557 () Bool)

(assert (=> start!129002 (=> (not res!1033557) (not e!844626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129002 (= res!1033557 (validMask!0 mask!2512))))

(assert (=> start!129002 e!844626))

(assert (=> start!129002 true))

(declare-fun array_inv!37900 (array!100858) Bool)

(assert (=> start!129002 (array_inv!37900 a!2804)))

(declare-fun b!1513446 () Bool)

(declare-fun res!1033562 () Bool)

(declare-fun e!844627 () Bool)

(assert (=> b!1513446 (=> (not res!1033562) (not e!844627))))

(declare-fun lt!655805 () SeekEntryResult!12861)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100858 (_ BitVec 32)) SeekEntryResult!12861)

(assert (=> b!1513446 (= res!1033562 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48667 a!2804) j!70) a!2804 mask!2512) lt!655805))))

(declare-fun b!1513447 () Bool)

(declare-fun res!1033556 () Bool)

(assert (=> b!1513447 (=> (not res!1033556) (not e!844626))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1513447 (= res!1033556 (and (= (size!49219 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49219 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49219 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513448 () Bool)

(declare-fun res!1033559 () Bool)

(assert (=> b!1513448 (=> (not res!1033559) (not e!844626))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513448 (= res!1033559 (validKeyInArray!0 (select (arr!48667 a!2804) i!961)))))

(declare-fun b!1513449 () Bool)

(declare-fun e!844632 () Bool)

(assert (=> b!1513449 (= e!844632 (not true))))

(assert (=> b!1513449 e!844631))

(declare-fun res!1033560 () Bool)

(assert (=> b!1513449 (=> (not res!1033560) (not e!844631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100858 (_ BitVec 32)) Bool)

(assert (=> b!1513449 (= res!1033560 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50429 0))(
  ( (Unit!50430) )
))
(declare-fun lt!655808 () Unit!50429)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100858 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50429)

(assert (=> b!1513449 (= lt!655808 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun lt!655809 () (_ BitVec 64))

(declare-fun b!1513450 () Bool)

(declare-fun lt!655806 () array!100858)

(assert (=> b!1513450 (= e!844628 (= (seekEntryOrOpen!0 lt!655809 lt!655806 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!655809 lt!655806 mask!2512)))))

(declare-fun b!1513451 () Bool)

(assert (=> b!1513451 (= e!844626 e!844627)))

(declare-fun res!1033563 () Bool)

(assert (=> b!1513451 (=> (not res!1033563) (not e!844627))))

(declare-fun lt!655807 () SeekEntryResult!12861)

(assert (=> b!1513451 (= res!1033563 (= lt!655807 lt!655805))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1513451 (= lt!655805 (Intermediate!12861 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513451 (= lt!655807 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48667 a!2804) j!70) mask!2512) (select (arr!48667 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513452 () Bool)

(assert (=> b!1513452 (= e!844631 e!844630)))

(declare-fun res!1033553 () Bool)

(assert (=> b!1513452 (=> res!1033553 e!844630)))

(assert (=> b!1513452 (= res!1033553 (or (not (= (select (arr!48667 a!2804) j!70) lt!655809)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48667 a!2804) index!487) (select (arr!48667 a!2804) j!70)) (not (= (select (arr!48667 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1513453 () Bool)

(assert (=> b!1513453 (= e!844627 e!844632)))

(declare-fun res!1033565 () Bool)

(assert (=> b!1513453 (=> (not res!1033565) (not e!844632))))

(assert (=> b!1513453 (= res!1033565 (= lt!655807 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655809 mask!2512) lt!655809 lt!655806 mask!2512)))))

(assert (=> b!1513453 (= lt!655809 (select (store (arr!48667 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513453 (= lt!655806 (array!100859 (store (arr!48667 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49219 a!2804)))))

(declare-fun b!1513454 () Bool)

(declare-fun res!1033554 () Bool)

(assert (=> b!1513454 (=> (not res!1033554) (not e!844626))))

(assert (=> b!1513454 (= res!1033554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513455 () Bool)

(declare-fun res!1033561 () Bool)

(assert (=> b!1513455 (=> (not res!1033561) (not e!844626))))

(assert (=> b!1513455 (= res!1033561 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49219 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49219 a!2804))))))

(declare-fun b!1513456 () Bool)

(declare-fun res!1033564 () Bool)

(assert (=> b!1513456 (=> (not res!1033564) (not e!844626))))

(assert (=> b!1513456 (= res!1033564 (validKeyInArray!0 (select (arr!48667 a!2804) j!70)))))

(assert (= (and start!129002 res!1033557) b!1513447))

(assert (= (and b!1513447 res!1033556) b!1513448))

(assert (= (and b!1513448 res!1033559) b!1513456))

(assert (= (and b!1513456 res!1033564) b!1513454))

(assert (= (and b!1513454 res!1033554) b!1513443))

(assert (= (and b!1513443 res!1033552) b!1513455))

(assert (= (and b!1513455 res!1033561) b!1513451))

(assert (= (and b!1513451 res!1033563) b!1513446))

(assert (= (and b!1513446 res!1033562) b!1513453))

(assert (= (and b!1513453 res!1033565) b!1513449))

(assert (= (and b!1513449 res!1033560) b!1513445))

(assert (= (and b!1513445 res!1033558) b!1513452))

(assert (= (and b!1513452 (not res!1033553)) b!1513444))

(assert (= (and b!1513444 res!1033555) b!1513450))

(declare-fun m!1395767 () Bool)

(assert (=> b!1513454 m!1395767))

(declare-fun m!1395769 () Bool)

(assert (=> b!1513452 m!1395769))

(declare-fun m!1395771 () Bool)

(assert (=> b!1513452 m!1395771))

(declare-fun m!1395773 () Bool)

(assert (=> b!1513443 m!1395773))

(assert (=> b!1513446 m!1395769))

(assert (=> b!1513446 m!1395769))

(declare-fun m!1395775 () Bool)

(assert (=> b!1513446 m!1395775))

(declare-fun m!1395777 () Bool)

(assert (=> b!1513449 m!1395777))

(declare-fun m!1395779 () Bool)

(assert (=> b!1513449 m!1395779))

(declare-fun m!1395781 () Bool)

(assert (=> start!129002 m!1395781))

(declare-fun m!1395783 () Bool)

(assert (=> start!129002 m!1395783))

(assert (=> b!1513451 m!1395769))

(assert (=> b!1513451 m!1395769))

(declare-fun m!1395785 () Bool)

(assert (=> b!1513451 m!1395785))

(assert (=> b!1513451 m!1395785))

(assert (=> b!1513451 m!1395769))

(declare-fun m!1395787 () Bool)

(assert (=> b!1513451 m!1395787))

(declare-fun m!1395789 () Bool)

(assert (=> b!1513453 m!1395789))

(assert (=> b!1513453 m!1395789))

(declare-fun m!1395791 () Bool)

(assert (=> b!1513453 m!1395791))

(declare-fun m!1395793 () Bool)

(assert (=> b!1513453 m!1395793))

(declare-fun m!1395795 () Bool)

(assert (=> b!1513453 m!1395795))

(assert (=> b!1513444 m!1395769))

(assert (=> b!1513444 m!1395769))

(declare-fun m!1395797 () Bool)

(assert (=> b!1513444 m!1395797))

(assert (=> b!1513444 m!1395769))

(declare-fun m!1395799 () Bool)

(assert (=> b!1513444 m!1395799))

(assert (=> b!1513445 m!1395769))

(assert (=> b!1513445 m!1395769))

(declare-fun m!1395801 () Bool)

(assert (=> b!1513445 m!1395801))

(assert (=> b!1513456 m!1395769))

(assert (=> b!1513456 m!1395769))

(declare-fun m!1395803 () Bool)

(assert (=> b!1513456 m!1395803))

(declare-fun m!1395805 () Bool)

(assert (=> b!1513450 m!1395805))

(declare-fun m!1395807 () Bool)

(assert (=> b!1513450 m!1395807))

(declare-fun m!1395809 () Bool)

(assert (=> b!1513448 m!1395809))

(assert (=> b!1513448 m!1395809))

(declare-fun m!1395811 () Bool)

(assert (=> b!1513448 m!1395811))

(check-sat (not b!1513450) (not b!1513444) (not b!1513445) (not b!1513453) (not b!1513451) (not b!1513448) (not start!129002) (not b!1513456) (not b!1513454) (not b!1513449) (not b!1513446) (not b!1513443))
(check-sat)
