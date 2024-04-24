; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130254 () Bool)

(assert start!130254)

(declare-fun b!1526530 () Bool)

(declare-fun e!851146 () Bool)

(assert (=> b!1526530 (= e!851146 (not true))))

(declare-fun e!851145 () Bool)

(assert (=> b!1526530 e!851145))

(declare-fun res!1043705 () Bool)

(assert (=> b!1526530 (=> (not res!1043705) (not e!851145))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101530 0))(
  ( (array!101531 (arr!48988 (Array (_ BitVec 32) (_ BitVec 64))) (size!49539 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101530)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101530 (_ BitVec 32)) Bool)

(assert (=> b!1526530 (= res!1043705 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50911 0))(
  ( (Unit!50912) )
))
(declare-fun lt!661137 () Unit!50911)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101530 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50911)

(assert (=> b!1526530 (= lt!661137 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526531 () Bool)

(declare-datatypes ((SeekEntryResult!13046 0))(
  ( (MissingZero!13046 (index!54579 (_ BitVec 32))) (Found!13046 (index!54580 (_ BitVec 32))) (Intermediate!13046 (undefined!13858 Bool) (index!54581 (_ BitVec 32)) (x!136481 (_ BitVec 32))) (Undefined!13046) (MissingVacant!13046 (index!54582 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101530 (_ BitVec 32)) SeekEntryResult!13046)

(assert (=> b!1526531 (= e!851145 (= (seekEntry!0 (select (arr!48988 a!2804) j!70) a!2804 mask!2512) (Found!13046 j!70)))))

(declare-fun b!1526532 () Bool)

(declare-fun res!1043699 () Bool)

(declare-fun e!851144 () Bool)

(assert (=> b!1526532 (=> (not res!1043699) (not e!851144))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1526532 (= res!1043699 (and (= (size!49539 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49539 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49539 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1043698 () Bool)

(assert (=> start!130254 (=> (not res!1043698) (not e!851144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130254 (= res!1043698 (validMask!0 mask!2512))))

(assert (=> start!130254 e!851144))

(assert (=> start!130254 true))

(declare-fun array_inv!38269 (array!101530) Bool)

(assert (=> start!130254 (array_inv!38269 a!2804)))

(declare-fun b!1526533 () Bool)

(declare-fun res!1043702 () Bool)

(assert (=> b!1526533 (=> (not res!1043702) (not e!851144))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1526533 (= res!1043702 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49539 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49539 a!2804))))))

(declare-fun b!1526534 () Bool)

(declare-fun res!1043704 () Bool)

(assert (=> b!1526534 (=> (not res!1043704) (not e!851144))))

(assert (=> b!1526534 (= res!1043704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526535 () Bool)

(declare-fun res!1043697 () Bool)

(assert (=> b!1526535 (=> (not res!1043697) (not e!851146))))

(declare-fun lt!661136 () SeekEntryResult!13046)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101530 (_ BitVec 32)) SeekEntryResult!13046)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526535 (= res!1043697 (= lt!661136 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48988 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48988 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101531 (store (arr!48988 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49539 a!2804)) mask!2512)))))

(declare-fun b!1526536 () Bool)

(declare-fun res!1043703 () Bool)

(assert (=> b!1526536 (=> (not res!1043703) (not e!851144))))

(declare-datatypes ((List!35458 0))(
  ( (Nil!35455) (Cons!35454 (h!36899 (_ BitVec 64)) (t!50144 List!35458)) )
))
(declare-fun arrayNoDuplicates!0 (array!101530 (_ BitVec 32) List!35458) Bool)

(assert (=> b!1526536 (= res!1043703 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35455))))

(declare-fun b!1526537 () Bool)

(declare-fun res!1043706 () Bool)

(assert (=> b!1526537 (=> (not res!1043706) (not e!851146))))

(declare-fun lt!661135 () SeekEntryResult!13046)

(assert (=> b!1526537 (= res!1043706 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48988 a!2804) j!70) a!2804 mask!2512) lt!661135))))

(declare-fun b!1526538 () Bool)

(assert (=> b!1526538 (= e!851144 e!851146)))

(declare-fun res!1043700 () Bool)

(assert (=> b!1526538 (=> (not res!1043700) (not e!851146))))

(assert (=> b!1526538 (= res!1043700 (= lt!661136 lt!661135))))

(assert (=> b!1526538 (= lt!661135 (Intermediate!13046 false resIndex!21 resX!21))))

(assert (=> b!1526538 (= lt!661136 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48988 a!2804) j!70) mask!2512) (select (arr!48988 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526539 () Bool)

(declare-fun res!1043696 () Bool)

(assert (=> b!1526539 (=> (not res!1043696) (not e!851144))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526539 (= res!1043696 (validKeyInArray!0 (select (arr!48988 a!2804) j!70)))))

(declare-fun b!1526540 () Bool)

(declare-fun res!1043701 () Bool)

(assert (=> b!1526540 (=> (not res!1043701) (not e!851144))))

(assert (=> b!1526540 (= res!1043701 (validKeyInArray!0 (select (arr!48988 a!2804) i!961)))))

(assert (= (and start!130254 res!1043698) b!1526532))

(assert (= (and b!1526532 res!1043699) b!1526540))

(assert (= (and b!1526540 res!1043701) b!1526539))

(assert (= (and b!1526539 res!1043696) b!1526534))

(assert (= (and b!1526534 res!1043704) b!1526536))

(assert (= (and b!1526536 res!1043703) b!1526533))

(assert (= (and b!1526533 res!1043702) b!1526538))

(assert (= (and b!1526538 res!1043700) b!1526537))

(assert (= (and b!1526537 res!1043706) b!1526535))

(assert (= (and b!1526535 res!1043697) b!1526530))

(assert (= (and b!1526530 res!1043705) b!1526531))

(declare-fun m!1409407 () Bool)

(assert (=> b!1526531 m!1409407))

(assert (=> b!1526531 m!1409407))

(declare-fun m!1409409 () Bool)

(assert (=> b!1526531 m!1409409))

(assert (=> b!1526538 m!1409407))

(assert (=> b!1526538 m!1409407))

(declare-fun m!1409411 () Bool)

(assert (=> b!1526538 m!1409411))

(assert (=> b!1526538 m!1409411))

(assert (=> b!1526538 m!1409407))

(declare-fun m!1409413 () Bool)

(assert (=> b!1526538 m!1409413))

(declare-fun m!1409415 () Bool)

(assert (=> b!1526530 m!1409415))

(declare-fun m!1409417 () Bool)

(assert (=> b!1526530 m!1409417))

(declare-fun m!1409419 () Bool)

(assert (=> start!130254 m!1409419))

(declare-fun m!1409421 () Bool)

(assert (=> start!130254 m!1409421))

(declare-fun m!1409423 () Bool)

(assert (=> b!1526540 m!1409423))

(assert (=> b!1526540 m!1409423))

(declare-fun m!1409425 () Bool)

(assert (=> b!1526540 m!1409425))

(assert (=> b!1526539 m!1409407))

(assert (=> b!1526539 m!1409407))

(declare-fun m!1409427 () Bool)

(assert (=> b!1526539 m!1409427))

(declare-fun m!1409429 () Bool)

(assert (=> b!1526535 m!1409429))

(declare-fun m!1409431 () Bool)

(assert (=> b!1526535 m!1409431))

(assert (=> b!1526535 m!1409431))

(declare-fun m!1409433 () Bool)

(assert (=> b!1526535 m!1409433))

(assert (=> b!1526535 m!1409433))

(assert (=> b!1526535 m!1409431))

(declare-fun m!1409435 () Bool)

(assert (=> b!1526535 m!1409435))

(declare-fun m!1409437 () Bool)

(assert (=> b!1526536 m!1409437))

(declare-fun m!1409439 () Bool)

(assert (=> b!1526534 m!1409439))

(assert (=> b!1526537 m!1409407))

(assert (=> b!1526537 m!1409407))

(declare-fun m!1409441 () Bool)

(assert (=> b!1526537 m!1409441))

(check-sat (not b!1526538) (not b!1526530) (not b!1526531) (not start!130254) (not b!1526534) (not b!1526540) (not b!1526537) (not b!1526536) (not b!1526535) (not b!1526539))
(check-sat)
