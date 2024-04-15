; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129696 () Bool)

(assert start!129696)

(declare-fun b!1522473 () Bool)

(declare-fun e!848903 () Bool)

(declare-fun e!848905 () Bool)

(assert (=> b!1522473 (= e!848903 e!848905)))

(declare-fun res!1041573 () Bool)

(assert (=> b!1522473 (=> (not res!1041573) (not e!848905))))

(declare-datatypes ((SeekEntryResult!13065 0))(
  ( (MissingZero!13065 (index!54655 (_ BitVec 32))) (Found!13065 (index!54656 (_ BitVec 32))) (Intermediate!13065 (undefined!13877 Bool) (index!54657 (_ BitVec 32)) (x!136354 (_ BitVec 32))) (Undefined!13065) (MissingVacant!13065 (index!54658 (_ BitVec 32))) )
))
(declare-fun lt!659490 () SeekEntryResult!13065)

(declare-fun lt!659488 () SeekEntryResult!13065)

(assert (=> b!1522473 (= res!1041573 (= lt!659490 lt!659488))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1522473 (= lt!659488 (Intermediate!13065 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101290 0))(
  ( (array!101291 (arr!48877 (Array (_ BitVec 32) (_ BitVec 64))) (size!49429 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101290)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101290 (_ BitVec 32)) SeekEntryResult!13065)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522473 (= lt!659490 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48877 a!2804) j!70) mask!2512) (select (arr!48877 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522475 () Bool)

(declare-fun res!1041567 () Bool)

(assert (=> b!1522475 (=> (not res!1041567) (not e!848905))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1522475 (= res!1041567 (= lt!659490 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48877 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48877 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101291 (store (arr!48877 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49429 a!2804)) mask!2512)))))

(declare-fun b!1522476 () Bool)

(declare-fun res!1041569 () Bool)

(assert (=> b!1522476 (=> (not res!1041569) (not e!848903))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1522476 (= res!1041569 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49429 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49429 a!2804))))))

(declare-fun b!1522477 () Bool)

(declare-fun res!1041564 () Bool)

(assert (=> b!1522477 (=> (not res!1041564) (not e!848903))))

(declare-datatypes ((List!35438 0))(
  ( (Nil!35435) (Cons!35434 (h!36859 (_ BitVec 64)) (t!50124 List!35438)) )
))
(declare-fun arrayNoDuplicates!0 (array!101290 (_ BitVec 32) List!35438) Bool)

(assert (=> b!1522477 (= res!1041564 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35435))))

(declare-fun b!1522478 () Bool)

(assert (=> b!1522478 (= e!848905 (not true))))

(declare-fun e!848902 () Bool)

(assert (=> b!1522478 e!848902))

(declare-fun res!1041570 () Bool)

(assert (=> b!1522478 (=> (not res!1041570) (not e!848902))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101290 (_ BitVec 32)) Bool)

(assert (=> b!1522478 (= res!1041570 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50753 0))(
  ( (Unit!50754) )
))
(declare-fun lt!659489 () Unit!50753)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101290 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50753)

(assert (=> b!1522478 (= lt!659489 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1522479 () Bool)

(declare-fun res!1041568 () Bool)

(assert (=> b!1522479 (=> (not res!1041568) (not e!848903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1522479 (= res!1041568 (validKeyInArray!0 (select (arr!48877 a!2804) i!961)))))

(declare-fun b!1522480 () Bool)

(declare-fun res!1041574 () Bool)

(assert (=> b!1522480 (=> (not res!1041574) (not e!848903))))

(assert (=> b!1522480 (= res!1041574 (validKeyInArray!0 (select (arr!48877 a!2804) j!70)))))

(declare-fun b!1522481 () Bool)

(declare-fun res!1041571 () Bool)

(assert (=> b!1522481 (=> (not res!1041571) (not e!848905))))

(assert (=> b!1522481 (= res!1041571 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48877 a!2804) j!70) a!2804 mask!2512) lt!659488))))

(declare-fun b!1522482 () Bool)

(declare-fun res!1041566 () Bool)

(assert (=> b!1522482 (=> (not res!1041566) (not e!848903))))

