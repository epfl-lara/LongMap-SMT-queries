; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128850 () Bool)

(assert start!128850)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100706 0))(
  ( (array!100707 (arr!48590 (Array (_ BitVec 32) (_ BitVec 64))) (size!49140 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100706)

(declare-fun e!843298 () Bool)

(declare-fun b!1510006 () Bool)

(declare-datatypes ((SeekEntryResult!12761 0))(
  ( (MissingZero!12761 (index!53439 (_ BitVec 32))) (Found!12761 (index!53440 (_ BitVec 32))) (Intermediate!12761 (undefined!13573 Bool) (index!53441 (_ BitVec 32)) (x!135191 (_ BitVec 32))) (Undefined!12761) (MissingVacant!12761 (index!53442 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100706 (_ BitVec 32)) SeekEntryResult!12761)

(assert (=> b!1510006 (= e!843298 (= (seekEntry!0 (select (arr!48590 a!2804) j!70) a!2804 mask!2512) (Found!12761 j!70)))))

(declare-fun b!1510007 () Bool)

(declare-fun res!1029912 () Bool)

(declare-fun e!843297 () Bool)

(assert (=> b!1510007 (=> (not res!1029912) (not e!843297))))

(declare-datatypes ((List!35073 0))(
  ( (Nil!35070) (Cons!35069 (h!36481 (_ BitVec 64)) (t!49767 List!35073)) )
))
(declare-fun arrayNoDuplicates!0 (array!100706 (_ BitVec 32) List!35073) Bool)

(assert (=> b!1510007 (= res!1029912 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35070))))

(declare-fun b!1510008 () Bool)

(declare-fun res!1029917 () Bool)

(assert (=> b!1510008 (=> (not res!1029917) (not e!843297))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510008 (= res!1029917 (validKeyInArray!0 (select (arr!48590 a!2804) i!961)))))

(declare-fun b!1510009 () Bool)

(declare-fun res!1029910 () Bool)

(assert (=> b!1510009 (=> (not res!1029910) (not e!843297))))

(assert (=> b!1510009 (= res!1029910 (and (= (size!49140 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49140 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49140 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510010 () Bool)

(declare-fun res!1029911 () Bool)

(declare-fun e!843296 () Bool)

(assert (=> b!1510010 (=> (not res!1029911) (not e!843296))))

(declare-fun lt!655052 () SeekEntryResult!12761)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100706 (_ BitVec 32)) SeekEntryResult!12761)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510010 (= res!1029911 (= lt!655052 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48590 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48590 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100707 (store (arr!48590 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49140 a!2804)) mask!2512)))))

(declare-fun b!1510012 () Bool)

(assert (=> b!1510012 (= e!843296 (not true))))

(assert (=> b!1510012 e!843298))

(declare-fun res!1029914 () Bool)

(assert (=> b!1510012 (=> (not res!1029914) (not e!843298))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100706 (_ BitVec 32)) Bool)

(assert (=> b!1510012 (= res!1029914 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50390 0))(
  ( (Unit!50391) )
))
(declare-fun lt!655054 () Unit!50390)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100706 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50390)

(assert (=> b!1510012 (= lt!655054 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510013 () Bool)

(declare-fun res!1029919 () Bool)

(assert (=> b!1510013 (=> (not res!1029919) (not e!843297))))

(assert (=> b!1510013 (= res!1029919 (validKeyInArray!0 (select (arr!48590 a!2804) j!70)))))

(declare-fun b!1510014 () Bool)

(declare-fun res!1029915 () Bool)

(assert (=> b!1510014 (=> (not res!1029915) (not e!843297))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510014 (= res!1029915 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49140 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49140 a!2804))))))

(declare-fun b!1510015 () Bool)

(declare-fun res!1029918 () Bool)

(assert (=> b!1510015 (=> (not res!1029918) (not e!843296))))

(declare-fun lt!655053 () SeekEntryResult!12761)

(assert (=> b!1510015 (= res!1029918 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48590 a!2804) j!70) a!2804 mask!2512) lt!655053))))

(declare-fun b!1510016 () Bool)

