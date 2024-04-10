; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128636 () Bool)

(assert start!128636)

(declare-fun b!1507774 () Bool)

(declare-fun res!1027893 () Bool)

(declare-fun e!842430 () Bool)

(assert (=> b!1507774 (=> (not res!1027893) (not e!842430))))

(declare-datatypes ((array!100570 0))(
  ( (array!100571 (arr!48525 (Array (_ BitVec 32) (_ BitVec 64))) (size!49075 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100570)

(declare-datatypes ((List!35008 0))(
  ( (Nil!35005) (Cons!35004 (h!36410 (_ BitVec 64)) (t!49702 List!35008)) )
))
(declare-fun arrayNoDuplicates!0 (array!100570 (_ BitVec 32) List!35008) Bool)

(assert (=> b!1507774 (= res!1027893 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35005))))

(declare-fun b!1507775 () Bool)

(assert (=> b!1507775 (= e!842430 false)))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12696 0))(
  ( (MissingZero!12696 (index!53179 (_ BitVec 32))) (Found!12696 (index!53180 (_ BitVec 32))) (Intermediate!12696 (undefined!13508 Bool) (index!53181 (_ BitVec 32)) (x!134938 (_ BitVec 32))) (Undefined!12696) (MissingVacant!12696 (index!53182 (_ BitVec 32))) )
))
(declare-fun lt!654484 () SeekEntryResult!12696)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100570 (_ BitVec 32)) SeekEntryResult!12696)

(assert (=> b!1507775 (= lt!654484 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48525 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1507776 () Bool)

(declare-fun res!1027887 () Bool)

(assert (=> b!1507776 (=> (not res!1027887) (not e!842430))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1507776 (= res!1027887 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49075 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49075 a!2804))))))

(declare-fun b!1507777 () Bool)

(declare-fun res!1027891 () Bool)

(assert (=> b!1507777 (=> (not res!1027891) (not e!842430))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1507777 (= res!1027891 (and (= (size!49075 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49075 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49075 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1507778 () Bool)

(declare-fun res!1027890 () Bool)

(assert (=> b!1507778 (=> (not res!1027890) (not e!842430))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507778 (= res!1027890 (validKeyInArray!0 (select (arr!48525 a!2804) j!70)))))

(declare-fun b!1507779 () Bool)

(declare-fun res!1027888 () Bool)

(assert (=> b!1507779 (=> (not res!1027888) (not e!842430))))

(assert (=> b!1507779 (= res!1027888 (validKeyInArray!0 (select (arr!48525 a!2804) i!961)))))

(declare-fun res!1027892 () Bool)

(assert (=> start!128636 (=> (not res!1027892) (not e!842430))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128636 (= res!1027892 (validMask!0 mask!2512))))

(assert (=> start!128636 e!842430))

(assert (=> start!128636 true))

(declare-fun array_inv!37553 (array!100570) Bool)

(assert (=> start!128636 (array_inv!37553 a!2804)))

(declare-fun b!1507780 () Bool)

(declare-fun res!1027894 () Bool)

(assert (=> b!1507780 (=> (not res!1027894) (not e!842430))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1507780 (= res!1027894 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48525 a!2804) j!70) mask!2512) (select (arr!48525 a!2804) j!70) a!2804 mask!2512) (Intermediate!12696 false resIndex!21 resX!21)))))

(declare-fun b!1507781 () Bool)

(declare-fun res!1027889 () Bool)

(assert (=> b!1507781 (=> (not res!1027889) (not e!842430))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100570 (_ BitVec 32)) Bool)

(assert (=> b!1507781 (= res!1027889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!128636 res!1027892) b!1507777))

(assert (= (and b!1507777 res!1027891) b!1507779))

(assert (= (and b!1507779 res!1027888) b!1507778))

(assert (= (and b!1507778 res!1027890) b!1507781))

(assert (= (and b!1507781 res!1027889) b!1507774))

(assert (= (and b!1507774 res!1027893) b!1507776))

(assert (= (and b!1507776 res!1027887) b!1507780))

(assert (= (and b!1507780 res!1027894) b!1507775))

(declare-fun m!1390409 () Bool)

(assert (=> b!1507779 m!1390409))

(assert (=> b!1507779 m!1390409))

(declare-fun m!1390411 () Bool)

(assert (=> b!1507779 m!1390411))

(declare-fun m!1390413 () Bool)

(assert (=> b!1507781 m!1390413))

(declare-fun m!1390415 () Bool)

(assert (=> b!1507774 m!1390415))

(declare-fun m!1390417 () Bool)

(assert (=> b!1507780 m!1390417))

(assert (=> b!1507780 m!1390417))

(declare-fun m!1390419 () Bool)

(assert (=> b!1507780 m!1390419))

(assert (=> b!1507780 m!1390419))

(assert (=> b!1507780 m!1390417))

(declare-fun m!1390421 () Bool)

(assert (=> b!1507780 m!1390421))

(assert (=> b!1507775 m!1390417))

(assert (=> b!1507775 m!1390417))

(declare-fun m!1390423 () Bool)

(assert (=> b!1507775 m!1390423))

(assert (=> b!1507778 m!1390417))

(assert (=> b!1507778 m!1390417))

(declare-fun m!1390425 () Bool)

(assert (=> b!1507778 m!1390425))

(declare-fun m!1390427 () Bool)

(assert (=> start!128636 m!1390427))

(declare-fun m!1390429 () Bool)

(assert (=> start!128636 m!1390429))

(check-sat (not b!1507778) (not b!1507779) (not b!1507781) (not b!1507780) (not start!128636) (not b!1507774) (not b!1507775))
