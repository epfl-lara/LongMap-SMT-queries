; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128826 () Bool)

(assert start!128826)

(declare-fun b!1509610 () Bool)

(declare-fun e!843154 () Bool)

(declare-fun e!843153 () Bool)

(assert (=> b!1509610 (= e!843154 e!843153)))

(declare-fun res!1029518 () Bool)

(assert (=> b!1509610 (=> (not res!1029518) (not e!843153))))

(declare-datatypes ((SeekEntryResult!12749 0))(
  ( (MissingZero!12749 (index!53391 (_ BitVec 32))) (Found!12749 (index!53392 (_ BitVec 32))) (Intermediate!12749 (undefined!13561 Bool) (index!53393 (_ BitVec 32)) (x!135147 (_ BitVec 32))) (Undefined!12749) (MissingVacant!12749 (index!53394 (_ BitVec 32))) )
))
(declare-fun lt!654946 () SeekEntryResult!12749)

(declare-fun lt!654945 () SeekEntryResult!12749)

(assert (=> b!1509610 (= res!1029518 (= lt!654946 lt!654945))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1509610 (= lt!654945 (Intermediate!12749 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100682 0))(
  ( (array!100683 (arr!48578 (Array (_ BitVec 32) (_ BitVec 64))) (size!49128 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100682)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100682 (_ BitVec 32)) SeekEntryResult!12749)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509610 (= lt!654946 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48578 a!2804) j!70) mask!2512) (select (arr!48578 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509611 () Bool)

(declare-fun res!1029516 () Bool)

(assert (=> b!1509611 (=> (not res!1029516) (not e!843153))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1509611 (= res!1029516 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48578 a!2804) j!70) a!2804 mask!2512) lt!654945))))

(declare-fun b!1509612 () Bool)

(declare-fun res!1029522 () Bool)

(assert (=> b!1509612 (=> (not res!1029522) (not e!843154))))

(declare-datatypes ((List!35061 0))(
  ( (Nil!35058) (Cons!35057 (h!36469 (_ BitVec 64)) (t!49755 List!35061)) )
))
(declare-fun arrayNoDuplicates!0 (array!100682 (_ BitVec 32) List!35061) Bool)

(assert (=> b!1509612 (= res!1029522 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35058))))

(declare-fun b!1509613 () Bool)

(declare-fun res!1029521 () Bool)

(assert (=> b!1509613 (=> (not res!1029521) (not e!843154))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509613 (= res!1029521 (validKeyInArray!0 (select (arr!48578 a!2804) i!961)))))

(declare-fun res!1029520 () Bool)

