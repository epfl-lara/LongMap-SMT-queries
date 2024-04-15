; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128732 () Bool)

(assert start!128732)

(declare-fun b!1508672 () Bool)

(declare-fun res!1028783 () Bool)

(declare-fun e!842746 () Bool)

(assert (=> b!1508672 (=> (not res!1028783) (not e!842746))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100588 0))(
  ( (array!100589 (arr!48532 (Array (_ BitVec 32) (_ BitVec 64))) (size!49084 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100588)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12726 0))(
  ( (MissingZero!12726 (index!53299 (_ BitVec 32))) (Found!12726 (index!53300 (_ BitVec 32))) (Intermediate!12726 (undefined!13538 Bool) (index!53301 (_ BitVec 32)) (x!135062 (_ BitVec 32))) (Undefined!12726) (MissingVacant!12726 (index!53302 (_ BitVec 32))) )
))
(declare-fun lt!654495 () SeekEntryResult!12726)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100588 (_ BitVec 32)) SeekEntryResult!12726)

(assert (=> b!1508672 (= res!1028783 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48532 a!2804) j!70) a!2804 mask!2512) lt!654495))))

(declare-fun b!1508673 () Bool)

(declare-fun res!1028787 () Bool)

(declare-fun e!842747 () Bool)

(assert (=> b!1508673 (=> (not res!1028787) (not e!842747))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508673 (= res!1028787 (validKeyInArray!0 (select (arr!48532 a!2804) j!70)))))

(declare-fun b!1508674 () Bool)

(assert (=> b!1508674 (= e!842746 false)))

(declare-fun lt!654494 () SeekEntryResult!12726)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508674 (= lt!654494 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48532 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48532 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100589 (store (arr!48532 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49084 a!2804)) mask!2512))))

(declare-fun b!1508675 () Bool)

(declare-fun res!1028786 () Bool)

(assert (=> b!1508675 (=> (not res!1028786) (not e!842747))))

(assert (=> b!1508675 (= res!1028786 (and (= (size!49084 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49084 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49084 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508676 () Bool)

(declare-fun res!1028789 () Bool)

(assert (=> b!1508676 (=> (not res!1028789) (not e!842747))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100588 (_ BitVec 32)) Bool)

(assert (=> b!1508676 (= res!1028789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508677 () Bool)

(declare-fun res!1028782 () Bool)

(assert (=> b!1508677 (=> (not res!1028782) (not e!842747))))

(declare-datatypes ((List!35093 0))(
  ( (Nil!35090) (Cons!35089 (h!36502 (_ BitVec 64)) (t!49779 List!35093)) )
))
(declare-fun arrayNoDuplicates!0 (array!100588 (_ BitVec 32) List!35093) Bool)

(assert (=> b!1508677 (= res!1028782 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35090))))

(declare-fun b!1508678 () Bool)

(assert (=> b!1508678 (= e!842747 e!842746)))

(declare-fun res!1028781 () Bool)

(assert (=> b!1508678 (=> (not res!1028781) (not e!842746))))

(assert (=> b!1508678 (= res!1028781 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48532 a!2804) j!70) mask!2512) (select (arr!48532 a!2804) j!70) a!2804 mask!2512) lt!654495))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1508678 (= lt!654495 (Intermediate!12726 false resIndex!21 resX!21))))

(declare-fun res!1028785 () Bool)

(assert (=> start!128732 (=> (not res!1028785) (not e!842747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128732 (= res!1028785 (validMask!0 mask!2512))))

(assert (=> start!128732 e!842747))

(assert (=> start!128732 true))

(declare-fun array_inv!37765 (array!100588) Bool)

(assert (=> start!128732 (array_inv!37765 a!2804)))

(declare-fun b!1508679 () Bool)

(declare-fun res!1028788 () Bool)

(assert (=> b!1508679 (=> (not res!1028788) (not e!842747))))

(assert (=> b!1508679 (= res!1028788 (validKeyInArray!0 (select (arr!48532 a!2804) i!961)))))

(declare-fun b!1508680 () Bool)

(declare-fun res!1028784 () Bool)

(assert (=> b!1508680 (=> (not res!1028784) (not e!842747))))

(assert (=> b!1508680 (= res!1028784 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49084 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49084 a!2804))))))

(assert (= (and start!128732 res!1028785) b!1508675))

(assert (= (and b!1508675 res!1028786) b!1508679))

(assert (= (and b!1508679 res!1028788) b!1508673))

(assert (= (and b!1508673 res!1028787) b!1508676))

(assert (= (and b!1508676 res!1028789) b!1508677))

(assert (= (and b!1508677 res!1028782) b!1508680))

(assert (= (and b!1508680 res!1028784) b!1508678))

(assert (= (and b!1508678 res!1028781) b!1508672))

(assert (= (and b!1508672 res!1028783) b!1508674))

(declare-fun m!1390535 () Bool)

(assert (=> b!1508676 m!1390535))

(declare-fun m!1390537 () Bool)

(assert (=> b!1508678 m!1390537))

(assert (=> b!1508678 m!1390537))

(declare-fun m!1390539 () Bool)

(assert (=> b!1508678 m!1390539))

(assert (=> b!1508678 m!1390539))

(assert (=> b!1508678 m!1390537))

(declare-fun m!1390541 () Bool)

(assert (=> b!1508678 m!1390541))

(declare-fun m!1390543 () Bool)

(assert (=> b!1508679 m!1390543))

(assert (=> b!1508679 m!1390543))

(declare-fun m!1390545 () Bool)

(assert (=> b!1508679 m!1390545))

(declare-fun m!1390547 () Bool)

(assert (=> start!128732 m!1390547))

(declare-fun m!1390549 () Bool)

(assert (=> start!128732 m!1390549))

(declare-fun m!1390551 () Bool)

(assert (=> b!1508674 m!1390551))

(declare-fun m!1390553 () Bool)

(assert (=> b!1508674 m!1390553))

(assert (=> b!1508674 m!1390553))

(declare-fun m!1390555 () Bool)

(assert (=> b!1508674 m!1390555))

(assert (=> b!1508674 m!1390555))

(assert (=> b!1508674 m!1390553))

(declare-fun m!1390557 () Bool)

(assert (=> b!1508674 m!1390557))

(assert (=> b!1508672 m!1390537))

(assert (=> b!1508672 m!1390537))

(declare-fun m!1390559 () Bool)

(assert (=> b!1508672 m!1390559))

(declare-fun m!1390561 () Bool)

(assert (=> b!1508677 m!1390561))

(assert (=> b!1508673 m!1390537))

(assert (=> b!1508673 m!1390537))

(declare-fun m!1390563 () Bool)

(assert (=> b!1508673 m!1390563))

(check-sat (not b!1508673) (not b!1508678) (not start!128732) (not b!1508674) (not b!1508672) (not b!1508676) (not b!1508677) (not b!1508679))
(check-sat)
