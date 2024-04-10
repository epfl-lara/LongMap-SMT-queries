; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128936 () Bool)

(assert start!128936)

(declare-fun b!1511434 () Bool)

(declare-fun res!1031341 () Bool)

(declare-fun e!843822 () Bool)

(assert (=> b!1511434 (=> (not res!1031341) (not e!843822))))

(declare-datatypes ((array!100792 0))(
  ( (array!100793 (arr!48633 (Array (_ BitVec 32) (_ BitVec 64))) (size!49183 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100792)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100792 (_ BitVec 32)) Bool)

(assert (=> b!1511434 (= res!1031341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511435 () Bool)

(declare-fun res!1031340 () Bool)

(assert (=> b!1511435 (=> (not res!1031340) (not e!843822))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1511435 (= res!1031340 (and (= (size!49183 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49183 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49183 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511436 () Bool)

(declare-fun res!1031342 () Bool)

(assert (=> b!1511436 (=> (not res!1031342) (not e!843822))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511436 (= res!1031342 (validKeyInArray!0 (select (arr!48633 a!2804) i!961)))))

(declare-fun b!1511437 () Bool)

(declare-fun e!843821 () Bool)

(assert (=> b!1511437 (= e!843821 (not true))))

(declare-fun e!843823 () Bool)

(assert (=> b!1511437 e!843823))

(declare-fun res!1031339 () Bool)

(assert (=> b!1511437 (=> (not res!1031339) (not e!843823))))

(assert (=> b!1511437 (= res!1031339 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50476 0))(
  ( (Unit!50477) )
))
(declare-fun lt!655441 () Unit!50476)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100792 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50476)

(assert (=> b!1511437 (= lt!655441 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1031345 () Bool)

(assert (=> start!128936 (=> (not res!1031345) (not e!843822))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128936 (= res!1031345 (validMask!0 mask!2512))))

(assert (=> start!128936 e!843822))

(assert (=> start!128936 true))

(declare-fun array_inv!37661 (array!100792) Bool)

(assert (=> start!128936 (array_inv!37661 a!2804)))

(declare-fun b!1511438 () Bool)

(declare-fun res!1031344 () Bool)

(assert (=> b!1511438 (=> (not res!1031344) (not e!843822))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511438 (= res!1031344 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49183 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49183 a!2804))))))

(declare-fun b!1511439 () Bool)

(declare-fun res!1031347 () Bool)

(assert (=> b!1511439 (=> (not res!1031347) (not e!843822))))

(declare-datatypes ((List!35116 0))(
  ( (Nil!35113) (Cons!35112 (h!36524 (_ BitVec 64)) (t!49810 List!35116)) )
))
(declare-fun arrayNoDuplicates!0 (array!100792 (_ BitVec 32) List!35116) Bool)

(assert (=> b!1511439 (= res!1031347 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35113))))

(declare-fun b!1511440 () Bool)

(declare-datatypes ((SeekEntryResult!12804 0))(
  ( (MissingZero!12804 (index!53611 (_ BitVec 32))) (Found!12804 (index!53612 (_ BitVec 32))) (Intermediate!12804 (undefined!13616 Bool) (index!53613 (_ BitVec 32)) (x!135346 (_ BitVec 32))) (Undefined!12804) (MissingVacant!12804 (index!53614 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100792 (_ BitVec 32)) SeekEntryResult!12804)

(assert (=> b!1511440 (= e!843823 (= (seekEntry!0 (select (arr!48633 a!2804) j!70) a!2804 mask!2512) (Found!12804 j!70)))))

(declare-fun b!1511441 () Bool)

(assert (=> b!1511441 (= e!843822 e!843821)))

(declare-fun res!1031346 () Bool)

(assert (=> b!1511441 (=> (not res!1031346) (not e!843821))))

(declare-fun lt!655439 () SeekEntryResult!12804)

(declare-fun lt!655440 () SeekEntryResult!12804)

(assert (=> b!1511441 (= res!1031346 (= lt!655439 lt!655440))))

(assert (=> b!1511441 (= lt!655440 (Intermediate!12804 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100792 (_ BitVec 32)) SeekEntryResult!12804)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511441 (= lt!655439 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48633 a!2804) j!70) mask!2512) (select (arr!48633 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511442 () Bool)

(declare-fun res!1031343 () Bool)

(assert (=> b!1511442 (=> (not res!1031343) (not e!843821))))

(assert (=> b!1511442 (= res!1031343 (= lt!655439 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48633 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48633 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100793 (store (arr!48633 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49183 a!2804)) mask!2512)))))

(declare-fun b!1511443 () Bool)

(declare-fun res!1031338 () Bool)

(assert (=> b!1511443 (=> (not res!1031338) (not e!843822))))

(assert (=> b!1511443 (= res!1031338 (validKeyInArray!0 (select (arr!48633 a!2804) j!70)))))

(declare-fun b!1511444 () Bool)

(declare-fun res!1031337 () Bool)

(assert (=> b!1511444 (=> (not res!1031337) (not e!843821))))

(assert (=> b!1511444 (= res!1031337 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48633 a!2804) j!70) a!2804 mask!2512) lt!655440))))

(assert (= (and start!128936 res!1031345) b!1511435))

(assert (= (and b!1511435 res!1031340) b!1511436))

(assert (= (and b!1511436 res!1031342) b!1511443))

(assert (= (and b!1511443 res!1031338) b!1511434))

(assert (= (and b!1511434 res!1031341) b!1511439))

(assert (= (and b!1511439 res!1031347) b!1511438))

(assert (= (and b!1511438 res!1031344) b!1511441))

(assert (= (and b!1511441 res!1031346) b!1511444))

(assert (= (and b!1511444 res!1031337) b!1511442))

(assert (= (and b!1511442 res!1031343) b!1511437))

(assert (= (and b!1511437 res!1031339) b!1511440))

(declare-fun m!1394131 () Bool)

(assert (=> b!1511443 m!1394131))

(assert (=> b!1511443 m!1394131))

(declare-fun m!1394133 () Bool)

(assert (=> b!1511443 m!1394133))

(declare-fun m!1394135 () Bool)

(assert (=> b!1511437 m!1394135))

(declare-fun m!1394137 () Bool)

(assert (=> b!1511437 m!1394137))

(assert (=> b!1511440 m!1394131))

(assert (=> b!1511440 m!1394131))

(declare-fun m!1394139 () Bool)

(assert (=> b!1511440 m!1394139))

(declare-fun m!1394141 () Bool)

(assert (=> b!1511442 m!1394141))

(declare-fun m!1394143 () Bool)

(assert (=> b!1511442 m!1394143))

(assert (=> b!1511442 m!1394143))

(declare-fun m!1394145 () Bool)

(assert (=> b!1511442 m!1394145))

(assert (=> b!1511442 m!1394145))

(assert (=> b!1511442 m!1394143))

(declare-fun m!1394147 () Bool)

(assert (=> b!1511442 m!1394147))

(declare-fun m!1394149 () Bool)

(assert (=> b!1511434 m!1394149))

(declare-fun m!1394151 () Bool)

(assert (=> start!128936 m!1394151))

(declare-fun m!1394153 () Bool)

(assert (=> start!128936 m!1394153))

(declare-fun m!1394155 () Bool)

(assert (=> b!1511439 m!1394155))

(assert (=> b!1511441 m!1394131))

(assert (=> b!1511441 m!1394131))

(declare-fun m!1394157 () Bool)

(assert (=> b!1511441 m!1394157))

(assert (=> b!1511441 m!1394157))

(assert (=> b!1511441 m!1394131))

(declare-fun m!1394159 () Bool)

(assert (=> b!1511441 m!1394159))

(assert (=> b!1511444 m!1394131))

(assert (=> b!1511444 m!1394131))

(declare-fun m!1394161 () Bool)

(assert (=> b!1511444 m!1394161))

(declare-fun m!1394163 () Bool)

(assert (=> b!1511436 m!1394163))

(assert (=> b!1511436 m!1394163))

(declare-fun m!1394165 () Bool)

(assert (=> b!1511436 m!1394165))

(check-sat (not b!1511437) (not b!1511439) (not b!1511441) (not b!1511444) (not b!1511436) (not b!1511434) (not b!1511442) (not b!1511440) (not b!1511443) (not start!128936))
(check-sat)
