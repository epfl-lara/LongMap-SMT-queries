; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129650 () Bool)

(assert start!129650)

(declare-fun b!1520604 () Bool)

(declare-fun e!848411 () Bool)

(declare-fun e!848410 () Bool)

(assert (=> b!1520604 (= e!848411 e!848410)))

(declare-fun res!1039152 () Bool)

(assert (=> b!1520604 (=> res!1039152 e!848410)))

(declare-fun lt!658993 () (_ BitVec 32))

(declare-datatypes ((array!101269 0))(
  ( (array!101270 (arr!48865 (Array (_ BitVec 32) (_ BitVec 64))) (size!49416 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101269)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1520604 (= res!1039152 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658993 #b00000000000000000000000000000000) (bvsge lt!658993 (size!49416 a!2804))))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520604 (= lt!658993 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun res!1039151 () Bool)

(declare-fun e!848412 () Bool)

(assert (=> start!129650 (=> (not res!1039151) (not e!848412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129650 (= res!1039151 (validMask!0 mask!2512))))

(assert (=> start!129650 e!848412))

(assert (=> start!129650 true))

(declare-fun array_inv!38146 (array!101269) Bool)

(assert (=> start!129650 (array_inv!38146 a!2804)))

(declare-fun b!1520605 () Bool)

(declare-fun res!1039154 () Bool)

(declare-fun e!848409 () Bool)

(assert (=> b!1520605 (=> (not res!1039154) (not e!848409))))

(declare-datatypes ((SeekEntryResult!12929 0))(
  ( (MissingZero!12929 (index!54111 (_ BitVec 32))) (Found!12929 (index!54112 (_ BitVec 32))) (Intermediate!12929 (undefined!13741 Bool) (index!54113 (_ BitVec 32)) (x!135994 (_ BitVec 32))) (Undefined!12929) (MissingVacant!12929 (index!54114 (_ BitVec 32))) )
))
(declare-fun lt!658995 () SeekEntryResult!12929)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101269 (_ BitVec 32)) SeekEntryResult!12929)

(assert (=> b!1520605 (= res!1039154 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48865 a!2804) j!70) a!2804 mask!2512) lt!658995))))

(declare-fun b!1520606 () Bool)

(declare-fun res!1039147 () Bool)

(assert (=> b!1520606 (=> (not res!1039147) (not e!848412))))

(declare-datatypes ((List!35335 0))(
  ( (Nil!35332) (Cons!35331 (h!36761 (_ BitVec 64)) (t!50021 List!35335)) )
))
(declare-fun arrayNoDuplicates!0 (array!101269 (_ BitVec 32) List!35335) Bool)

(assert (=> b!1520606 (= res!1039147 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35332))))

(declare-fun b!1520607 () Bool)

(declare-fun res!1039156 () Bool)

(assert (=> b!1520607 (=> (not res!1039156) (not e!848412))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1520607 (= res!1039156 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49416 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49416 a!2804))))))

(declare-fun b!1520608 () Bool)

(declare-fun res!1039158 () Bool)

