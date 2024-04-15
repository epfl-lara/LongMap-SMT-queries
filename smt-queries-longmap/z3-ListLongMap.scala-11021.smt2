; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128906 () Bool)

(assert start!128906)

(declare-fun b!1511497 () Bool)

(declare-fun res!1031606 () Bool)

(declare-fun e!843760 () Bool)

(assert (=> b!1511497 (=> (not res!1031606) (not e!843760))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100762 0))(
  ( (array!100763 (arr!48619 (Array (_ BitVec 32) (_ BitVec 64))) (size!49171 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100762)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511497 (= res!1031606 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49171 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49171 a!2804))))))

(declare-fun b!1511498 () Bool)

(declare-fun res!1031612 () Bool)

(assert (=> b!1511498 (=> (not res!1031612) (not e!843760))))

(declare-datatypes ((List!35180 0))(
  ( (Nil!35177) (Cons!35176 (h!36589 (_ BitVec 64)) (t!49866 List!35180)) )
))
(declare-fun arrayNoDuplicates!0 (array!100762 (_ BitVec 32) List!35180) Bool)

(assert (=> b!1511498 (= res!1031612 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35177))))

(declare-fun b!1511499 () Bool)

(declare-fun res!1031617 () Bool)

(declare-fun e!843762 () Bool)

(assert (=> b!1511499 (=> (not res!1031617) (not e!843762))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12813 0))(
  ( (MissingZero!12813 (index!53647 (_ BitVec 32))) (Found!12813 (index!53648 (_ BitVec 32))) (Intermediate!12813 (undefined!13625 Bool) (index!53649 (_ BitVec 32)) (x!135381 (_ BitVec 32))) (Undefined!12813) (MissingVacant!12813 (index!53650 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100762 (_ BitVec 32)) SeekEntryResult!12813)

(assert (=> b!1511499 (= res!1031617 (= (seekEntry!0 (select (arr!48619 a!2804) j!70) a!2804 mask!2512) (Found!12813 j!70)))))

(declare-fun b!1511500 () Bool)

(declare-fun res!1031610 () Bool)

(declare-fun e!843759 () Bool)

(assert (=> b!1511500 (=> (not res!1031610) (not e!843759))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lt!655243 () SeekEntryResult!12813)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100762 (_ BitVec 32)) SeekEntryResult!12813)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511500 (= res!1031610 (= lt!655243 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48619 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48619 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100763 (store (arr!48619 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49171 a!2804)) mask!2512)))))

(declare-fun b!1511501 () Bool)

(declare-fun res!1031615 () Bool)

(assert (=> b!1511501 (=> (not res!1031615) (not e!843760))))

