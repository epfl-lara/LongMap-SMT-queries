; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128792 () Bool)

(assert start!128792)

(declare-fun b!1509568 () Bool)

(declare-fun e!843045 () Bool)

(declare-fun e!843047 () Bool)

(assert (=> b!1509568 (= e!843045 e!843047)))

(declare-fun res!1029679 () Bool)

(assert (=> b!1509568 (=> (not res!1029679) (not e!843047))))

(declare-datatypes ((SeekEntryResult!12756 0))(
  ( (MissingZero!12756 (index!53419 (_ BitVec 32))) (Found!12756 (index!53420 (_ BitVec 32))) (Intermediate!12756 (undefined!13568 Bool) (index!53421 (_ BitVec 32)) (x!135172 (_ BitVec 32))) (Undefined!12756) (MissingVacant!12756 (index!53422 (_ BitVec 32))) )
))
(declare-fun lt!654730 () SeekEntryResult!12756)

(declare-fun lt!654731 () SeekEntryResult!12756)

(assert (=> b!1509568 (= res!1029679 (= lt!654730 lt!654731))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1509568 (= lt!654731 (Intermediate!12756 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100648 0))(
  ( (array!100649 (arr!48562 (Array (_ BitVec 32) (_ BitVec 64))) (size!49114 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100648)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100648 (_ BitVec 32)) SeekEntryResult!12756)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509568 (= lt!654730 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48562 a!2804) j!70) mask!2512) (select (arr!48562 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1509569 () Bool)

(declare-fun res!1029677 () Bool)

(assert (=> b!1509569 (=> (not res!1029677) (not e!843045))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509569 (= res!1029677 (validKeyInArray!0 (select (arr!48562 a!2804) j!70)))))

(declare-fun b!1509570 () Bool)

(declare-fun res!1029676 () Bool)

(assert (=> b!1509570 (=> (not res!1029676) (not e!843045))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1509570 (= res!1029676 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49114 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49114 a!2804))))))

(declare-fun b!1509571 () Bool)

(declare-fun res!1029686 () Bool)

(assert (=> b!1509571 (=> (not res!1029686) (not e!843045))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1509571 (= res!1029686 (and (= (size!49114 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49114 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49114 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1509572 () Bool)

(declare-fun e!843048 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100648 (_ BitVec 32)) SeekEntryResult!12756)

(assert (=> b!1509572 (= e!843048 (= (seekEntry!0 (select (arr!48562 a!2804) j!70) a!2804 mask!2512) (Found!12756 j!70)))))

(declare-fun b!1509573 () Bool)

(declare-fun res!1029685 () Bool)

(assert (=> b!1509573 (=> (not res!1029685) (not e!843045))))

(assert (=> b!1509573 (= res!1029685 (validKeyInArray!0 (select (arr!48562 a!2804) i!961)))))

(declare-fun res!1029684 () Bool)

(assert (=> start!128792 (=> (not res!1029684) (not e!843045))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128792 (= res!1029684 (validMask!0 mask!2512))))

(assert (=> start!128792 e!843045))

(assert (=> start!128792 true))

(declare-fun array_inv!37795 (array!100648) Bool)

(assert (=> start!128792 (array_inv!37795 a!2804)))

(declare-fun b!1509567 () Bool)

(declare-fun res!1029680 () Bool)

(assert (=> b!1509567 (=> (not res!1029680) (not e!843047))))

(assert (=> b!1509567 (= res!1029680 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48562 a!2804) j!70) a!2804 mask!2512) lt!654731))))

(declare-fun b!1509574 () Bool)

(declare-fun res!1029683 () Bool)

(assert (=> b!1509574 (=> (not res!1029683) (not e!843045))))

(declare-datatypes ((List!35123 0))(
  ( (Nil!35120) (Cons!35119 (h!36532 (_ BitVec 64)) (t!49809 List!35123)) )
))
(declare-fun arrayNoDuplicates!0 (array!100648 (_ BitVec 32) List!35123) Bool)

(assert (=> b!1509574 (= res!1029683 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35120))))

(declare-fun b!1509575 () Bool)

(declare-fun res!1029678 () Bool)

