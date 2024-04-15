; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129110 () Bool)

(assert start!129110)

(declare-fun b!1515642 () Bool)

(declare-fun res!1035755 () Bool)

(declare-fun e!845765 () Bool)

(assert (=> b!1515642 (=> (not res!1035755) (not e!845765))))

(declare-datatypes ((array!100966 0))(
  ( (array!100967 (arr!48721 (Array (_ BitVec 32) (_ BitVec 64))) (size!49273 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100966)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100966 (_ BitVec 32)) Bool)

(assert (=> b!1515642 (= res!1035755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1515643 () Bool)

(declare-fun e!845766 () Bool)

(assert (=> b!1515643 (= e!845766 (not true))))

(declare-fun e!845764 () Bool)

(assert (=> b!1515643 e!845764))

(declare-fun res!1035759 () Bool)

(assert (=> b!1515643 (=> (not res!1035759) (not e!845764))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1515643 (= res!1035759 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50537 0))(
  ( (Unit!50538) )
))
(declare-fun lt!656973 () Unit!50537)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100966 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50537)

(assert (=> b!1515643 (= lt!656973 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1515644 () Bool)

(declare-fun res!1035757 () Bool)

(assert (=> b!1515644 (=> (not res!1035757) (not e!845765))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1515644 (= res!1035757 (and (= (size!49273 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49273 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49273 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1035761 () Bool)

(assert (=> start!129110 (=> (not res!1035761) (not e!845765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129110 (= res!1035761 (validMask!0 mask!2512))))

(assert (=> start!129110 e!845765))

(assert (=> start!129110 true))

(declare-fun array_inv!37954 (array!100966) Bool)

(assert (=> start!129110 (array_inv!37954 a!2804)))

(declare-fun b!1515645 () Bool)

(declare-fun res!1035752 () Bool)

(assert (=> b!1515645 (=> (not res!1035752) (not e!845765))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1515645 (= res!1035752 (validKeyInArray!0 (select (arr!48721 a!2804) j!70)))))

(declare-fun b!1515646 () Bool)

(declare-datatypes ((SeekEntryResult!12915 0))(
  ( (MissingZero!12915 (index!54055 (_ BitVec 32))) (Found!12915 (index!54056 (_ BitVec 32))) (Intermediate!12915 (undefined!13727 Bool) (index!54057 (_ BitVec 32)) (x!135755 (_ BitVec 32))) (Undefined!12915) (MissingVacant!12915 (index!54058 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!100966 (_ BitVec 32)) SeekEntryResult!12915)

(assert (=> b!1515646 (= e!845764 (= (seekEntry!0 (select (arr!48721 a!2804) j!70) a!2804 mask!2512) (Found!12915 j!70)))))

(declare-fun b!1515647 () Bool)

(declare-fun res!1035751 () Bool)

(assert (=> b!1515647 (=> (not res!1035751) (not e!845765))))

(assert (=> b!1515647 (= res!1035751 (validKeyInArray!0 (select (arr!48721 a!2804) i!961)))))

(declare-fun b!1515648 () Bool)

(assert (=> b!1515648 (= e!845765 e!845766)))

(declare-fun res!1035758 () Bool)

(assert (=> b!1515648 (=> (not res!1035758) (not e!845766))))

(declare-fun lt!656972 () SeekEntryResult!12915)

(declare-fun lt!656971 () SeekEntryResult!12915)

(assert (=> b!1515648 (= res!1035758 (= lt!656972 lt!656971))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1515648 (= lt!656971 (Intermediate!12915 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100966 (_ BitVec 32)) SeekEntryResult!12915)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1515648 (= lt!656972 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48721 a!2804) j!70) mask!2512) (select (arr!48721 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1515649 () Bool)

(declare-fun res!1035754 () Bool)

(assert (=> b!1515649 (=> (not res!1035754) (not e!845765))))

(declare-datatypes ((List!35282 0))(
  ( (Nil!35279) (Cons!35278 (h!36691 (_ BitVec 64)) (t!49968 List!35282)) )
))
(declare-fun arrayNoDuplicates!0 (array!100966 (_ BitVec 32) List!35282) Bool)

(assert (=> b!1515649 (= res!1035754 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35279))))

(declare-fun b!1515650 () Bool)

(declare-fun res!1035760 () Bool)

(assert (=> b!1515650 (=> (not res!1035760) (not e!845766))))

(assert (=> b!1515650 (= res!1035760 (= lt!656972 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48721 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48721 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100967 (store (arr!48721 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49273 a!2804)) mask!2512)))))

(declare-fun b!1515651 () Bool)

(declare-fun res!1035756 () Bool)

(assert (=> b!1515651 (=> (not res!1035756) (not e!845766))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1515651 (= res!1035756 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48721 a!2804) j!70) a!2804 mask!2512) lt!656971))))

(declare-fun b!1515652 () Bool)

(declare-fun res!1035753 () Bool)

(assert (=> b!1515652 (=> (not res!1035753) (not e!845765))))

(assert (=> b!1515652 (= res!1035753 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49273 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49273 a!2804))))))

(assert (= (and start!129110 res!1035761) b!1515644))

(assert (= (and b!1515644 res!1035757) b!1515647))

(assert (= (and b!1515647 res!1035751) b!1515645))

(assert (= (and b!1515645 res!1035752) b!1515642))

(assert (= (and b!1515642 res!1035755) b!1515649))

(assert (= (and b!1515649 res!1035754) b!1515652))

(assert (= (and b!1515652 res!1035753) b!1515648))

(assert (= (and b!1515648 res!1035758) b!1515651))

(assert (= (and b!1515651 res!1035756) b!1515650))

(assert (= (and b!1515650 res!1035760) b!1515643))

(assert (= (and b!1515643 res!1035759) b!1515646))

(declare-fun m!1398305 () Bool)

(assert (=> b!1515648 m!1398305))

(assert (=> b!1515648 m!1398305))

(declare-fun m!1398307 () Bool)

(assert (=> b!1515648 m!1398307))

(assert (=> b!1515648 m!1398307))

(assert (=> b!1515648 m!1398305))

(declare-fun m!1398309 () Bool)

(assert (=> b!1515648 m!1398309))

(declare-fun m!1398311 () Bool)

(assert (=> b!1515649 m!1398311))

(declare-fun m!1398313 () Bool)

(assert (=> b!1515643 m!1398313))

(declare-fun m!1398315 () Bool)

(assert (=> b!1515643 m!1398315))

(assert (=> b!1515651 m!1398305))

(assert (=> b!1515651 m!1398305))

(declare-fun m!1398317 () Bool)

(assert (=> b!1515651 m!1398317))

(declare-fun m!1398319 () Bool)

(assert (=> b!1515650 m!1398319))

(declare-fun m!1398321 () Bool)

(assert (=> b!1515650 m!1398321))

(assert (=> b!1515650 m!1398321))

(declare-fun m!1398323 () Bool)

(assert (=> b!1515650 m!1398323))

(assert (=> b!1515650 m!1398323))

(assert (=> b!1515650 m!1398321))

(declare-fun m!1398325 () Bool)

(assert (=> b!1515650 m!1398325))

(declare-fun m!1398327 () Bool)

(assert (=> b!1515642 m!1398327))

(declare-fun m!1398329 () Bool)

(assert (=> start!129110 m!1398329))

(declare-fun m!1398331 () Bool)

(assert (=> start!129110 m!1398331))

(declare-fun m!1398333 () Bool)

(assert (=> b!1515647 m!1398333))

(assert (=> b!1515647 m!1398333))

(declare-fun m!1398335 () Bool)

(assert (=> b!1515647 m!1398335))

(assert (=> b!1515645 m!1398305))

(assert (=> b!1515645 m!1398305))

(declare-fun m!1398337 () Bool)

(assert (=> b!1515645 m!1398337))

(assert (=> b!1515646 m!1398305))

(assert (=> b!1515646 m!1398305))

(declare-fun m!1398339 () Bool)

(assert (=> b!1515646 m!1398339))

(check-sat (not start!129110) (not b!1515649) (not b!1515645) (not b!1515650) (not b!1515643) (not b!1515648) (not b!1515646) (not b!1515651) (not b!1515647) (not b!1515642))
(check-sat)
