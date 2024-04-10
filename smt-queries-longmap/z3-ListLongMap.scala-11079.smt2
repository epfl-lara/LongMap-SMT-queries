; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129308 () Bool)

(assert start!129308)

(declare-fun b!1518784 () Bool)

(declare-fun e!847250 () Bool)

(declare-fun e!847252 () Bool)

(assert (=> b!1518784 (= e!847250 e!847252)))

(declare-fun res!1038687 () Bool)

(assert (=> b!1518784 (=> (not res!1038687) (not e!847252))))

(declare-datatypes ((array!101164 0))(
  ( (array!101165 (arr!48819 (Array (_ BitVec 32) (_ BitVec 64))) (size!49369 (_ BitVec 32))) )
))
(declare-fun lt!658339 () array!101164)

(declare-datatypes ((SeekEntryResult!12990 0))(
  ( (MissingZero!12990 (index!54355 (_ BitVec 32))) (Found!12990 (index!54356 (_ BitVec 32))) (Intermediate!12990 (undefined!13802 Bool) (index!54357 (_ BitVec 32)) (x!136028 (_ BitVec 32))) (Undefined!12990) (MissingVacant!12990 (index!54358 (_ BitVec 32))) )
))
(declare-fun lt!658344 () SeekEntryResult!12990)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun lt!658341 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101164 (_ BitVec 32)) SeekEntryResult!12990)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518784 (= res!1038687 (= lt!658344 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658341 mask!2512) lt!658341 lt!658339 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun a!2804 () array!101164)

