; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130062 () Bool)

(assert start!130062)

(declare-fun b!1526925 () Bool)

(declare-fun res!1045153 () Bool)

(declare-fun e!851033 () Bool)

(assert (=> b!1526925 (=> (not res!1045153) (not e!851033))))

(declare-datatypes ((array!101473 0))(
  ( (array!101474 (arr!48964 (Array (_ BitVec 32) (_ BitVec 64))) (size!49516 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101473)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101473 (_ BitVec 32)) Bool)

(assert (=> b!1526925 (= res!1045153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526926 () Bool)

(declare-fun e!851037 () Bool)

(assert (=> b!1526926 (= e!851033 e!851037)))

(declare-fun res!1045154 () Bool)

(assert (=> b!1526926 (=> (not res!1045154) (not e!851037))))

(declare-datatypes ((SeekEntryResult!13152 0))(
  ( (MissingZero!13152 (index!55003 (_ BitVec 32))) (Found!13152 (index!55004 (_ BitVec 32))) (Intermediate!13152 (undefined!13964 Bool) (index!55005 (_ BitVec 32)) (x!136697 (_ BitVec 32))) (Undefined!13152) (MissingVacant!13152 (index!55006 (_ BitVec 32))) )
))
(declare-fun lt!661076 () SeekEntryResult!13152)

(declare-fun lt!661077 () SeekEntryResult!13152)

(assert (=> b!1526926 (= res!1045154 (= lt!661076 lt!661077))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1526926 (= lt!661077 (Intermediate!13152 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101473 (_ BitVec 32)) SeekEntryResult!13152)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526926 (= lt!661076 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48964 a!2804) j!70) mask!2512) (select (arr!48964 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526927 () Bool)

(declare-fun res!1045144 () Bool)

(declare-fun e!851036 () Bool)

(assert (=> b!1526927 (=> (not res!1045144) (not e!851036))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101473 (_ BitVec 32)) SeekEntryResult!13152)

(assert (=> b!1526927 (= res!1045144 (= (seekEntry!0 (select (arr!48964 a!2804) j!70) a!2804 mask!2512) (Found!13152 j!70)))))

(declare-fun res!1045145 () Bool)

(assert (=> start!130062 (=> (not res!1045145) (not e!851033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130062 (= res!1045145 (validMask!0 mask!2512))))

(assert (=> start!130062 e!851033))

(assert (=> start!130062 true))

(declare-fun array_inv!38197 (array!101473) Bool)

(assert (=> start!130062 (array_inv!38197 a!2804)))

(declare-fun b!1526928 () Bool)

(declare-fun e!851034 () Bool)

(declare-fun e!851035 () Bool)

(assert (=> b!1526928 (= e!851034 e!851035)))

(declare-fun res!1045143 () Bool)

(assert (=> b!1526928 (=> (not res!1045143) (not e!851035))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101473 (_ BitVec 32)) SeekEntryResult!13152)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101473 (_ BitVec 32)) SeekEntryResult!13152)

(assert (=> b!1526928 (= res!1045143 (= (seekEntryOrOpen!0 (select (arr!48964 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48964 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1526929 () Bool)

(declare-fun e!851032 () Bool)

(assert (=> b!1526929 (= e!851032 (not true))))

(assert (=> b!1526929 e!851036))

(declare-fun res!1045152 () Bool)

(assert (=> b!1526929 (=> (not res!1045152) (not e!851036))))

(assert (=> b!1526929 (= res!1045152 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50927 0))(
  ( (Unit!50928) )
))
(declare-fun lt!661074 () Unit!50927)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101473 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50927)

(assert (=> b!1526929 (= lt!661074 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526930 () Bool)

(declare-fun res!1045149 () Bool)

(assert (=> b!1526930 (=> (not res!1045149) (not e!851033))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1526930 (= res!1045149 (and (= (size!49516 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49516 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49516 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526931 () Bool)

(declare-fun res!1045151 () Bool)

(assert (=> b!1526931 (=> (not res!1045151) (not e!851033))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526931 (= res!1045151 (validKeyInArray!0 (select (arr!48964 a!2804) j!70)))))

(declare-fun b!1526932 () Bool)

(declare-fun res!1045147 () Bool)

(assert (=> b!1526932 (=> (not res!1045147) (not e!851033))))

(assert (=> b!1526932 (= res!1045147 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49516 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49516 a!2804))))))

(declare-fun b!1526933 () Bool)

(declare-fun res!1045150 () Bool)

(assert (=> b!1526933 (=> (not res!1045150) (not e!851037))))

(assert (=> b!1526933 (= res!1045150 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48964 a!2804) j!70) a!2804 mask!2512) lt!661077))))

(declare-fun b!1526934 () Bool)

(declare-fun res!1045155 () Bool)

(assert (=> b!1526934 (=> (not res!1045155) (not e!851033))))

(assert (=> b!1526934 (= res!1045155 (validKeyInArray!0 (select (arr!48964 a!2804) i!961)))))

(declare-fun b!1526935 () Bool)

(assert (=> b!1526935 (= e!851036 e!851034)))

(declare-fun res!1045156 () Bool)

(assert (=> b!1526935 (=> res!1045156 e!851034)))

(declare-fun lt!661073 () (_ BitVec 64))

(assert (=> b!1526935 (= res!1045156 (or (not (= (select (arr!48964 a!2804) j!70) lt!661073)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48964 a!2804) index!487) (select (arr!48964 a!2804) j!70)) (not (= (select (arr!48964 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1526936 () Bool)

(assert (=> b!1526936 (= e!851037 e!851032)))

(declare-fun res!1045148 () Bool)

(assert (=> b!1526936 (=> (not res!1045148) (not e!851032))))

(declare-fun lt!661075 () array!101473)

(assert (=> b!1526936 (= res!1045148 (= lt!661076 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661073 mask!2512) lt!661073 lt!661075 mask!2512)))))

(assert (=> b!1526936 (= lt!661073 (select (store (arr!48964 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526936 (= lt!661075 (array!101474 (store (arr!48964 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49516 a!2804)))))

(declare-fun b!1526937 () Bool)

(assert (=> b!1526937 (= e!851035 (= (seekEntryOrOpen!0 lt!661073 lt!661075 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661073 lt!661075 mask!2512)))))

(declare-fun b!1526938 () Bool)

(declare-fun res!1045146 () Bool)

(assert (=> b!1526938 (=> (not res!1045146) (not e!851033))))

(declare-datatypes ((List!35525 0))(
  ( (Nil!35522) (Cons!35521 (h!36955 (_ BitVec 64)) (t!50211 List!35525)) )
))
(declare-fun arrayNoDuplicates!0 (array!101473 (_ BitVec 32) List!35525) Bool)

(assert (=> b!1526938 (= res!1045146 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35522))))

(assert (= (and start!130062 res!1045145) b!1526930))

(assert (= (and b!1526930 res!1045149) b!1526934))

(assert (= (and b!1526934 res!1045155) b!1526931))

(assert (= (and b!1526931 res!1045151) b!1526925))

(assert (= (and b!1526925 res!1045153) b!1526938))

(assert (= (and b!1526938 res!1045146) b!1526932))

(assert (= (and b!1526932 res!1045147) b!1526926))

(assert (= (and b!1526926 res!1045154) b!1526933))

(assert (= (and b!1526933 res!1045150) b!1526936))

(assert (= (and b!1526936 res!1045148) b!1526929))

(assert (= (and b!1526929 res!1045152) b!1526927))

(assert (= (and b!1526927 res!1045144) b!1526935))

(assert (= (and b!1526935 (not res!1045156)) b!1526928))

(assert (= (and b!1526928 res!1045143) b!1526937))

(declare-fun m!1409225 () Bool)

(assert (=> b!1526926 m!1409225))

(assert (=> b!1526926 m!1409225))

(declare-fun m!1409227 () Bool)

(assert (=> b!1526926 m!1409227))

(assert (=> b!1526926 m!1409227))

(assert (=> b!1526926 m!1409225))

(declare-fun m!1409229 () Bool)

(assert (=> b!1526926 m!1409229))

(declare-fun m!1409231 () Bool)

(assert (=> b!1526934 m!1409231))

(assert (=> b!1526934 m!1409231))

(declare-fun m!1409233 () Bool)

(assert (=> b!1526934 m!1409233))

(assert (=> b!1526935 m!1409225))

(declare-fun m!1409235 () Bool)

(assert (=> b!1526935 m!1409235))

(assert (=> b!1526928 m!1409225))

(assert (=> b!1526928 m!1409225))

(declare-fun m!1409237 () Bool)

(assert (=> b!1526928 m!1409237))

(assert (=> b!1526928 m!1409225))

(declare-fun m!1409239 () Bool)

(assert (=> b!1526928 m!1409239))

(declare-fun m!1409241 () Bool)

(assert (=> b!1526936 m!1409241))

(assert (=> b!1526936 m!1409241))

(declare-fun m!1409243 () Bool)

(assert (=> b!1526936 m!1409243))

(declare-fun m!1409245 () Bool)

(assert (=> b!1526936 m!1409245))

(declare-fun m!1409247 () Bool)

(assert (=> b!1526936 m!1409247))

(declare-fun m!1409249 () Bool)

(assert (=> b!1526929 m!1409249))

(declare-fun m!1409251 () Bool)

(assert (=> b!1526929 m!1409251))

(assert (=> b!1526927 m!1409225))

(assert (=> b!1526927 m!1409225))

(declare-fun m!1409253 () Bool)

(assert (=> b!1526927 m!1409253))

(declare-fun m!1409255 () Bool)

(assert (=> b!1526937 m!1409255))

(declare-fun m!1409257 () Bool)

(assert (=> b!1526937 m!1409257))

(assert (=> b!1526933 m!1409225))

(assert (=> b!1526933 m!1409225))

(declare-fun m!1409259 () Bool)

(assert (=> b!1526933 m!1409259))

(declare-fun m!1409261 () Bool)

(assert (=> b!1526925 m!1409261))

(declare-fun m!1409263 () Bool)

(assert (=> start!130062 m!1409263))

(declare-fun m!1409265 () Bool)

(assert (=> start!130062 m!1409265))

(declare-fun m!1409267 () Bool)

(assert (=> b!1526938 m!1409267))

(assert (=> b!1526931 m!1409225))

(assert (=> b!1526931 m!1409225))

(declare-fun m!1409269 () Bool)

(assert (=> b!1526931 m!1409269))

(check-sat (not b!1526933) (not b!1526928) (not b!1526925) (not b!1526937) (not start!130062) (not b!1526929) (not b!1526938) (not b!1526931) (not b!1526934) (not b!1526927) (not b!1526936) (not b!1526926))
(check-sat)
