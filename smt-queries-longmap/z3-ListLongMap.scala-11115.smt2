; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129744 () Bool)

(assert start!129744)

(declare-fun b!1523265 () Bool)

(declare-fun res!1042360 () Bool)

(declare-fun e!849193 () Bool)

(assert (=> b!1523265 (=> (not res!1042360) (not e!849193))))

(declare-datatypes ((SeekEntryResult!13089 0))(
  ( (MissingZero!13089 (index!54751 (_ BitVec 32))) (Found!13089 (index!54752 (_ BitVec 32))) (Intermediate!13089 (undefined!13901 Bool) (index!54753 (_ BitVec 32)) (x!136442 (_ BitVec 32))) (Undefined!13089) (MissingVacant!13089 (index!54754 (_ BitVec 32))) )
))
(declare-fun lt!659705 () SeekEntryResult!13089)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((array!101338 0))(
  ( (array!101339 (arr!48901 (Array (_ BitVec 32) (_ BitVec 64))) (size!49453 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101338)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101338 (_ BitVec 32)) SeekEntryResult!13089)

(assert (=> b!1523265 (= res!1042360 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48901 a!2804) j!70) a!2804 mask!2512) lt!659705))))

(declare-fun b!1523266 () Bool)

(declare-fun res!1042356 () Bool)

(declare-fun e!849190 () Bool)

(assert (=> b!1523266 (=> (not res!1042356) (not e!849190))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1523266 (= res!1042356 (and (= (size!49453 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49453 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49453 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1523267 () Bool)

(declare-fun res!1042359 () Bool)

(assert (=> b!1523267 (=> (not res!1042359) (not e!849190))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1523267 (= res!1042359 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49453 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49453 a!2804))))))

(declare-fun b!1523268 () Bool)

(declare-fun res!1042358 () Bool)

(assert (=> b!1523268 (=> (not res!1042358) (not e!849190))))

(declare-datatypes ((List!35462 0))(
  ( (Nil!35459) (Cons!35458 (h!36883 (_ BitVec 64)) (t!50148 List!35462)) )
))
(declare-fun arrayNoDuplicates!0 (array!101338 (_ BitVec 32) List!35462) Bool)

(assert (=> b!1523268 (= res!1042358 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35459))))

(declare-fun b!1523269 () Bool)

(assert (=> b!1523269 (= e!849193 (not true))))

(declare-fun e!849192 () Bool)

(assert (=> b!1523269 e!849192))

(declare-fun res!1042365 () Bool)

(assert (=> b!1523269 (=> (not res!1042365) (not e!849192))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101338 (_ BitVec 32)) Bool)

(assert (=> b!1523269 (= res!1042365 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50801 0))(
  ( (Unit!50802) )
))
(declare-fun lt!659704 () Unit!50801)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101338 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50801)

