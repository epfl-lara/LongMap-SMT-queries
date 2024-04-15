; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129278 () Bool)

(assert start!129278)

(declare-fun b!1518906 () Bool)

(declare-fun e!847267 () Bool)

(declare-fun e!847263 () Bool)

(assert (=> b!1518906 (= e!847267 e!847263)))

(declare-fun res!1039026 () Bool)

(assert (=> b!1518906 (=> (not res!1039026) (not e!847263))))

(declare-datatypes ((SeekEntryResult!12999 0))(
  ( (MissingZero!12999 (index!54391 (_ BitVec 32))) (Found!12999 (index!54392 (_ BitVec 32))) (Intermediate!12999 (undefined!13811 Bool) (index!54393 (_ BitVec 32)) (x!136063 (_ BitVec 32))) (Undefined!12999) (MissingVacant!12999 (index!54394 (_ BitVec 32))) )
))
(declare-fun lt!658275 () SeekEntryResult!12999)

(declare-fun lt!658280 () SeekEntryResult!12999)

(assert (=> b!1518906 (= res!1039026 (= lt!658275 lt!658280))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1518906 (= lt!658280 (Intermediate!12999 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101134 0))(
  ( (array!101135 (arr!48805 (Array (_ BitVec 32) (_ BitVec 64))) (size!49357 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101134)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101134 (_ BitVec 32)) SeekEntryResult!12999)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518906 (= lt!658275 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48805 a!2804) j!70) mask!2512) (select (arr!48805 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518907 () Bool)

(declare-fun e!847265 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101134 (_ BitVec 32)) SeekEntryResult!12999)

(assert (=> b!1518907 (= e!847265 (= (seekEntry!0 (select (arr!48805 a!2804) j!70) a!2804 mask!2512) (Found!12999 j!70)))))

(declare-fun b!1518908 () Bool)

(declare-fun e!847268 () Bool)

(declare-fun e!847269 () Bool)

(assert (=> b!1518908 (= e!847268 e!847269)))

(declare-fun res!1039018 () Bool)

(assert (=> b!1518908 (=> res!1039018 e!847269)))

(declare-fun lt!658278 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1518908 (= res!1039018 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658278 #b00000000000000000000000000000000) (bvsge lt!658278 (size!49357 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518908 (= lt!658278 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518909 () Bool)

(declare-fun res!1039019 () Bool)

(assert (=> b!1518909 (=> (not res!1039019) (not e!847263))))

(assert (=> b!1518909 (= res!1039019 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48805 a!2804) j!70) a!2804 mask!2512) lt!658280))))

(declare-fun b!1518910 () Bool)

(declare-fun e!847266 () Bool)

(assert (=> b!1518910 (= e!847266 (not e!847268))))

(declare-fun res!1039028 () Bool)

(assert (=> b!1518910 (=> res!1039028 e!847268)))

(declare-fun lt!658276 () (_ BitVec 64))

(assert (=> b!1518910 (= res!1039028 (or (not (= (select (arr!48805 a!2804) j!70) lt!658276)) (= x!534 resX!21)))))

(assert (=> b!1518910 e!847265))

(declare-fun res!1039021 () Bool)

(assert (=> b!1518910 (=> (not res!1039021) (not e!847265))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101134 (_ BitVec 32)) Bool)

(assert (=> b!1518910 (= res!1039021 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50705 0))(
  ( (Unit!50706) )
))
(declare-fun lt!658281 () Unit!50705)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101134 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50705)

(assert (=> b!1518910 (= lt!658281 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518911 () Bool)

(declare-fun res!1039023 () Bool)

(assert (=> b!1518911 (=> (not res!1039023) (not e!847267))))

(assert (=> b!1518911 (= res!1039023 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49357 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49357 a!2804))))))

(declare-fun b!1518912 () Bool)

(declare-fun res!1039015 () Bool)

(assert (=> b!1518912 (=> (not res!1039015) (not e!847267))))

(declare-datatypes ((List!35366 0))(
  ( (Nil!35363) (Cons!35362 (h!36775 (_ BitVec 64)) (t!50052 List!35366)) )
))
(declare-fun arrayNoDuplicates!0 (array!101134 (_ BitVec 32) List!35366) Bool)

(assert (=> b!1518912 (= res!1039015 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35363))))

(declare-fun res!1039027 () Bool)

