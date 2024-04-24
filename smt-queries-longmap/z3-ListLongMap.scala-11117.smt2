; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130248 () Bool)

(assert start!130248)

(declare-fun b!1526431 () Bool)

(declare-fun e!851110 () Bool)

(assert (=> b!1526431 (= e!851110 (not true))))

(declare-fun e!851107 () Bool)

(assert (=> b!1526431 e!851107))

(declare-fun res!1043604 () Bool)

(assert (=> b!1526431 (=> (not res!1043604) (not e!851107))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101524 0))(
  ( (array!101525 (arr!48985 (Array (_ BitVec 32) (_ BitVec 64))) (size!49536 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101524)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101524 (_ BitVec 32)) Bool)

(assert (=> b!1526431 (= res!1043604 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50905 0))(
  ( (Unit!50906) )
))
(declare-fun lt!661109 () Unit!50905)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101524 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50905)

(assert (=> b!1526431 (= lt!661109 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526432 () Bool)

(declare-fun res!1043605 () Bool)

(declare-fun e!851109 () Bool)

(assert (=> b!1526432 (=> (not res!1043605) (not e!851109))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1526432 (= res!1043605 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49536 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49536 a!2804))))))

(declare-fun b!1526433 () Bool)

(declare-datatypes ((SeekEntryResult!13043 0))(
  ( (MissingZero!13043 (index!54567 (_ BitVec 32))) (Found!13043 (index!54568 (_ BitVec 32))) (Intermediate!13043 (undefined!13855 Bool) (index!54569 (_ BitVec 32)) (x!136470 (_ BitVec 32))) (Undefined!13043) (MissingVacant!13043 (index!54570 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101524 (_ BitVec 32)) SeekEntryResult!13043)

(assert (=> b!1526433 (= e!851107 (= (seekEntry!0 (select (arr!48985 a!2804) j!70) a!2804 mask!2512) (Found!13043 j!70)))))

(declare-fun b!1526434 () Bool)

(assert (=> b!1526434 (= e!851109 e!851110)))

(declare-fun res!1043597 () Bool)

(assert (=> b!1526434 (=> (not res!1043597) (not e!851110))))

(declare-fun lt!661108 () SeekEntryResult!13043)

(declare-fun lt!661110 () SeekEntryResult!13043)

(assert (=> b!1526434 (= res!1043597 (= lt!661108 lt!661110))))

(assert (=> b!1526434 (= lt!661110 (Intermediate!13043 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101524 (_ BitVec 32)) SeekEntryResult!13043)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526434 (= lt!661108 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48985 a!2804) j!70) mask!2512) (select (arr!48985 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526435 () Bool)

(declare-fun res!1043607 () Bool)

(assert (=> b!1526435 (=> (not res!1043607) (not e!851109))))

(assert (=> b!1526435 (= res!1043607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526436 () Bool)

(declare-fun res!1043602 () Bool)

(assert (=> b!1526436 (=> (not res!1043602) (not e!851109))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526436 (= res!1043602 (validKeyInArray!0 (select (arr!48985 a!2804) i!961)))))

(declare-fun b!1526437 () Bool)

(declare-fun res!1043601 () Bool)

(assert (=> b!1526437 (=> (not res!1043601) (not e!851110))))

(assert (=> b!1526437 (= res!1043601 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48985 a!2804) j!70) a!2804 mask!2512) lt!661110))))

(declare-fun b!1526438 () Bool)

(declare-fun res!1043603 () Bool)

(assert (=> b!1526438 (=> (not res!1043603) (not e!851109))))

(assert (=> b!1526438 (= res!1043603 (validKeyInArray!0 (select (arr!48985 a!2804) j!70)))))

(declare-fun res!1043606 () Bool)

(assert (=> start!130248 (=> (not res!1043606) (not e!851109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130248 (= res!1043606 (validMask!0 mask!2512))))

(assert (=> start!130248 e!851109))

(assert (=> start!130248 true))

(declare-fun array_inv!38266 (array!101524) Bool)

(assert (=> start!130248 (array_inv!38266 a!2804)))

(declare-fun b!1526439 () Bool)

(declare-fun res!1043598 () Bool)

(assert (=> b!1526439 (=> (not res!1043598) (not e!851109))))

(declare-datatypes ((List!35455 0))(
  ( (Nil!35452) (Cons!35451 (h!36896 (_ BitVec 64)) (t!50141 List!35455)) )
))
(declare-fun arrayNoDuplicates!0 (array!101524 (_ BitVec 32) List!35455) Bool)

(assert (=> b!1526439 (= res!1043598 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35452))))

(declare-fun b!1526440 () Bool)

(declare-fun res!1043600 () Bool)

(assert (=> b!1526440 (=> (not res!1043600) (not e!851109))))

(assert (=> b!1526440 (= res!1043600 (and (= (size!49536 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49536 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49536 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526441 () Bool)

(declare-fun res!1043599 () Bool)

(assert (=> b!1526441 (=> (not res!1043599) (not e!851110))))

(assert (=> b!1526441 (= res!1043599 (= lt!661108 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48985 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48985 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101525 (store (arr!48985 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49536 a!2804)) mask!2512)))))

(assert (= (and start!130248 res!1043606) b!1526440))

(assert (= (and b!1526440 res!1043600) b!1526436))

(assert (= (and b!1526436 res!1043602) b!1526438))

(assert (= (and b!1526438 res!1043603) b!1526435))

(assert (= (and b!1526435 res!1043607) b!1526439))

(assert (= (and b!1526439 res!1043598) b!1526432))

(assert (= (and b!1526432 res!1043605) b!1526434))

(assert (= (and b!1526434 res!1043597) b!1526437))

(assert (= (and b!1526437 res!1043601) b!1526441))

(assert (= (and b!1526441 res!1043599) b!1526431))

(assert (= (and b!1526431 res!1043604) b!1526433))

(declare-fun m!1409299 () Bool)

(assert (=> b!1526439 m!1409299))

(declare-fun m!1409301 () Bool)

(assert (=> start!130248 m!1409301))

(declare-fun m!1409303 () Bool)

(assert (=> start!130248 m!1409303))

(declare-fun m!1409305 () Bool)

(assert (=> b!1526437 m!1409305))

(assert (=> b!1526437 m!1409305))

(declare-fun m!1409307 () Bool)

(assert (=> b!1526437 m!1409307))

(declare-fun m!1409309 () Bool)

(assert (=> b!1526431 m!1409309))

(declare-fun m!1409311 () Bool)

(assert (=> b!1526431 m!1409311))

(assert (=> b!1526433 m!1409305))

(assert (=> b!1526433 m!1409305))

(declare-fun m!1409313 () Bool)

(assert (=> b!1526433 m!1409313))

(assert (=> b!1526434 m!1409305))

(assert (=> b!1526434 m!1409305))

(declare-fun m!1409315 () Bool)

(assert (=> b!1526434 m!1409315))

(assert (=> b!1526434 m!1409315))

(assert (=> b!1526434 m!1409305))

(declare-fun m!1409317 () Bool)

(assert (=> b!1526434 m!1409317))

(assert (=> b!1526438 m!1409305))

(assert (=> b!1526438 m!1409305))

(declare-fun m!1409319 () Bool)

(assert (=> b!1526438 m!1409319))

(declare-fun m!1409321 () Bool)

(assert (=> b!1526441 m!1409321))

(declare-fun m!1409323 () Bool)

(assert (=> b!1526441 m!1409323))

(assert (=> b!1526441 m!1409323))

(declare-fun m!1409325 () Bool)

(assert (=> b!1526441 m!1409325))

(assert (=> b!1526441 m!1409325))

(assert (=> b!1526441 m!1409323))

(declare-fun m!1409327 () Bool)

(assert (=> b!1526441 m!1409327))

(declare-fun m!1409329 () Bool)

(assert (=> b!1526435 m!1409329))

(declare-fun m!1409331 () Bool)

(assert (=> b!1526436 m!1409331))

(assert (=> b!1526436 m!1409331))

(declare-fun m!1409333 () Bool)

(assert (=> b!1526436 m!1409333))

(check-sat (not b!1526436) (not b!1526437) (not b!1526431) (not b!1526438) (not b!1526434) (not b!1526441) (not b!1526435) (not b!1526439) (not b!1526433) (not start!130248))
(check-sat)
