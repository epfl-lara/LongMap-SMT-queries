; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130368 () Bool)

(assert start!130368)

(declare-fun res!1047922 () Bool)

(declare-fun e!852787 () Bool)

(assert (=> start!130368 (=> (not res!1047922) (not e!852787))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130368 (= res!1047922 (validMask!0 mask!2512))))

(assert (=> start!130368 e!852787))

(assert (=> start!130368 true))

(declare-datatypes ((array!101661 0))(
  ( (array!101662 (arr!49054 (Array (_ BitVec 32) (_ BitVec 64))) (size!49604 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101661)

(declare-fun array_inv!38082 (array!101661) Bool)

(assert (=> start!130368 (array_inv!38082 a!2804)))

(declare-fun b!1530390 () Bool)

(declare-fun res!1047919 () Bool)

(assert (=> b!1530390 (=> (not res!1047919) (not e!852787))))

(declare-datatypes ((List!35537 0))(
  ( (Nil!35534) (Cons!35533 (h!36972 (_ BitVec 64)) (t!50231 List!35537)) )
))
(declare-fun arrayNoDuplicates!0 (array!101661 (_ BitVec 32) List!35537) Bool)

(assert (=> b!1530390 (= res!1047919 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35534))))

(declare-fun b!1530391 () Bool)

(declare-fun e!852786 () Bool)

(declare-fun e!852785 () Bool)

(assert (=> b!1530391 (= e!852786 (not e!852785))))

(declare-fun res!1047920 () Bool)

(assert (=> b!1530391 (=> res!1047920 e!852785)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1530391 (= res!1047920 (or (not (= (select (arr!49054 a!2804) j!70) (select (store (arr!49054 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852783 () Bool)

(assert (=> b!1530391 e!852783))

(declare-fun res!1047917 () Bool)

(assert (=> b!1530391 (=> (not res!1047917) (not e!852783))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101661 (_ BitVec 32)) Bool)

(assert (=> b!1530391 (= res!1047917 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51222 0))(
  ( (Unit!51223) )
))
(declare-fun lt!662802 () Unit!51222)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101661 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51222)

(assert (=> b!1530391 (= lt!662802 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1530392 () Bool)

(declare-datatypes ((SeekEntryResult!13219 0))(
  ( (MissingZero!13219 (index!55271 (_ BitVec 32))) (Found!13219 (index!55272 (_ BitVec 32))) (Intermediate!13219 (undefined!14031 Bool) (index!55273 (_ BitVec 32)) (x!136955 (_ BitVec 32))) (Undefined!13219) (MissingVacant!13219 (index!55274 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101661 (_ BitVec 32)) SeekEntryResult!13219)

(assert (=> b!1530392 (= e!852783 (= (seekEntry!0 (select (arr!49054 a!2804) j!70) a!2804 mask!2512) (Found!13219 j!70)))))

(declare-fun b!1530393 () Bool)

(declare-fun res!1047923 () Bool)

(assert (=> b!1530393 (=> (not res!1047923) (not e!852787))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1530393 (= res!1047923 (validKeyInArray!0 (select (arr!49054 a!2804) i!961)))))

(declare-fun b!1530394 () Bool)

(declare-fun res!1047915 () Bool)

(assert (=> b!1530394 (=> (not res!1047915) (not e!852787))))

(assert (=> b!1530394 (= res!1047915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1530395 () Bool)

(declare-fun res!1047916 () Bool)

(assert (=> b!1530395 (=> (not res!1047916) (not e!852787))))

(assert (=> b!1530395 (= res!1047916 (validKeyInArray!0 (select (arr!49054 a!2804) j!70)))))

(declare-fun b!1530396 () Bool)

(assert (=> b!1530396 (= e!852785 true)))

(declare-fun lt!662800 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530396 (= lt!662800 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1530397 () Bool)

(assert (=> b!1530397 (= e!852787 e!852786)))

(declare-fun res!1047918 () Bool)

(assert (=> b!1530397 (=> (not res!1047918) (not e!852786))))

(declare-fun lt!662803 () SeekEntryResult!13219)

(declare-fun lt!662801 () SeekEntryResult!13219)

(assert (=> b!1530397 (= res!1047918 (= lt!662803 lt!662801))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1530397 (= lt!662801 (Intermediate!13219 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101661 (_ BitVec 32)) SeekEntryResult!13219)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530397 (= lt!662803 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49054 a!2804) j!70) mask!2512) (select (arr!49054 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530398 () Bool)

(declare-fun res!1047925 () Bool)

(assert (=> b!1530398 (=> (not res!1047925) (not e!852786))))

(assert (=> b!1530398 (= res!1047925 (= lt!662803 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49054 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49054 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101662 (store (arr!49054 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49604 a!2804)) mask!2512)))))

(declare-fun b!1530399 () Bool)

(declare-fun res!1047914 () Bool)

(assert (=> b!1530399 (=> (not res!1047914) (not e!852787))))

(assert (=> b!1530399 (= res!1047914 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49604 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49604 a!2804))))))

(declare-fun b!1530400 () Bool)

(declare-fun res!1047924 () Bool)

(assert (=> b!1530400 (=> (not res!1047924) (not e!852786))))

(assert (=> b!1530400 (= res!1047924 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49054 a!2804) j!70) a!2804 mask!2512) lt!662801))))

(declare-fun b!1530401 () Bool)

(declare-fun res!1047921 () Bool)

(assert (=> b!1530401 (=> (not res!1047921) (not e!852787))))

(assert (=> b!1530401 (= res!1047921 (and (= (size!49604 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49604 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49604 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!130368 res!1047922) b!1530401))

(assert (= (and b!1530401 res!1047921) b!1530393))

(assert (= (and b!1530393 res!1047923) b!1530395))

(assert (= (and b!1530395 res!1047916) b!1530394))

(assert (= (and b!1530394 res!1047915) b!1530390))

(assert (= (and b!1530390 res!1047919) b!1530399))

(assert (= (and b!1530399 res!1047914) b!1530397))

(assert (= (and b!1530397 res!1047918) b!1530400))

(assert (= (and b!1530400 res!1047924) b!1530398))

(assert (= (and b!1530398 res!1047925) b!1530391))

(assert (= (and b!1530391 res!1047917) b!1530392))

(assert (= (and b!1530391 (not res!1047920)) b!1530396))

(declare-fun m!1413259 () Bool)

(assert (=> b!1530400 m!1413259))

(assert (=> b!1530400 m!1413259))

(declare-fun m!1413261 () Bool)

(assert (=> b!1530400 m!1413261))

(declare-fun m!1413263 () Bool)

(assert (=> b!1530396 m!1413263))

(assert (=> b!1530395 m!1413259))

(assert (=> b!1530395 m!1413259))

(declare-fun m!1413265 () Bool)

(assert (=> b!1530395 m!1413265))

(declare-fun m!1413267 () Bool)

(assert (=> start!130368 m!1413267))

(declare-fun m!1413269 () Bool)

(assert (=> start!130368 m!1413269))

(assert (=> b!1530397 m!1413259))

(assert (=> b!1530397 m!1413259))

(declare-fun m!1413271 () Bool)

(assert (=> b!1530397 m!1413271))

(assert (=> b!1530397 m!1413271))

(assert (=> b!1530397 m!1413259))

(declare-fun m!1413273 () Bool)

(assert (=> b!1530397 m!1413273))

(declare-fun m!1413275 () Bool)

(assert (=> b!1530398 m!1413275))

(declare-fun m!1413277 () Bool)

(assert (=> b!1530398 m!1413277))

(assert (=> b!1530398 m!1413277))

(declare-fun m!1413279 () Bool)

(assert (=> b!1530398 m!1413279))

(assert (=> b!1530398 m!1413279))

(assert (=> b!1530398 m!1413277))

(declare-fun m!1413281 () Bool)

(assert (=> b!1530398 m!1413281))

(declare-fun m!1413283 () Bool)

(assert (=> b!1530390 m!1413283))

(assert (=> b!1530391 m!1413259))

(declare-fun m!1413285 () Bool)

(assert (=> b!1530391 m!1413285))

(assert (=> b!1530391 m!1413275))

(assert (=> b!1530391 m!1413277))

(declare-fun m!1413287 () Bool)

(assert (=> b!1530391 m!1413287))

(assert (=> b!1530392 m!1413259))

(assert (=> b!1530392 m!1413259))

(declare-fun m!1413289 () Bool)

(assert (=> b!1530392 m!1413289))

(declare-fun m!1413291 () Bool)

(assert (=> b!1530394 m!1413291))

(declare-fun m!1413293 () Bool)

(assert (=> b!1530393 m!1413293))

(assert (=> b!1530393 m!1413293))

(declare-fun m!1413295 () Bool)

(assert (=> b!1530393 m!1413295))

(push 1)

