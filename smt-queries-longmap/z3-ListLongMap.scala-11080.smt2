; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129314 () Bool)

(assert start!129314)

(declare-fun b!1518910 () Bool)

(declare-fun e!847309 () Bool)

(declare-fun e!847315 () Bool)

(assert (=> b!1518910 (= e!847309 (not e!847315))))

(declare-fun res!1038819 () Bool)

(assert (=> b!1518910 (=> res!1038819 e!847315)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun lt!658408 () (_ BitVec 64))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!101170 0))(
  ( (array!101171 (arr!48822 (Array (_ BitVec 32) (_ BitVec 64))) (size!49372 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101170)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1518910 (= res!1038819 (or (not (= (select (arr!48822 a!2804) j!70) lt!658408)) (= x!534 resX!21)))))

(declare-fun e!847313 () Bool)

(assert (=> b!1518910 e!847313))

(declare-fun res!1038825 () Bool)

(assert (=> b!1518910 (=> (not res!1038825) (not e!847313))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101170 (_ BitVec 32)) Bool)

(assert (=> b!1518910 (= res!1038825 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50854 0))(
  ( (Unit!50855) )
))
(declare-fun lt!658403 () Unit!50854)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101170 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50854)

(assert (=> b!1518910 (= lt!658403 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518911 () Bool)

(declare-fun res!1038821 () Bool)

(declare-fun e!847310 () Bool)

(assert (=> b!1518911 (=> res!1038821 e!847310)))

(declare-datatypes ((SeekEntryResult!12993 0))(
  ( (MissingZero!12993 (index!54367 (_ BitVec 32))) (Found!12993 (index!54368 (_ BitVec 32))) (Intermediate!12993 (undefined!13805 Bool) (index!54369 (_ BitVec 32)) (x!136039 (_ BitVec 32))) (Undefined!12993) (MissingVacant!12993 (index!54370 (_ BitVec 32))) )
))
(declare-fun lt!658402 () SeekEntryResult!12993)

(declare-fun lt!658404 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101170 (_ BitVec 32)) SeekEntryResult!12993)

(assert (=> b!1518911 (= res!1038821 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658404 (select (arr!48822 a!2804) j!70) a!2804 mask!2512) lt!658402)))))

(declare-fun b!1518912 () Bool)

(declare-fun res!1038815 () Bool)

(declare-fun e!847314 () Bool)

(assert (=> b!1518912 (=> (not res!1038815) (not e!847314))))

(declare-datatypes ((List!35305 0))(
  ( (Nil!35302) (Cons!35301 (h!36713 (_ BitVec 64)) (t!49999 List!35305)) )
))
(declare-fun arrayNoDuplicates!0 (array!101170 (_ BitVec 32) List!35305) Bool)

(assert (=> b!1518912 (= res!1038815 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35302))))

(declare-fun b!1518913 () Bool)

(declare-fun res!1038814 () Bool)

(declare-fun e!847312 () Bool)

(assert (=> b!1518913 (=> (not res!1038814) (not e!847312))))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1518913 (= res!1038814 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48822 a!2804) j!70) a!2804 mask!2512) lt!658402))))

(declare-fun b!1518914 () Bool)

(declare-fun res!1038826 () Bool)

(assert (=> b!1518914 (=> (not res!1038826) (not e!847314))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518914 (= res!1038826 (validKeyInArray!0 (select (arr!48822 a!2804) i!961)))))

(declare-fun b!1518915 () Bool)

(assert (=> b!1518915 (= e!847314 e!847312)))

(declare-fun res!1038823 () Bool)

(assert (=> b!1518915 (=> (not res!1038823) (not e!847312))))

(declare-fun lt!658407 () SeekEntryResult!12993)

