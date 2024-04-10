; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129798 () Bool)

(assert start!129798)

(declare-fun b!1523644 () Bool)

(declare-fun res!1042557 () Bool)

(declare-fun e!849414 () Bool)

(assert (=> b!1523644 (=> (not res!1042557) (not e!849414))))

(declare-datatypes ((SeekEntryResult!13093 0))(
  ( (MissingZero!13093 (index!54767 (_ BitVec 32))) (Found!13093 (index!54768 (_ BitVec 32))) (Intermediate!13093 (undefined!13905 Bool) (index!54769 (_ BitVec 32)) (x!136451 (_ BitVec 32))) (Undefined!13093) (MissingVacant!13093 (index!54770 (_ BitVec 32))) )
))
(declare-fun lt!660008 () SeekEntryResult!13093)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((array!101394 0))(
  ( (array!101395 (arr!48928 (Array (_ BitVec 32) (_ BitVec 64))) (size!49478 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101394)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101394 (_ BitVec 32)) SeekEntryResult!13093)

(assert (=> b!1523644 (= res!1042557 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48928 a!2804) j!70) a!2804 mask!2512) lt!660008))))

(declare-fun b!1523645 () Bool)

(declare-fun res!1042561 () Bool)

(declare-fun e!849415 () Bool)

(assert (=> b!1523645 (=> (not res!1042561) (not e!849415))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1523645 (= res!1042561 (and (= (size!49478 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49478 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49478 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1523646 () Bool)

(declare-fun res!1042552 () Bool)

(assert (=> b!1523646 (=> (not res!1042552) (not e!849414))))

(declare-fun lt!660010 () SeekEntryResult!13093)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523646 (= res!1042552 (= lt!660010 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48928 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48928 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101395 (store (arr!48928 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49478 a!2804)) mask!2512)))))

(declare-fun b!1523647 () Bool)

(declare-fun res!1042556 () Bool)

(assert (=> b!1523647 (=> (not res!1042556) (not e!849415))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523647 (= res!1042556 (validKeyInArray!0 (select (arr!48928 a!2804) j!70)))))

(declare-fun res!1042558 () Bool)

(assert (=> start!129798 (=> (not res!1042558) (not e!849415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129798 (= res!1042558 (validMask!0 mask!2512))))

(assert (=> start!129798 e!849415))

(assert (=> start!129798 true))

(declare-fun array_inv!37956 (array!101394) Bool)

(assert (=> start!129798 (array_inv!37956 a!2804)))

(declare-fun b!1523648 () Bool)

(declare-fun res!1042555 () Bool)

(assert (=> b!1523648 (=> (not res!1042555) (not e!849415))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101394 (_ BitVec 32)) Bool)

(assert (=> b!1523648 (= res!1042555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523649 () Bool)

(declare-fun res!1042559 () Bool)

(assert (=> b!1523649 (=> (not res!1042559) (not e!849415))))

(declare-datatypes ((List!35411 0))(
  ( (Nil!35408) (Cons!35407 (h!36831 (_ BitVec 64)) (t!50105 List!35411)) )
))
(declare-fun arrayNoDuplicates!0 (array!101394 (_ BitVec 32) List!35411) Bool)

(assert (=> b!1523649 (= res!1042559 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35408))))

(declare-fun b!1523650 () Bool)

(assert (=> b!1523650 (= e!849415 e!849414)))

(declare-fun res!1042560 () Bool)

(assert (=> b!1523650 (=> (not res!1042560) (not e!849414))))

(assert (=> b!1523650 (= res!1042560 (= lt!660010 lt!660008))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1523650 (= lt!660008 (Intermediate!13093 false resIndex!21 resX!21))))

(assert (=> b!1523650 (= lt!660010 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48928 a!2804) j!70) mask!2512) (select (arr!48928 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523651 () Bool)

(declare-fun res!1042554 () Bool)

(assert (=> b!1523651 (=> (not res!1042554) (not e!849415))))

(assert (=> b!1523651 (= res!1042554 (validKeyInArray!0 (select (arr!48928 a!2804) i!961)))))

(declare-fun b!1523652 () Bool)

(declare-fun res!1042551 () Bool)

(assert (=> b!1523652 (=> (not res!1042551) (not e!849415))))

(assert (=> b!1523652 (= res!1042551 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49478 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49478 a!2804))))))

(declare-fun b!1523653 () Bool)

(assert (=> b!1523653 (= e!849414 (not true))))

(declare-fun e!849412 () Bool)

(assert (=> b!1523653 e!849412))

(declare-fun res!1042553 () Bool)

(assert (=> b!1523653 (=> (not res!1042553) (not e!849412))))

(assert (=> b!1523653 (= res!1042553 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50970 0))(
  ( (Unit!50971) )
))
(declare-fun lt!660009 () Unit!50970)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101394 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50970)

(assert (=> b!1523653 (= lt!660009 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1523654 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101394 (_ BitVec 32)) SeekEntryResult!13093)

(assert (=> b!1523654 (= e!849412 (= (seekEntry!0 (select (arr!48928 a!2804) j!70) a!2804 mask!2512) (Found!13093 j!70)))))

(assert (= (and start!129798 res!1042558) b!1523645))

(assert (= (and b!1523645 res!1042561) b!1523651))

(assert (= (and b!1523651 res!1042554) b!1523647))

(assert (= (and b!1523647 res!1042556) b!1523648))

(assert (= (and b!1523648 res!1042555) b!1523649))

(assert (= (and b!1523649 res!1042559) b!1523652))

(assert (= (and b!1523652 res!1042551) b!1523650))

(assert (= (and b!1523650 res!1042560) b!1523644))

(assert (= (and b!1523644 res!1042557) b!1523646))

(assert (= (and b!1523646 res!1042552) b!1523653))

(assert (= (and b!1523653 res!1042553) b!1523654))

(declare-fun m!1406781 () Bool)

(assert (=> start!129798 m!1406781))

(declare-fun m!1406783 () Bool)

(assert (=> start!129798 m!1406783))

(declare-fun m!1406785 () Bool)

(assert (=> b!1523644 m!1406785))

(assert (=> b!1523644 m!1406785))

(declare-fun m!1406787 () Bool)

(assert (=> b!1523644 m!1406787))

(declare-fun m!1406789 () Bool)

(assert (=> b!1523651 m!1406789))

(assert (=> b!1523651 m!1406789))

(declare-fun m!1406791 () Bool)

(assert (=> b!1523651 m!1406791))

(assert (=> b!1523654 m!1406785))

(assert (=> b!1523654 m!1406785))

(declare-fun m!1406793 () Bool)

(assert (=> b!1523654 m!1406793))

(declare-fun m!1406795 () Bool)

(assert (=> b!1523648 m!1406795))

(declare-fun m!1406797 () Bool)

(assert (=> b!1523649 m!1406797))

(assert (=> b!1523650 m!1406785))

(assert (=> b!1523650 m!1406785))

(declare-fun m!1406799 () Bool)

(assert (=> b!1523650 m!1406799))

(assert (=> b!1523650 m!1406799))

(assert (=> b!1523650 m!1406785))

(declare-fun m!1406801 () Bool)

(assert (=> b!1523650 m!1406801))

(declare-fun m!1406803 () Bool)

(assert (=> b!1523653 m!1406803))

(declare-fun m!1406805 () Bool)

(assert (=> b!1523653 m!1406805))

(declare-fun m!1406807 () Bool)

(assert (=> b!1523646 m!1406807))

(declare-fun m!1406809 () Bool)

(assert (=> b!1523646 m!1406809))

(assert (=> b!1523646 m!1406809))

(declare-fun m!1406811 () Bool)

(assert (=> b!1523646 m!1406811))

(assert (=> b!1523646 m!1406811))

(assert (=> b!1523646 m!1406809))

(declare-fun m!1406813 () Bool)

(assert (=> b!1523646 m!1406813))

(assert (=> b!1523647 m!1406785))

(assert (=> b!1523647 m!1406785))

(declare-fun m!1406815 () Bool)

(assert (=> b!1523647 m!1406815))

(push 1)

(assert (not b!1523651))

(assert (not start!129798))

(assert (not b!1523654))

