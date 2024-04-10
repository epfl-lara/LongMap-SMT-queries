; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128798 () Bool)

(assert start!128798)

(declare-fun b!1509201 () Bool)

(declare-fun res!1029105 () Bool)

(declare-fun e!843024 () Bool)

(assert (=> b!1509201 (=> (not res!1029105) (not e!843024))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100654 0))(
  ( (array!100655 (arr!48564 (Array (_ BitVec 32) (_ BitVec 64))) (size!49114 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100654)

(declare-datatypes ((SeekEntryResult!12735 0))(
  ( (MissingZero!12735 (index!53335 (_ BitVec 32))) (Found!12735 (index!53336 (_ BitVec 32))) (Intermediate!12735 (undefined!13547 Bool) (index!53337 (_ BitVec 32)) (x!135093 (_ BitVec 32))) (Undefined!12735) (MissingVacant!12735 (index!53338 (_ BitVec 32))) )
))
(declare-fun lt!654832 () SeekEntryResult!12735)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100654 (_ BitVec 32)) SeekEntryResult!12735)

(assert (=> b!1509201 (= res!1029105 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48564 a!2804) j!70) a!2804 mask!2512) lt!654832))))

(declare-fun b!1509202 () Bool)

(declare-fun res!1029110 () Bool)

(declare-fun e!843025 () Bool)

(assert (=> b!1509202 (=> (not res!1029110) (not e!843025))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1509202 (= res!1029110 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49114 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49114 a!2804))))))

(declare-fun b!1509203 () Bool)

(declare-fun res!1029107 () Bool)

(assert (=> b!1509203 (=> (not res!1029107) (not e!843025))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1509203 (= res!1029107 (and (= (size!49114 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49114 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49114 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1029108 () Bool)

(assert (=> start!128798 (=> (not res!1029108) (not e!843025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128798 (= res!1029108 (validMask!0 mask!2512))))

(assert (=> start!128798 e!843025))

(assert (=> start!128798 true))

(declare-fun array_inv!37592 (array!100654) Bool)

(assert (=> start!128798 (array_inv!37592 a!2804)))

(declare-fun b!1509204 () Bool)

(declare-fun res!1029106 () Bool)

(assert (=> b!1509204 (=> (not res!1029106) (not e!843025))))

(declare-datatypes ((List!35047 0))(
  ( (Nil!35044) (Cons!35043 (h!36455 (_ BitVec 64)) (t!49741 List!35047)) )
))
(declare-fun arrayNoDuplicates!0 (array!100654 (_ BitVec 32) List!35047) Bool)

(assert (=> b!1509204 (= res!1029106 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35044))))

(declare-fun b!1509205 () Bool)

(declare-fun res!1029109 () Bool)

(assert (=> b!1509205 (=> (not res!1029109) (not e!843025))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1509205 (= res!1029109 (validKeyInArray!0 (select (arr!48564 a!2804) i!961)))))

(declare-fun b!1509206 () Bool)

(assert (=> b!1509206 (= e!843025 e!843024)))

(declare-fun res!1029111 () Bool)

(assert (=> b!1509206 (=> (not res!1029111) (not e!843024))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1509206 (= res!1029111 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48564 a!2804) j!70) mask!2512) (select (arr!48564 a!2804) j!70) a!2804 mask!2512) lt!654832))))

(assert (=> b!1509206 (= lt!654832 (Intermediate!12735 false resIndex!21 resX!21))))

(declare-fun b!1509207 () Bool)

(assert (=> b!1509207 (= e!843024 false)))

(declare-fun lt!654831 () SeekEntryResult!12735)

(assert (=> b!1509207 (= lt!654831 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48564 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48564 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100655 (store (arr!48564 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49114 a!2804)) mask!2512))))

(declare-fun b!1509208 () Bool)

(declare-fun res!1029104 () Bool)

(assert (=> b!1509208 (=> (not res!1029104) (not e!843025))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100654 (_ BitVec 32)) Bool)

(assert (=> b!1509208 (= res!1029104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1509209 () Bool)

(declare-fun res!1029112 () Bool)

(assert (=> b!1509209 (=> (not res!1029112) (not e!843025))))

(assert (=> b!1509209 (= res!1029112 (validKeyInArray!0 (select (arr!48564 a!2804) j!70)))))

(assert (= (and start!128798 res!1029108) b!1509203))

(assert (= (and b!1509203 res!1029107) b!1509205))

(assert (= (and b!1509205 res!1029109) b!1509209))

(assert (= (and b!1509209 res!1029112) b!1509208))

(assert (= (and b!1509208 res!1029104) b!1509204))

(assert (= (and b!1509204 res!1029106) b!1509202))

(assert (= (and b!1509202 res!1029110) b!1509206))

(assert (= (and b!1509206 res!1029111) b!1509201))

(assert (= (and b!1509201 res!1029105) b!1509207))

(declare-fun m!1391653 () Bool)

(assert (=> b!1509209 m!1391653))

(assert (=> b!1509209 m!1391653))

(declare-fun m!1391655 () Bool)

(assert (=> b!1509209 m!1391655))

(assert (=> b!1509201 m!1391653))

(assert (=> b!1509201 m!1391653))

(declare-fun m!1391657 () Bool)

(assert (=> b!1509201 m!1391657))

(declare-fun m!1391659 () Bool)

(assert (=> b!1509204 m!1391659))

(declare-fun m!1391661 () Bool)

(assert (=> b!1509207 m!1391661))

(declare-fun m!1391663 () Bool)

(assert (=> b!1509207 m!1391663))

(assert (=> b!1509207 m!1391663))

(declare-fun m!1391665 () Bool)

(assert (=> b!1509207 m!1391665))

(assert (=> b!1509207 m!1391665))

(assert (=> b!1509207 m!1391663))

(declare-fun m!1391667 () Bool)

(assert (=> b!1509207 m!1391667))

(declare-fun m!1391669 () Bool)

(assert (=> b!1509205 m!1391669))

(assert (=> b!1509205 m!1391669))

(declare-fun m!1391671 () Bool)

(assert (=> b!1509205 m!1391671))

(declare-fun m!1391673 () Bool)

(assert (=> b!1509208 m!1391673))

(assert (=> b!1509206 m!1391653))

(assert (=> b!1509206 m!1391653))

(declare-fun m!1391675 () Bool)

(assert (=> b!1509206 m!1391675))

(assert (=> b!1509206 m!1391675))

(assert (=> b!1509206 m!1391653))

(declare-fun m!1391677 () Bool)

(assert (=> b!1509206 m!1391677))

(declare-fun m!1391679 () Bool)

(assert (=> start!128798 m!1391679))

(declare-fun m!1391681 () Bool)

(assert (=> start!128798 m!1391681))

(check-sat (not b!1509205) (not b!1509207) (not b!1509201) (not b!1509206) (not b!1509209) (not b!1509204) (not start!128798) (not b!1509208))
(check-sat)
