; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129134 () Bool)

(assert start!129134)

(declare-fun b!1515431 () Bool)

(declare-fun res!1035337 () Bool)

(declare-fun e!845686 () Bool)

(assert (=> b!1515431 (=> (not res!1035337) (not e!845686))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100990 0))(
  ( (array!100991 (arr!48732 (Array (_ BitVec 32) (_ BitVec 64))) (size!49282 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100990)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12903 0))(
  ( (MissingZero!12903 (index!54007 (_ BitVec 32))) (Found!12903 (index!54008 (_ BitVec 32))) (Intermediate!12903 (undefined!13715 Bool) (index!54009 (_ BitVec 32)) (x!135709 (_ BitVec 32))) (Undefined!12903) (MissingVacant!12903 (index!54010 (_ BitVec 32))) )
))
(declare-fun lt!656867 () SeekEntryResult!12903)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100990 (_ BitVec 32)) SeekEntryResult!12903)

(assert (=> b!1515431 (= res!1035337 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48732 a!2804) j!70) a!2804 mask!2512) lt!656867))))

(declare-fun b!1515432 () Bool)

(declare-fun res!1035344 () Bool)

(declare-fun e!845684 () Bool)

(assert (=> b!1515432 (=> (not res!1035344) (not e!845684))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1515432 (= res!1035344 (and (= (size!49282 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49282 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49282 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1515433 () Bool)

(declare-fun res!1035338 () Bool)

(assert (=> b!1515433 (=> (not res!1035338) (not e!845684))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515433 (= res!1035338 (validKeyInArray!0 (select (arr!48732 a!2804) i!961)))))

(declare-fun b!1515434 () Bool)

(declare-fun e!845685 () Bool)

(assert (=> b!1515434 (= e!845685 true)))

(declare-fun lt!656868 () SeekEntryResult!12903)

(declare-fun lt!656860 () SeekEntryResult!12903)

(assert (=> b!1515434 (= lt!656868 lt!656860)))

(declare-datatypes ((Unit!50674 0))(
  ( (Unit!50675) )
))
(declare-fun lt!656862 () Unit!50674)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!100990 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50674)

(assert (=> b!1515434 (= lt!656862 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1515435 () Bool)

(declare-fun e!845682 () Bool)

(assert (=> b!1515435 (= e!845686 e!845682)))

(declare-fun res!1035336 () Bool)

(assert (=> b!1515435 (=> (not res!1035336) (not e!845682))))

(declare-fun lt!656864 () SeekEntryResult!12903)

(declare-fun lt!656865 () array!100990)

(declare-fun lt!656866 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515435 (= res!1035336 (= lt!656864 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!656866 mask!2512) lt!656866 lt!656865 mask!2512)))))

(assert (=> b!1515435 (= lt!656866 (select (store (arr!48732 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1515435 (= lt!656865 (array!100991 (store (arr!48732 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49282 a!2804)))))

(declare-fun b!1515436 () Bool)

(declare-fun res!1035340 () Bool)

(assert (=> b!1515436 (=> (not res!1035340) (not e!845684))))

(assert (=> b!1515436 (= res!1035340 (validKeyInArray!0 (select (arr!48732 a!2804) j!70)))))

(declare-fun b!1515437 () Bool)

(assert (=> b!1515437 (= e!845684 e!845686)))

(declare-fun res!1035334 () Bool)

(assert (=> b!1515437 (=> (not res!1035334) (not e!845686))))

(assert (=> b!1515437 (= res!1035334 (= lt!656864 lt!656867))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1515437 (= lt!656867 (Intermediate!12903 false resIndex!21 resX!21))))

(assert (=> b!1515437 (= lt!656864 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48732 a!2804) j!70) mask!2512) (select (arr!48732 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1035341 () Bool)

(assert (=> start!129134 (=> (not res!1035341) (not e!845684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129134 (= res!1035341 (validMask!0 mask!2512))))

(assert (=> start!129134 e!845684))

(assert (=> start!129134 true))

(declare-fun array_inv!37760 (array!100990) Bool)

(assert (=> start!129134 (array_inv!37760 a!2804)))

(declare-fun b!1515438 () Bool)

(declare-fun e!845680 () Bool)

(assert (=> b!1515438 (= e!845680 e!845685)))

(declare-fun res!1035346 () Bool)

(assert (=> b!1515438 (=> res!1035346 e!845685)))

(assert (=> b!1515438 (= res!1035346 (not (= lt!656860 (Found!12903 j!70))))))

(declare-fun lt!656869 () SeekEntryResult!12903)

(assert (=> b!1515438 (= lt!656869 lt!656868)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100990 (_ BitVec 32)) SeekEntryResult!12903)

(assert (=> b!1515438 (= lt!656868 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!656866 lt!656865 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100990 (_ BitVec 32)) SeekEntryResult!12903)

(assert (=> b!1515438 (= lt!656869 (seekEntryOrOpen!0 lt!656866 lt!656865 mask!2512))))

(declare-fun lt!656863 () SeekEntryResult!12903)

(assert (=> b!1515438 (= lt!656863 lt!656860)))

(assert (=> b!1515438 (= lt!656860 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48732 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1515438 (= lt!656863 (seekEntryOrOpen!0 (select (arr!48732 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515439 () Bool)

(assert (=> b!1515439 (= e!845682 (not e!845680))))

(declare-fun res!1035342 () Bool)

(assert (=> b!1515439 (=> res!1035342 e!845680)))

(assert (=> b!1515439 (= res!1035342 (or (not (= (select (arr!48732 a!2804) j!70) lt!656866)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48732 a!2804) index!487) (select (arr!48732 a!2804) j!70)) (not (= (select (arr!48732 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!845683 () Bool)

(assert (=> b!1515439 e!845683))

(declare-fun res!1035343 () Bool)

(assert (=> b!1515439 (=> (not res!1035343) (not e!845683))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100990 (_ BitVec 32)) Bool)

(assert (=> b!1515439 (= res!1035343 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!656861 () Unit!50674)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100990 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50674)

(assert (=> b!1515439 (= lt!656861 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515440 () Bool)

(declare-fun res!1035335 () Bool)

(assert (=> b!1515440 (=> (not res!1035335) (not e!845684))))

(assert (=> b!1515440 (= res!1035335 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49282 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49282 a!2804))))))

(declare-fun b!1515441 () Bool)

(declare-fun res!1035345 () Bool)

(assert (=> b!1515441 (=> (not res!1035345) (not e!845684))))

(declare-datatypes ((List!35215 0))(
  ( (Nil!35212) (Cons!35211 (h!36623 (_ BitVec 64)) (t!49909 List!35215)) )
))
(declare-fun arrayNoDuplicates!0 (array!100990 (_ BitVec 32) List!35215) Bool)

(assert (=> b!1515441 (= res!1035345 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35212))))

(declare-fun b!1515442 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100990 (_ BitVec 32)) SeekEntryResult!12903)

(assert (=> b!1515442 (= e!845683 (= (seekEntry!0 (select (arr!48732 a!2804) j!70) a!2804 mask!2512) (Found!12903 j!70)))))

(declare-fun b!1515443 () Bool)

(declare-fun res!1035339 () Bool)

(assert (=> b!1515443 (=> (not res!1035339) (not e!845684))))

(assert (=> b!1515443 (= res!1035339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129134 res!1035341) b!1515432))

(assert (= (and b!1515432 res!1035344) b!1515433))

(assert (= (and b!1515433 res!1035338) b!1515436))

(assert (= (and b!1515436 res!1035340) b!1515443))

(assert (= (and b!1515443 res!1035339) b!1515441))

(assert (= (and b!1515441 res!1035345) b!1515440))

(assert (= (and b!1515440 res!1035335) b!1515437))

(assert (= (and b!1515437 res!1035334) b!1515431))

(assert (= (and b!1515431 res!1035337) b!1515435))

(assert (= (and b!1515435 res!1035336) b!1515439))

(assert (= (and b!1515439 res!1035343) b!1515442))

(assert (= (and b!1515439 (not res!1035342)) b!1515438))

(assert (= (and b!1515438 (not res!1035346)) b!1515434))

(declare-fun m!1398535 () Bool)

(assert (=> b!1515435 m!1398535))

(assert (=> b!1515435 m!1398535))

(declare-fun m!1398537 () Bool)

(assert (=> b!1515435 m!1398537))

(declare-fun m!1398539 () Bool)

(assert (=> b!1515435 m!1398539))

(declare-fun m!1398541 () Bool)

(assert (=> b!1515435 m!1398541))

(declare-fun m!1398543 () Bool)

(assert (=> b!1515443 m!1398543))

(declare-fun m!1398545 () Bool)

(assert (=> b!1515436 m!1398545))

(assert (=> b!1515436 m!1398545))

(declare-fun m!1398547 () Bool)

(assert (=> b!1515436 m!1398547))

(declare-fun m!1398549 () Bool)

(assert (=> start!129134 m!1398549))

(declare-fun m!1398551 () Bool)

(assert (=> start!129134 m!1398551))

(declare-fun m!1398553 () Bool)

(assert (=> b!1515433 m!1398553))

(assert (=> b!1515433 m!1398553))

(declare-fun m!1398555 () Bool)

(assert (=> b!1515433 m!1398555))

(assert (=> b!1515437 m!1398545))

(assert (=> b!1515437 m!1398545))

(declare-fun m!1398557 () Bool)

(assert (=> b!1515437 m!1398557))

(assert (=> b!1515437 m!1398557))

(assert (=> b!1515437 m!1398545))

(declare-fun m!1398559 () Bool)

(assert (=> b!1515437 m!1398559))

(assert (=> b!1515438 m!1398545))

(declare-fun m!1398561 () Bool)

(assert (=> b!1515438 m!1398561))

(assert (=> b!1515438 m!1398545))

(declare-fun m!1398563 () Bool)

(assert (=> b!1515438 m!1398563))

(declare-fun m!1398565 () Bool)

(assert (=> b!1515438 m!1398565))

(assert (=> b!1515438 m!1398545))

(declare-fun m!1398567 () Bool)

(assert (=> b!1515438 m!1398567))

(assert (=> b!1515439 m!1398545))

(declare-fun m!1398569 () Bool)

(assert (=> b!1515439 m!1398569))

(declare-fun m!1398571 () Bool)

(assert (=> b!1515439 m!1398571))

(declare-fun m!1398573 () Bool)

(assert (=> b!1515439 m!1398573))

(assert (=> b!1515431 m!1398545))

(assert (=> b!1515431 m!1398545))

(declare-fun m!1398575 () Bool)

(assert (=> b!1515431 m!1398575))

(assert (=> b!1515442 m!1398545))

(assert (=> b!1515442 m!1398545))

(declare-fun m!1398577 () Bool)

(assert (=> b!1515442 m!1398577))

(declare-fun m!1398579 () Bool)

(assert (=> b!1515434 m!1398579))

(declare-fun m!1398581 () Bool)

(assert (=> b!1515441 m!1398581))

(check-sat (not b!1515442) (not b!1515431) (not b!1515438) (not b!1515435) (not b!1515437) (not b!1515439) (not b!1515434) (not b!1515443) (not b!1515433) (not b!1515441) (not b!1515436) (not start!129134))
(check-sat)
