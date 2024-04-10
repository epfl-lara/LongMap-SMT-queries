; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128876 () Bool)

(assert start!128876)

(declare-fun b!1510444 () Bool)

(declare-fun res!1030355 () Bool)

(declare-fun e!843460 () Bool)

(assert (=> b!1510444 (=> (not res!1030355) (not e!843460))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!100732 0))(
  ( (array!100733 (arr!48603 (Array (_ BitVec 32) (_ BitVec 64))) (size!49153 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100732)

(declare-fun i!961 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12774 0))(
  ( (MissingZero!12774 (index!53491 (_ BitVec 32))) (Found!12774 (index!53492 (_ BitVec 32))) (Intermediate!12774 (undefined!13586 Bool) (index!53493 (_ BitVec 32)) (x!135236 (_ BitVec 32))) (Undefined!12774) (MissingVacant!12774 (index!53494 (_ BitVec 32))) )
))
(declare-fun lt!655170 () SeekEntryResult!12774)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100732 (_ BitVec 32)) SeekEntryResult!12774)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510444 (= res!1030355 (= lt!655170 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48603 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48603 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100733 (store (arr!48603 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49153 a!2804)) mask!2512)))))

(declare-fun b!1510445 () Bool)

(assert (=> b!1510445 (= e!843460 (not true))))

(declare-fun e!843463 () Bool)

(assert (=> b!1510445 e!843463))

(declare-fun res!1030349 () Bool)

(assert (=> b!1510445 (=> (not res!1030349) (not e!843463))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100732 (_ BitVec 32)) Bool)

(assert (=> b!1510445 (= res!1030349 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50416 0))(
  ( (Unit!50417) )
))
(declare-fun lt!655171 () Unit!50416)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100732 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50416)