(assert (=> b!1523269 (= lt!659704 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1042362 () Bool)

(assert (=> start!129744 (=> (not res!1042362) (not e!849190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129744 (= res!1042362 (validMask!0 mask!2512))))

(assert (=> start!129744 e!849190))

(assert (=> start!129744 true))

(declare-fun array_inv!38134 (array!101338) Bool)

(assert (=> start!129744 (array_inv!38134 a!2804)))

(declare-fun b!1523270 () Bool)

(assert (=> b!1523270 (= e!849190 e!849193)))

(declare-fun res!1042361 () Bool)

(assert (=> b!1523270 (=> (not res!1042361) (not e!849193))))

(declare-fun lt!659706 () SeekEntryResult!13089)

(assert (=> b!1523270 (= res!1042361 (= lt!659706 lt!659705))))

(assert (=> b!1523270 (= lt!659705 (Intermediate!13089 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523270 (= lt!659706 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48901 a!2804) j!70) mask!2512) (select (arr!48901 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523271 () Bool)

(declare-fun res!1042364 () Bool)

(assert (=> b!1523271 (=> (not res!1042364) (not e!849193))))

(assert (=> b!1523271 (= res!1042364 (= lt!659706 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101339 (store (arr!48901 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49453 a!2804)) mask!2512)))))

(declare-fun b!1523272 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101338 (_ BitVec 32)) SeekEntryResult!13089)

(assert (=> b!1523272 (= e!849192 (= (seekEntry!0 (select (arr!48901 a!2804) j!70) a!2804 mask!2512) (Found!13089 j!70)))))

(declare-fun b!1523273 () Bool)

(declare-fun res!1042366 () Bool)

(assert (=> b!1523273 (=> (not res!1042366) (not e!849190))))

(assert (=> b!1523273 (= res!1042366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523274 () Bool)

(declare-fun res!1042357 () Bool)

(assert (=> b!1523274 (=> (not res!1042357) (not e!849190))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523274 (= res!1042357 (validKeyInArray!0 (select (arr!48901 a!2804) i!961)))))

(declare-fun b!1523275 () Bool)

(declare-fun res!1042363 () Bool)

(assert (=> b!1523275 (=> (not res!1042363) (not e!849190))))

(assert (=> b!1523275 (= res!1042363 (validKeyInArray!0 (select (arr!48901 a!2804) j!70)))))

(assert (= (and start!129744 res!1042362) b!1523266))

(assert (= (and b!1523266 res!1042356) b!1523274))

(assert (= (and b!1523274 res!1042357) b!1523275))

(assert (= (and b!1523275 res!1042363) b!1523273))

(assert (= (and b!1523273 res!1042366) b!1523268))

(assert (= (and b!1523268 res!1042358) b!1523267))

(assert (= (and b!1523267 res!1042359) b!1523270))

(assert (= (and b!1523270 res!1042361) b!1523265))

(assert (= (and b!1523265 res!1042360) b!1523271))

(assert (= (and b!1523271 res!1042364) b!1523269))

(assert (= (and b!1523269 res!1042365) b!1523272))

(declare-fun m!1405817 () Bool)

(assert (=> b!1523273 m!1405817))

(declare-fun m!1405819 () Bool)

(assert (=> b!1523265 m!1405819))

(assert (=> b!1523265 m!1405819))

(declare-fun m!1405821 () Bool)

(assert (=> b!1523265 m!1405821))

(declare-fun m!1405823 () Bool)

(assert (=> b!1523271 m!1405823))

(declare-fun m!1405825 () Bool)

(assert (=> b!1523271 m!1405825))

(assert (=> b!1523271 m!1405825))

(declare-fun m!1405827 () Bool)

(assert (=> b!1523271 m!1405827))

(assert (=> b!1523271 m!1405827))

(assert (=> b!1523271 m!1405825))

(declare-fun m!1405829 () Bool)

(assert (=> b!1523271 m!1405829))

(assert (=> b!1523270 m!1405819))

(assert (=> b!1523270 m!1405819))

(declare-fun m!1405831 () Bool)

(assert (=> b!1523270 m!1405831))

(assert (=> b!1523270 m!1405831))

(assert (=> b!1523270 m!1405819))

(declare-fun m!1405833 () Bool)

(assert (=> b!1523270 m!1405833))

(declare-fun m!1405835 () Bool)

(assert (=> b!1523274 m!1405835))

(assert (=> b!1523274 m!1405835))

(declare-fun m!1405837 () Bool)

(assert (=> b!1523274 m!1405837))

(declare-fun m!1405839 () Bool)

(assert (=> b!1523269 m!1405839))

(declare-fun m!1405841 () Bool)

(assert (=> b!1523269 m!1405841))

(assert (=> b!1523272 m!1405819))

(assert (=> b!1523272 m!1405819))

(declare-fun m!1405843 () Bool)

(assert (=> b!1523272 m!1405843))

(declare-fun m!1405845 () Bool)

(assert (=> start!129744 m!1405845))

(declare-fun m!1405847 () Bool)

(assert (=> start!129744 m!1405847))

(declare-fun m!1405849 () Bool)

(assert (=> b!1523268 m!1405849))

(assert (=> b!1523275 m!1405819))

(assert (=> b!1523275 m!1405819))

(declare-fun m!1405851 () Bool)

(assert (=> b!1523275 m!1405851))

(check-sat (not b!1523275) (not b!1523268) (not b!1523273) (not b!1523265) (not b!1523270) (not start!129744) (not b!1523271) (not b!1523274) (not b!1523269) (not b!1523272))
(check-sat)
