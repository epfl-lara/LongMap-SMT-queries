; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130470 () Bool)

(assert start!130470)

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!101647 0))(
  ( (array!101648 (arr!49045 (Array (_ BitVec 32) (_ BitVec 64))) (size!49597 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101647)

(declare-fun b!1531266 () Bool)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun e!853211 () Bool)

(declare-datatypes ((SeekEntryResult!13233 0))(
  ( (MissingZero!13233 (index!55327 (_ BitVec 32))) (Found!13233 (index!55328 (_ BitVec 32))) (Intermediate!13233 (undefined!14045 Bool) (index!55329 (_ BitVec 32)) (x!137030 (_ BitVec 32))) (Undefined!13233) (MissingVacant!13233 (index!55330 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101647 (_ BitVec 32)) SeekEntryResult!13233)

(assert (=> b!1531266 (= e!853211 (= (seekEntry!0 (select (arr!49045 a!2804) j!70) a!2804 mask!2512) (Found!13233 j!70)))))

(declare-fun res!1048596 () Bool)

(declare-fun e!853208 () Bool)

(assert (=> start!130470 (=> (not res!1048596) (not e!853208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130470 (= res!1048596 (validMask!0 mask!2512))))

(assert (=> start!130470 e!853208))

(assert (=> start!130470 true))

(declare-fun array_inv!38278 (array!101647) Bool)

(assert (=> start!130470 (array_inv!38278 a!2804)))

(declare-fun b!1531267 () Bool)

(declare-fun res!1048601 () Bool)

(assert (=> b!1531267 (=> (not res!1048601) (not e!853208))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1531267 (= res!1048601 (and (= (size!49597 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49597 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49597 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531268 () Bool)

(declare-fun res!1048602 () Bool)

(assert (=> b!1531268 (=> (not res!1048602) (not e!853208))))

(declare-datatypes ((List!35606 0))(
  ( (Nil!35603) (Cons!35602 (h!37048 (_ BitVec 64)) (t!50292 List!35606)) )
))
(declare-fun arrayNoDuplicates!0 (array!101647 (_ BitVec 32) List!35606) Bool)

(assert (=> b!1531268 (= res!1048602 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35603))))

(declare-fun b!1531269 () Bool)

(declare-fun e!853213 () Bool)

(declare-fun e!853212 () Bool)

(assert (=> b!1531269 (= e!853213 e!853212)))

(declare-fun res!1048597 () Bool)

(assert (=> b!1531269 (=> res!1048597 e!853212)))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun lt!663011 () (_ BitVec 32))

(assert (=> b!1531269 (= res!1048597 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663011 #b00000000000000000000000000000000) (bvsge lt!663011 (size!49597 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531269 (= lt!663011 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1531270 () Bool)

(assert (=> b!1531270 (= e!853212 (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!534)) (bvsub #b01111111111111111111111111111110 x!534)))))

(declare-fun b!1531271 () Bool)

(declare-fun res!1048591 () Bool)

(declare-fun e!853210 () Bool)

(assert (=> b!1531271 (=> (not res!1048591) (not e!853210))))

(declare-fun lt!663010 () SeekEntryResult!13233)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101647 (_ BitVec 32)) SeekEntryResult!13233)

(assert (=> b!1531271 (= res!1048591 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49045 a!2804) j!70) a!2804 mask!2512) lt!663010))))

(declare-fun b!1531272 () Bool)

(assert (=> b!1531272 (= e!853208 e!853210)))

(declare-fun res!1048592 () Bool)

(assert (=> b!1531272 (=> (not res!1048592) (not e!853210))))

(declare-fun lt!663009 () SeekEntryResult!13233)

(assert (=> b!1531272 (= res!1048592 (= lt!663009 lt!663010))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1531272 (= lt!663010 (Intermediate!13233 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531272 (= lt!663009 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49045 a!2804) j!70) mask!2512) (select (arr!49045 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531273 () Bool)

(declare-fun res!1048600 () Bool)

(assert (=> b!1531273 (=> (not res!1048600) (not e!853208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101647 (_ BitVec 32)) Bool)

(assert (=> b!1531273 (= res!1048600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531274 () Bool)

(declare-fun res!1048598 () Bool)

(assert (=> b!1531274 (=> (not res!1048598) (not e!853210))))

(assert (=> b!1531274 (= res!1048598 (= lt!663009 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49045 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49045 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101648 (store (arr!49045 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49597 a!2804)) mask!2512)))))

(declare-fun b!1531275 () Bool)

(declare-fun res!1048590 () Bool)

(assert (=> b!1531275 (=> res!1048590 e!853212)))

(assert (=> b!1531275 (= res!1048590 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663011 (select (arr!49045 a!2804) j!70) a!2804 mask!2512) lt!663010)))))

(declare-fun b!1531276 () Bool)

(declare-fun res!1048595 () Bool)

(assert (=> b!1531276 (=> (not res!1048595) (not e!853208))))

(assert (=> b!1531276 (= res!1048595 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49597 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49597 a!2804))))))

(declare-fun b!1531277 () Bool)

(declare-fun res!1048594 () Bool)

(assert (=> b!1531277 (=> (not res!1048594) (not e!853208))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531277 (= res!1048594 (validKeyInArray!0 (select (arr!49045 a!2804) j!70)))))

(declare-fun b!1531278 () Bool)

(assert (=> b!1531278 (= e!853210 (not e!853213))))

(declare-fun res!1048603 () Bool)

(assert (=> b!1531278 (=> res!1048603 e!853213)))

(assert (=> b!1531278 (= res!1048603 (or (not (= (select (arr!49045 a!2804) j!70) (select (store (arr!49045 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1531278 e!853211))

(declare-fun res!1048599 () Bool)

(assert (=> b!1531278 (=> (not res!1048599) (not e!853211))))

(assert (=> b!1531278 (= res!1048599 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51089 0))(
  ( (Unit!51090) )
))
(declare-fun lt!663012 () Unit!51089)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101647 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51089)

(assert (=> b!1531278 (= lt!663012 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531279 () Bool)

(declare-fun res!1048593 () Bool)

(assert (=> b!1531279 (=> (not res!1048593) (not e!853208))))

(assert (=> b!1531279 (= res!1048593 (validKeyInArray!0 (select (arr!49045 a!2804) i!961)))))

(assert (= (and start!130470 res!1048596) b!1531267))

(assert (= (and b!1531267 res!1048601) b!1531279))

(assert (= (and b!1531279 res!1048593) b!1531277))

(assert (= (and b!1531277 res!1048594) b!1531273))

(assert (= (and b!1531273 res!1048600) b!1531268))

(assert (= (and b!1531268 res!1048602) b!1531276))

(assert (= (and b!1531276 res!1048595) b!1531272))

(assert (= (and b!1531272 res!1048592) b!1531271))

(assert (= (and b!1531271 res!1048591) b!1531274))

(assert (= (and b!1531274 res!1048598) b!1531278))

(assert (= (and b!1531278 res!1048599) b!1531266))

(assert (= (and b!1531278 (not res!1048603)) b!1531269))

(assert (= (and b!1531269 (not res!1048597)) b!1531275))

(assert (= (and b!1531275 (not res!1048590)) b!1531270))

(declare-fun m!1413347 () Bool)

(assert (=> b!1531277 m!1413347))

(assert (=> b!1531277 m!1413347))

(declare-fun m!1413349 () Bool)

(assert (=> b!1531277 m!1413349))

(declare-fun m!1413351 () Bool)

(assert (=> start!130470 m!1413351))

(declare-fun m!1413353 () Bool)

(assert (=> start!130470 m!1413353))

(assert (=> b!1531278 m!1413347))

(declare-fun m!1413355 () Bool)

(assert (=> b!1531278 m!1413355))

(declare-fun m!1413357 () Bool)

(assert (=> b!1531278 m!1413357))

(declare-fun m!1413359 () Bool)

(assert (=> b!1531278 m!1413359))

(declare-fun m!1413361 () Bool)

(assert (=> b!1531278 m!1413361))

(assert (=> b!1531266 m!1413347))

(assert (=> b!1531266 m!1413347))

(declare-fun m!1413363 () Bool)

(assert (=> b!1531266 m!1413363))

(assert (=> b!1531274 m!1413357))

(assert (=> b!1531274 m!1413359))

(assert (=> b!1531274 m!1413359))

(declare-fun m!1413365 () Bool)

(assert (=> b!1531274 m!1413365))

(assert (=> b!1531274 m!1413365))

(assert (=> b!1531274 m!1413359))

(declare-fun m!1413367 () Bool)

(assert (=> b!1531274 m!1413367))

(declare-fun m!1413369 () Bool)

(assert (=> b!1531273 m!1413369))

(declare-fun m!1413371 () Bool)

(assert (=> b!1531268 m!1413371))

(assert (=> b!1531271 m!1413347))

(assert (=> b!1531271 m!1413347))

(declare-fun m!1413373 () Bool)

(assert (=> b!1531271 m!1413373))

(declare-fun m!1413375 () Bool)

(assert (=> b!1531269 m!1413375))

(declare-fun m!1413377 () Bool)

(assert (=> b!1531279 m!1413377))

(assert (=> b!1531279 m!1413377))

(declare-fun m!1413379 () Bool)

(assert (=> b!1531279 m!1413379))

(assert (=> b!1531272 m!1413347))

(assert (=> b!1531272 m!1413347))

(declare-fun m!1413381 () Bool)

(assert (=> b!1531272 m!1413381))

(assert (=> b!1531272 m!1413381))

(assert (=> b!1531272 m!1413347))

(declare-fun m!1413383 () Bool)

(assert (=> b!1531272 m!1413383))

(assert (=> b!1531275 m!1413347))

(assert (=> b!1531275 m!1413347))

(declare-fun m!1413385 () Bool)

(assert (=> b!1531275 m!1413385))

(check-sat (not start!130470) (not b!1531274) (not b!1531273) (not b!1531279) (not b!1531275) (not b!1531272) (not b!1531266) (not b!1531278) (not b!1531269) (not b!1531277) (not b!1531268) (not b!1531271))
(check-sat)