(assert (=> b!1520608 (=> (not res!1039158) (not e!848412))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1520608 (= res!1039158 (and (= (size!49416 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49416 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49416 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1520609 () Bool)

(declare-fun res!1039149 () Bool)

(assert (=> b!1520609 (=> (not res!1039149) (not e!848412))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1520609 (= res!1039149 (validKeyInArray!0 (select (arr!48865 a!2804) i!961)))))

(declare-fun b!1520610 () Bool)

(declare-fun e!848413 () Bool)

(assert (=> b!1520610 (= e!848409 e!848413)))

(declare-fun res!1039150 () Bool)

(assert (=> b!1520610 (=> (not res!1039150) (not e!848413))))

(declare-fun lt!658996 () SeekEntryResult!12929)

(declare-fun lt!658990 () array!101269)

(declare-fun lt!658992 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520610 (= res!1039150 (= lt!658996 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658992 mask!2512) lt!658992 lt!658990 mask!2512)))))

(assert (=> b!1520610 (= lt!658992 (select (store (arr!48865 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1520610 (= lt!658990 (array!101270 (store (arr!48865 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49416 a!2804)))))

(declare-fun b!1520611 () Bool)

(declare-fun res!1039153 () Bool)

(assert (=> b!1520611 (=> (not res!1039153) (not e!848412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101269 (_ BitVec 32)) Bool)

(assert (=> b!1520611 (= res!1039153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1520612 () Bool)

(assert (=> b!1520612 (= e!848412 e!848409)))

(declare-fun res!1039148 () Bool)

(assert (=> b!1520612 (=> (not res!1039148) (not e!848409))))

(assert (=> b!1520612 (= res!1039148 (= lt!658996 lt!658995))))

(assert (=> b!1520612 (= lt!658995 (Intermediate!12929 false resIndex!21 resX!21))))

(assert (=> b!1520612 (= lt!658996 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48865 a!2804) j!70) mask!2512) (select (arr!48865 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520613 () Bool)

(declare-fun res!1039155 () Bool)

(assert (=> b!1520613 (=> (not res!1039155) (not e!848412))))

(assert (=> b!1520613 (= res!1039155 (validKeyInArray!0 (select (arr!48865 a!2804) j!70)))))

(declare-fun b!1520614 () Bool)

(assert (=> b!1520614 (= e!848413 (not e!848411))))

(declare-fun res!1039157 () Bool)

(assert (=> b!1520614 (=> res!1039157 e!848411)))

(assert (=> b!1520614 (= res!1039157 (or (not (= (select (arr!48865 a!2804) j!70) lt!658992)) (= x!534 resX!21)))))

(declare-fun e!848415 () Bool)

(assert (=> b!1520614 e!848415))

(declare-fun res!1039160 () Bool)

(assert (=> b!1520614 (=> (not res!1039160) (not e!848415))))

(assert (=> b!1520614 (= res!1039160 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50761 0))(
  ( (Unit!50762) )
))
(declare-fun lt!658994 () Unit!50761)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101269 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50761)

(assert (=> b!1520614 (= lt!658994 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1520615 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101269 (_ BitVec 32)) SeekEntryResult!12929)

(assert (=> b!1520615 (= e!848415 (= (seekEntry!0 (select (arr!48865 a!2804) j!70) a!2804 mask!2512) (Found!12929 j!70)))))

(declare-fun b!1520616 () Bool)

(assert (=> b!1520616 (= e!848410 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101269 (_ BitVec 32)) SeekEntryResult!12929)

(assert (=> b!1520616 (= (seekEntryOrOpen!0 (select (arr!48865 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658992 lt!658990 mask!2512))))

(declare-fun lt!658991 () Unit!50761)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101269 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50761)

(assert (=> b!1520616 (= lt!658991 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658993 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1520617 () Bool)

(declare-fun res!1039159 () Bool)

(assert (=> b!1520617 (=> res!1039159 e!848410)))

(assert (=> b!1520617 (= res!1039159 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658993 (select (arr!48865 a!2804) j!70) a!2804 mask!2512) lt!658995)))))

(assert (= (and start!129650 res!1039151) b!1520608))

(assert (= (and b!1520608 res!1039158) b!1520609))

(assert (= (and b!1520609 res!1039149) b!1520613))

(assert (= (and b!1520613 res!1039155) b!1520611))

(assert (= (and b!1520611 res!1039153) b!1520606))

(assert (= (and b!1520606 res!1039147) b!1520607))

(assert (= (and b!1520607 res!1039156) b!1520612))

(assert (= (and b!1520612 res!1039148) b!1520605))

(assert (= (and b!1520605 res!1039154) b!1520610))

(assert (= (and b!1520610 res!1039150) b!1520614))

(assert (= (and b!1520614 res!1039160) b!1520615))

(assert (= (and b!1520614 (not res!1039157)) b!1520604))

(assert (= (and b!1520604 (not res!1039152)) b!1520617))

(assert (= (and b!1520617 (not res!1039159)) b!1520616))

(declare-fun m!1403769 () Bool)

(assert (=> b!1520613 m!1403769))

(assert (=> b!1520613 m!1403769))

(declare-fun m!1403771 () Bool)

(assert (=> b!1520613 m!1403771))

(assert (=> b!1520617 m!1403769))

(assert (=> b!1520617 m!1403769))

(declare-fun m!1403773 () Bool)

(assert (=> b!1520617 m!1403773))

(declare-fun m!1403775 () Bool)

(assert (=> b!1520611 m!1403775))

(assert (=> b!1520612 m!1403769))

(assert (=> b!1520612 m!1403769))

(declare-fun m!1403777 () Bool)

(assert (=> b!1520612 m!1403777))

(assert (=> b!1520612 m!1403777))

(assert (=> b!1520612 m!1403769))

(declare-fun m!1403779 () Bool)

(assert (=> b!1520612 m!1403779))

(assert (=> b!1520615 m!1403769))

(assert (=> b!1520615 m!1403769))

(declare-fun m!1403781 () Bool)

(assert (=> b!1520615 m!1403781))

(declare-fun m!1403783 () Bool)

(assert (=> b!1520604 m!1403783))

(declare-fun m!1403785 () Bool)

(assert (=> start!129650 m!1403785))

(declare-fun m!1403787 () Bool)

(assert (=> start!129650 m!1403787))

(assert (=> b!1520605 m!1403769))

(assert (=> b!1520605 m!1403769))

(declare-fun m!1403789 () Bool)

(assert (=> b!1520605 m!1403789))

(declare-fun m!1403791 () Bool)

(assert (=> b!1520609 m!1403791))

(assert (=> b!1520609 m!1403791))

(declare-fun m!1403793 () Bool)

(assert (=> b!1520609 m!1403793))

(declare-fun m!1403795 () Bool)

(assert (=> b!1520610 m!1403795))

(assert (=> b!1520610 m!1403795))

(declare-fun m!1403797 () Bool)

(assert (=> b!1520610 m!1403797))

(declare-fun m!1403799 () Bool)

(assert (=> b!1520610 m!1403799))

(declare-fun m!1403801 () Bool)

(assert (=> b!1520610 m!1403801))

(assert (=> b!1520616 m!1403769))

(assert (=> b!1520616 m!1403769))

(declare-fun m!1403803 () Bool)

(assert (=> b!1520616 m!1403803))

(declare-fun m!1403805 () Bool)

(assert (=> b!1520616 m!1403805))

(declare-fun m!1403807 () Bool)

(assert (=> b!1520616 m!1403807))

(assert (=> b!1520614 m!1403769))

(declare-fun m!1403809 () Bool)

(assert (=> b!1520614 m!1403809))

(declare-fun m!1403811 () Bool)

(assert (=> b!1520614 m!1403811))

(declare-fun m!1403813 () Bool)

(assert (=> b!1520606 m!1403813))

(check-sat (not start!129650) (not b!1520613) (not b!1520616) (not b!1520611) (not b!1520610) (not b!1520612) (not b!1520606) (not b!1520617) (not b!1520609) (not b!1520615) (not b!1520604) (not b!1520614) (not b!1520605))
(check-sat)
