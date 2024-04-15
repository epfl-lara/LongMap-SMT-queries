; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129008 () Bool)

(assert start!129008)

(declare-fun b!1513569 () Bool)

(declare-fun res!1033682 () Bool)

(declare-fun e!844692 () Bool)

(assert (=> b!1513569 (=> (not res!1033682) (not e!844692))))

(declare-datatypes ((array!100864 0))(
  ( (array!100865 (arr!48670 (Array (_ BitVec 32) (_ BitVec 64))) (size!49222 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100864)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513569 (= res!1033682 (validKeyInArray!0 (select (arr!48670 a!2804) j!70)))))

(declare-fun b!1513570 () Bool)

(declare-fun e!844689 () Bool)

(assert (=> b!1513570 (= e!844692 e!844689)))

(declare-fun res!1033687 () Bool)

(assert (=> b!1513570 (=> (not res!1033687) (not e!844689))))

(declare-datatypes ((SeekEntryResult!12864 0))(
  ( (MissingZero!12864 (index!53851 (_ BitVec 32))) (Found!12864 (index!53852 (_ BitVec 32))) (Intermediate!12864 (undefined!13676 Bool) (index!53853 (_ BitVec 32)) (x!135568 (_ BitVec 32))) (Undefined!12864) (MissingVacant!12864 (index!53854 (_ BitVec 32))) )
))
(declare-fun lt!655850 () SeekEntryResult!12864)

(declare-fun lt!655852 () SeekEntryResult!12864)

(assert (=> b!1513570 (= res!1033687 (= lt!655850 lt!655852))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1513570 (= lt!655852 (Intermediate!12864 false resIndex!21 resX!21))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100864 (_ BitVec 32)) SeekEntryResult!12864)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1513570 (= lt!655850 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48670 a!2804) j!70) mask!2512) (select (arr!48670 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1513571 () Bool)

(declare-fun res!1033679 () Bool)

(assert (=> b!1513571 (=> (not res!1033679) (not e!844692))))

(declare-datatypes ((List!35231 0))(
  ( (Nil!35228) (Cons!35227 (h!36640 (_ BitVec 64)) (t!49917 List!35231)) )
))
(declare-fun arrayNoDuplicates!0 (array!100864 (_ BitVec 32) List!35231) Bool)

(assert (=> b!1513571 (= res!1033679 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35228))))

(declare-fun b!1513572 () Bool)

(declare-fun res!1033689 () Bool)

(assert (=> b!1513572 (=> (not res!1033689) (not e!844692))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100864 (_ BitVec 32)) Bool)

(assert (=> b!1513572 (= res!1033689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1513573 () Bool)

(declare-fun e!844691 () Bool)

(assert (=> b!1513573 (= e!844691 (not true))))

(declare-fun e!844694 () Bool)

(assert (=> b!1513573 e!844694))

(declare-fun res!1033683 () Bool)

(assert (=> b!1513573 (=> (not res!1033683) (not e!844694))))

(assert (=> b!1513573 (= res!1033683 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50435 0))(
  ( (Unit!50436) )
))
(declare-fun lt!655851 () Unit!50435)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100864 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50435)

(assert (=> b!1513573 (= lt!655851 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1513574 () Bool)

(declare-fun res!1033681 () Bool)

(assert (=> b!1513574 (=> (not res!1033681) (not e!844692))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1513574 (= res!1033681 (validKeyInArray!0 (select (arr!48670 a!2804) i!961)))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!655853 () (_ BitVec 64))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun e!844695 () Bool)

(declare-fun b!1513575 () Bool)

(declare-fun lt!655854 () array!100864)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100864 (_ BitVec 32)) SeekEntryResult!12864)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100864 (_ BitVec 32)) SeekEntryResult!12864)

(assert (=> b!1513575 (= e!844695 (= (seekEntryOrOpen!0 lt!655853 lt!655854 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!655853 lt!655854 mask!2512)))))

(declare-fun b!1513576 () Bool)

(assert (=> b!1513576 (= e!844689 e!844691)))

(declare-fun res!1033684 () Bool)

(assert (=> b!1513576 (=> (not res!1033684) (not e!844691))))

(assert (=> b!1513576 (= res!1033684 (= lt!655850 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655853 mask!2512) lt!655853 lt!655854 mask!2512)))))

