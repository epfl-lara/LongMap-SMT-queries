; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129626 () Bool)

(assert start!129626)

(declare-fun b!1520134 () Bool)

(declare-fun res!1038686 () Bool)

(declare-fun e!848191 () Bool)

(assert (=> b!1520134 (=> (not res!1038686) (not e!848191))))

(declare-datatypes ((array!101245 0))(
  ( (array!101246 (arr!48853 (Array (_ BitVec 32) (_ BitVec 64))) (size!49404 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101245)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1520134 (= res!1038686 (validKeyInArray!0 (select (arr!48853 a!2804) i!961)))))

(declare-fun b!1520135 () Bool)

(declare-fun res!1038678 () Bool)

(assert (=> b!1520135 (=> (not res!1038678) (not e!848191))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1520135 (= res!1038678 (and (= (size!49404 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49404 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49404 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1520136 () Bool)

(declare-fun res!1038682 () Bool)

(declare-fun e!848195 () Bool)

(assert (=> b!1520136 (=> (not res!1038682) (not e!848195))))

(declare-datatypes ((SeekEntryResult!12917 0))(
  ( (MissingZero!12917 (index!54063 (_ BitVec 32))) (Found!12917 (index!54064 (_ BitVec 32))) (Intermediate!12917 (undefined!13729 Bool) (index!54065 (_ BitVec 32)) (x!135950 (_ BitVec 32))) (Undefined!12917) (MissingVacant!12917 (index!54066 (_ BitVec 32))) )
))
(declare-fun lt!658806 () SeekEntryResult!12917)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101245 (_ BitVec 32)) SeekEntryResult!12917)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520136 (= res!1038682 (= lt!658806 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48853 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48853 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101246 (store (arr!48853 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49404 a!2804)) mask!2512)))))

(declare-fun b!1520137 () Bool)

(declare-fun res!1038683 () Bool)

(assert (=> b!1520137 (=> (not res!1038683) (not e!848191))))

(assert (=> b!1520137 (= res!1038683 (validKeyInArray!0 (select (arr!48853 a!2804) j!70)))))

(declare-fun b!1520138 () Bool)

(assert (=> b!1520138 (= e!848191 e!848195)))

(declare-fun res!1038685 () Bool)

(assert (=> b!1520138 (=> (not res!1038685) (not e!848195))))

(declare-fun lt!658809 () SeekEntryResult!12917)

(assert (=> b!1520138 (= res!1038685 (= lt!658806 lt!658809))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1520138 (= lt!658809 (Intermediate!12917 false resIndex!21 resX!21))))

(assert (=> b!1520138 (= lt!658806 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48853 a!2804) j!70) mask!2512) (select (arr!48853 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520139 () Bool)

(declare-fun e!848196 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101245 (_ BitVec 32)) SeekEntryResult!12917)

(assert (=> b!1520139 (= e!848196 (= (seekEntry!0 (select (arr!48853 a!2804) j!70) a!2804 mask!2512) (Found!12917 j!70)))))

(declare-fun b!1520140 () Bool)

(declare-fun e!848193 () Bool)

(assert (=> b!1520140 (= e!848195 (not e!848193))))

(declare-fun res!1038687 () Bool)

(assert (=> b!1520140 (=> res!1038687 e!848193)))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1520140 (= res!1038687 (or (not (= (select (arr!48853 a!2804) j!70) (select (store (arr!48853 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1520140 e!848196))

(declare-fun res!1038688 () Bool)

(assert (=> b!1520140 (=> (not res!1038688) (not e!848196))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101245 (_ BitVec 32)) Bool)

(assert (=> b!1520140 (= res!1038688 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50737 0))(
  ( (Unit!50738) )
))
(declare-fun lt!658808 () Unit!50737)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101245 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50737)

(assert (=> b!1520140 (= lt!658808 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1520141 () Bool)

(declare-fun e!848194 () Bool)

(assert (=> b!1520141 (= e!848194 true)))

(declare-fun lt!658807 () SeekEntryResult!12917)

(declare-fun lt!658810 () (_ BitVec 32))

(assert (=> b!1520141 (= lt!658807 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658810 (select (arr!48853 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520142 () Bool)

(declare-fun res!1038689 () Bool)

(assert (=> b!1520142 (=> (not res!1038689) (not e!848191))))

(declare-datatypes ((List!35323 0))(
  ( (Nil!35320) (Cons!35319 (h!36749 (_ BitVec 64)) (t!50009 List!35323)) )
))
(declare-fun arrayNoDuplicates!0 (array!101245 (_ BitVec 32) List!35323) Bool)

(assert (=> b!1520142 (= res!1038689 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35320))))

(declare-fun res!1038679 () Bool)

(assert (=> start!129626 (=> (not res!1038679) (not e!848191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129626 (= res!1038679 (validMask!0 mask!2512))))

(assert (=> start!129626 e!848191))

(assert (=> start!129626 true))

(declare-fun array_inv!38134 (array!101245) Bool)

(assert (=> start!129626 (array_inv!38134 a!2804)))

(declare-fun b!1520143 () Bool)

(declare-fun res!1038680 () Bool)

(assert (=> b!1520143 (=> (not res!1038680) (not e!848191))))

(assert (=> b!1520143 (= res!1038680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1520144 () Bool)

(assert (=> b!1520144 (= e!848193 e!848194)))

(declare-fun res!1038677 () Bool)

(assert (=> b!1520144 (=> res!1038677 e!848194)))

(assert (=> b!1520144 (= res!1038677 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658810 #b00000000000000000000000000000000) (bvsge lt!658810 (size!49404 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520144 (= lt!658810 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1520145 () Bool)

(declare-fun res!1038681 () Bool)

(assert (=> b!1520145 (=> (not res!1038681) (not e!848195))))

(assert (=> b!1520145 (= res!1038681 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48853 a!2804) j!70) a!2804 mask!2512) lt!658809))))

(declare-fun b!1520146 () Bool)

(declare-fun res!1038684 () Bool)

(assert (=> b!1520146 (=> (not res!1038684) (not e!848191))))

(assert (=> b!1520146 (= res!1038684 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49404 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49404 a!2804))))))

(assert (= (and start!129626 res!1038679) b!1520135))

(assert (= (and b!1520135 res!1038678) b!1520134))

(assert (= (and b!1520134 res!1038686) b!1520137))

(assert (= (and b!1520137 res!1038683) b!1520143))

(assert (= (and b!1520143 res!1038680) b!1520142))

(assert (= (and b!1520142 res!1038689) b!1520146))

(assert (= (and b!1520146 res!1038684) b!1520138))

(assert (= (and b!1520138 res!1038685) b!1520145))

(assert (= (and b!1520145 res!1038681) b!1520136))

(assert (= (and b!1520136 res!1038682) b!1520140))

(assert (= (and b!1520140 res!1038688) b!1520139))

(assert (= (and b!1520140 (not res!1038687)) b!1520144))

(assert (= (and b!1520144 (not res!1038677)) b!1520141))

(declare-fun m!1403289 () Bool)

(assert (=> b!1520137 m!1403289))

(assert (=> b!1520137 m!1403289))

(declare-fun m!1403291 () Bool)

(assert (=> b!1520137 m!1403291))

(assert (=> b!1520140 m!1403289))

(declare-fun m!1403293 () Bool)

(assert (=> b!1520140 m!1403293))

(declare-fun m!1403295 () Bool)

(assert (=> b!1520140 m!1403295))

(declare-fun m!1403297 () Bool)

(assert (=> b!1520140 m!1403297))

(declare-fun m!1403299 () Bool)

(assert (=> b!1520140 m!1403299))

(declare-fun m!1403301 () Bool)

(assert (=> b!1520144 m!1403301))

(assert (=> b!1520139 m!1403289))

(assert (=> b!1520139 m!1403289))

(declare-fun m!1403303 () Bool)

(assert (=> b!1520139 m!1403303))

(assert (=> b!1520138 m!1403289))

(assert (=> b!1520138 m!1403289))

(declare-fun m!1403305 () Bool)

(assert (=> b!1520138 m!1403305))

(assert (=> b!1520138 m!1403305))

(assert (=> b!1520138 m!1403289))

(declare-fun m!1403307 () Bool)

(assert (=> b!1520138 m!1403307))

(assert (=> b!1520145 m!1403289))

(assert (=> b!1520145 m!1403289))

(declare-fun m!1403309 () Bool)

(assert (=> b!1520145 m!1403309))

(assert (=> b!1520141 m!1403289))

(assert (=> b!1520141 m!1403289))

(declare-fun m!1403311 () Bool)

(assert (=> b!1520141 m!1403311))

(declare-fun m!1403313 () Bool)

(assert (=> start!129626 m!1403313))

(declare-fun m!1403315 () Bool)

(assert (=> start!129626 m!1403315))

(declare-fun m!1403317 () Bool)

(assert (=> b!1520142 m!1403317))

(declare-fun m!1403319 () Bool)

(assert (=> b!1520143 m!1403319))

(declare-fun m!1403321 () Bool)

(assert (=> b!1520134 m!1403321))

(assert (=> b!1520134 m!1403321))

(declare-fun m!1403323 () Bool)

(assert (=> b!1520134 m!1403323))

(assert (=> b!1520136 m!1403295))

(assert (=> b!1520136 m!1403297))

(assert (=> b!1520136 m!1403297))

(declare-fun m!1403325 () Bool)

(assert (=> b!1520136 m!1403325))

(assert (=> b!1520136 m!1403325))

(assert (=> b!1520136 m!1403297))

(declare-fun m!1403327 () Bool)

(assert (=> b!1520136 m!1403327))

(check-sat (not b!1520144) (not b!1520134) (not b!1520138) (not b!1520142) (not start!129626) (not b!1520143) (not b!1520145) (not b!1520136) (not b!1520139) (not b!1520140) (not b!1520137) (not b!1520141))
(check-sat)
