; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129122 () Bool)

(assert start!129122)

(declare-fun b!1511350 () Bool)

(declare-fun res!1030084 () Bool)

(declare-fun e!844259 () Bool)

(assert (=> b!1511350 (=> (not res!1030084) (not e!844259))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100792 0))(
  ( (array!100793 (arr!48628 (Array (_ BitVec 32) (_ BitVec 64))) (size!49179 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100792)

(declare-datatypes ((SeekEntryResult!12692 0))(
  ( (MissingZero!12692 (index!53163 (_ BitVec 32))) (Found!12692 (index!53164 (_ BitVec 32))) (Intermediate!12692 (undefined!13504 Bool) (index!53165 (_ BitVec 32)) (x!135119 (_ BitVec 32))) (Undefined!12692) (MissingVacant!12692 (index!53166 (_ BitVec 32))) )
))
(declare-fun lt!655582 () SeekEntryResult!12692)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100792 (_ BitVec 32)) SeekEntryResult!12692)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511350 (= res!1030084 (= lt!655582 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48628 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48628 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100793 (store (arr!48628 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49179 a!2804)) mask!2512)))))

(declare-fun b!1511351 () Bool)

(declare-fun res!1030081 () Bool)

(declare-fun e!844258 () Bool)

(assert (=> b!1511351 (=> (not res!1030081) (not e!844258))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511351 (= res!1030081 (validKeyInArray!0 (select (arr!48628 a!2804) i!961)))))

(declare-fun res!1030077 () Bool)

(assert (=> start!129122 (=> (not res!1030077) (not e!844258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129122 (= res!1030077 (validMask!0 mask!2512))))

(assert (=> start!129122 e!844258))

(assert (=> start!129122 true))

(declare-fun array_inv!37909 (array!100792) Bool)

(assert (=> start!129122 (array_inv!37909 a!2804)))

(declare-fun b!1511352 () Bool)

(declare-fun res!1030083 () Bool)

(assert (=> b!1511352 (=> (not res!1030083) (not e!844258))))

(assert (=> b!1511352 (= res!1030083 (validKeyInArray!0 (select (arr!48628 a!2804) j!70)))))

(declare-fun b!1511353 () Bool)

(declare-fun res!1030085 () Bool)

(assert (=> b!1511353 (=> (not res!1030085) (not e!844258))))

(assert (=> b!1511353 (= res!1030085 (and (= (size!49179 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49179 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49179 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511354 () Bool)

(assert (=> b!1511354 (= e!844258 e!844259)))

(declare-fun res!1030076 () Bool)

(assert (=> b!1511354 (=> (not res!1030076) (not e!844259))))

(declare-fun lt!655581 () SeekEntryResult!12692)

(assert (=> b!1511354 (= res!1030076 (= lt!655582 lt!655581))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1511354 (= lt!655581 (Intermediate!12692 false resIndex!21 resX!21))))

(assert (=> b!1511354 (= lt!655582 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48628 a!2804) j!70) mask!2512) (select (arr!48628 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511355 () Bool)

(declare-fun res!1030080 () Bool)

(assert (=> b!1511355 (=> (not res!1030080) (not e!844258))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1511355 (= res!1030080 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49179 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49179 a!2804))))))

(declare-fun b!1511356 () Bool)

(declare-fun res!1030079 () Bool)

(assert (=> b!1511356 (=> (not res!1030079) (not e!844258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100792 (_ BitVec 32)) Bool)

(assert (=> b!1511356 (= res!1030079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511357 () Bool)

(declare-fun res!1030082 () Bool)

(assert (=> b!1511357 (=> (not res!1030082) (not e!844258))))

(declare-datatypes ((List!35098 0))(
  ( (Nil!35095) (Cons!35094 (h!36521 (_ BitVec 64)) (t!49784 List!35098)) )
))
(declare-fun arrayNoDuplicates!0 (array!100792 (_ BitVec 32) List!35098) Bool)

(assert (=> b!1511357 (= res!1030082 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35095))))

(declare-fun b!1511358 () Bool)

(declare-fun res!1030078 () Bool)

(assert (=> b!1511358 (=> (not res!1030078) (not e!844259))))

(assert (=> b!1511358 (= res!1030078 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48628 a!2804) j!70) a!2804 mask!2512) lt!655581))))

(declare-fun b!1511359 () Bool)

(assert (=> b!1511359 (= e!844259 (not true))))

(assert (=> b!1511359 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-datatypes ((Unit!50287 0))(
  ( (Unit!50288) )
))
(declare-fun lt!655580 () Unit!50287)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100792 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50287)

(assert (=> b!1511359 (= lt!655580 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!129122 res!1030077) b!1511353))

(assert (= (and b!1511353 res!1030085) b!1511351))

(assert (= (and b!1511351 res!1030081) b!1511352))

(assert (= (and b!1511352 res!1030083) b!1511356))

(assert (= (and b!1511356 res!1030079) b!1511357))

(assert (= (and b!1511357 res!1030082) b!1511355))

(assert (= (and b!1511355 res!1030080) b!1511354))

(assert (= (and b!1511354 res!1030076) b!1511358))

(assert (= (and b!1511358 res!1030078) b!1511350))

(assert (= (and b!1511350 res!1030084) b!1511359))

(declare-fun m!1393803 () Bool)

(assert (=> b!1511359 m!1393803))

(declare-fun m!1393805 () Bool)

(assert (=> b!1511359 m!1393805))

(declare-fun m!1393807 () Bool)

(assert (=> b!1511351 m!1393807))

(assert (=> b!1511351 m!1393807))

(declare-fun m!1393809 () Bool)

(assert (=> b!1511351 m!1393809))

(declare-fun m!1393811 () Bool)

(assert (=> b!1511354 m!1393811))

(assert (=> b!1511354 m!1393811))

(declare-fun m!1393813 () Bool)

(assert (=> b!1511354 m!1393813))

(assert (=> b!1511354 m!1393813))

(assert (=> b!1511354 m!1393811))

(declare-fun m!1393815 () Bool)

(assert (=> b!1511354 m!1393815))

(assert (=> b!1511352 m!1393811))

(assert (=> b!1511352 m!1393811))

(declare-fun m!1393817 () Bool)

(assert (=> b!1511352 m!1393817))

(declare-fun m!1393819 () Bool)

(assert (=> b!1511350 m!1393819))

(declare-fun m!1393821 () Bool)

(assert (=> b!1511350 m!1393821))

(assert (=> b!1511350 m!1393821))

(declare-fun m!1393823 () Bool)

(assert (=> b!1511350 m!1393823))

(assert (=> b!1511350 m!1393823))

(assert (=> b!1511350 m!1393821))

(declare-fun m!1393825 () Bool)

(assert (=> b!1511350 m!1393825))

(assert (=> b!1511358 m!1393811))

(assert (=> b!1511358 m!1393811))

(declare-fun m!1393827 () Bool)

(assert (=> b!1511358 m!1393827))

(declare-fun m!1393829 () Bool)

(assert (=> b!1511357 m!1393829))

(declare-fun m!1393831 () Bool)

(assert (=> start!129122 m!1393831))

(declare-fun m!1393833 () Bool)

(assert (=> start!129122 m!1393833))

(declare-fun m!1393835 () Bool)

(assert (=> b!1511356 m!1393835))

(check-sat (not b!1511358) (not b!1511357) (not b!1511352) (not b!1511351) (not b!1511359) (not start!129122) (not b!1511354) (not b!1511356) (not b!1511350))
(check-sat)
