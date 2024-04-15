; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129726 () Bool)

(assert start!129726)

(declare-fun b!1522968 () Bool)

(declare-fun e!849083 () Bool)

(declare-fun e!849084 () Bool)

(assert (=> b!1522968 (= e!849083 e!849084)))

(declare-fun res!1042067 () Bool)

(assert (=> b!1522968 (=> (not res!1042067) (not e!849084))))

(declare-datatypes ((SeekEntryResult!13080 0))(
  ( (MissingZero!13080 (index!54715 (_ BitVec 32))) (Found!13080 (index!54716 (_ BitVec 32))) (Intermediate!13080 (undefined!13892 Bool) (index!54717 (_ BitVec 32)) (x!136409 (_ BitVec 32))) (Undefined!13080) (MissingVacant!13080 (index!54718 (_ BitVec 32))) )
))
(declare-fun lt!659624 () SeekEntryResult!13080)

(declare-fun lt!659623 () SeekEntryResult!13080)

(assert (=> b!1522968 (= res!1042067 (= lt!659624 lt!659623))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1522968 (= lt!659623 (Intermediate!13080 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101320 0))(
  ( (array!101321 (arr!48892 (Array (_ BitVec 32) (_ BitVec 64))) (size!49444 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101320)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101320 (_ BitVec 32)) SeekEntryResult!13080)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522968 (= lt!659624 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48892 a!2804) j!70) mask!2512) (select (arr!48892 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522969 () Bool)

(declare-fun res!1042066 () Bool)

(assert (=> b!1522969 (=> (not res!1042066) (not e!849083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1522969 (= res!1042066 (validKeyInArray!0 (select (arr!48892 a!2804) j!70)))))

(declare-fun b!1522970 () Bool)

(declare-fun res!1042069 () Bool)

(assert (=> b!1522970 (=> (not res!1042069) (not e!849083))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1522970 (= res!1042069 (validKeyInArray!0 (select (arr!48892 a!2804) i!961)))))

(declare-fun b!1522971 () Bool)

(declare-fun res!1042063 () Bool)

(assert (=> b!1522971 (=> (not res!1042063) (not e!849084))))

(assert (=> b!1522971 (= res!1042063 (= lt!659624 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101321 (store (arr!48892 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49444 a!2804)) mask!2512)))))

(declare-fun b!1522972 () Bool)

(declare-fun e!849085 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101320 (_ BitVec 32)) SeekEntryResult!13080)

(assert (=> b!1522972 (= e!849085 (= (seekEntry!0 (select (arr!48892 a!2804) j!70) a!2804 mask!2512) (Found!13080 j!70)))))

(declare-fun b!1522974 () Bool)

(assert (=> b!1522974 (= e!849084 (not true))))

(assert (=> b!1522974 e!849085))

(declare-fun res!1042059 () Bool)

(assert (=> b!1522974 (=> (not res!1042059) (not e!849085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101320 (_ BitVec 32)) Bool)

(assert (=> b!1522974 (= res!1042059 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50783 0))(
  ( (Unit!50784) )
))
(declare-fun lt!659625 () Unit!50783)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101320 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50783)

(assert (=> b!1522974 (= lt!659625 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1522975 () Bool)

(declare-fun res!1042061 () Bool)

(assert (=> b!1522975 (=> (not res!1042061) (not e!849083))))

(assert (=> b!1522975 (= res!1042061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1522976 () Bool)

(declare-fun res!1042060 () Bool)

(assert (=> b!1522976 (=> (not res!1042060) (not e!849083))))

(assert (=> b!1522976 (= res!1042060 (and (= (size!49444 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49444 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49444 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1522977 () Bool)

(declare-fun res!1042062 () Bool)

(assert (=> b!1522977 (=> (not res!1042062) (not e!849083))))

(declare-datatypes ((List!35453 0))(
  ( (Nil!35450) (Cons!35449 (h!36874 (_ BitVec 64)) (t!50139 List!35453)) )
))
(declare-fun arrayNoDuplicates!0 (array!101320 (_ BitVec 32) List!35453) Bool)

(assert (=> b!1522977 (= res!1042062 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35450))))

(declare-fun b!1522978 () Bool)

(declare-fun res!1042068 () Bool)

(assert (=> b!1522978 (=> (not res!1042068) (not e!849084))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1522978 (= res!1042068 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48892 a!2804) j!70) a!2804 mask!2512) lt!659623))))

(declare-fun b!1522973 () Bool)

(declare-fun res!1042065 () Bool)

(assert (=> b!1522973 (=> (not res!1042065) (not e!849083))))

(assert (=> b!1522973 (= res!1042065 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49444 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49444 a!2804))))))

(declare-fun res!1042064 () Bool)

(assert (=> start!129726 (=> (not res!1042064) (not e!849083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129726 (= res!1042064 (validMask!0 mask!2512))))

(assert (=> start!129726 e!849083))

(assert (=> start!129726 true))

(declare-fun array_inv!38125 (array!101320) Bool)

(assert (=> start!129726 (array_inv!38125 a!2804)))

(assert (= (and start!129726 res!1042064) b!1522976))

(assert (= (and b!1522976 res!1042060) b!1522970))

(assert (= (and b!1522970 res!1042069) b!1522969))

(assert (= (and b!1522969 res!1042066) b!1522975))

(assert (= (and b!1522975 res!1042061) b!1522977))

(assert (= (and b!1522977 res!1042062) b!1522973))

(assert (= (and b!1522973 res!1042065) b!1522968))

(assert (= (and b!1522968 res!1042067) b!1522978))

(assert (= (and b!1522978 res!1042068) b!1522971))

(assert (= (and b!1522971 res!1042063) b!1522974))

(assert (= (and b!1522974 res!1042059) b!1522972))

(declare-fun m!1405493 () Bool)

(assert (=> b!1522971 m!1405493))

(declare-fun m!1405495 () Bool)

(assert (=> b!1522971 m!1405495))

(assert (=> b!1522971 m!1405495))

(declare-fun m!1405497 () Bool)

(assert (=> b!1522971 m!1405497))

(assert (=> b!1522971 m!1405497))

(assert (=> b!1522971 m!1405495))

(declare-fun m!1405499 () Bool)

(assert (=> b!1522971 m!1405499))

(declare-fun m!1405501 () Bool)

(assert (=> b!1522974 m!1405501))

(declare-fun m!1405503 () Bool)

(assert (=> b!1522974 m!1405503))

(declare-fun m!1405505 () Bool)

(assert (=> b!1522970 m!1405505))

(assert (=> b!1522970 m!1405505))

(declare-fun m!1405507 () Bool)

(assert (=> b!1522970 m!1405507))

(declare-fun m!1405509 () Bool)

(assert (=> b!1522972 m!1405509))

(assert (=> b!1522972 m!1405509))

(declare-fun m!1405511 () Bool)

(assert (=> b!1522972 m!1405511))

(declare-fun m!1405513 () Bool)

(assert (=> start!129726 m!1405513))

(declare-fun m!1405515 () Bool)

(assert (=> start!129726 m!1405515))

(assert (=> b!1522969 m!1405509))

(assert (=> b!1522969 m!1405509))

(declare-fun m!1405517 () Bool)

(assert (=> b!1522969 m!1405517))

(declare-fun m!1405519 () Bool)

(assert (=> b!1522975 m!1405519))

(declare-fun m!1405521 () Bool)

(assert (=> b!1522977 m!1405521))

(assert (=> b!1522978 m!1405509))

(assert (=> b!1522978 m!1405509))

(declare-fun m!1405523 () Bool)

(assert (=> b!1522978 m!1405523))

(assert (=> b!1522968 m!1405509))

(assert (=> b!1522968 m!1405509))

(declare-fun m!1405525 () Bool)

(assert (=> b!1522968 m!1405525))

(assert (=> b!1522968 m!1405525))

(assert (=> b!1522968 m!1405509))

(declare-fun m!1405527 () Bool)

(assert (=> b!1522968 m!1405527))

(check-sat (not b!1522977) (not start!129726) (not b!1522969) (not b!1522978) (not b!1522971) (not b!1522974) (not b!1522975) (not b!1522968) (not b!1522970) (not b!1522972))
(check-sat)
