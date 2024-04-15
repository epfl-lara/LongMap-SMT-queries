; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130482 () Bool)

(assert start!130482)

(declare-fun b!1531518 () Bool)

(declare-fun res!1048849 () Bool)

(declare-fun e!853329 () Bool)

(assert (=> b!1531518 (=> (not res!1048849) (not e!853329))))

(declare-datatypes ((array!101659 0))(
  ( (array!101660 (arr!49051 (Array (_ BitVec 32) (_ BitVec 64))) (size!49603 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101659)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101659 (_ BitVec 32)) Bool)

(assert (=> b!1531518 (= res!1048849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531519 () Bool)

(declare-fun res!1048855 () Bool)

(assert (=> b!1531519 (=> (not res!1048855) (not e!853329))))

(declare-datatypes ((List!35612 0))(
  ( (Nil!35609) (Cons!35608 (h!37054 (_ BitVec 64)) (t!50298 List!35612)) )
))
(declare-fun arrayNoDuplicates!0 (array!101659 (_ BitVec 32) List!35612) Bool)

(assert (=> b!1531519 (= res!1048855 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35609))))

(declare-fun b!1531520 () Bool)

(declare-fun e!853332 () Bool)

(assert (=> b!1531520 (= e!853332 true)))

(declare-fun lt!663119 () array!101659)

(declare-fun lt!663120 () (_ BitVec 64))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13239 0))(
  ( (MissingZero!13239 (index!55351 (_ BitVec 32))) (Found!13239 (index!55352 (_ BitVec 32))) (Intermediate!13239 (undefined!14051 Bool) (index!55353 (_ BitVec 32)) (x!137052 (_ BitVec 32))) (Undefined!13239) (MissingVacant!13239 (index!55354 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101659 (_ BitVec 32)) SeekEntryResult!13239)

(assert (=> b!1531520 (= (seekEntryOrOpen!0 (select (arr!49051 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!663120 lt!663119 mask!2512))))

(declare-fun lt!663118 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-datatypes ((Unit!51101 0))(
  ( (Unit!51102) )
))
(declare-fun lt!663114 () Unit!51101)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101659 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51101)

(assert (=> b!1531520 (= lt!663114 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!663118 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1531521 () Bool)

(declare-fun e!853328 () Bool)

(declare-fun e!853327 () Bool)

(assert (=> b!1531521 (= e!853328 e!853327)))

(declare-fun res!1048847 () Bool)

(assert (=> b!1531521 (=> (not res!1048847) (not e!853327))))

(declare-fun lt!663116 () SeekEntryResult!13239)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101659 (_ BitVec 32)) SeekEntryResult!13239)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531521 (= res!1048847 (= lt!663116 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!663120 mask!2512) lt!663120 lt!663119 mask!2512)))))

(assert (=> b!1531521 (= lt!663120 (select (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1531521 (= lt!663119 (array!101660 (store (arr!49051 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49603 a!2804)))))

(declare-fun e!853330 () Bool)

(declare-fun b!1531522 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101659 (_ BitVec 32)) SeekEntryResult!13239)

(assert (=> b!1531522 (= e!853330 (= (seekEntry!0 (select (arr!49051 a!2804) j!70) a!2804 mask!2512) (Found!13239 j!70)))))

(declare-fun b!1531523 () Bool)

(declare-fun res!1048848 () Bool)

(assert (=> b!1531523 (=> (not res!1048848) (not e!853329))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1531523 (= res!1048848 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49603 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49603 a!2804))))))

(declare-fun b!1531524 () Bool)

(declare-fun e!853333 () Bool)

(assert (=> b!1531524 (= e!853327 (not e!853333))))

(declare-fun res!1048854 () Bool)

(assert (=> b!1531524 (=> res!1048854 e!853333)))

(assert (=> b!1531524 (= res!1048854 (or (not (= (select (arr!49051 a!2804) j!70) lt!663120)) (= x!534 resX!21)))))

(assert (=> b!1531524 e!853330))

(declare-fun res!1048845 () Bool)

(assert (=> b!1531524 (=> (not res!1048845) (not e!853330))))

