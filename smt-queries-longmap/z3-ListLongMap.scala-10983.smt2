; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128594 () Bool)

(assert start!128594)

(declare-fun b!1507556 () Bool)

(declare-fun e!842248 () Bool)

(declare-fun e!842250 () Bool)

(assert (=> b!1507556 (= e!842248 e!842250)))

(declare-fun res!1027882 () Bool)

(assert (=> b!1507556 (=> (not res!1027882) (not e!842250))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100528 0))(
  ( (array!100529 (arr!48505 (Array (_ BitVec 32) (_ BitVec 64))) (size!49057 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100528)

(declare-datatypes ((SeekEntryResult!12699 0))(
  ( (MissingZero!12699 (index!53191 (_ BitVec 32))) (Found!12699 (index!53192 (_ BitVec 32))) (Intermediate!12699 (undefined!13511 Bool) (index!53193 (_ BitVec 32)) (x!134951 (_ BitVec 32))) (Undefined!12699) (MissingVacant!12699 (index!53194 (_ BitVec 32))) )
))
(declare-fun lt!654204 () SeekEntryResult!12699)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100528 (_ BitVec 32)) SeekEntryResult!12699)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507556 (= res!1027882 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48505 a!2804) j!70) mask!2512) (select (arr!48505 a!2804) j!70) a!2804 mask!2512) lt!654204))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1507556 (= lt!654204 (Intermediate!12699 false resIndex!21 resX!21))))

(declare-fun b!1507557 () Bool)

(declare-fun res!1027881 () Bool)

(assert (=> b!1507557 (=> (not res!1027881) (not e!842248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100528 (_ BitVec 32)) Bool)

(assert (=> b!1507557 (= res!1027881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1507558 () Bool)

(declare-fun res!1027878 () Bool)

(assert (=> b!1507558 (=> (not res!1027878) (not e!842248))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507558 (= res!1027878 (validKeyInArray!0 (select (arr!48505 a!2804) j!70)))))

(declare-fun res!1027879 () Bool)

(assert (=> start!128594 (=> (not res!1027879) (not e!842248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128594 (= res!1027879 (validMask!0 mask!2512))))

(assert (=> start!128594 e!842248))

(assert (=> start!128594 true))

(declare-fun array_inv!37738 (array!100528) Bool)

(assert (=> start!128594 (array_inv!37738 a!2804)))

(declare-fun b!1507559 () Bool)

(declare-fun res!1027883 () Bool)

(assert (=> b!1507559 (=> (not res!1027883) (not e!842248))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1507559 (= res!1027883 (validKeyInArray!0 (select (arr!48505 a!2804) i!961)))))

(declare-fun b!1507560 () Bool)

(declare-fun res!1027876 () Bool)

(assert (=> b!1507560 (=> (not res!1027876) (not e!842248))))

(assert (=> b!1507560 (= res!1027876 (and (= (size!49057 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49057 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49057 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507561 () Bool)

(assert (=> b!1507561 (= e!842250 (bvslt mask!2512 #b00000000000000000000000000000000))))

(declare-fun b!1507562 () Bool)

(declare-fun res!1027880 () Bool)

(assert (=> b!1507562 (=> (not res!1027880) (not e!842248))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1507562 (= res!1027880 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49057 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49057 a!2804))))))

(declare-fun b!1507563 () Bool)

(declare-fun res!1027875 () Bool)

(assert (=> b!1507563 (=> (not res!1027875) (not e!842248))))

(declare-datatypes ((List!35066 0))(
  ( (Nil!35063) (Cons!35062 (h!36469 (_ BitVec 64)) (t!49752 List!35066)) )
))
(declare-fun arrayNoDuplicates!0 (array!100528 (_ BitVec 32) List!35066) Bool)

(assert (=> b!1507563 (= res!1027875 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35063))))

(declare-fun b!1507564 () Bool)

(declare-fun res!1027877 () Bool)

(assert (=> b!1507564 (=> (not res!1027877) (not e!842250))))

(assert (=> b!1507564 (= res!1027877 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48505 a!2804) j!70) a!2804 mask!2512) lt!654204))))

(assert (= (and start!128594 res!1027879) b!1507560))

(assert (= (and b!1507560 res!1027876) b!1507559))

(assert (= (and b!1507559 res!1027883) b!1507558))

(assert (= (and b!1507558 res!1027878) b!1507557))

(assert (= (and b!1507557 res!1027881) b!1507563))

(assert (= (and b!1507563 res!1027875) b!1507562))

(assert (= (and b!1507562 res!1027880) b!1507556))

(assert (= (and b!1507556 res!1027882) b!1507564))

(assert (= (and b!1507564 res!1027877) b!1507561))

(declare-fun m!1389611 () Bool)

(assert (=> b!1507564 m!1389611))

(assert (=> b!1507564 m!1389611))

(declare-fun m!1389613 () Bool)

(assert (=> b!1507564 m!1389613))

(declare-fun m!1389615 () Bool)

(assert (=> b!1507559 m!1389615))

(assert (=> b!1507559 m!1389615))

(declare-fun m!1389617 () Bool)

(assert (=> b!1507559 m!1389617))

(declare-fun m!1389619 () Bool)

(assert (=> start!128594 m!1389619))

(declare-fun m!1389621 () Bool)

(assert (=> start!128594 m!1389621))

(declare-fun m!1389623 () Bool)

(assert (=> b!1507557 m!1389623))

(assert (=> b!1507558 m!1389611))

(assert (=> b!1507558 m!1389611))

(declare-fun m!1389625 () Bool)

(assert (=> b!1507558 m!1389625))

(declare-fun m!1389627 () Bool)

(assert (=> b!1507563 m!1389627))

(assert (=> b!1507556 m!1389611))

(assert (=> b!1507556 m!1389611))

(declare-fun m!1389629 () Bool)

(assert (=> b!1507556 m!1389629))

(assert (=> b!1507556 m!1389629))

(assert (=> b!1507556 m!1389611))

(declare-fun m!1389631 () Bool)

(assert (=> b!1507556 m!1389631))

(check-sat (not b!1507564) (not b!1507559) (not b!1507557) (not b!1507558) (not b!1507556) (not b!1507563) (not start!128594))
(check-sat)