(assert (=> b!1510016 (= e!843297 e!843296)))

(declare-fun res!1029913 () Bool)

(assert (=> b!1510016 (=> (not res!1029913) (not e!843296))))

(assert (=> b!1510016 (= res!1029913 (= lt!655052 lt!655053))))

(assert (=> b!1510016 (= lt!655053 (Intermediate!12761 false resIndex!21 resX!21))))

(assert (=> b!1510016 (= lt!655052 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48590 a!2804) j!70) mask!2512) (select (arr!48590 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1029916 () Bool)

(assert (=> start!128850 (=> (not res!1029916) (not e!843297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128850 (= res!1029916 (validMask!0 mask!2512))))

(assert (=> start!128850 e!843297))

(assert (=> start!128850 true))

(declare-fun array_inv!37618 (array!100706) Bool)

(assert (=> start!128850 (array_inv!37618 a!2804)))

(declare-fun b!1510011 () Bool)

(declare-fun res!1029909 () Bool)

(assert (=> b!1510011 (=> (not res!1029909) (not e!843297))))

(assert (=> b!1510011 (= res!1029909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128850 res!1029916) b!1510009))

(assert (= (and b!1510009 res!1029910) b!1510008))

(assert (= (and b!1510008 res!1029917) b!1510013))

(assert (= (and b!1510013 res!1029919) b!1510011))

(assert (= (and b!1510011 res!1029909) b!1510007))

(assert (= (and b!1510007 res!1029912) b!1510014))

(assert (= (and b!1510014 res!1029915) b!1510016))

(assert (= (and b!1510016 res!1029913) b!1510015))

(assert (= (and b!1510015 res!1029918) b!1510010))

(assert (= (and b!1510010 res!1029911) b!1510012))

(assert (= (and b!1510012 res!1029914) b!1510006))

(declare-fun m!1392547 () Bool)

(assert (=> start!128850 m!1392547))

(declare-fun m!1392549 () Bool)

(assert (=> start!128850 m!1392549))

(declare-fun m!1392551 () Bool)

(assert (=> b!1510013 m!1392551))

(assert (=> b!1510013 m!1392551))

(declare-fun m!1392553 () Bool)

(assert (=> b!1510013 m!1392553))

(declare-fun m!1392555 () Bool)

(assert (=> b!1510007 m!1392555))

(declare-fun m!1392557 () Bool)

(assert (=> b!1510010 m!1392557))

(declare-fun m!1392559 () Bool)

(assert (=> b!1510010 m!1392559))

(assert (=> b!1510010 m!1392559))

(declare-fun m!1392561 () Bool)

(assert (=> b!1510010 m!1392561))

(assert (=> b!1510010 m!1392561))

(assert (=> b!1510010 m!1392559))

(declare-fun m!1392563 () Bool)

(assert (=> b!1510010 m!1392563))

(declare-fun m!1392565 () Bool)

(assert (=> b!1510008 m!1392565))

(assert (=> b!1510008 m!1392565))

(declare-fun m!1392567 () Bool)

(assert (=> b!1510008 m!1392567))

(assert (=> b!1510016 m!1392551))

(assert (=> b!1510016 m!1392551))

(declare-fun m!1392569 () Bool)

(assert (=> b!1510016 m!1392569))

(assert (=> b!1510016 m!1392569))

(assert (=> b!1510016 m!1392551))

(declare-fun m!1392571 () Bool)

(assert (=> b!1510016 m!1392571))

(assert (=> b!1510006 m!1392551))

(assert (=> b!1510006 m!1392551))

(declare-fun m!1392573 () Bool)

(assert (=> b!1510006 m!1392573))

(assert (=> b!1510015 m!1392551))

(assert (=> b!1510015 m!1392551))

(declare-fun m!1392575 () Bool)

(assert (=> b!1510015 m!1392575))

(declare-fun m!1392577 () Bool)

(assert (=> b!1510012 m!1392577))

(declare-fun m!1392579 () Bool)

(assert (=> b!1510012 m!1392579))

(declare-fun m!1392581 () Bool)

(assert (=> b!1510011 m!1392581))

(push 1)

