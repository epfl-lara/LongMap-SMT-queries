; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129282 () Bool)

(assert start!129282)

(declare-fun b!1518254 () Bool)

(declare-fun res!1038158 () Bool)

(declare-fun e!846994 () Bool)

(assert (=> b!1518254 (=> (not res!1038158) (not e!846994))))

(declare-datatypes ((array!101138 0))(
  ( (array!101139 (arr!48806 (Array (_ BitVec 32) (_ BitVec 64))) (size!49356 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101138)

(declare-datatypes ((List!35289 0))(
  ( (Nil!35286) (Cons!35285 (h!36697 (_ BitVec 64)) (t!49983 List!35289)) )
))
(declare-fun arrayNoDuplicates!0 (array!101138 (_ BitVec 32) List!35289) Bool)

(assert (=> b!1518254 (= res!1038158 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35286))))

(declare-fun b!1518255 () Bool)

(declare-fun e!846993 () Bool)

(declare-fun e!846989 () Bool)

(assert (=> b!1518255 (= e!846993 e!846989)))

(declare-fun res!1038157 () Bool)

(assert (=> b!1518255 (=> res!1038157 e!846989)))

(declare-fun lt!658098 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1518255 (= res!1038157 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!658098 #b00000000000000000000000000000000) (bvsge lt!658098 (size!49356 a!2804))))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518255 (= lt!658098 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1518256 () Bool)

(declare-fun res!1038161 () Bool)

(assert (=> b!1518256 (=> (not res!1038161) (not e!846994))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1518256 (= res!1038161 (and (= (size!49356 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49356 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49356 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1518258 () Bool)

(declare-fun res!1038163 () Bool)

(declare-fun e!846990 () Bool)

(assert (=> b!1518258 (=> (not res!1038163) (not e!846990))))

(declare-datatypes ((SeekEntryResult!12977 0))(
  ( (MissingZero!12977 (index!54303 (_ BitVec 32))) (Found!12977 (index!54304 (_ BitVec 32))) (Intermediate!12977 (undefined!13789 Bool) (index!54305 (_ BitVec 32)) (x!135983 (_ BitVec 32))) (Undefined!12977) (MissingVacant!12977 (index!54306 (_ BitVec 32))) )
))
(declare-fun lt!658100 () SeekEntryResult!12977)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101138 (_ BitVec 32)) SeekEntryResult!12977)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1518258 (= res!1038163 (= lt!658100 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48806 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48806 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101139 (store (arr!48806 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49356 a!2804)) mask!2512)))))

(declare-fun b!1518259 () Bool)

(declare-fun res!1038162 () Bool)

(assert (=> b!1518259 (=> (not res!1038162) (not e!846994))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1518259 (= res!1038162 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49356 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49356 a!2804))))))

(declare-fun b!1518260 () Bool)

(declare-fun res!1038166 () Bool)

(assert (=> b!1518260 (=> (not res!1038166) (not e!846994))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1518260 (= res!1038166 (validKeyInArray!0 (select (arr!48806 a!2804) j!70)))))

(declare-fun b!1518261 () Bool)

(assert (=> b!1518261 (= e!846990 (not e!846993))))

(declare-fun res!1038159 () Bool)

(assert (=> b!1518261 (=> res!1038159 e!846993)))

(assert (=> b!1518261 (= res!1038159 (or (not (= (select (arr!48806 a!2804) j!70) (select (store (arr!48806 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846991 () Bool)

(assert (=> b!1518261 e!846991))

(declare-fun res!1038164 () Bool)

(assert (=> b!1518261 (=> (not res!1038164) (not e!846991))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101138 (_ BitVec 32)) Bool)

(assert (=> b!1518261 (= res!1038164 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50822 0))(
  ( (Unit!50823) )
))
(declare-fun lt!658101 () Unit!50822)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101138 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50822)

(assert (=> b!1518261 (= lt!658101 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1518262 () Bool)

(declare-fun res!1038165 () Bool)

(assert (=> b!1518262 (=> (not res!1038165) (not e!846990))))

(declare-fun lt!658102 () SeekEntryResult!12977)

(assert (=> b!1518262 (= res!1038165 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48806 a!2804) j!70) a!2804 mask!2512) lt!658102))))

(declare-fun b!1518263 () Bool)

(assert (=> b!1518263 (= e!846989 true)))

(declare-fun lt!658099 () SeekEntryResult!12977)

(assert (=> b!1518263 (= lt!658099 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!658098 (select (arr!48806 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1518264 () Bool)

(declare-fun res!1038167 () Bool)

(assert (=> b!1518264 (=> (not res!1038167) (not e!846994))))

(assert (=> b!1518264 (= res!1038167 (validKeyInArray!0 (select (arr!48806 a!2804) i!961)))))

(declare-fun res!1038168 () Bool)

(assert (=> start!129282 (=> (not res!1038168) (not e!846994))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129282 (= res!1038168 (validMask!0 mask!2512))))

(assert (=> start!129282 e!846994))

(assert (=> start!129282 true))

(declare-fun array_inv!37834 (array!101138) Bool)

(assert (=> start!129282 (array_inv!37834 a!2804)))

(declare-fun b!1518257 () Bool)

(declare-fun res!1038169 () Bool)

(assert (=> b!1518257 (=> (not res!1038169) (not e!846994))))

(assert (=> b!1518257 (= res!1038169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1518265 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101138 (_ BitVec 32)) SeekEntryResult!12977)

(assert (=> b!1518265 (= e!846991 (= (seekEntry!0 (select (arr!48806 a!2804) j!70) a!2804 mask!2512) (Found!12977 j!70)))))

(declare-fun b!1518266 () Bool)

(assert (=> b!1518266 (= e!846994 e!846990)))

(declare-fun res!1038160 () Bool)

(assert (=> b!1518266 (=> (not res!1038160) (not e!846990))))

(assert (=> b!1518266 (= res!1038160 (= lt!658100 lt!658102))))

(assert (=> b!1518266 (= lt!658102 (Intermediate!12977 false resIndex!21 resX!21))))

(assert (=> b!1518266 (= lt!658100 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48806 a!2804) j!70) mask!2512) (select (arr!48806 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129282 res!1038168) b!1518256))

(assert (= (and b!1518256 res!1038161) b!1518264))

(assert (= (and b!1518264 res!1038167) b!1518260))

(assert (= (and b!1518260 res!1038166) b!1518257))

(assert (= (and b!1518257 res!1038169) b!1518254))

(assert (= (and b!1518254 res!1038158) b!1518259))

(assert (= (and b!1518259 res!1038162) b!1518266))

(assert (= (and b!1518266 res!1038160) b!1518262))

(assert (= (and b!1518262 res!1038165) b!1518258))

(assert (= (and b!1518258 res!1038163) b!1518261))

(assert (= (and b!1518261 res!1038164) b!1518265))

(assert (= (and b!1518261 (not res!1038159)) b!1518255))

(assert (= (and b!1518255 (not res!1038157)) b!1518263))

(declare-fun m!1401565 () Bool)

(assert (=> b!1518261 m!1401565))

(declare-fun m!1401567 () Bool)

(assert (=> b!1518261 m!1401567))

(declare-fun m!1401569 () Bool)

(assert (=> b!1518261 m!1401569))

(declare-fun m!1401571 () Bool)

(assert (=> b!1518261 m!1401571))

(declare-fun m!1401573 () Bool)

(assert (=> b!1518261 m!1401573))

(assert (=> b!1518260 m!1401565))

(assert (=> b!1518260 m!1401565))

(declare-fun m!1401575 () Bool)

(assert (=> b!1518260 m!1401575))

(declare-fun m!1401577 () Bool)

(assert (=> b!1518264 m!1401577))

(assert (=> b!1518264 m!1401577))

(declare-fun m!1401579 () Bool)

(assert (=> b!1518264 m!1401579))

(assert (=> b!1518263 m!1401565))

(assert (=> b!1518263 m!1401565))

(declare-fun m!1401581 () Bool)

(assert (=> b!1518263 m!1401581))

(assert (=> b!1518265 m!1401565))

(assert (=> b!1518265 m!1401565))

(declare-fun m!1401583 () Bool)

(assert (=> b!1518265 m!1401583))

(declare-fun m!1401585 () Bool)

(assert (=> b!1518257 m!1401585))

(declare-fun m!1401587 () Bool)

(assert (=> b!1518255 m!1401587))

(assert (=> b!1518266 m!1401565))

(assert (=> b!1518266 m!1401565))

(declare-fun m!1401589 () Bool)

(assert (=> b!1518266 m!1401589))

(assert (=> b!1518266 m!1401589))

(assert (=> b!1518266 m!1401565))

(declare-fun m!1401591 () Bool)

(assert (=> b!1518266 m!1401591))

(declare-fun m!1401593 () Bool)

(assert (=> start!129282 m!1401593))

(declare-fun m!1401595 () Bool)

(assert (=> start!129282 m!1401595))

(declare-fun m!1401597 () Bool)

(assert (=> b!1518254 m!1401597))

(assert (=> b!1518262 m!1401565))

(assert (=> b!1518262 m!1401565))

(declare-fun m!1401599 () Bool)

(assert (=> b!1518262 m!1401599))

(assert (=> b!1518258 m!1401569))

(assert (=> b!1518258 m!1401571))

(assert (=> b!1518258 m!1401571))

(declare-fun m!1401601 () Bool)

(assert (=> b!1518258 m!1401601))

(assert (=> b!1518258 m!1401601))

(assert (=> b!1518258 m!1401571))

(declare-fun m!1401603 () Bool)

(assert (=> b!1518258 m!1401603))

(push 1)