(assert (=> b!1513576 (= lt!655853 (select (store (arr!48670 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1513576 (= lt!655854 (array!100865 (store (arr!48670 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49222 a!2804)))))

(declare-fun b!1513577 () Bool)

(declare-fun e!844693 () Bool)

(assert (=> b!1513577 (= e!844694 e!844693)))

(declare-fun res!1033680 () Bool)

(assert (=> b!1513577 (=> res!1033680 e!844693)))

(assert (=> b!1513577 (= res!1033680 (or (not (= (select (arr!48670 a!2804) j!70) lt!655853)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48670 a!2804) index!487) (select (arr!48670 a!2804) j!70)) (not (= (select (arr!48670 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1513578 () Bool)

(declare-fun res!1033691 () Bool)

(assert (=> b!1513578 (=> (not res!1033691) (not e!844692))))

(assert (=> b!1513578 (= res!1033691 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49222 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49222 a!2804))))))

(declare-fun res!1033688 () Bool)

(assert (=> start!129008 (=> (not res!1033688) (not e!844692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129008 (= res!1033688 (validMask!0 mask!2512))))

(assert (=> start!129008 e!844692))

(assert (=> start!129008 true))

(declare-fun array_inv!37903 (array!100864) Bool)

(assert (=> start!129008 (array_inv!37903 a!2804)))

(declare-fun b!1513579 () Bool)

(declare-fun res!1033690 () Bool)

(assert (=> b!1513579 (=> (not res!1033690) (not e!844694))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100864 (_ BitVec 32)) SeekEntryResult!12864)

(assert (=> b!1513579 (= res!1033690 (= (seekEntry!0 (select (arr!48670 a!2804) j!70) a!2804 mask!2512) (Found!12864 j!70)))))

(declare-fun b!1513580 () Bool)

(declare-fun res!1033678 () Bool)

(assert (=> b!1513580 (=> (not res!1033678) (not e!844692))))

(assert (=> b!1513580 (= res!1033678 (and (= (size!49222 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49222 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49222 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1513581 () Bool)

(declare-fun res!1033685 () Bool)

(assert (=> b!1513581 (=> (not res!1033685) (not e!844689))))

(assert (=> b!1513581 (= res!1033685 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48670 a!2804) j!70) a!2804 mask!2512) lt!655852))))

(declare-fun b!1513582 () Bool)

(assert (=> b!1513582 (= e!844693 e!844695)))

(declare-fun res!1033686 () Bool)

(assert (=> b!1513582 (=> (not res!1033686) (not e!844695))))

(assert (=> b!1513582 (= res!1033686 (= (seekEntryOrOpen!0 (select (arr!48670 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48670 a!2804) j!70) a!2804 mask!2512)))))

(assert (= (and start!129008 res!1033688) b!1513580))

(assert (= (and b!1513580 res!1033678) b!1513574))

(assert (= (and b!1513574 res!1033681) b!1513569))

(assert (= (and b!1513569 res!1033682) b!1513572))

(assert (= (and b!1513572 res!1033689) b!1513571))

(assert (= (and b!1513571 res!1033679) b!1513578))

(assert (= (and b!1513578 res!1033691) b!1513570))

(assert (= (and b!1513570 res!1033687) b!1513581))

(assert (= (and b!1513581 res!1033685) b!1513576))

(assert (= (and b!1513576 res!1033684) b!1513573))

(assert (= (and b!1513573 res!1033683) b!1513579))

(assert (= (and b!1513579 res!1033690) b!1513577))

(assert (= (and b!1513577 (not res!1033680)) b!1513582))

(assert (= (and b!1513582 res!1033686) b!1513575))

(declare-fun m!1395905 () Bool)

(assert (=> b!1513569 m!1395905))

(assert (=> b!1513569 m!1395905))

(declare-fun m!1395907 () Bool)

(assert (=> b!1513569 m!1395907))

(declare-fun m!1395909 () Bool)

(assert (=> start!129008 m!1395909))

(declare-fun m!1395911 () Bool)

(assert (=> start!129008 m!1395911))

(assert (=> b!1513570 m!1395905))

(assert (=> b!1513570 m!1395905))

(declare-fun m!1395913 () Bool)

(assert (=> b!1513570 m!1395913))

(assert (=> b!1513570 m!1395913))

(assert (=> b!1513570 m!1395905))

(declare-fun m!1395915 () Bool)

(assert (=> b!1513570 m!1395915))

(declare-fun m!1395917 () Bool)

(assert (=> b!1513573 m!1395917))

(declare-fun m!1395919 () Bool)

(assert (=> b!1513573 m!1395919))

(assert (=> b!1513579 m!1395905))

(assert (=> b!1513579 m!1395905))

(declare-fun m!1395921 () Bool)

(assert (=> b!1513579 m!1395921))

(declare-fun m!1395923 () Bool)

(assert (=> b!1513571 m!1395923))

(assert (=> b!1513581 m!1395905))

(assert (=> b!1513581 m!1395905))

(declare-fun m!1395925 () Bool)

(assert (=> b!1513581 m!1395925))

(declare-fun m!1395927 () Bool)

(assert (=> b!1513572 m!1395927))

(assert (=> b!1513577 m!1395905))

(declare-fun m!1395929 () Bool)

(assert (=> b!1513577 m!1395929))

(declare-fun m!1395931 () Bool)

(assert (=> b!1513575 m!1395931))

(declare-fun m!1395933 () Bool)

(assert (=> b!1513575 m!1395933))

(declare-fun m!1395935 () Bool)

(assert (=> b!1513576 m!1395935))

(assert (=> b!1513576 m!1395935))

(declare-fun m!1395937 () Bool)

(assert (=> b!1513576 m!1395937))

(declare-fun m!1395939 () Bool)

(assert (=> b!1513576 m!1395939))

(declare-fun m!1395941 () Bool)

(assert (=> b!1513576 m!1395941))

(declare-fun m!1395943 () Bool)

(assert (=> b!1513574 m!1395943))

(assert (=> b!1513574 m!1395943))

(declare-fun m!1395945 () Bool)

(assert (=> b!1513574 m!1395945))

(assert (=> b!1513582 m!1395905))

(assert (=> b!1513582 m!1395905))

(declare-fun m!1395947 () Bool)

(assert (=> b!1513582 m!1395947))

(assert (=> b!1513582 m!1395905))

(declare-fun m!1395949 () Bool)

(assert (=> b!1513582 m!1395949))

(check-sat (not b!1513571) (not b!1513582) (not b!1513579) (not b!1513575) (not b!1513569) (not start!129008) (not b!1513572) (not b!1513570) (not b!1513576) (not b!1513573) (not b!1513581) (not b!1513574))
(check-sat)
