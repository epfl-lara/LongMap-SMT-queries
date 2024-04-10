; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129346 () Bool)

(assert start!129346)

(declare-fun b!1519567 () Bool)

(declare-fun e!847632 () Bool)

(declare-fun e!847633 () Bool)

(assert (=> b!1519567 (= e!847632 e!847633)))

(declare-fun res!1039472 () Bool)

(assert (=> b!1519567 (=> (not res!1039472) (not e!847633))))

(declare-datatypes ((SeekEntryResult!13009 0))(
  ( (MissingZero!13009 (index!54431 (_ BitVec 32))) (Found!13009 (index!54432 (_ BitVec 32))) (Intermediate!13009 (undefined!13821 Bool) (index!54433 (_ BitVec 32)) (x!136095 (_ BitVec 32))) (Undefined!13009) (MissingVacant!13009 (index!54434 (_ BitVec 32))) )
))
(declare-fun lt!658706 () SeekEntryResult!13009)

(declare-fun lt!658707 () SeekEntryResult!13009)

(assert (=> b!1519567 (= res!1039472 (= lt!658706 lt!658707))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1519567 (= lt!658707 (Intermediate!13009 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101202 0))(
  ( (array!101203 (arr!48838 (Array (_ BitVec 32) (_ BitVec 64))) (size!49388 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101202)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101202 (_ BitVec 32)) SeekEntryResult!13009)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519567 (= lt!658706 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48838 a!2804) j!70) mask!2512) (select (arr!48838 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519568 () Bool)

(declare-fun res!1039478 () Bool)

(assert (=> b!1519568 (=> (not res!1039478) (not e!847632))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1519568 (= res!1039478 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49388 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49388 a!2804))))))

(declare-fun b!1519569 () Bool)

(declare-fun res!1039477 () Bool)

(assert (=> b!1519569 (=> (not res!1039477) (not e!847632))))

(declare-datatypes ((List!35321 0))(
  ( (Nil!35318) (Cons!35317 (h!36729 (_ BitVec 64)) (t!50015 List!35321)) )
))
(declare-fun arrayNoDuplicates!0 (array!101202 (_ BitVec 32) List!35321) Bool)

(assert (=> b!1519569 (= res!1039477 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35318))))

(declare-fun b!1519570 () Bool)

(declare-fun res!1039476 () Bool)

(assert (=> b!1519570 (=> (not res!1039476) (not e!847632))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519570 (= res!1039476 (validKeyInArray!0 (select (arr!48838 a!2804) i!961)))))

(declare-fun res!1039479 () Bool)