(assert (=> b!1511501 (= res!1031615 (and (= (size!49171 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49171 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49171 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511502 () Bool)

(assert (=> b!1511502 (= e!843760 e!843759)))

(declare-fun res!1031608 () Bool)

(assert (=> b!1511502 (=> (not res!1031608) (not e!843759))))

(declare-fun lt!655245 () SeekEntryResult!12813)

(assert (=> b!1511502 (= res!1031608 (= lt!655243 lt!655245))))

(assert (=> b!1511502 (= lt!655245 (Intermediate!12813 false resIndex!21 resX!21))))

(assert (=> b!1511502 (= lt!655243 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48619 a!2804) j!70) mask!2512) (select (arr!48619 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511503 () Bool)

(declare-fun e!843761 () Bool)

(assert (=> b!1511503 (= e!843762 e!843761)))

(declare-fun res!1031616 () Bool)

(assert (=> b!1511503 (=> res!1031616 e!843761)))

(assert (=> b!1511503 (= res!1031616 (or (not (= (select (arr!48619 a!2804) j!70) (select (store (arr!48619 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48619 a!2804) index!487) (select (arr!48619 a!2804) j!70)) (not (= (select (arr!48619 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1511505 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100762 (_ BitVec 32)) SeekEntryResult!12813)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100762 (_ BitVec 32)) SeekEntryResult!12813)

(assert (=> b!1511505 (= e!843761 (= (seekEntryOrOpen!0 (select (arr!48619 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48619 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1511506 () Bool)

(declare-fun res!1031607 () Bool)

(assert (=> b!1511506 (=> (not res!1031607) (not e!843760))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511506 (= res!1031607 (validKeyInArray!0 (select (arr!48619 a!2804) j!70)))))

(declare-fun b!1511507 () Bool)

(assert (=> b!1511507 (= e!843759 (not true))))

(assert (=> b!1511507 e!843762))

(declare-fun res!1031614 () Bool)

(assert (=> b!1511507 (=> (not res!1031614) (not e!843762))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100762 (_ BitVec 32)) Bool)

(assert (=> b!1511507 (= res!1031614 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50333 0))(
  ( (Unit!50334) )
))
(declare-fun lt!655244 () Unit!50333)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100762 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50333)

(assert (=> b!1511507 (= lt!655244 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1031618 () Bool)

(assert (=> start!128906 (=> (not res!1031618) (not e!843760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128906 (= res!1031618 (validMask!0 mask!2512))))

(assert (=> start!128906 e!843760))

(assert (=> start!128906 true))

(declare-fun array_inv!37852 (array!100762) Bool)

(assert (=> start!128906 (array_inv!37852 a!2804)))

(declare-fun b!1511504 () Bool)

(declare-fun res!1031613 () Bool)

(assert (=> b!1511504 (=> (not res!1031613) (not e!843760))))

(assert (=> b!1511504 (= res!1031613 (validKeyInArray!0 (select (arr!48619 a!2804) i!961)))))

(declare-fun b!1511508 () Bool)

(declare-fun res!1031609 () Bool)

(assert (=> b!1511508 (=> (not res!1031609) (not e!843760))))

(assert (=> b!1511508 (= res!1031609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511509 () Bool)

(declare-fun res!1031611 () Bool)

(assert (=> b!1511509 (=> (not res!1031611) (not e!843759))))

(assert (=> b!1511509 (= res!1031611 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48619 a!2804) j!70) a!2804 mask!2512) lt!655245))))

(assert (= (and start!128906 res!1031618) b!1511501))

(assert (= (and b!1511501 res!1031615) b!1511504))

(assert (= (and b!1511504 res!1031613) b!1511506))

(assert (= (and b!1511506 res!1031607) b!1511508))

(assert (= (and b!1511508 res!1031609) b!1511498))

(assert (= (and b!1511498 res!1031612) b!1511497))

(assert (= (and b!1511497 res!1031606) b!1511502))

(assert (= (and b!1511502 res!1031608) b!1511509))

(assert (= (and b!1511509 res!1031611) b!1511500))

(assert (= (and b!1511500 res!1031610) b!1511507))

(assert (= (and b!1511507 res!1031614) b!1511499))

(assert (= (and b!1511499 res!1031617) b!1511503))

(assert (= (and b!1511503 (not res!1031616)) b!1511505))

(declare-fun m!1393655 () Bool)

(assert (=> b!1511499 m!1393655))

(assert (=> b!1511499 m!1393655))

(declare-fun m!1393657 () Bool)

(assert (=> b!1511499 m!1393657))

(assert (=> b!1511506 m!1393655))

(assert (=> b!1511506 m!1393655))

(declare-fun m!1393659 () Bool)

(assert (=> b!1511506 m!1393659))

(declare-fun m!1393661 () Bool)

(assert (=> b!1511498 m!1393661))

(declare-fun m!1393663 () Bool)

(assert (=> b!1511504 m!1393663))

(assert (=> b!1511504 m!1393663))

(declare-fun m!1393665 () Bool)

(assert (=> b!1511504 m!1393665))

(declare-fun m!1393667 () Bool)

(assert (=> b!1511507 m!1393667))

(declare-fun m!1393669 () Bool)

(assert (=> b!1511507 m!1393669))

(assert (=> b!1511502 m!1393655))

(assert (=> b!1511502 m!1393655))

(declare-fun m!1393671 () Bool)

(assert (=> b!1511502 m!1393671))

(assert (=> b!1511502 m!1393671))

(assert (=> b!1511502 m!1393655))

(declare-fun m!1393673 () Bool)

(assert (=> b!1511502 m!1393673))

(declare-fun m!1393675 () Bool)

(assert (=> b!1511500 m!1393675))

(declare-fun m!1393677 () Bool)

(assert (=> b!1511500 m!1393677))

(assert (=> b!1511500 m!1393677))

(declare-fun m!1393679 () Bool)

(assert (=> b!1511500 m!1393679))

(assert (=> b!1511500 m!1393679))

(assert (=> b!1511500 m!1393677))

(declare-fun m!1393681 () Bool)

(assert (=> b!1511500 m!1393681))

(declare-fun m!1393683 () Bool)

(assert (=> b!1511508 m!1393683))

(assert (=> b!1511503 m!1393655))

(assert (=> b!1511503 m!1393675))

(assert (=> b!1511503 m!1393677))

(declare-fun m!1393685 () Bool)

(assert (=> b!1511503 m!1393685))

(declare-fun m!1393687 () Bool)

(assert (=> start!128906 m!1393687))

(declare-fun m!1393689 () Bool)

(assert (=> start!128906 m!1393689))

(assert (=> b!1511505 m!1393655))

(assert (=> b!1511505 m!1393655))

(declare-fun m!1393691 () Bool)

(assert (=> b!1511505 m!1393691))

(assert (=> b!1511505 m!1393655))

(declare-fun m!1393693 () Bool)

(assert (=> b!1511505 m!1393693))

(assert (=> b!1511509 m!1393655))

(assert (=> b!1511509 m!1393655))

(declare-fun m!1393695 () Bool)

(assert (=> b!1511509 m!1393695))

(check-sat (not b!1511504) (not b!1511498) (not b!1511508) (not b!1511499) (not b!1511509) (not b!1511500) (not start!128906) (not b!1511502) (not b!1511507) (not b!1511505) (not b!1511506))
(check-sat)