(assert (=> b!1510445 (= lt!655171 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510446 () Bool)

(declare-fun e!843462 () Bool)

(assert (=> b!1510446 (= e!843462 e!843460)))

(declare-fun res!1030348 () Bool)

(assert (=> b!1510446 (=> (not res!1030348) (not e!843460))))

(declare-fun lt!655169 () SeekEntryResult!12774)

(assert (=> b!1510446 (= res!1030348 (= lt!655170 lt!655169))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510446 (= lt!655169 (Intermediate!12774 false resIndex!21 resX!21))))

(assert (=> b!1510446 (= lt!655170 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48603 a!2804) j!70) mask!2512) (select (arr!48603 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510447 () Bool)

(declare-fun res!1030347 () Bool)

(assert (=> b!1510447 (=> (not res!1030347) (not e!843462))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510447 (= res!1030347 (validKeyInArray!0 (select (arr!48603 a!2804) i!961)))))

(declare-fun res!1030350 () Bool)

(assert (=> start!128876 (=> (not res!1030350) (not e!843462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128876 (= res!1030350 (validMask!0 mask!2512))))

(assert (=> start!128876 e!843462))

(assert (=> start!128876 true))

(declare-fun array_inv!37631 (array!100732) Bool)

(assert (=> start!128876 (array_inv!37631 a!2804)))

(declare-fun b!1510448 () Bool)

(declare-fun res!1030351 () Bool)

(assert (=> b!1510448 (=> (not res!1030351) (not e!843462))))

(declare-datatypes ((List!35086 0))(
  ( (Nil!35083) (Cons!35082 (h!36494 (_ BitVec 64)) (t!49780 List!35086)) )
))
(declare-fun arrayNoDuplicates!0 (array!100732 (_ BitVec 32) List!35086) Bool)

(assert (=> b!1510448 (= res!1030351 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35083))))

(declare-fun b!1510449 () Bool)

(declare-fun res!1030357 () Bool)

(assert (=> b!1510449 (=> (not res!1030357) (not e!843462))))

(assert (=> b!1510449 (= res!1030357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510450 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100732 (_ BitVec 32)) SeekEntryResult!12774)

(assert (=> b!1510450 (= e!843463 (= (seekEntry!0 (select (arr!48603 a!2804) j!70) a!2804 mask!2512) (Found!12774 j!70)))))

(declare-fun b!1510451 () Bool)

(declare-fun res!1030354 () Bool)

(assert (=> b!1510451 (=> (not res!1030354) (not e!843462))))

(assert (=> b!1510451 (= res!1030354 (validKeyInArray!0 (select (arr!48603 a!2804) j!70)))))

(declare-fun b!1510452 () Bool)

(declare-fun res!1030353 () Bool)

(assert (=> b!1510452 (=> (not res!1030353) (not e!843460))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1510452 (= res!1030353 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48603 a!2804) j!70) a!2804 mask!2512) lt!655169))))

(declare-fun b!1510453 () Bool)

(declare-fun res!1030356 () Bool)

(assert (=> b!1510453 (=> (not res!1030356) (not e!843462))))

(assert (=> b!1510453 (= res!1030356 (and (= (size!49153 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49153 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49153 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510454 () Bool)

(declare-fun res!1030352 () Bool)

(assert (=> b!1510454 (=> (not res!1030352) (not e!843462))))

(assert (=> b!1510454 (= res!1030352 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49153 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49153 a!2804))))))

(assert (= (and start!128876 res!1030350) b!1510453))

(assert (= (and b!1510453 res!1030356) b!1510447))

(assert (= (and b!1510447 res!1030347) b!1510451))

(assert (= (and b!1510451 res!1030354) b!1510449))

(assert (= (and b!1510449 res!1030357) b!1510448))

(assert (= (and b!1510448 res!1030351) b!1510454))

(assert (= (and b!1510454 res!1030352) b!1510446))

(assert (= (and b!1510446 res!1030348) b!1510452))

(assert (= (and b!1510452 res!1030353) b!1510444))

(assert (= (and b!1510444 res!1030355) b!1510445))

(assert (= (and b!1510445 res!1030349) b!1510450))

(declare-fun m!1393033 () Bool)

(assert (=> b!1510444 m!1393033))

(declare-fun m!1393035 () Bool)

(assert (=> b!1510444 m!1393035))

(assert (=> b!1510444 m!1393035))

(declare-fun m!1393037 () Bool)

(assert (=> b!1510444 m!1393037))

(assert (=> b!1510444 m!1393037))

(assert (=> b!1510444 m!1393035))

(declare-fun m!1393039 () Bool)

(assert (=> b!1510444 m!1393039))

(declare-fun m!1393041 () Bool)

(assert (=> b!1510451 m!1393041))

(assert (=> b!1510451 m!1393041))

(declare-fun m!1393043 () Bool)

(assert (=> b!1510451 m!1393043))

(assert (=> b!1510452 m!1393041))

(assert (=> b!1510452 m!1393041))

(declare-fun m!1393045 () Bool)

(assert (=> b!1510452 m!1393045))

(declare-fun m!1393047 () Bool)

(assert (=> b!1510448 m!1393047))

(assert (=> b!1510446 m!1393041))

(assert (=> b!1510446 m!1393041))

(declare-fun m!1393049 () Bool)

(assert (=> b!1510446 m!1393049))

(assert (=> b!1510446 m!1393049))

(assert (=> b!1510446 m!1393041))

(declare-fun m!1393051 () Bool)

(assert (=> b!1510446 m!1393051))

(assert (=> b!1510450 m!1393041))

(assert (=> b!1510450 m!1393041))

(declare-fun m!1393053 () Bool)

(assert (=> b!1510450 m!1393053))

(declare-fun m!1393055 () Bool)

(assert (=> start!128876 m!1393055))

(declare-fun m!1393057 () Bool)

(assert (=> start!128876 m!1393057))

(declare-fun m!1393059 () Bool)

(assert (=> b!1510445 m!1393059))

(declare-fun m!1393061 () Bool)

(assert (=> b!1510445 m!1393061))

(declare-fun m!1393063 () Bool)

(assert (=> b!1510447 m!1393063))

(assert (=> b!1510447 m!1393063))

(declare-fun m!1393065 () Bool)

(assert (=> b!1510447 m!1393065))

(declare-fun m!1393067 () Bool)

(assert (=> b!1510449 m!1393067))

(check-sat (not b!1510448) (not b!1510452) (not b!1510451) (not b!1510445) (not b!1510444) (not b!1510447) (not b!1510450) (not b!1510446) (not b!1510449) (not start!128876))
(check-sat)