(assert (=> start!129346 (=> (not res!1039479) (not e!847632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129346 (= res!1039479 (validMask!0 mask!2512))))

(assert (=> start!129346 e!847632))

(assert (=> start!129346 true))

(declare-fun array_inv!37866 (array!101202) Bool)

(assert (=> start!129346 (array_inv!37866 a!2804)))

(declare-fun b!1519571 () Bool)

(assert (=> b!1519571 (= e!847633 (not (= (select (arr!48838 a!2804) j!70) (select (store (arr!48838 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))))

(declare-fun e!847630 () Bool)

(assert (=> b!1519571 e!847630))

(declare-fun res!1039474 () Bool)

(assert (=> b!1519571 (=> (not res!1039474) (not e!847630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101202 (_ BitVec 32)) Bool)

(assert (=> b!1519571 (= res!1039474 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50886 0))(
  ( (Unit!50887) )
))
(declare-fun lt!658708 () Unit!50886)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101202 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50886)

(assert (=> b!1519571 (= lt!658708 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1519572 () Bool)

(declare-fun res!1039470 () Bool)

(assert (=> b!1519572 (=> (not res!1039470) (not e!847633))))

(assert (=> b!1519572 (= res!1039470 (= lt!658706 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48838 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48838 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101203 (store (arr!48838 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49388 a!2804)) mask!2512)))))

(declare-fun b!1519573 () Bool)

(declare-fun res!1039471 () Bool)

(assert (=> b!1519573 (=> (not res!1039471) (not e!847632))))

(assert (=> b!1519573 (= res!1039471 (validKeyInArray!0 (select (arr!48838 a!2804) j!70)))))

(declare-fun b!1519574 () Bool)

(declare-fun res!1039480 () Bool)

(assert (=> b!1519574 (=> (not res!1039480) (not e!847633))))

(assert (=> b!1519574 (= res!1039480 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48838 a!2804) j!70) a!2804 mask!2512) lt!658707))))

(declare-fun b!1519575 () Bool)

(declare-fun res!1039473 () Bool)

(assert (=> b!1519575 (=> (not res!1039473) (not e!847632))))

(assert (=> b!1519575 (= res!1039473 (and (= (size!49388 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49388 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49388 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1519576 () Bool)

(declare-fun res!1039475 () Bool)

(assert (=> b!1519576 (=> (not res!1039475) (not e!847632))))

(assert (=> b!1519576 (= res!1039475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1519577 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101202 (_ BitVec 32)) SeekEntryResult!13009)

(assert (=> b!1519577 (= e!847630 (= (seekEntry!0 (select (arr!48838 a!2804) j!70) a!2804 mask!2512) (Found!13009 j!70)))))

(assert (= (and start!129346 res!1039479) b!1519575))

(assert (= (and b!1519575 res!1039473) b!1519570))

(assert (= (and b!1519570 res!1039476) b!1519573))

(assert (= (and b!1519573 res!1039471) b!1519576))

(assert (= (and b!1519576 res!1039475) b!1519569))

(assert (= (and b!1519569 res!1039477) b!1519568))

(assert (= (and b!1519568 res!1039478) b!1519567))

(assert (= (and b!1519567 res!1039472) b!1519574))

(assert (= (and b!1519574 res!1039480) b!1519572))

(assert (= (and b!1519572 res!1039470) b!1519571))

(assert (= (and b!1519571 res!1039474) b!1519577))

(declare-fun m!1402987 () Bool)

(assert (=> start!129346 m!1402987))

(declare-fun m!1402989 () Bool)

(assert (=> start!129346 m!1402989))

(declare-fun m!1402991 () Bool)

(assert (=> b!1519572 m!1402991))

(declare-fun m!1402993 () Bool)

(assert (=> b!1519572 m!1402993))

(assert (=> b!1519572 m!1402993))

(declare-fun m!1402995 () Bool)

(assert (=> b!1519572 m!1402995))

(assert (=> b!1519572 m!1402995))

(assert (=> b!1519572 m!1402993))

(declare-fun m!1402997 () Bool)

(assert (=> b!1519572 m!1402997))

(declare-fun m!1402999 () Bool)

(assert (=> b!1519577 m!1402999))

(assert (=> b!1519577 m!1402999))

(declare-fun m!1403001 () Bool)

(assert (=> b!1519577 m!1403001))

(declare-fun m!1403003 () Bool)

(assert (=> b!1519576 m!1403003))

(assert (=> b!1519573 m!1402999))

(assert (=> b!1519573 m!1402999))

(declare-fun m!1403005 () Bool)

(assert (=> b!1519573 m!1403005))

(assert (=> b!1519571 m!1402999))

(declare-fun m!1403007 () Bool)

(assert (=> b!1519571 m!1403007))

(assert (=> b!1519571 m!1402991))

(assert (=> b!1519571 m!1402993))

(declare-fun m!1403009 () Bool)

(assert (=> b!1519571 m!1403009))

(assert (=> b!1519574 m!1402999))

(assert (=> b!1519574 m!1402999))

(declare-fun m!1403011 () Bool)

(assert (=> b!1519574 m!1403011))

(declare-fun m!1403013 () Bool)

(assert (=> b!1519570 m!1403013))

(assert (=> b!1519570 m!1403013))

(declare-fun m!1403015 () Bool)

(assert (=> b!1519570 m!1403015))

(declare-fun m!1403017 () Bool)

(assert (=> b!1519569 m!1403017))

(assert (=> b!1519567 m!1402999))

(assert (=> b!1519567 m!1402999))

(declare-fun m!1403019 () Bool)

(assert (=> b!1519567 m!1403019))

(assert (=> b!1519567 m!1403019))

(assert (=> b!1519567 m!1402999))

(declare-fun m!1403021 () Bool)

(assert (=> b!1519567 m!1403021))

(push 1)

(assert (not b!1519576))

(assert (not b!1519573))

(assert (not b!1519574))

(assert (not b!1519570))