(assert (=> b!1518915 (= res!1038823 (= lt!658407 lt!658402))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1518915 (= lt!658402 (Intermediate!12993 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518915 (= lt!658407 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48822 a!2804) j!70) mask!2512) (select (arr!48822 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518916 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101170 (_ BitVec 32)) SeekEntryResult!12993)

(assert (=> b!1518916 (= e!847313 (= (seekEntry!0 (select (arr!48822 a!2804) j!70) a!2804 mask!2512) (Found!12993 j!70)))))

(declare-fun b!1518917 () Bool)

(assert (=> b!1518917 (= e!847315 e!847310)))

(declare-fun res!1038822 () Bool)

(assert (=> b!1518917 (=> res!1038822 e!847310)))

(assert (=> b!1518917 (= res!1038822 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658404 #b00000000000000000000000000000000) (bvsge lt!658404 (size!49372 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518917 (= lt!658404 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518918 () Bool)

(declare-fun res!1038820 () Bool)

(assert (=> b!1518918 (=> (not res!1038820) (not e!847314))))

(assert (=> b!1518918 (= res!1038820 (and (= (size!49372 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49372 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49372 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518919 () Bool)

(declare-fun res!1038816 () Bool)

(assert (=> b!1518919 (=> (not res!1038816) (not e!847314))))

(assert (=> b!1518919 (= res!1038816 (validKeyInArray!0 (select (arr!48822 a!2804) j!70)))))

(declare-fun b!1518920 () Bool)

(assert (=> b!1518920 (= e!847310 true)))

(declare-fun lt!658406 () array!101170)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101170 (_ BitVec 32)) SeekEntryResult!12993)

(assert (=> b!1518920 (= (seekEntryOrOpen!0 (select (arr!48822 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658408 lt!658406 mask!2512))))

(declare-fun lt!658405 () Unit!50854)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101170 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50854)

(assert (=> b!1518920 (= lt!658405 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658404 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1518921 () Bool)

(declare-fun res!1038817 () Bool)

(assert (=> b!1518921 (=> (not res!1038817) (not e!847314))))

(assert (=> b!1518921 (= res!1038817 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49372 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49372 a!2804))))))

(declare-fun res!1038818 () Bool)

(assert (=> start!129314 (=> (not res!1038818) (not e!847314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129314 (= res!1038818 (validMask!0 mask!2512))))

(assert (=> start!129314 e!847314))

(assert (=> start!129314 true))

(declare-fun array_inv!37850 (array!101170) Bool)

(assert (=> start!129314 (array_inv!37850 a!2804)))

(declare-fun b!1518922 () Bool)

(declare-fun res!1038813 () Bool)

(assert (=> b!1518922 (=> (not res!1038813) (not e!847314))))

(assert (=> b!1518922 (= res!1038813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518923 () Bool)

(assert (=> b!1518923 (= e!847312 e!847309)))

(declare-fun res!1038824 () Bool)

(assert (=> b!1518923 (=> (not res!1038824) (not e!847309))))

(assert (=> b!1518923 (= res!1038824 (= lt!658407 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658408 mask!2512) lt!658408 lt!658406 mask!2512)))))

(assert (=> b!1518923 (= lt!658408 (select (store (arr!48822 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1518923 (= lt!658406 (array!101171 (store (arr!48822 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49372 a!2804)))))

(assert (= (and start!129314 res!1038818) b!1518918))

(assert (= (and b!1518918 res!1038820) b!1518914))

(assert (= (and b!1518914 res!1038826) b!1518919))

(assert (= (and b!1518919 res!1038816) b!1518922))

(assert (= (and b!1518922 res!1038813) b!1518912))

(assert (= (and b!1518912 res!1038815) b!1518921))

(assert (= (and b!1518921 res!1038817) b!1518915))

(assert (= (and b!1518915 res!1038823) b!1518913))

(assert (= (and b!1518913 res!1038814) b!1518923))

(assert (= (and b!1518923 res!1038824) b!1518910))

(assert (= (and b!1518910 res!1038825) b!1518916))

(assert (= (and b!1518910 (not res!1038819)) b!1518917))

(assert (= (and b!1518917 (not res!1038822)) b!1518911))

(assert (= (and b!1518911 (not res!1038821)) b!1518920))

(declare-fun m!1402265 () Bool)

(assert (=> b!1518917 m!1402265))

(declare-fun m!1402267 () Bool)

(assert (=> b!1518911 m!1402267))

(assert (=> b!1518911 m!1402267))

(declare-fun m!1402269 () Bool)

(assert (=> b!1518911 m!1402269))

(assert (=> b!1518916 m!1402267))

(assert (=> b!1518916 m!1402267))

(declare-fun m!1402271 () Bool)

(assert (=> b!1518916 m!1402271))

(assert (=> b!1518910 m!1402267))

(declare-fun m!1402273 () Bool)

(assert (=> b!1518910 m!1402273))

(declare-fun m!1402275 () Bool)

(assert (=> b!1518910 m!1402275))

(assert (=> b!1518915 m!1402267))

(assert (=> b!1518915 m!1402267))

(declare-fun m!1402277 () Bool)

(assert (=> b!1518915 m!1402277))

(assert (=> b!1518915 m!1402277))

(assert (=> b!1518915 m!1402267))

(declare-fun m!1402279 () Bool)

(assert (=> b!1518915 m!1402279))

(declare-fun m!1402281 () Bool)

(assert (=> b!1518922 m!1402281))

(assert (=> b!1518913 m!1402267))

(assert (=> b!1518913 m!1402267))

(declare-fun m!1402283 () Bool)

(assert (=> b!1518913 m!1402283))

(assert (=> b!1518919 m!1402267))

(assert (=> b!1518919 m!1402267))

(declare-fun m!1402285 () Bool)

(assert (=> b!1518919 m!1402285))

(declare-fun m!1402287 () Bool)

(assert (=> b!1518914 m!1402287))

(assert (=> b!1518914 m!1402287))

(declare-fun m!1402289 () Bool)

(assert (=> b!1518914 m!1402289))

(declare-fun m!1402291 () Bool)

(assert (=> start!129314 m!1402291))

(declare-fun m!1402293 () Bool)

(assert (=> start!129314 m!1402293))

(assert (=> b!1518920 m!1402267))

(assert (=> b!1518920 m!1402267))

(declare-fun m!1402295 () Bool)

(assert (=> b!1518920 m!1402295))

(declare-fun m!1402297 () Bool)

(assert (=> b!1518920 m!1402297))

(declare-fun m!1402299 () Bool)

(assert (=> b!1518920 m!1402299))

(declare-fun m!1402301 () Bool)

(assert (=> b!1518923 m!1402301))

(assert (=> b!1518923 m!1402301))

(declare-fun m!1402303 () Bool)

(assert (=> b!1518923 m!1402303))

(declare-fun m!1402305 () Bool)

(assert (=> b!1518923 m!1402305))

(declare-fun m!1402307 () Bool)

(assert (=> b!1518923 m!1402307))

(declare-fun m!1402309 () Bool)

(assert (=> b!1518912 m!1402309))

(check-sat (not b!1518911) (not start!129314) (not b!1518912) (not b!1518917) (not b!1518913) (not b!1518914) (not b!1518920) (not b!1518910) (not b!1518915) (not b!1518919) (not b!1518922) (not b!1518923) (not b!1518916))
(check-sat)
