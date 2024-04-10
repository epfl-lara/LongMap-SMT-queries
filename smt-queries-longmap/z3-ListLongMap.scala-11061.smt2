; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129200 () Bool)

(assert start!129200)

(declare-fun b!1516655 () Bool)

(declare-fun e!846251 () Bool)

(assert (=> b!1516655 (= e!846251 true)))

(declare-fun lt!657487 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12936 0))(
  ( (MissingZero!12936 (index!54139 (_ BitVec 32))) (Found!12936 (index!54140 (_ BitVec 32))) (Intermediate!12936 (undefined!13748 Bool) (index!54141 (_ BitVec 32)) (x!135830 (_ BitVec 32))) (Undefined!12936) (MissingVacant!12936 (index!54142 (_ BitVec 32))) )
))
(declare-fun lt!657485 () SeekEntryResult!12936)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101056 0))(
  ( (array!101057 (arr!48765 (Array (_ BitVec 32) (_ BitVec 64))) (size!49315 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101056)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101056 (_ BitVec 32)) SeekEntryResult!12936)

(assert (=> b!1516655 (= lt!657485 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657487 (select (arr!48765 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1036560 () Bool)

(declare-fun e!846256 () Bool)

(assert (=> start!129200 (=> (not res!1036560) (not e!846256))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129200 (= res!1036560 (validMask!0 mask!2512))))

(assert (=> start!129200 e!846256))

(assert (=> start!129200 true))

(declare-fun array_inv!37793 (array!101056) Bool)

(assert (=> start!129200 (array_inv!37793 a!2804)))

(declare-fun b!1516656 () Bool)

(declare-fun e!846253 () Bool)

(assert (=> b!1516656 (= e!846253 e!846251)))

(declare-fun res!1036570 () Bool)

(assert (=> b!1516656 (=> res!1036570 e!846251)))

(assert (=> b!1516656 (= res!1036570 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657487 #b00000000000000000000000000000000) (bvsge lt!657487 (size!49315 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516656 (= lt!657487 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1516657 () Bool)

(declare-fun res!1036564 () Bool)

(assert (=> b!1516657 (=> (not res!1036564) (not e!846256))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516657 (= res!1036564 (validKeyInArray!0 (select (arr!48765 a!2804) j!70)))))

(declare-fun b!1516658 () Bool)

(declare-fun res!1036568 () Bool)

(assert (=> b!1516658 (=> (not res!1036568) (not e!846256))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1516658 (= res!1036568 (validKeyInArray!0 (select (arr!48765 a!2804) i!961)))))

(declare-fun b!1516659 () Bool)

(declare-fun res!1036562 () Bool)

(assert (=> b!1516659 (=> (not res!1036562) (not e!846256))))

(assert (=> b!1516659 (= res!1036562 (and (= (size!49315 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49315 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49315 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516660 () Bool)

(declare-fun res!1036565 () Bool)

(assert (=> b!1516660 (=> (not res!1036565) (not e!846256))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101056 (_ BitVec 32)) Bool)

(assert (=> b!1516660 (= res!1036565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516661 () Bool)

(declare-fun res!1036561 () Bool)

(declare-fun e!846255 () Bool)

(assert (=> b!1516661 (=> (not res!1036561) (not e!846255))))

(declare-fun lt!657483 () SeekEntryResult!12936)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516661 (= res!1036561 (= lt!657483 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48765 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48765 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101057 (store (arr!48765 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49315 a!2804)) mask!2512)))))

(declare-fun e!846254 () Bool)

(declare-fun b!1516662 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101056 (_ BitVec 32)) SeekEntryResult!12936)

(assert (=> b!1516662 (= e!846254 (= (seekEntry!0 (select (arr!48765 a!2804) j!70) a!2804 mask!2512) (Found!12936 j!70)))))

(declare-fun b!1516663 () Bool)

(declare-fun res!1036559 () Bool)

(assert (=> b!1516663 (=> (not res!1036559) (not e!846256))))

(declare-datatypes ((List!35248 0))(
  ( (Nil!35245) (Cons!35244 (h!36656 (_ BitVec 64)) (t!49942 List!35248)) )
))
(declare-fun arrayNoDuplicates!0 (array!101056 (_ BitVec 32) List!35248) Bool)

(assert (=> b!1516663 (= res!1036559 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35245))))

(declare-fun b!1516664 () Bool)

(assert (=> b!1516664 (= e!846255 (not e!846253))))

(declare-fun res!1036563 () Bool)

(assert (=> b!1516664 (=> res!1036563 e!846253)))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1516664 (= res!1036563 (or (not (= (select (arr!48765 a!2804) j!70) (select (store (arr!48765 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1516664 e!846254))

(declare-fun res!1036567 () Bool)

(assert (=> b!1516664 (=> (not res!1036567) (not e!846254))))

(assert (=> b!1516664 (= res!1036567 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50740 0))(
  ( (Unit!50741) )
))
(declare-fun lt!657484 () Unit!50740)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101056 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50740)

(assert (=> b!1516664 (= lt!657484 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516665 () Bool)

(assert (=> b!1516665 (= e!846256 e!846255)))

(declare-fun res!1036566 () Bool)

(assert (=> b!1516665 (=> (not res!1036566) (not e!846255))))

(declare-fun lt!657486 () SeekEntryResult!12936)

(assert (=> b!1516665 (= res!1036566 (= lt!657483 lt!657486))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1516665 (= lt!657486 (Intermediate!12936 false resIndex!21 resX!21))))

(assert (=> b!1516665 (= lt!657483 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48765 a!2804) j!70) mask!2512) (select (arr!48765 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516666 () Bool)

(declare-fun res!1036558 () Bool)

(assert (=> b!1516666 (=> (not res!1036558) (not e!846255))))

(assert (=> b!1516666 (= res!1036558 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48765 a!2804) j!70) a!2804 mask!2512) lt!657486))))

(declare-fun b!1516667 () Bool)

(declare-fun res!1036569 () Bool)

(assert (=> b!1516667 (=> (not res!1036569) (not e!846256))))

(assert (=> b!1516667 (= res!1036569 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49315 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49315 a!2804))))))

(assert (= (and start!129200 res!1036560) b!1516659))

(assert (= (and b!1516659 res!1036562) b!1516658))

(assert (= (and b!1516658 res!1036568) b!1516657))

(assert (= (and b!1516657 res!1036564) b!1516660))

(assert (= (and b!1516660 res!1036565) b!1516663))

(assert (= (and b!1516663 res!1036559) b!1516667))

(assert (= (and b!1516667 res!1036569) b!1516665))

(assert (= (and b!1516665 res!1036566) b!1516666))

(assert (= (and b!1516666 res!1036558) b!1516661))

(assert (= (and b!1516661 res!1036561) b!1516664))

(assert (= (and b!1516664 res!1036567) b!1516662))

(assert (= (and b!1516664 (not res!1036563)) b!1516656))

(assert (= (and b!1516656 (not res!1036570)) b!1516655))

(declare-fun m!1399925 () Bool)

(assert (=> b!1516662 m!1399925))

(assert (=> b!1516662 m!1399925))

(declare-fun m!1399927 () Bool)

(assert (=> b!1516662 m!1399927))

(assert (=> b!1516664 m!1399925))

(declare-fun m!1399929 () Bool)

(assert (=> b!1516664 m!1399929))

(declare-fun m!1399931 () Bool)

(assert (=> b!1516664 m!1399931))

(declare-fun m!1399933 () Bool)

(assert (=> b!1516664 m!1399933))

(declare-fun m!1399935 () Bool)

(assert (=> b!1516664 m!1399935))

(declare-fun m!1399937 () Bool)

(assert (=> b!1516656 m!1399937))

(assert (=> b!1516665 m!1399925))

(assert (=> b!1516665 m!1399925))

(declare-fun m!1399939 () Bool)

(assert (=> b!1516665 m!1399939))

(assert (=> b!1516665 m!1399939))

(assert (=> b!1516665 m!1399925))

(declare-fun m!1399941 () Bool)

(assert (=> b!1516665 m!1399941))

(declare-fun m!1399943 () Bool)

(assert (=> start!129200 m!1399943))

(declare-fun m!1399945 () Bool)

(assert (=> start!129200 m!1399945))

(assert (=> b!1516655 m!1399925))

(assert (=> b!1516655 m!1399925))

(declare-fun m!1399947 () Bool)

(assert (=> b!1516655 m!1399947))

(assert (=> b!1516666 m!1399925))

(assert (=> b!1516666 m!1399925))

(declare-fun m!1399949 () Bool)

(assert (=> b!1516666 m!1399949))

(declare-fun m!1399951 () Bool)

(assert (=> b!1516660 m!1399951))

(assert (=> b!1516657 m!1399925))

(assert (=> b!1516657 m!1399925))

(declare-fun m!1399953 () Bool)

(assert (=> b!1516657 m!1399953))

(assert (=> b!1516661 m!1399931))

(assert (=> b!1516661 m!1399933))

(assert (=> b!1516661 m!1399933))

(declare-fun m!1399955 () Bool)

(assert (=> b!1516661 m!1399955))

(assert (=> b!1516661 m!1399955))

(assert (=> b!1516661 m!1399933))

(declare-fun m!1399957 () Bool)

(assert (=> b!1516661 m!1399957))

(declare-fun m!1399959 () Bool)

(assert (=> b!1516658 m!1399959))

(assert (=> b!1516658 m!1399959))

(declare-fun m!1399961 () Bool)

(assert (=> b!1516658 m!1399961))

(declare-fun m!1399963 () Bool)

(assert (=> b!1516663 m!1399963))

(check-sat (not b!1516665) (not b!1516660) (not b!1516657) (not b!1516656) (not b!1516662) (not b!1516655) (not b!1516666) (not b!1516663) (not b!1516664) (not start!129200) (not b!1516658) (not b!1516661))
(check-sat)
