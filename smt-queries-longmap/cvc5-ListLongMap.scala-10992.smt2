; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128784 () Bool)

(assert start!128784)

(declare-fun b!1509012 () Bool)

(declare-fun res!1028917 () Bool)

(declare-fun e!842961 () Bool)

(assert (=> b!1509012 (=> (not res!1028917) (not e!842961))))

(declare-datatypes ((SeekEntryResult!12728 0))(
  ( (MissingZero!12728 (index!53307 (_ BitVec 32))) (Found!12728 (index!53308 (_ BitVec 32))) (Intermediate!12728 (undefined!13540 Bool) (index!53309 (_ BitVec 32)) (x!135070 (_ BitVec 32))) (Undefined!12728) (MissingVacant!12728 (index!53310 (_ BitVec 32))) )
))
(declare-fun lt!654789 () SeekEntryResult!12728)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100640 0))(
  ( (array!100641 (arr!48557 (Array (_ BitVec 32) (_ BitVec 64))) (size!49107 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100640)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100640 (_ BitVec 32)) SeekEntryResult!12728)

(assert (=> b!1509012 (= res!1028917 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48557 a!2804) j!70) a!2804 mask!2512) lt!654789))))

(declare-fun b!1509013 () Bool)

(declare-fun res!1028920 () Bool)

(declare-fun e!842962 () Bool)

(assert (=> b!1509013 (=> (not res!1028920) (not e!842962))))

(declare-datatypes ((List!35040 0))(
  ( (Nil!35037) (Cons!35036 (h!36448 (_ BitVec 64)) (t!49734 List!35040)) )
))
(declare-fun arrayNoDuplicates!0 (array!100640 (_ BitVec 32) List!35040) Bool)

(assert (=> b!1509013 (= res!1028920 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35037))))

(declare-fun b!1509014 () Bool)

(assert (=> b!1509014 (= e!842962 e!842961)))

(declare-fun res!1028918 () Bool)

(assert (=> b!1509014 (=> (not res!1028918) (not e!842961))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509014 (= res!1028918 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48557 a!2804) j!70) mask!2512) (select (arr!48557 a!2804) j!70) a!2804 mask!2512) lt!654789))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1509014 (= lt!654789 (Intermediate!12728 false resIndex!21 resX!21))))

(declare-fun b!1509015 () Bool)

(declare-fun res!1028916 () Bool)

(assert (=> b!1509015 (=> (not res!1028916) (not e!842962))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509015 (= res!1028916 (validKeyInArray!0 (select (arr!48557 a!2804) j!70)))))

(declare-fun b!1509016 () Bool)

(declare-fun res!1028919 () Bool)

(assert (=> b!1509016 (=> (not res!1028919) (not e!842962))))

(assert (=> b!1509016 (= res!1028919 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49107 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49107 a!2804))))))

(declare-fun b!1509017 () Bool)

(assert (=> b!1509017 (= e!842961 false)))

(declare-fun lt!654790 () SeekEntryResult!12728)

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1509017 (= lt!654790 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48557 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48557 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100641 (store (arr!48557 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49107 a!2804)) mask!2512))))

(declare-fun b!1509018 () Bool)

(declare-fun res!1028915 () Bool)

(assert (=> b!1509018 (=> (not res!1028915) (not e!842962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100640 (_ BitVec 32)) Bool)

(assert (=> b!1509018 (= res!1028915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509019 () Bool)

(declare-fun res!1028921 () Bool)

(assert (=> b!1509019 (=> (not res!1028921) (not e!842962))))

(assert (=> b!1509019 (= res!1028921 (and (= (size!49107 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49107 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49107 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1028922 () Bool)

(assert (=> start!128784 (=> (not res!1028922) (not e!842962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128784 (= res!1028922 (validMask!0 mask!2512))))

(assert (=> start!128784 e!842962))

(assert (=> start!128784 true))

(declare-fun array_inv!37585 (array!100640) Bool)

(assert (=> start!128784 (array_inv!37585 a!2804)))

(declare-fun b!1509020 () Bool)

(declare-fun res!1028923 () Bool)

(assert (=> b!1509020 (=> (not res!1028923) (not e!842962))))

(assert (=> b!1509020 (= res!1028923 (validKeyInArray!0 (select (arr!48557 a!2804) i!961)))))

(assert (= (and start!128784 res!1028922) b!1509019))

(assert (= (and b!1509019 res!1028921) b!1509020))

(assert (= (and b!1509020 res!1028923) b!1509015))

(assert (= (and b!1509015 res!1028916) b!1509018))

(assert (= (and b!1509018 res!1028915) b!1509013))

(assert (= (and b!1509013 res!1028920) b!1509016))

(assert (= (and b!1509016 res!1028919) b!1509014))

(assert (= (and b!1509014 res!1028918) b!1509012))

(assert (= (and b!1509012 res!1028917) b!1509017))

(declare-fun m!1391443 () Bool)

(assert (=> b!1509017 m!1391443))

(declare-fun m!1391445 () Bool)

(assert (=> b!1509017 m!1391445))

(assert (=> b!1509017 m!1391445))

(declare-fun m!1391447 () Bool)

(assert (=> b!1509017 m!1391447))

(assert (=> b!1509017 m!1391447))

(assert (=> b!1509017 m!1391445))

(declare-fun m!1391449 () Bool)

(assert (=> b!1509017 m!1391449))

(declare-fun m!1391451 () Bool)

(assert (=> b!1509012 m!1391451))

(assert (=> b!1509012 m!1391451))

(declare-fun m!1391453 () Bool)

(assert (=> b!1509012 m!1391453))

(declare-fun m!1391455 () Bool)

(assert (=> b!1509013 m!1391455))

(assert (=> b!1509014 m!1391451))

(assert (=> b!1509014 m!1391451))

(declare-fun m!1391457 () Bool)

(assert (=> b!1509014 m!1391457))

(assert (=> b!1509014 m!1391457))

(assert (=> b!1509014 m!1391451))

(declare-fun m!1391459 () Bool)

(assert (=> b!1509014 m!1391459))

(declare-fun m!1391461 () Bool)

(assert (=> start!128784 m!1391461))

(declare-fun m!1391463 () Bool)

(assert (=> start!128784 m!1391463))

(assert (=> b!1509015 m!1391451))

(assert (=> b!1509015 m!1391451))

(declare-fun m!1391465 () Bool)

(assert (=> b!1509015 m!1391465))

(declare-fun m!1391467 () Bool)

(assert (=> b!1509018 m!1391467))

(declare-fun m!1391469 () Bool)

(assert (=> b!1509020 m!1391469))

(assert (=> b!1509020 m!1391469))

(declare-fun m!1391471 () Bool)

(assert (=> b!1509020 m!1391471))

(push 1)

