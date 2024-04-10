; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128888 () Bool)

(assert start!128888)

(declare-fun b!1510642 () Bool)

(declare-fun res!1030554 () Bool)

(declare-fun e!843532 () Bool)

(assert (=> b!1510642 (=> (not res!1030554) (not e!843532))))

(declare-datatypes ((SeekEntryResult!12780 0))(
  ( (MissingZero!12780 (index!53515 (_ BitVec 32))) (Found!12780 (index!53516 (_ BitVec 32))) (Intermediate!12780 (undefined!13592 Bool) (index!53517 (_ BitVec 32)) (x!135258 (_ BitVec 32))) (Undefined!12780) (MissingVacant!12780 (index!53518 (_ BitVec 32))) )
))
(declare-fun lt!655223 () SeekEntryResult!12780)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100744 0))(
  ( (array!100745 (arr!48609 (Array (_ BitVec 32) (_ BitVec 64))) (size!49159 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100744)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100744 (_ BitVec 32)) SeekEntryResult!12780)

(assert (=> b!1510642 (= res!1030554 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48609 a!2804) j!70) a!2804 mask!2512) lt!655223))))

(declare-fun b!1510643 () Bool)

(declare-fun res!1030546 () Bool)

(declare-fun e!843533 () Bool)

(assert (=> b!1510643 (=> (not res!1030546) (not e!843533))))

(declare-datatypes ((List!35092 0))(
  ( (Nil!35089) (Cons!35088 (h!36500 (_ BitVec 64)) (t!49786 List!35092)) )
))
(declare-fun arrayNoDuplicates!0 (array!100744 (_ BitVec 32) List!35092) Bool)

(assert (=> b!1510643 (= res!1030546 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35089))))

(declare-fun b!1510644 () Bool)

(declare-fun res!1030550 () Bool)

(assert (=> b!1510644 (=> (not res!1030550) (not e!843533))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1510644 (= res!1030550 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49159 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49159 a!2804))))))

(declare-fun res!1030555 () Bool)