(assert (=> start!128826 (=> (not res!1029520) (not e!843154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128826 (= res!1029520 (validMask!0 mask!2512))))

(assert (=> start!128826 e!843154))

(assert (=> start!128826 true))

(declare-fun array_inv!37606 (array!100682) Bool)

(assert (=> start!128826 (array_inv!37606 a!2804)))

(declare-fun b!1509614 () Bool)

(declare-fun res!1029523 () Bool)

(assert (=> b!1509614 (=> (not res!1029523) (not e!843153))))

(assert (=> b!1509614 (= res!1029523 (= lt!654946 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48578 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48578 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100683 (store (arr!48578 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49128 a!2804)) mask!2512)))))

(declare-fun b!1509615 () Bool)

(declare-fun res!1029515 () Bool)

(assert (=> b!1509615 (=> (not res!1029515) (not e!843154))))

(assert (=> b!1509615 (= res!1029515 (validKeyInArray!0 (select (arr!48578 a!2804) j!70)))))

(declare-fun b!1509616 () Bool)

(declare-fun res!1029519 () Bool)

(assert (=> b!1509616 (=> (not res!1029519) (not e!843154))))

(assert (=> b!1509616 (= res!1029519 (and (= (size!49128 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49128 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49128 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509617 () Bool)

(declare-fun res!1029513 () Bool)

(assert (=> b!1509617 (=> (not res!1029513) (not e!843154))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100682 (_ BitVec 32)) Bool)

(assert (=> b!1509617 (= res!1029513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509618 () Bool)

(assert (=> b!1509618 (= e!843153 (not true))))

(declare-fun e!843151 () Bool)

(assert (=> b!1509618 e!843151))

(declare-fun res!1029517 () Bool)

(assert (=> b!1509618 (=> (not res!1029517) (not e!843151))))

(assert (=> b!1509618 (= res!1029517 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50366 0))(
  ( (Unit!50367) )
))
(declare-fun lt!654944 () Unit!50366)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100682 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50366)

(assert (=> b!1509618 (= lt!654944 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1509619 () Bool)

(declare-fun res!1029514 () Bool)

(assert (=> b!1509619 (=> (not res!1029514) (not e!843154))))

(assert (=> b!1509619 (= res!1029514 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49128 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49128 a!2804))))))

(declare-fun b!1509620 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100682 (_ BitVec 32)) SeekEntryResult!12749)

(assert (=> b!1509620 (= e!843151 (= (seekEntry!0 (select (arr!48578 a!2804) j!70) a!2804 mask!2512) (Found!12749 j!70)))))

(assert (= (and start!128826 res!1029520) b!1509616))

(assert (= (and b!1509616 res!1029519) b!1509613))

(assert (= (and b!1509613 res!1029521) b!1509615))

(assert (= (and b!1509615 res!1029515) b!1509617))

(assert (= (and b!1509617 res!1029513) b!1509612))

(assert (= (and b!1509612 res!1029522) b!1509619))

(assert (= (and b!1509619 res!1029514) b!1509610))

(assert (= (and b!1509610 res!1029518) b!1509611))

(assert (= (and b!1509611 res!1029516) b!1509614))

(assert (= (and b!1509614 res!1029523) b!1509618))

(assert (= (and b!1509618 res!1029517) b!1509620))

(declare-fun m!1392109 () Bool)

(assert (=> b!1509617 m!1392109))

(declare-fun m!1392111 () Bool)

(assert (=> b!1509615 m!1392111))

(assert (=> b!1509615 m!1392111))

(declare-fun m!1392113 () Bool)

(assert (=> b!1509615 m!1392113))

(declare-fun m!1392115 () Bool)

(assert (=> b!1509614 m!1392115))

(declare-fun m!1392117 () Bool)

(assert (=> b!1509614 m!1392117))

(assert (=> b!1509614 m!1392117))

(declare-fun m!1392119 () Bool)

(assert (=> b!1509614 m!1392119))

(assert (=> b!1509614 m!1392119))

(assert (=> b!1509614 m!1392117))

(declare-fun m!1392121 () Bool)

(assert (=> b!1509614 m!1392121))

(declare-fun m!1392123 () Bool)

(assert (=> b!1509612 m!1392123))

(assert (=> b!1509620 m!1392111))

(assert (=> b!1509620 m!1392111))

(declare-fun m!1392125 () Bool)

(assert (=> b!1509620 m!1392125))

(declare-fun m!1392127 () Bool)

(assert (=> b!1509613 m!1392127))

(assert (=> b!1509613 m!1392127))

(declare-fun m!1392129 () Bool)

(assert (=> b!1509613 m!1392129))

(declare-fun m!1392131 () Bool)

(assert (=> start!128826 m!1392131))

(declare-fun m!1392133 () Bool)

(assert (=> start!128826 m!1392133))

(assert (=> b!1509611 m!1392111))

(assert (=> b!1509611 m!1392111))

(declare-fun m!1392135 () Bool)

(assert (=> b!1509611 m!1392135))

(declare-fun m!1392137 () Bool)

(assert (=> b!1509618 m!1392137))

(declare-fun m!1392139 () Bool)

(assert (=> b!1509618 m!1392139))

(assert (=> b!1509610 m!1392111))

(assert (=> b!1509610 m!1392111))

(declare-fun m!1392141 () Bool)

(assert (=> b!1509610 m!1392141))

(assert (=> b!1509610 m!1392141))

(assert (=> b!1509610 m!1392111))

(declare-fun m!1392143 () Bool)

(assert (=> b!1509610 m!1392143))

(push 1)

(assert (not b!1509615))

(assert (not start!128826))

(assert (not b!1509620))

(assert (not b!1509614))

(assert (not b!1509618))

(assert (not b!1509611))

(assert (not b!1509612))

