; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130914 () Bool)

(assert start!130914)

(declare-fun b!1534123 () Bool)

(declare-fun res!1049786 () Bool)

(declare-fun e!854949 () Bool)

(assert (=> b!1534123 (=> (not res!1049786) (not e!854949))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101830 0))(
  ( (array!101831 (arr!49129 (Array (_ BitVec 32) (_ BitVec 64))) (size!49680 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101830)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1534123 (= res!1049786 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49680 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49680 a!2804))))))

(declare-fun b!1534124 () Bool)

(declare-fun e!854950 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13187 0))(
  ( (MissingZero!13187 (index!55143 (_ BitVec 32))) (Found!13187 (index!55144 (_ BitVec 32))) (Intermediate!13187 (undefined!13999 Bool) (index!55145 (_ BitVec 32)) (x!137052 (_ BitVec 32))) (Undefined!13187) (MissingVacant!13187 (index!55146 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101830 (_ BitVec 32)) SeekEntryResult!13187)

(assert (=> b!1534124 (= e!854950 (= (seekEntry!0 (select (arr!49129 a!2804) j!70) a!2804 mask!2512) (Found!13187 j!70)))))

(declare-fun b!1534125 () Bool)

(declare-fun e!854946 () Bool)

(declare-fun e!854944 () Bool)

(assert (=> b!1534125 (= e!854946 e!854944)))

(declare-fun res!1049779 () Bool)

(assert (=> b!1534125 (=> res!1049779 e!854944)))

(declare-fun lt!664277 () (_ BitVec 32))

(assert (=> b!1534125 (= res!1049779 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!664277 #b00000000000000000000000000000000) (bvsge lt!664277 (size!49680 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534125 (= lt!664277 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1534126 () Bool)

(declare-fun e!854948 () Bool)

(declare-fun e!854947 () Bool)

(assert (=> b!1534126 (= e!854948 e!854947)))

(declare-fun res!1049788 () Bool)

(assert (=> b!1534126 (=> (not res!1049788) (not e!854947))))

(declare-fun lt!664280 () (_ BitVec 64))

(declare-fun lt!664275 () SeekEntryResult!13187)

(declare-fun lt!664276 () array!101830)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101830 (_ BitVec 32)) SeekEntryResult!13187)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534126 (= res!1049788 (= lt!664275 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!664280 mask!2512) lt!664280 lt!664276 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1534126 (= lt!664280 (select (store (arr!49129 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1534126 (= lt!664276 (array!101831 (store (arr!49129 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49680 a!2804)))))

(declare-fun b!1534127 () Bool)

(declare-fun res!1049787 () Bool)

(assert (=> b!1534127 (=> (not res!1049787) (not e!854949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101830 (_ BitVec 32)) Bool)

(assert (=> b!1534127 (= res!1049787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1049781 () Bool)

(assert (=> start!130914 (=> (not res!1049781) (not e!854949))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130914 (= res!1049781 (validMask!0 mask!2512))))

(assert (=> start!130914 e!854949))

(assert (=> start!130914 true))

(declare-fun array_inv!38410 (array!101830) Bool)

(assert (=> start!130914 (array_inv!38410 a!2804)))

(declare-fun b!1534128 () Bool)

(declare-fun res!1049778 () Bool)

(assert (=> b!1534128 (=> (not res!1049778) (not e!854949))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534128 (= res!1049778 (validKeyInArray!0 (select (arr!49129 a!2804) j!70)))))

(declare-fun b!1534129 () Bool)

(declare-fun res!1049785 () Bool)

(assert (=> b!1534129 (=> (not res!1049785) (not e!854949))))

(assert (=> b!1534129 (= res!1049785 (and (= (size!49680 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49680 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49680 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1534130 () Bool)

(declare-fun res!1049780 () Bool)

(assert (=> b!1534130 (=> (not res!1049780) (not e!854948))))

(declare-fun lt!664278 () SeekEntryResult!13187)

(assert (=> b!1534130 (= res!1049780 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49129 a!2804) j!70) a!2804 mask!2512) lt!664278))))

(declare-fun b!1534131 () Bool)

(declare-fun res!1049783 () Bool)

(assert (=> b!1534131 (=> res!1049783 e!854944)))

(assert (=> b!1534131 (= res!1049783 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!664277 (select (arr!49129 a!2804) j!70) a!2804 mask!2512) lt!664278)))))

(declare-fun b!1534132 () Bool)

(assert (=> b!1534132 (= e!854949 e!854948)))

(declare-fun res!1049789 () Bool)

(assert (=> b!1534132 (=> (not res!1049789) (not e!854948))))

(assert (=> b!1534132 (= res!1049789 (= lt!664275 lt!664278))))

(assert (=> b!1534132 (= lt!664278 (Intermediate!13187 false resIndex!21 resX!21))))

(assert (=> b!1534132 (= lt!664275 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49129 a!2804) j!70) mask!2512) (select (arr!49129 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1534133 () Bool)

(assert (=> b!1534133 (= e!854944 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101830 (_ BitVec 32)) SeekEntryResult!13187)

(assert (=> b!1534133 (= (seekEntryOrOpen!0 (select (arr!49129 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!664280 lt!664276 mask!2512))))

(declare-datatypes ((Unit!51193 0))(
  ( (Unit!51194) )
))
(declare-fun lt!664281 () Unit!51193)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101830 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51193)

(assert (=> b!1534133 (= lt!664281 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!664277 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1534134 () Bool)

(assert (=> b!1534134 (= e!854947 (not e!854946))))

(declare-fun res!1049777 () Bool)

(assert (=> b!1534134 (=> res!1049777 e!854946)))

(assert (=> b!1534134 (= res!1049777 (or (not (= (select (arr!49129 a!2804) j!70) lt!664280)) (= x!534 resX!21)))))

(assert (=> b!1534134 e!854950))

(declare-fun res!1049782 () Bool)

(assert (=> b!1534134 (=> (not res!1049782) (not e!854950))))

(assert (=> b!1534134 (= res!1049782 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!664279 () Unit!51193)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101830 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51193)

(assert (=> b!1534134 (= lt!664279 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1534135 () Bool)

(declare-fun res!1049790 () Bool)

(assert (=> b!1534135 (=> (not res!1049790) (not e!854949))))

(assert (=> b!1534135 (= res!1049790 (validKeyInArray!0 (select (arr!49129 a!2804) i!961)))))

(declare-fun b!1534136 () Bool)

(declare-fun res!1049784 () Bool)

(assert (=> b!1534136 (=> (not res!1049784) (not e!854949))))

(declare-datatypes ((List!35599 0))(
  ( (Nil!35596) (Cons!35595 (h!37058 (_ BitVec 64)) (t!50285 List!35599)) )
))
(declare-fun arrayNoDuplicates!0 (array!101830 (_ BitVec 32) List!35599) Bool)

(assert (=> b!1534136 (= res!1049784 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35596))))

(assert (= (and start!130914 res!1049781) b!1534129))

(assert (= (and b!1534129 res!1049785) b!1534135))

(assert (= (and b!1534135 res!1049790) b!1534128))

(assert (= (and b!1534128 res!1049778) b!1534127))

(assert (= (and b!1534127 res!1049787) b!1534136))

(assert (= (and b!1534136 res!1049784) b!1534123))

(assert (= (and b!1534123 res!1049786) b!1534132))

(assert (= (and b!1534132 res!1049789) b!1534130))

(assert (= (and b!1534130 res!1049780) b!1534126))

(assert (= (and b!1534126 res!1049788) b!1534134))

(assert (= (and b!1534134 res!1049782) b!1534124))

(assert (= (and b!1534134 (not res!1049777)) b!1534125))

(assert (= (and b!1534125 (not res!1049779)) b!1534131))

(assert (= (and b!1534131 (not res!1049783)) b!1534133))

(declare-fun m!1416655 () Bool)

(assert (=> b!1534127 m!1416655))

(declare-fun m!1416657 () Bool)

(assert (=> b!1534130 m!1416657))

(assert (=> b!1534130 m!1416657))

(declare-fun m!1416659 () Bool)

(assert (=> b!1534130 m!1416659))

(declare-fun m!1416661 () Bool)

(assert (=> start!130914 m!1416661))

(declare-fun m!1416663 () Bool)

(assert (=> start!130914 m!1416663))

(assert (=> b!1534134 m!1416657))

(declare-fun m!1416665 () Bool)

(assert (=> b!1534134 m!1416665))

(declare-fun m!1416667 () Bool)

(assert (=> b!1534134 m!1416667))

(declare-fun m!1416669 () Bool)

(assert (=> b!1534136 m!1416669))

(assert (=> b!1534124 m!1416657))

(assert (=> b!1534124 m!1416657))

(declare-fun m!1416671 () Bool)

(assert (=> b!1534124 m!1416671))

(declare-fun m!1416673 () Bool)

(assert (=> b!1534126 m!1416673))

(assert (=> b!1534126 m!1416673))

(declare-fun m!1416675 () Bool)

(assert (=> b!1534126 m!1416675))

(declare-fun m!1416677 () Bool)

(assert (=> b!1534126 m!1416677))

(declare-fun m!1416679 () Bool)

(assert (=> b!1534126 m!1416679))

(declare-fun m!1416681 () Bool)

(assert (=> b!1534135 m!1416681))

(assert (=> b!1534135 m!1416681))

(declare-fun m!1416683 () Bool)

(assert (=> b!1534135 m!1416683))

(assert (=> b!1534133 m!1416657))

(assert (=> b!1534133 m!1416657))

(declare-fun m!1416685 () Bool)

(assert (=> b!1534133 m!1416685))

(declare-fun m!1416687 () Bool)

(assert (=> b!1534133 m!1416687))

(declare-fun m!1416689 () Bool)

(assert (=> b!1534133 m!1416689))

(assert (=> b!1534131 m!1416657))

(assert (=> b!1534131 m!1416657))

(declare-fun m!1416691 () Bool)

(assert (=> b!1534131 m!1416691))

(assert (=> b!1534128 m!1416657))

(assert (=> b!1534128 m!1416657))

(declare-fun m!1416693 () Bool)

(assert (=> b!1534128 m!1416693))

(assert (=> b!1534132 m!1416657))

(assert (=> b!1534132 m!1416657))

(declare-fun m!1416695 () Bool)

(assert (=> b!1534132 m!1416695))

(assert (=> b!1534132 m!1416695))

(assert (=> b!1534132 m!1416657))

(declare-fun m!1416697 () Bool)

(assert (=> b!1534132 m!1416697))

(declare-fun m!1416699 () Bool)

(assert (=> b!1534125 m!1416699))

(check-sat (not b!1534135) (not b!1534130) (not b!1534126) (not b!1534131) (not b!1534124) (not start!130914) (not b!1534133) (not b!1534136) (not b!1534128) (not b!1534127) (not b!1534125) (not b!1534132) (not b!1534134))
(check-sat)
