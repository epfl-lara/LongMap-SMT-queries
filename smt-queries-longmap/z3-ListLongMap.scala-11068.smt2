; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129596 () Bool)

(assert start!129596)

(declare-fun b!1519549 () Bool)

(declare-fun res!1038099 () Bool)

(declare-fun e!847926 () Bool)

(assert (=> b!1519549 (=> (not res!1038099) (not e!847926))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-datatypes ((array!101215 0))(
  ( (array!101216 (arr!48838 (Array (_ BitVec 32) (_ BitVec 64))) (size!49389 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101215)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1519549 (= res!1038099 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49389 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49389 a!2804))))))

(declare-fun e!847925 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun b!1519550 () Bool)

(declare-datatypes ((SeekEntryResult!12902 0))(
  ( (MissingZero!12902 (index!54003 (_ BitVec 32))) (Found!12902 (index!54004 (_ BitVec 32))) (Intermediate!12902 (undefined!13714 Bool) (index!54005 (_ BitVec 32)) (x!135895 (_ BitVec 32))) (Undefined!12902) (MissingVacant!12902 (index!54006 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101215 (_ BitVec 32)) SeekEntryResult!12902)

(assert (=> b!1519550 (= e!847925 (= (seekEntry!0 (select (arr!48838 a!2804) j!70) a!2804 mask!2512) (Found!12902 j!70)))))

(declare-fun b!1519551 () Bool)

(declare-fun res!1038104 () Bool)

(assert (=> b!1519551 (=> (not res!1038104) (not e!847926))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519551 (= res!1038104 (validKeyInArray!0 (select (arr!48838 a!2804) i!961)))))

(declare-fun res!1038093 () Bool)

(assert (=> start!129596 (=> (not res!1038093) (not e!847926))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129596 (= res!1038093 (validMask!0 mask!2512))))

(assert (=> start!129596 e!847926))

(assert (=> start!129596 true))

(declare-fun array_inv!38119 (array!101215) Bool)

(assert (=> start!129596 (array_inv!38119 a!2804)))

(declare-fun b!1519552 () Bool)

(declare-fun e!847922 () Bool)

(declare-fun e!847921 () Bool)

(assert (=> b!1519552 (= e!847922 e!847921)))

(declare-fun res!1038095 () Bool)

(assert (=> b!1519552 (=> res!1038095 e!847921)))

(declare-fun lt!658583 () (_ BitVec 32))

(assert (=> b!1519552 (= res!1038095 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658583 #b00000000000000000000000000000000) (bvsge lt!658583 (size!49389 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519552 (= lt!658583 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1519553 () Bool)

(declare-fun res!1038102 () Bool)

(declare-fun e!847923 () Bool)

(assert (=> b!1519553 (=> (not res!1038102) (not e!847923))))

(declare-fun lt!658585 () SeekEntryResult!12902)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101215 (_ BitVec 32)) SeekEntryResult!12902)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519553 (= res!1038102 (= lt!658585 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48838 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48838 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101216 (store (arr!48838 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49389 a!2804)) mask!2512)))))

(declare-fun b!1519554 () Bool)

(declare-fun res!1038100 () Bool)

(assert (=> b!1519554 (=> (not res!1038100) (not e!847926))))

(assert (=> b!1519554 (= res!1038100 (and (= (size!49389 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49389 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49389 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1519555 () Bool)

(declare-fun res!1038094 () Bool)

(assert (=> b!1519555 (=> (not res!1038094) (not e!847923))))

(declare-fun lt!658581 () SeekEntryResult!12902)

(assert (=> b!1519555 (= res!1038094 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48838 a!2804) j!70) a!2804 mask!2512) lt!658581))))

(declare-fun b!1519556 () Bool)

(assert (=> b!1519556 (= e!847921 true)))

(declare-fun lt!658582 () SeekEntryResult!12902)

(assert (=> b!1519556 (= lt!658582 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658583 (select (arr!48838 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519557 () Bool)

(assert (=> b!1519557 (= e!847926 e!847923)))

(declare-fun res!1038092 () Bool)

(assert (=> b!1519557 (=> (not res!1038092) (not e!847923))))

(assert (=> b!1519557 (= res!1038092 (= lt!658585 lt!658581))))

(assert (=> b!1519557 (= lt!658581 (Intermediate!12902 false resIndex!21 resX!21))))

(assert (=> b!1519557 (= lt!658585 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48838 a!2804) j!70) mask!2512) (select (arr!48838 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519558 () Bool)

(declare-fun res!1038096 () Bool)

(assert (=> b!1519558 (=> (not res!1038096) (not e!847926))))

(declare-datatypes ((List!35308 0))(
  ( (Nil!35305) (Cons!35304 (h!36734 (_ BitVec 64)) (t!49994 List!35308)) )
))
(declare-fun arrayNoDuplicates!0 (array!101215 (_ BitVec 32) List!35308) Bool)

(assert (=> b!1519558 (= res!1038096 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35305))))

(declare-fun b!1519559 () Bool)

(assert (=> b!1519559 (= e!847923 (not e!847922))))

(declare-fun res!1038098 () Bool)

(assert (=> b!1519559 (=> res!1038098 e!847922)))

(assert (=> b!1519559 (= res!1038098 (or (not (= (select (arr!48838 a!2804) j!70) (select (store (arr!48838 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1519559 e!847925))

(declare-fun res!1038103 () Bool)

(assert (=> b!1519559 (=> (not res!1038103) (not e!847925))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101215 (_ BitVec 32)) Bool)

(assert (=> b!1519559 (= res!1038103 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50707 0))(
  ( (Unit!50708) )
))
(declare-fun lt!658584 () Unit!50707)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101215 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50707)

(assert (=> b!1519559 (= lt!658584 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1519560 () Bool)

(declare-fun res!1038097 () Bool)

(assert (=> b!1519560 (=> (not res!1038097) (not e!847926))))

(assert (=> b!1519560 (= res!1038097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1519561 () Bool)

(declare-fun res!1038101 () Bool)

(assert (=> b!1519561 (=> (not res!1038101) (not e!847926))))

(assert (=> b!1519561 (= res!1038101 (validKeyInArray!0 (select (arr!48838 a!2804) j!70)))))

(assert (= (and start!129596 res!1038093) b!1519554))

(assert (= (and b!1519554 res!1038100) b!1519551))

(assert (= (and b!1519551 res!1038104) b!1519561))

(assert (= (and b!1519561 res!1038101) b!1519560))

(assert (= (and b!1519560 res!1038097) b!1519558))

(assert (= (and b!1519558 res!1038096) b!1519549))

(assert (= (and b!1519549 res!1038099) b!1519557))

(assert (= (and b!1519557 res!1038092) b!1519555))

(assert (= (and b!1519555 res!1038094) b!1519553))

(assert (= (and b!1519553 res!1038102) b!1519559))

(assert (= (and b!1519559 res!1038103) b!1519550))

(assert (= (and b!1519559 (not res!1038098)) b!1519552))

(assert (= (and b!1519552 (not res!1038095)) b!1519556))

(declare-fun m!1402689 () Bool)

(assert (=> b!1519560 m!1402689))

(declare-fun m!1402691 () Bool)

(assert (=> b!1519557 m!1402691))

(assert (=> b!1519557 m!1402691))

(declare-fun m!1402693 () Bool)

(assert (=> b!1519557 m!1402693))

(assert (=> b!1519557 m!1402693))

(assert (=> b!1519557 m!1402691))

(declare-fun m!1402695 () Bool)

(assert (=> b!1519557 m!1402695))

(assert (=> b!1519561 m!1402691))

(assert (=> b!1519561 m!1402691))

(declare-fun m!1402697 () Bool)

(assert (=> b!1519561 m!1402697))

(assert (=> b!1519550 m!1402691))

(assert (=> b!1519550 m!1402691))

(declare-fun m!1402699 () Bool)

(assert (=> b!1519550 m!1402699))

(declare-fun m!1402701 () Bool)

(assert (=> b!1519553 m!1402701))

(declare-fun m!1402703 () Bool)

(assert (=> b!1519553 m!1402703))

(assert (=> b!1519553 m!1402703))

(declare-fun m!1402705 () Bool)

(assert (=> b!1519553 m!1402705))

(assert (=> b!1519553 m!1402705))

(assert (=> b!1519553 m!1402703))

(declare-fun m!1402707 () Bool)

(assert (=> b!1519553 m!1402707))

(assert (=> b!1519559 m!1402691))

(declare-fun m!1402709 () Bool)

(assert (=> b!1519559 m!1402709))

(assert (=> b!1519559 m!1402701))

(assert (=> b!1519559 m!1402703))

(declare-fun m!1402711 () Bool)

(assert (=> b!1519559 m!1402711))

(declare-fun m!1402713 () Bool)

(assert (=> b!1519552 m!1402713))

(declare-fun m!1402715 () Bool)

(assert (=> start!129596 m!1402715))

(declare-fun m!1402717 () Bool)

(assert (=> start!129596 m!1402717))

(declare-fun m!1402719 () Bool)

(assert (=> b!1519551 m!1402719))

(assert (=> b!1519551 m!1402719))

(declare-fun m!1402721 () Bool)

(assert (=> b!1519551 m!1402721))

(declare-fun m!1402723 () Bool)

(assert (=> b!1519558 m!1402723))

(assert (=> b!1519555 m!1402691))

(assert (=> b!1519555 m!1402691))

(declare-fun m!1402725 () Bool)

(assert (=> b!1519555 m!1402725))

(assert (=> b!1519556 m!1402691))

(assert (=> b!1519556 m!1402691))

(declare-fun m!1402727 () Bool)

(assert (=> b!1519556 m!1402727))

(check-sat (not b!1519551) (not b!1519559) (not b!1519557) (not b!1519558) (not b!1519553) (not b!1519555) (not b!1519561) (not b!1519552) (not b!1519550) (not b!1519560) (not b!1519556) (not start!129596))
(check-sat)
