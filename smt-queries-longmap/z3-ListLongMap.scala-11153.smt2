; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130662 () Bool)

(assert start!130662)

(declare-fun b!1531896 () Bool)

(declare-fun e!853819 () Bool)

(declare-fun e!853821 () Bool)

(assert (=> b!1531896 (= e!853819 e!853821)))

(declare-fun res!1048120 () Bool)

(assert (=> b!1531896 (=> (not res!1048120) (not e!853821))))

(declare-datatypes ((SeekEntryResult!13151 0))(
  ( (MissingZero!13151 (index!54999 (_ BitVec 32))) (Found!13151 (index!55000 (_ BitVec 32))) (Intermediate!13151 (undefined!13963 Bool) (index!55001 (_ BitVec 32)) (x!136893 (_ BitVec 32))) (Undefined!13151) (MissingVacant!13151 (index!55002 (_ BitVec 32))) )
))
(declare-fun lt!663366 () SeekEntryResult!13151)

(declare-fun lt!663365 () SeekEntryResult!13151)

(assert (=> b!1531896 (= res!1048120 (= lt!663366 lt!663365))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1531896 (= lt!663365 (Intermediate!13151 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101749 0))(
  ( (array!101750 (arr!49093 (Array (_ BitVec 32) (_ BitVec 64))) (size!49644 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101749)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101749 (_ BitVec 32)) SeekEntryResult!13151)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531896 (= lt!663366 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49093 a!2804) j!70) mask!2512) (select (arr!49093 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531897 () Bool)

(declare-fun e!853822 () Bool)

(assert (=> b!1531897 (= e!853821 (not e!853822))))

(declare-fun res!1048127 () Bool)

(assert (=> b!1531897 (=> res!1048127 e!853822)))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1531897 (= res!1048127 (or (not (= (select (arr!49093 a!2804) j!70) (select (store (arr!49093 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!853820 () Bool)

(assert (=> b!1531897 e!853820))

(declare-fun res!1048124 () Bool)

(assert (=> b!1531897 (=> (not res!1048124) (not e!853820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101749 (_ BitVec 32)) Bool)

(assert (=> b!1531897 (= res!1048124 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51121 0))(
  ( (Unit!51122) )
))
(declare-fun lt!663363 () Unit!51121)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101749 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51121)

(assert (=> b!1531897 (= lt!663363 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531898 () Bool)

(declare-fun res!1048123 () Bool)

(assert (=> b!1531898 (=> (not res!1048123) (not e!853819))))

(assert (=> b!1531898 (= res!1048123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531899 () Bool)

(declare-fun res!1048122 () Bool)

(assert (=> b!1531899 (=> (not res!1048122) (not e!853819))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531899 (= res!1048122 (validKeyInArray!0 (select (arr!49093 a!2804) j!70)))))

(declare-fun b!1531900 () Bool)

(declare-fun res!1048126 () Bool)

(assert (=> b!1531900 (=> (not res!1048126) (not e!853819))))

(assert (=> b!1531900 (= res!1048126 (and (= (size!49644 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49644 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49644 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531901 () Bool)

(assert (=> b!1531901 (= e!853822 true)))

(declare-fun lt!663364 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531901 (= lt!663364 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun res!1048125 () Bool)

(assert (=> start!130662 (=> (not res!1048125) (not e!853819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130662 (= res!1048125 (validMask!0 mask!2512))))

(assert (=> start!130662 e!853819))

(assert (=> start!130662 true))

(declare-fun array_inv!38374 (array!101749) Bool)

(assert (=> start!130662 (array_inv!38374 a!2804)))

(declare-fun b!1531902 () Bool)

(declare-fun res!1048118 () Bool)

(assert (=> b!1531902 (=> (not res!1048118) (not e!853821))))

(assert (=> b!1531902 (= res!1048118 (= lt!663366 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49093 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49093 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101750 (store (arr!49093 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49644 a!2804)) mask!2512)))))

(declare-fun b!1531903 () Bool)

(declare-fun res!1048121 () Bool)

(assert (=> b!1531903 (=> (not res!1048121) (not e!853819))))

(assert (=> b!1531903 (= res!1048121 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49644 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49644 a!2804))))))

(declare-fun b!1531904 () Bool)

(declare-fun res!1048117 () Bool)

(assert (=> b!1531904 (=> (not res!1048117) (not e!853819))))

(declare-datatypes ((List!35563 0))(
  ( (Nil!35560) (Cons!35559 (h!37013 (_ BitVec 64)) (t!50249 List!35563)) )
))
(declare-fun arrayNoDuplicates!0 (array!101749 (_ BitVec 32) List!35563) Bool)

(assert (=> b!1531904 (= res!1048117 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35560))))

(declare-fun b!1531905 () Bool)

(declare-fun res!1048119 () Bool)

(assert (=> b!1531905 (=> (not res!1048119) (not e!853819))))

(assert (=> b!1531905 (= res!1048119 (validKeyInArray!0 (select (arr!49093 a!2804) i!961)))))

(declare-fun b!1531906 () Bool)

(declare-fun res!1048128 () Bool)

(assert (=> b!1531906 (=> (not res!1048128) (not e!853821))))

(assert (=> b!1531906 (= res!1048128 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49093 a!2804) j!70) a!2804 mask!2512) lt!663365))))

(declare-fun b!1531907 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101749 (_ BitVec 32)) SeekEntryResult!13151)

(assert (=> b!1531907 (= e!853820 (= (seekEntry!0 (select (arr!49093 a!2804) j!70) a!2804 mask!2512) (Found!13151 j!70)))))

(assert (= (and start!130662 res!1048125) b!1531900))

(assert (= (and b!1531900 res!1048126) b!1531905))

(assert (= (and b!1531905 res!1048119) b!1531899))

(assert (= (and b!1531899 res!1048122) b!1531898))

(assert (= (and b!1531898 res!1048123) b!1531904))

(assert (= (and b!1531904 res!1048117) b!1531903))

(assert (= (and b!1531903 res!1048121) b!1531896))

(assert (= (and b!1531896 res!1048120) b!1531906))

(assert (= (and b!1531906 res!1048128) b!1531902))

(assert (= (and b!1531902 res!1048118) b!1531897))

(assert (= (and b!1531897 res!1048124) b!1531907))

(assert (= (and b!1531897 (not res!1048127)) b!1531901))

(declare-fun m!1414699 () Bool)

(assert (=> b!1531901 m!1414699))

(declare-fun m!1414701 () Bool)

(assert (=> b!1531902 m!1414701))

(declare-fun m!1414703 () Bool)

(assert (=> b!1531902 m!1414703))

(assert (=> b!1531902 m!1414703))

(declare-fun m!1414705 () Bool)

(assert (=> b!1531902 m!1414705))

(assert (=> b!1531902 m!1414705))

(assert (=> b!1531902 m!1414703))

(declare-fun m!1414707 () Bool)

(assert (=> b!1531902 m!1414707))

(declare-fun m!1414709 () Bool)

(assert (=> b!1531905 m!1414709))

(assert (=> b!1531905 m!1414709))

(declare-fun m!1414711 () Bool)

(assert (=> b!1531905 m!1414711))

(declare-fun m!1414713 () Bool)

(assert (=> b!1531904 m!1414713))

(declare-fun m!1414715 () Bool)

(assert (=> b!1531898 m!1414715))

(declare-fun m!1414717 () Bool)

(assert (=> b!1531899 m!1414717))

(assert (=> b!1531899 m!1414717))

(declare-fun m!1414719 () Bool)

(assert (=> b!1531899 m!1414719))

(assert (=> b!1531907 m!1414717))

(assert (=> b!1531907 m!1414717))

(declare-fun m!1414721 () Bool)

(assert (=> b!1531907 m!1414721))

(assert (=> b!1531897 m!1414717))

(declare-fun m!1414723 () Bool)

(assert (=> b!1531897 m!1414723))

(assert (=> b!1531897 m!1414701))

(assert (=> b!1531897 m!1414703))

(declare-fun m!1414725 () Bool)

(assert (=> b!1531897 m!1414725))

(assert (=> b!1531906 m!1414717))

(assert (=> b!1531906 m!1414717))

(declare-fun m!1414727 () Bool)

(assert (=> b!1531906 m!1414727))

(assert (=> b!1531896 m!1414717))

(assert (=> b!1531896 m!1414717))

(declare-fun m!1414729 () Bool)

(assert (=> b!1531896 m!1414729))

(assert (=> b!1531896 m!1414729))

(assert (=> b!1531896 m!1414717))

(declare-fun m!1414731 () Bool)

(assert (=> b!1531896 m!1414731))

(declare-fun m!1414733 () Bool)

(assert (=> start!130662 m!1414733))

(declare-fun m!1414735 () Bool)

(assert (=> start!130662 m!1414735))

(check-sat (not b!1531899) (not b!1531898) (not b!1531905) (not b!1531907) (not b!1531904) (not b!1531897) (not b!1531906) (not start!130662) (not b!1531901) (not b!1531902) (not b!1531896))
(check-sat)