(assert (=> start!128888 (=> (not res!1030555) (not e!843533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128888 (= res!1030555 (validMask!0 mask!2512))))

(assert (=> start!128888 e!843533))

(assert (=> start!128888 true))

(declare-fun array_inv!37637 (array!100744) Bool)

(assert (=> start!128888 (array_inv!37637 a!2804)))

(declare-fun b!1510645 () Bool)

(declare-fun res!1030548 () Bool)

(assert (=> b!1510645 (=> (not res!1030548) (not e!843533))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510645 (= res!1030548 (validKeyInArray!0 (select (arr!48609 a!2804) i!961)))))

(declare-fun b!1510646 () Bool)

(assert (=> b!1510646 (= e!843533 e!843532)))

(declare-fun res!1030551 () Bool)

(assert (=> b!1510646 (=> (not res!1030551) (not e!843532))))

(declare-fun lt!655225 () SeekEntryResult!12780)

(assert (=> b!1510646 (= res!1030551 (= lt!655225 lt!655223))))

(assert (=> b!1510646 (= lt!655223 (Intermediate!12780 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510646 (= lt!655225 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48609 a!2804) j!70) mask!2512) (select (arr!48609 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510647 () Bool)

(declare-fun e!843535 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100744 (_ BitVec 32)) SeekEntryResult!12780)

(assert (=> b!1510647 (= e!843535 (= (seekEntry!0 (select (arr!48609 a!2804) j!70) a!2804 mask!2512) (Found!12780 j!70)))))

(declare-fun b!1510648 () Bool)

(assert (=> b!1510648 (= e!843532 (not true))))

(assert (=> b!1510648 e!843535))

(declare-fun res!1030547 () Bool)

(assert (=> b!1510648 (=> (not res!1030547) (not e!843535))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100744 (_ BitVec 32)) Bool)

(assert (=> b!1510648 (= res!1030547 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50428 0))(
  ( (Unit!50429) )
))
(declare-fun lt!655224 () Unit!50428)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100744 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50428)

(assert (=> b!1510648 (= lt!655224 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510649 () Bool)

(declare-fun res!1030549 () Bool)

(assert (=> b!1510649 (=> (not res!1030549) (not e!843533))))

(assert (=> b!1510649 (= res!1030549 (and (= (size!49159 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49159 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49159 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510650 () Bool)

(declare-fun res!1030545 () Bool)

(assert (=> b!1510650 (=> (not res!1030545) (not e!843533))))

(assert (=> b!1510650 (= res!1030545 (validKeyInArray!0 (select (arr!48609 a!2804) j!70)))))

(declare-fun b!1510651 () Bool)

(declare-fun res!1030552 () Bool)

(assert (=> b!1510651 (=> (not res!1030552) (not e!843532))))

(assert (=> b!1510651 (= res!1030552 (= lt!655225 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48609 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48609 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100745 (store (arr!48609 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49159 a!2804)) mask!2512)))))

(declare-fun b!1510652 () Bool)

(declare-fun res!1030553 () Bool)

(assert (=> b!1510652 (=> (not res!1030553) (not e!843533))))

(assert (=> b!1510652 (= res!1030553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128888 res!1030555) b!1510649))

(assert (= (and b!1510649 res!1030549) b!1510645))

(assert (= (and b!1510645 res!1030548) b!1510650))

(assert (= (and b!1510650 res!1030545) b!1510652))

(assert (= (and b!1510652 res!1030553) b!1510643))

(assert (= (and b!1510643 res!1030546) b!1510644))

(assert (= (and b!1510644 res!1030550) b!1510646))

(assert (= (and b!1510646 res!1030551) b!1510642))

(assert (= (and b!1510642 res!1030554) b!1510651))

(assert (= (and b!1510651 res!1030552) b!1510648))

(assert (= (and b!1510648 res!1030547) b!1510647))

(declare-fun m!1393255 () Bool)

(assert (=> b!1510642 m!1393255))

(assert (=> b!1510642 m!1393255))

(declare-fun m!1393257 () Bool)

(assert (=> b!1510642 m!1393257))

(declare-fun m!1393259 () Bool)

(assert (=> start!128888 m!1393259))

(declare-fun m!1393261 () Bool)

(assert (=> start!128888 m!1393261))

(declare-fun m!1393263 () Bool)

(assert (=> b!1510643 m!1393263))

(assert (=> b!1510650 m!1393255))

(assert (=> b!1510650 m!1393255))

(declare-fun m!1393265 () Bool)

(assert (=> b!1510650 m!1393265))

(declare-fun m!1393267 () Bool)

(assert (=> b!1510645 m!1393267))

(assert (=> b!1510645 m!1393267))

(declare-fun m!1393269 () Bool)

(assert (=> b!1510645 m!1393269))

(assert (=> b!1510647 m!1393255))

(assert (=> b!1510647 m!1393255))

(declare-fun m!1393271 () Bool)

(assert (=> b!1510647 m!1393271))

(declare-fun m!1393273 () Bool)

(assert (=> b!1510652 m!1393273))

(declare-fun m!1393275 () Bool)

(assert (=> b!1510648 m!1393275))

(declare-fun m!1393277 () Bool)

(assert (=> b!1510648 m!1393277))

(assert (=> b!1510646 m!1393255))

(assert (=> b!1510646 m!1393255))

(declare-fun m!1393279 () Bool)

(assert (=> b!1510646 m!1393279))

(assert (=> b!1510646 m!1393279))

(assert (=> b!1510646 m!1393255))

(declare-fun m!1393281 () Bool)

(assert (=> b!1510646 m!1393281))

(declare-fun m!1393283 () Bool)

(assert (=> b!1510651 m!1393283))

(declare-fun m!1393285 () Bool)

(assert (=> b!1510651 m!1393285))

(assert (=> b!1510651 m!1393285))

(declare-fun m!1393287 () Bool)

(assert (=> b!1510651 m!1393287))

(assert (=> b!1510651 m!1393287))

(assert (=> b!1510651 m!1393285))

(declare-fun m!1393289 () Bool)

(assert (=> b!1510651 m!1393289))

(check-sat (not b!1510647) (not b!1510646) (not b!1510652) (not b!1510642) (not start!128888) (not b!1510643) (not b!1510650) (not b!1510651) (not b!1510645) (not b!1510648))
(check-sat)