(assert (=> b!1522482 (= res!1041566 (and (= (size!49429 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49429 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49429 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1522483 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101290 (_ BitVec 32)) SeekEntryResult!13065)

(assert (=> b!1522483 (= e!848902 (= (seekEntry!0 (select (arr!48877 a!2804) j!70) a!2804 mask!2512) (Found!13065 j!70)))))

(declare-fun res!1041572 () Bool)

(assert (=> start!129696 (=> (not res!1041572) (not e!848903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129696 (= res!1041572 (validMask!0 mask!2512))))

(assert (=> start!129696 e!848903))

(assert (=> start!129696 true))

(declare-fun array_inv!38110 (array!101290) Bool)

(assert (=> start!129696 (array_inv!38110 a!2804)))

(declare-fun b!1522474 () Bool)

(declare-fun res!1041565 () Bool)

(assert (=> b!1522474 (=> (not res!1041565) (not e!848903))))

(assert (=> b!1522474 (= res!1041565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129696 res!1041572) b!1522482))

(assert (= (and b!1522482 res!1041566) b!1522479))

(assert (= (and b!1522479 res!1041568) b!1522480))

(assert (= (and b!1522480 res!1041574) b!1522474))

(assert (= (and b!1522474 res!1041565) b!1522477))

(assert (= (and b!1522477 res!1041564) b!1522476))

(assert (= (and b!1522476 res!1041569) b!1522473))

(assert (= (and b!1522473 res!1041573) b!1522481))

(assert (= (and b!1522481 res!1041571) b!1522475))

(assert (= (and b!1522475 res!1041567) b!1522478))

(assert (= (and b!1522478 res!1041570) b!1522483))

(declare-fun m!1404953 () Bool)

(assert (=> b!1522483 m!1404953))

(assert (=> b!1522483 m!1404953))

(declare-fun m!1404955 () Bool)

(assert (=> b!1522483 m!1404955))

(declare-fun m!1404957 () Bool)

(assert (=> start!129696 m!1404957))

(declare-fun m!1404959 () Bool)

(assert (=> start!129696 m!1404959))

(declare-fun m!1404961 () Bool)

(assert (=> b!1522479 m!1404961))

(assert (=> b!1522479 m!1404961))

(declare-fun m!1404963 () Bool)

(assert (=> b!1522479 m!1404963))

(assert (=> b!1522481 m!1404953))

(assert (=> b!1522481 m!1404953))

(declare-fun m!1404965 () Bool)

(assert (=> b!1522481 m!1404965))

(declare-fun m!1404967 () Bool)

(assert (=> b!1522478 m!1404967))

(declare-fun m!1404969 () Bool)

(assert (=> b!1522478 m!1404969))

(declare-fun m!1404971 () Bool)

(assert (=> b!1522474 m!1404971))

(declare-fun m!1404973 () Bool)

(assert (=> b!1522477 m!1404973))

(assert (=> b!1522473 m!1404953))

(assert (=> b!1522473 m!1404953))

(declare-fun m!1404975 () Bool)

(assert (=> b!1522473 m!1404975))

(assert (=> b!1522473 m!1404975))

(assert (=> b!1522473 m!1404953))

(declare-fun m!1404977 () Bool)

(assert (=> b!1522473 m!1404977))

(assert (=> b!1522480 m!1404953))

(assert (=> b!1522480 m!1404953))

(declare-fun m!1404979 () Bool)

(assert (=> b!1522480 m!1404979))

(declare-fun m!1404981 () Bool)

(assert (=> b!1522475 m!1404981))

(declare-fun m!1404983 () Bool)

(assert (=> b!1522475 m!1404983))

(assert (=> b!1522475 m!1404983))

(declare-fun m!1404985 () Bool)

(assert (=> b!1522475 m!1404985))

(assert (=> b!1522475 m!1404985))

(assert (=> b!1522475 m!1404983))

(declare-fun m!1404987 () Bool)

(assert (=> b!1522475 m!1404987))

(check-sat (not start!129696) (not b!1522478) (not b!1522483) (not b!1522481) (not b!1522473) (not b!1522477) (not b!1522479) (not b!1522474) (not b!1522475) (not b!1522480))
(check-sat)
