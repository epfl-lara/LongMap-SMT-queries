; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129270 () Bool)

(assert start!129270)

(declare-fun b!1518020 () Bool)

(declare-fun e!846883 () Bool)

(declare-fun e!846885 () Bool)

(assert (=> b!1518020 (= e!846883 (not e!846885))))

(declare-fun res!1037931 () Bool)

(assert (=> b!1518020 (=> res!1037931 e!846885)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-datatypes ((array!101126 0))(
  ( (array!101127 (arr!48800 (Array (_ BitVec 32) (_ BitVec 64))) (size!49350 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101126)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1518020 (= res!1037931 (or (not (= (select (arr!48800 a!2804) j!70) (select (store (arr!48800 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846884 () Bool)

(assert (=> b!1518020 e!846884))

(declare-fun res!1037932 () Bool)

(assert (=> b!1518020 (=> (not res!1037932) (not e!846884))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101126 (_ BitVec 32)) Bool)

(assert (=> b!1518020 (= res!1037932 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50810 0))(
  ( (Unit!50811) )
))
(declare-fun lt!658010 () Unit!50810)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101126 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50810)

(assert (=> b!1518020 (= lt!658010 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518021 () Bool)

(declare-datatypes ((SeekEntryResult!12971 0))(
  ( (MissingZero!12971 (index!54279 (_ BitVec 32))) (Found!12971 (index!54280 (_ BitVec 32))) (Intermediate!12971 (undefined!13783 Bool) (index!54281 (_ BitVec 32)) (x!135961 (_ BitVec 32))) (Undefined!12971) (MissingVacant!12971 (index!54282 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101126 (_ BitVec 32)) SeekEntryResult!12971)

(assert (=> b!1518021 (= e!846884 (= (seekEntry!0 (select (arr!48800 a!2804) j!70) a!2804 mask!2512) (Found!12971 j!70)))))

(declare-fun b!1518022 () Bool)

(declare-fun e!846886 () Bool)

(assert (=> b!1518022 (= e!846886 true)))

(declare-fun lt!658012 () SeekEntryResult!12971)

(declare-fun lt!658008 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101126 (_ BitVec 32)) SeekEntryResult!12971)

(assert (=> b!1518022 (= lt!658012 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658008 (select (arr!48800 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518023 () Bool)

(declare-fun res!1037927 () Bool)

(assert (=> b!1518023 (=> (not res!1037927) (not e!846883))))

(declare-fun lt!658011 () SeekEntryResult!12971)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518023 (= res!1037927 (= lt!658011 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48800 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48800 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101127 (store (arr!48800 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49350 a!2804)) mask!2512)))))

(declare-fun res!1037923 () Bool)

(declare-fun e!846882 () Bool)

(assert (=> start!129270 (=> (not res!1037923) (not e!846882))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129270 (= res!1037923 (validMask!0 mask!2512))))

(assert (=> start!129270 e!846882))

(assert (=> start!129270 true))

(declare-fun array_inv!37828 (array!101126) Bool)

(assert (=> start!129270 (array_inv!37828 a!2804)))

(declare-fun b!1518024 () Bool)

(declare-fun res!1037926 () Bool)

(assert (=> b!1518024 (=> (not res!1037926) (not e!846882))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518024 (= res!1037926 (validKeyInArray!0 (select (arr!48800 a!2804) j!70)))))

(declare-fun b!1518025 () Bool)

(assert (=> b!1518025 (= e!846885 e!846886)))

(declare-fun res!1037924 () Bool)

(assert (=> b!1518025 (=> res!1037924 e!846886)))

(assert (=> b!1518025 (= res!1037924 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658008 #b00000000000000000000000000000000) (bvsge lt!658008 (size!49350 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518025 (= lt!658008 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518026 () Bool)

(declare-fun res!1037934 () Bool)

(assert (=> b!1518026 (=> (not res!1037934) (not e!846882))))

(assert (=> b!1518026 (= res!1037934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518027 () Bool)

(declare-fun res!1037933 () Bool)

(assert (=> b!1518027 (=> (not res!1037933) (not e!846883))))

(declare-fun lt!658009 () SeekEntryResult!12971)

(assert (=> b!1518027 (= res!1037933 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48800 a!2804) j!70) a!2804 mask!2512) lt!658009))))

(declare-fun b!1518028 () Bool)

(declare-fun res!1037925 () Bool)

(assert (=> b!1518028 (=> (not res!1037925) (not e!846882))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1518028 (= res!1037925 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49350 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49350 a!2804))))))

(declare-fun b!1518029 () Bool)

(declare-fun res!1037930 () Bool)

(assert (=> b!1518029 (=> (not res!1037930) (not e!846882))))

(assert (=> b!1518029 (= res!1037930 (and (= (size!49350 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49350 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49350 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518030 () Bool)

(declare-fun res!1037929 () Bool)

(assert (=> b!1518030 (=> (not res!1037929) (not e!846882))))

(assert (=> b!1518030 (= res!1037929 (validKeyInArray!0 (select (arr!48800 a!2804) i!961)))))

(declare-fun b!1518031 () Bool)

(assert (=> b!1518031 (= e!846882 e!846883)))

(declare-fun res!1037935 () Bool)

(assert (=> b!1518031 (=> (not res!1037935) (not e!846883))))

(assert (=> b!1518031 (= res!1037935 (= lt!658011 lt!658009))))

(assert (=> b!1518031 (= lt!658009 (Intermediate!12971 false resIndex!21 resX!21))))

(assert (=> b!1518031 (= lt!658011 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48800 a!2804) j!70) mask!2512) (select (arr!48800 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518032 () Bool)

(declare-fun res!1037928 () Bool)

(assert (=> b!1518032 (=> (not res!1037928) (not e!846882))))

(declare-datatypes ((List!35283 0))(
  ( (Nil!35280) (Cons!35279 (h!36691 (_ BitVec 64)) (t!49977 List!35283)) )
))
(declare-fun arrayNoDuplicates!0 (array!101126 (_ BitVec 32) List!35283) Bool)

(assert (=> b!1518032 (= res!1037928 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35280))))

(assert (= (and start!129270 res!1037923) b!1518029))

(assert (= (and b!1518029 res!1037930) b!1518030))

(assert (= (and b!1518030 res!1037929) b!1518024))

(assert (= (and b!1518024 res!1037926) b!1518026))

(assert (= (and b!1518026 res!1037934) b!1518032))

(assert (= (and b!1518032 res!1037928) b!1518028))

(assert (= (and b!1518028 res!1037925) b!1518031))

(assert (= (and b!1518031 res!1037935) b!1518027))

(assert (= (and b!1518027 res!1037933) b!1518023))

(assert (= (and b!1518023 res!1037927) b!1518020))

(assert (= (and b!1518020 res!1037932) b!1518021))

(assert (= (and b!1518020 (not res!1037931)) b!1518025))

(assert (= (and b!1518025 (not res!1037924)) b!1518022))

(declare-fun m!1401325 () Bool)

(assert (=> b!1518030 m!1401325))

(assert (=> b!1518030 m!1401325))

(declare-fun m!1401327 () Bool)

(assert (=> b!1518030 m!1401327))

(declare-fun m!1401329 () Bool)

(assert (=> b!1518026 m!1401329))

(declare-fun m!1401331 () Bool)

(assert (=> b!1518027 m!1401331))

(assert (=> b!1518027 m!1401331))

(declare-fun m!1401333 () Bool)

(assert (=> b!1518027 m!1401333))

(declare-fun m!1401335 () Bool)

(assert (=> start!129270 m!1401335))

(declare-fun m!1401337 () Bool)

(assert (=> start!129270 m!1401337))

(declare-fun m!1401339 () Bool)

(assert (=> b!1518023 m!1401339))

(declare-fun m!1401341 () Bool)

(assert (=> b!1518023 m!1401341))

(assert (=> b!1518023 m!1401341))

(declare-fun m!1401343 () Bool)

(assert (=> b!1518023 m!1401343))

(assert (=> b!1518023 m!1401343))

(assert (=> b!1518023 m!1401341))

(declare-fun m!1401345 () Bool)

(assert (=> b!1518023 m!1401345))

(assert (=> b!1518031 m!1401331))

(assert (=> b!1518031 m!1401331))

(declare-fun m!1401347 () Bool)

(assert (=> b!1518031 m!1401347))

(assert (=> b!1518031 m!1401347))

(assert (=> b!1518031 m!1401331))

(declare-fun m!1401349 () Bool)

(assert (=> b!1518031 m!1401349))

(assert (=> b!1518024 m!1401331))

(assert (=> b!1518024 m!1401331))

(declare-fun m!1401351 () Bool)

(assert (=> b!1518024 m!1401351))

(assert (=> b!1518022 m!1401331))

(assert (=> b!1518022 m!1401331))

(declare-fun m!1401353 () Bool)

(assert (=> b!1518022 m!1401353))

(assert (=> b!1518020 m!1401331))

(declare-fun m!1401355 () Bool)

(assert (=> b!1518020 m!1401355))

(assert (=> b!1518020 m!1401339))

(assert (=> b!1518020 m!1401341))

(declare-fun m!1401357 () Bool)

(assert (=> b!1518020 m!1401357))

(declare-fun m!1401359 () Bool)

(assert (=> b!1518025 m!1401359))

(assert (=> b!1518021 m!1401331))

(assert (=> b!1518021 m!1401331))

(declare-fun m!1401361 () Bool)

(assert (=> b!1518021 m!1401361))

(declare-fun m!1401363 () Bool)

(assert (=> b!1518032 m!1401363))

(push 1)