(assert (=> b!1509575 (=> (not res!1029678) (not e!843045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100648 (_ BitVec 32)) Bool)

(assert (=> b!1509575 (= res!1029678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509576 () Bool)

(declare-fun res!1029681 () Bool)

(assert (=> b!1509576 (=> (not res!1029681) (not e!843047))))

(assert (=> b!1509576 (= res!1029681 (= lt!654730 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48562 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48562 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100649 (store (arr!48562 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49114 a!2804)) mask!2512)))))

(declare-fun b!1509577 () Bool)

(assert (=> b!1509577 (= e!843047 (not true))))

(assert (=> b!1509577 e!843048))

(declare-fun res!1029682 () Bool)

(assert (=> b!1509577 (=> (not res!1029682) (not e!843048))))

(assert (=> b!1509577 (= res!1029682 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50219 0))(
  ( (Unit!50220) )
))
(declare-fun lt!654732 () Unit!50219)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100648 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50219)

(assert (=> b!1509577 (= lt!654732 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!128792 res!1029684) b!1509571))

(assert (= (and b!1509571 res!1029686) b!1509573))

(assert (= (and b!1509573 res!1029685) b!1509569))

(assert (= (and b!1509569 res!1029677) b!1509575))

(assert (= (and b!1509575 res!1029678) b!1509574))

(assert (= (and b!1509574 res!1029683) b!1509570))

(assert (= (and b!1509570 res!1029676) b!1509568))

(assert (= (and b!1509568 res!1029679) b!1509567))

(assert (= (and b!1509567 res!1029680) b!1509576))

(assert (= (and b!1509576 res!1029681) b!1509577))

(assert (= (and b!1509577 res!1029682) b!1509572))

(declare-fun m!1391531 () Bool)

(assert (=> b!1509568 m!1391531))

(assert (=> b!1509568 m!1391531))

(declare-fun m!1391533 () Bool)

(assert (=> b!1509568 m!1391533))

(assert (=> b!1509568 m!1391533))

(assert (=> b!1509568 m!1391531))

(declare-fun m!1391535 () Bool)

(assert (=> b!1509568 m!1391535))

(assert (=> b!1509572 m!1391531))

(assert (=> b!1509572 m!1391531))

(declare-fun m!1391537 () Bool)

(assert (=> b!1509572 m!1391537))

(declare-fun m!1391539 () Bool)

(assert (=> b!1509573 m!1391539))

(assert (=> b!1509573 m!1391539))

(declare-fun m!1391541 () Bool)

(assert (=> b!1509573 m!1391541))

(declare-fun m!1391543 () Bool)

(assert (=> b!1509577 m!1391543))

(declare-fun m!1391545 () Bool)

(assert (=> b!1509577 m!1391545))

(declare-fun m!1391547 () Bool)

(assert (=> b!1509575 m!1391547))

(declare-fun m!1391549 () Bool)

(assert (=> b!1509576 m!1391549))

(declare-fun m!1391551 () Bool)

(assert (=> b!1509576 m!1391551))

(assert (=> b!1509576 m!1391551))

(declare-fun m!1391553 () Bool)

(assert (=> b!1509576 m!1391553))

(assert (=> b!1509576 m!1391553))

(assert (=> b!1509576 m!1391551))

(declare-fun m!1391555 () Bool)

(assert (=> b!1509576 m!1391555))

(declare-fun m!1391557 () Bool)

(assert (=> b!1509574 m!1391557))

(assert (=> b!1509569 m!1391531))

(assert (=> b!1509569 m!1391531))

(declare-fun m!1391559 () Bool)

(assert (=> b!1509569 m!1391559))

(assert (=> b!1509567 m!1391531))

(assert (=> b!1509567 m!1391531))

(declare-fun m!1391561 () Bool)

(assert (=> b!1509567 m!1391561))

(declare-fun m!1391563 () Bool)

(assert (=> start!128792 m!1391563))

(declare-fun m!1391565 () Bool)

(assert (=> start!128792 m!1391565))

(check-sat (not b!1509567) (not b!1509575) (not b!1509569) (not b!1509574) (not b!1509573) (not b!1509577) (not b!1509576) (not b!1509568) (not start!128792) (not b!1509572))
(check-sat)