(assert (=> b!1531524 (= res!1048845 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!663115 () Unit!51101)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101659 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51101)

(assert (=> b!1531524 (= lt!663115 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531525 () Bool)

(declare-fun res!1048843 () Bool)

(assert (=> b!1531525 (=> (not res!1048843) (not e!853329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531525 (= res!1048843 (validKeyInArray!0 (select (arr!49051 a!2804) i!961)))))

(declare-fun b!1531526 () Bool)

(declare-fun res!1048851 () Bool)

(assert (=> b!1531526 (=> res!1048851 e!853332)))

(declare-fun lt!663117 () SeekEntryResult!13239)

(assert (=> b!1531526 (= res!1048851 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663118 (select (arr!49051 a!2804) j!70) a!2804 mask!2512) lt!663117)))))

(declare-fun b!1531527 () Bool)

(declare-fun res!1048844 () Bool)

(assert (=> b!1531527 (=> (not res!1048844) (not e!853329))))

(assert (=> b!1531527 (= res!1048844 (and (= (size!49603 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49603 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49603 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531528 () Bool)

(declare-fun res!1048846 () Bool)

(assert (=> b!1531528 (=> (not res!1048846) (not e!853328))))

(assert (=> b!1531528 (= res!1048846 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49051 a!2804) j!70) a!2804 mask!2512) lt!663117))))

(declare-fun b!1531529 () Bool)

(declare-fun res!1048850 () Bool)

(assert (=> b!1531529 (=> (not res!1048850) (not e!853329))))

(assert (=> b!1531529 (= res!1048850 (validKeyInArray!0 (select (arr!49051 a!2804) j!70)))))

(declare-fun b!1531530 () Bool)

(assert (=> b!1531530 (= e!853333 e!853332)))

(declare-fun res!1048853 () Bool)

(assert (=> b!1531530 (=> res!1048853 e!853332)))

(assert (=> b!1531530 (= res!1048853 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663118 #b00000000000000000000000000000000) (bvsge lt!663118 (size!49603 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531530 (= lt!663118 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun res!1048842 () Bool)

(assert (=> start!130482 (=> (not res!1048842) (not e!853329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130482 (= res!1048842 (validMask!0 mask!2512))))

(assert (=> start!130482 e!853329))

(assert (=> start!130482 true))

(declare-fun array_inv!38284 (array!101659) Bool)

(assert (=> start!130482 (array_inv!38284 a!2804)))

(declare-fun b!1531531 () Bool)

(assert (=> b!1531531 (= e!853329 e!853328)))

(declare-fun res!1048852 () Bool)

(assert (=> b!1531531 (=> (not res!1048852) (not e!853328))))

(assert (=> b!1531531 (= res!1048852 (= lt!663116 lt!663117))))

(assert (=> b!1531531 (= lt!663117 (Intermediate!13239 false resIndex!21 resX!21))))

(assert (=> b!1531531 (= lt!663116 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49051 a!2804) j!70) mask!2512) (select (arr!49051 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!130482 res!1048842) b!1531527))

(assert (= (and b!1531527 res!1048844) b!1531525))

(assert (= (and b!1531525 res!1048843) b!1531529))

(assert (= (and b!1531529 res!1048850) b!1531518))

(assert (= (and b!1531518 res!1048849) b!1531519))

(assert (= (and b!1531519 res!1048855) b!1531523))

(assert (= (and b!1531523 res!1048848) b!1531531))

(assert (= (and b!1531531 res!1048852) b!1531528))

(assert (= (and b!1531528 res!1048846) b!1531521))

(assert (= (and b!1531521 res!1048847) b!1531524))

(assert (= (and b!1531524 res!1048845) b!1531522))

(assert (= (and b!1531524 (not res!1048854)) b!1531530))

(assert (= (and b!1531530 (not res!1048853)) b!1531526))

(assert (= (and b!1531526 (not res!1048851)) b!1531520))

(declare-fun m!1413605 () Bool)

(assert (=> b!1531520 m!1413605))

(assert (=> b!1531520 m!1413605))

(declare-fun m!1413607 () Bool)

(assert (=> b!1531520 m!1413607))

(declare-fun m!1413609 () Bool)

(assert (=> b!1531520 m!1413609))

(declare-fun m!1413611 () Bool)

(assert (=> b!1531520 m!1413611))

(declare-fun m!1413613 () Bool)

(assert (=> start!130482 m!1413613))

(declare-fun m!1413615 () Bool)

(assert (=> start!130482 m!1413615))

(assert (=> b!1531524 m!1413605))

(declare-fun m!1413617 () Bool)

(assert (=> b!1531524 m!1413617))

(declare-fun m!1413619 () Bool)

(assert (=> b!1531524 m!1413619))

(assert (=> b!1531526 m!1413605))

(assert (=> b!1531526 m!1413605))

(declare-fun m!1413621 () Bool)

(assert (=> b!1531526 m!1413621))

(declare-fun m!1413623 () Bool)

(assert (=> b!1531525 m!1413623))

(assert (=> b!1531525 m!1413623))

(declare-fun m!1413625 () Bool)

(assert (=> b!1531525 m!1413625))

(declare-fun m!1413627 () Bool)

(assert (=> b!1531530 m!1413627))

(assert (=> b!1531522 m!1413605))

(assert (=> b!1531522 m!1413605))

(declare-fun m!1413629 () Bool)

(assert (=> b!1531522 m!1413629))

(declare-fun m!1413631 () Bool)

(assert (=> b!1531518 m!1413631))

(declare-fun m!1413633 () Bool)

(assert (=> b!1531519 m!1413633))

(assert (=> b!1531529 m!1413605))

(assert (=> b!1531529 m!1413605))

(declare-fun m!1413635 () Bool)

(assert (=> b!1531529 m!1413635))

(declare-fun m!1413637 () Bool)

(assert (=> b!1531521 m!1413637))

(assert (=> b!1531521 m!1413637))

(declare-fun m!1413639 () Bool)

(assert (=> b!1531521 m!1413639))

(declare-fun m!1413641 () Bool)

(assert (=> b!1531521 m!1413641))

(declare-fun m!1413643 () Bool)

(assert (=> b!1531521 m!1413643))

(assert (=> b!1531528 m!1413605))

(assert (=> b!1531528 m!1413605))

(declare-fun m!1413645 () Bool)

(assert (=> b!1531528 m!1413645))

(assert (=> b!1531531 m!1413605))

(assert (=> b!1531531 m!1413605))

(declare-fun m!1413647 () Bool)

(assert (=> b!1531531 m!1413647))

(assert (=> b!1531531 m!1413647))

(assert (=> b!1531531 m!1413605))

(declare-fun m!1413649 () Bool)

(assert (=> b!1531531 m!1413649))

(check-sat (not b!1531530) (not b!1531521) (not b!1531526) (not start!130482) (not b!1531524) (not b!1531522) (not b!1531525) (not b!1531528) (not b!1531529) (not b!1531520) (not b!1531518) (not b!1531531) (not b!1531519))
(check-sat)