(assert (=> b!1518784 (= lt!658341 (select (store (arr!48819 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1518784 (= lt!658339 (array!101165 (store (arr!48819 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49369 a!2804)))))

(declare-fun e!847246 () Bool)

(declare-fun b!1518785 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101164 (_ BitVec 32)) SeekEntryResult!12990)

(assert (=> b!1518785 (= e!847246 (= (seekEntry!0 (select (arr!48819 a!2804) j!70) a!2804 mask!2512) (Found!12990 j!70)))))

(declare-fun b!1518786 () Bool)

(declare-fun e!847248 () Bool)

(assert (=> b!1518786 (= e!847248 e!847250)))

(declare-fun res!1038695 () Bool)

(assert (=> b!1518786 (=> (not res!1038695) (not e!847250))))

(declare-fun lt!658343 () SeekEntryResult!12990)

(assert (=> b!1518786 (= res!1038695 (= lt!658344 lt!658343))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1518786 (= lt!658343 (Intermediate!12990 false resIndex!21 resX!21))))

(assert (=> b!1518786 (= lt!658344 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48819 a!2804) j!70) mask!2512) (select (arr!48819 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518787 () Bool)

(declare-fun res!1038697 () Bool)

(assert (=> b!1518787 (=> (not res!1038697) (not e!847248))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518787 (= res!1038697 (validKeyInArray!0 (select (arr!48819 a!2804) i!961)))))

(declare-fun b!1518788 () Bool)

(declare-fun e!847249 () Bool)

(assert (=> b!1518788 (= e!847252 (not e!847249))))

(declare-fun res!1038693 () Bool)

(assert (=> b!1518788 (=> res!1038693 e!847249)))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1518788 (= res!1038693 (or (not (= (select (arr!48819 a!2804) j!70) lt!658341)) (= x!534 resX!21)))))

(assert (=> b!1518788 e!847246))

(declare-fun res!1038691 () Bool)

(assert (=> b!1518788 (=> (not res!1038691) (not e!847246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101164 (_ BitVec 32)) Bool)

(assert (=> b!1518788 (= res!1038691 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50848 0))(
  ( (Unit!50849) )
))
(declare-fun lt!658345 () Unit!50848)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101164 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50848)

(assert (=> b!1518788 (= lt!658345 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518789 () Bool)

(declare-fun e!847251 () Bool)

(assert (=> b!1518789 (= e!847251 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101164 (_ BitVec 32)) SeekEntryResult!12990)

(assert (=> b!1518789 (= (seekEntryOrOpen!0 (select (arr!48819 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658341 lt!658339 mask!2512))))

(declare-fun lt!658342 () Unit!50848)

(declare-fun lt!658340 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101164 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50848)

(assert (=> b!1518789 (= lt!658342 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658340 resX!21 resIndex!21 mask!2512))))

(declare-fun res!1038696 () Bool)

(assert (=> start!129308 (=> (not res!1038696) (not e!847248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129308 (= res!1038696 (validMask!0 mask!2512))))

(assert (=> start!129308 e!847248))

(assert (=> start!129308 true))

(declare-fun array_inv!37847 (array!101164) Bool)

(assert (=> start!129308 (array_inv!37847 a!2804)))

(declare-fun b!1518790 () Bool)

(declare-fun res!1038698 () Bool)

(assert (=> b!1518790 (=> (not res!1038698) (not e!847248))))

(assert (=> b!1518790 (= res!1038698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518791 () Bool)

(declare-fun res!1038688 () Bool)

(assert (=> b!1518791 (=> (not res!1038688) (not e!847248))))

(assert (=> b!1518791 (= res!1038688 (and (= (size!49369 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49369 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49369 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518792 () Bool)

(declare-fun res!1038689 () Bool)

(assert (=> b!1518792 (=> (not res!1038689) (not e!847248))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1518792 (= res!1038689 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49369 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49369 a!2804))))))

(declare-fun b!1518793 () Bool)

(declare-fun res!1038699 () Bool)

(assert (=> b!1518793 (=> res!1038699 e!847251)))

(assert (=> b!1518793 (= res!1038699 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658340 (select (arr!48819 a!2804) j!70) a!2804 mask!2512) lt!658343)))))

(declare-fun b!1518794 () Bool)

(declare-fun res!1038700 () Bool)

(assert (=> b!1518794 (=> (not res!1038700) (not e!847248))))

(declare-datatypes ((List!35302 0))(
  ( (Nil!35299) (Cons!35298 (h!36710 (_ BitVec 64)) (t!49996 List!35302)) )
))
(declare-fun arrayNoDuplicates!0 (array!101164 (_ BitVec 32) List!35302) Bool)

(assert (=> b!1518794 (= res!1038700 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35299))))

(declare-fun b!1518795 () Bool)

(assert (=> b!1518795 (= e!847249 e!847251)))

(declare-fun res!1038692 () Bool)

(assert (=> b!1518795 (=> res!1038692 e!847251)))

(assert (=> b!1518795 (= res!1038692 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658340 #b00000000000000000000000000000000) (bvsge lt!658340 (size!49369 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518795 (= lt!658340 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518796 () Bool)

(declare-fun res!1038690 () Bool)

(assert (=> b!1518796 (=> (not res!1038690) (not e!847248))))

(assert (=> b!1518796 (= res!1038690 (validKeyInArray!0 (select (arr!48819 a!2804) j!70)))))

(declare-fun b!1518797 () Bool)

(declare-fun res!1038694 () Bool)

(assert (=> b!1518797 (=> (not res!1038694) (not e!847250))))

(assert (=> b!1518797 (= res!1038694 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48819 a!2804) j!70) a!2804 mask!2512) lt!658343))))

(assert (= (and start!129308 res!1038696) b!1518791))

(assert (= (and b!1518791 res!1038688) b!1518787))

(assert (= (and b!1518787 res!1038697) b!1518796))

(assert (= (and b!1518796 res!1038690) b!1518790))

(assert (= (and b!1518790 res!1038698) b!1518794))

(assert (= (and b!1518794 res!1038700) b!1518792))

(assert (= (and b!1518792 res!1038689) b!1518786))

(assert (= (and b!1518786 res!1038695) b!1518797))

(assert (= (and b!1518797 res!1038694) b!1518784))

(assert (= (and b!1518784 res!1038687) b!1518788))

(assert (= (and b!1518788 res!1038691) b!1518785))

(assert (= (and b!1518788 (not res!1038693)) b!1518795))

(assert (= (and b!1518795 (not res!1038692)) b!1518793))

(assert (= (and b!1518793 (not res!1038699)) b!1518789))

(declare-fun m!1402127 () Bool)

(assert (=> b!1518794 m!1402127))

(declare-fun m!1402129 () Bool)

(assert (=> b!1518793 m!1402129))

(assert (=> b!1518793 m!1402129))

(declare-fun m!1402131 () Bool)

(assert (=> b!1518793 m!1402131))

(declare-fun m!1402133 () Bool)

(assert (=> b!1518787 m!1402133))

(assert (=> b!1518787 m!1402133))

(declare-fun m!1402135 () Bool)

(assert (=> b!1518787 m!1402135))

(assert (=> b!1518797 m!1402129))

(assert (=> b!1518797 m!1402129))

(declare-fun m!1402137 () Bool)

(assert (=> b!1518797 m!1402137))

(declare-fun m!1402139 () Bool)

(assert (=> b!1518784 m!1402139))

(assert (=> b!1518784 m!1402139))

(declare-fun m!1402141 () Bool)

(assert (=> b!1518784 m!1402141))

(declare-fun m!1402143 () Bool)

(assert (=> b!1518784 m!1402143))

(declare-fun m!1402145 () Bool)

(assert (=> b!1518784 m!1402145))

(assert (=> b!1518789 m!1402129))

(assert (=> b!1518789 m!1402129))

(declare-fun m!1402147 () Bool)

(assert (=> b!1518789 m!1402147))

(declare-fun m!1402149 () Bool)

(assert (=> b!1518789 m!1402149))

(declare-fun m!1402151 () Bool)

(assert (=> b!1518789 m!1402151))

(declare-fun m!1402153 () Bool)

(assert (=> start!129308 m!1402153))

(declare-fun m!1402155 () Bool)

(assert (=> start!129308 m!1402155))

(assert (=> b!1518786 m!1402129))

(assert (=> b!1518786 m!1402129))

(declare-fun m!1402157 () Bool)

(assert (=> b!1518786 m!1402157))

(assert (=> b!1518786 m!1402157))

(assert (=> b!1518786 m!1402129))

(declare-fun m!1402159 () Bool)

(assert (=> b!1518786 m!1402159))

(declare-fun m!1402161 () Bool)

(assert (=> b!1518790 m!1402161))

(assert (=> b!1518785 m!1402129))

(assert (=> b!1518785 m!1402129))

(declare-fun m!1402163 () Bool)

(assert (=> b!1518785 m!1402163))

(declare-fun m!1402165 () Bool)

(assert (=> b!1518795 m!1402165))

(assert (=> b!1518788 m!1402129))

(declare-fun m!1402167 () Bool)

(assert (=> b!1518788 m!1402167))

(declare-fun m!1402169 () Bool)

(assert (=> b!1518788 m!1402169))

(assert (=> b!1518796 m!1402129))

(assert (=> b!1518796 m!1402129))

(declare-fun m!1402171 () Bool)

(assert (=> b!1518796 m!1402171))

(check-sat (not b!1518787) (not b!1518794) (not start!129308) (not b!1518793) (not b!1518788) (not b!1518797) (not b!1518784) (not b!1518785) (not b!1518796) (not b!1518790) (not b!1518789) (not b!1518795) (not b!1518786))
(check-sat)