(assert (=> start!129278 (=> (not res!1039027) (not e!847267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129278 (= res!1039027 (validMask!0 mask!2512))))

(assert (=> start!129278 e!847267))

(assert (=> start!129278 true))

(declare-fun array_inv!38038 (array!101134) Bool)

(assert (=> start!129278 (array_inv!38038 a!2804)))

(declare-fun b!1518913 () Bool)

(declare-fun res!1039022 () Bool)

(assert (=> b!1518913 (=> (not res!1039022) (not e!847267))))

(assert (=> b!1518913 (= res!1039022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518914 () Bool)

(declare-fun res!1039024 () Bool)

(assert (=> b!1518914 (=> res!1039024 e!847269)))

(assert (=> b!1518914 (= res!1039024 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658278 (select (arr!48805 a!2804) j!70) a!2804 mask!2512) lt!658280)))))

(declare-fun b!1518915 () Bool)

(assert (=> b!1518915 (= e!847263 e!847266)))

(declare-fun res!1039020 () Bool)

(assert (=> b!1518915 (=> (not res!1039020) (not e!847266))))

(declare-fun lt!658277 () array!101134)

(assert (=> b!1518915 (= res!1039020 (= lt!658275 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!658276 mask!2512) lt!658276 lt!658277 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1518915 (= lt!658276 (select (store (arr!48805 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1518915 (= lt!658277 (array!101135 (store (arr!48805 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49357 a!2804)))))

(declare-fun b!1518916 () Bool)

(declare-fun res!1039017 () Bool)

(assert (=> b!1518916 (=> (not res!1039017) (not e!847267))))

(assert (=> b!1518916 (= res!1039017 (and (= (size!49357 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49357 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49357 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518917 () Bool)

(declare-fun res!1039025 () Bool)

(assert (=> b!1518917 (=> (not res!1039025) (not e!847267))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518917 (= res!1039025 (validKeyInArray!0 (select (arr!48805 a!2804) j!70)))))

(declare-fun b!1518918 () Bool)

(declare-fun res!1039016 () Bool)

(assert (=> b!1518918 (=> (not res!1039016) (not e!847267))))

(assert (=> b!1518918 (= res!1039016 (validKeyInArray!0 (select (arr!48805 a!2804) i!961)))))

(declare-fun b!1518919 () Bool)

(assert (=> b!1518919 (= e!847269 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101134 (_ BitVec 32)) SeekEntryResult!12999)

(assert (=> b!1518919 (= (seekEntryOrOpen!0 (select (arr!48805 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!658276 lt!658277 mask!2512))))

(declare-fun lt!658279 () Unit!50705)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101134 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50705)

(assert (=> b!1518919 (= lt!658279 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!658278 resX!21 resIndex!21 mask!2512))))

(assert (= (and start!129278 res!1039027) b!1518916))

(assert (= (and b!1518916 res!1039017) b!1518918))

(assert (= (and b!1518918 res!1039016) b!1518917))

(assert (= (and b!1518917 res!1039025) b!1518913))

(assert (= (and b!1518913 res!1039022) b!1518912))

(assert (= (and b!1518912 res!1039015) b!1518911))

(assert (= (and b!1518911 res!1039023) b!1518906))

(assert (= (and b!1518906 res!1039026) b!1518909))

(assert (= (and b!1518909 res!1039019) b!1518915))

(assert (= (and b!1518915 res!1039020) b!1518910))

(assert (= (and b!1518910 res!1039021) b!1518907))

(assert (= (and b!1518910 (not res!1039028)) b!1518908))

(assert (= (and b!1518908 (not res!1039018)) b!1518914))

(assert (= (and b!1518914 (not res!1039024)) b!1518919))

(declare-fun m!1401725 () Bool)

(assert (=> b!1518912 m!1401725))

(declare-fun m!1401727 () Bool)

(assert (=> b!1518908 m!1401727))

(declare-fun m!1401729 () Bool)

(assert (=> b!1518918 m!1401729))

(assert (=> b!1518918 m!1401729))

(declare-fun m!1401731 () Bool)

(assert (=> b!1518918 m!1401731))

(declare-fun m!1401733 () Bool)

(assert (=> start!129278 m!1401733))

(declare-fun m!1401735 () Bool)

(assert (=> start!129278 m!1401735))

(declare-fun m!1401737 () Bool)

(assert (=> b!1518907 m!1401737))

(assert (=> b!1518907 m!1401737))

(declare-fun m!1401739 () Bool)

(assert (=> b!1518907 m!1401739))

(assert (=> b!1518909 m!1401737))

(assert (=> b!1518909 m!1401737))

(declare-fun m!1401741 () Bool)

(assert (=> b!1518909 m!1401741))

(assert (=> b!1518914 m!1401737))

(assert (=> b!1518914 m!1401737))

(declare-fun m!1401743 () Bool)

(assert (=> b!1518914 m!1401743))

(assert (=> b!1518906 m!1401737))

(assert (=> b!1518906 m!1401737))

(declare-fun m!1401745 () Bool)

(assert (=> b!1518906 m!1401745))

(assert (=> b!1518906 m!1401745))

(assert (=> b!1518906 m!1401737))

(declare-fun m!1401747 () Bool)

(assert (=> b!1518906 m!1401747))

(assert (=> b!1518910 m!1401737))

(declare-fun m!1401749 () Bool)

(assert (=> b!1518910 m!1401749))

(declare-fun m!1401751 () Bool)

(assert (=> b!1518910 m!1401751))

(declare-fun m!1401753 () Bool)

(assert (=> b!1518913 m!1401753))

(declare-fun m!1401755 () Bool)

(assert (=> b!1518915 m!1401755))

(assert (=> b!1518915 m!1401755))

(declare-fun m!1401757 () Bool)

(assert (=> b!1518915 m!1401757))

(declare-fun m!1401759 () Bool)

(assert (=> b!1518915 m!1401759))

(declare-fun m!1401761 () Bool)

(assert (=> b!1518915 m!1401761))

(assert (=> b!1518919 m!1401737))

(assert (=> b!1518919 m!1401737))

(declare-fun m!1401763 () Bool)

(assert (=> b!1518919 m!1401763))

(declare-fun m!1401765 () Bool)

(assert (=> b!1518919 m!1401765))

(declare-fun m!1401767 () Bool)

(assert (=> b!1518919 m!1401767))

(assert (=> b!1518917 m!1401737))

(assert (=> b!1518917 m!1401737))

(declare-fun m!1401769 () Bool)

(assert (=> b!1518917 m!1401769))

(check-sat (not b!1518919) (not b!1518914) (not b!1518918) (not start!129278) (not b!1518906) (not b!1518907) (not b!1518917) (not b!1518908) (not b!1518915) (not b!1518910) (not b!1518912) (not b!1518909) (not b!1518913))
(check-sat)
