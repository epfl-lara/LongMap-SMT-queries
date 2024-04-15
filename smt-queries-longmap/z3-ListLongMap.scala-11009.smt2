; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128834 () Bool)

(assert start!128834)

(declare-fun b!1510269 () Bool)

(declare-fun res!1030384 () Bool)

(declare-fun e!843307 () Bool)

(assert (=> b!1510269 (=> (not res!1030384) (not e!843307))))

(declare-datatypes ((array!100690 0))(
  ( (array!100691 (arr!48583 (Array (_ BitVec 32) (_ BitVec 64))) (size!49135 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100690)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510269 (= res!1030384 (validKeyInArray!0 (select (arr!48583 a!2804) i!961)))))

(declare-fun b!1510270 () Bool)

(declare-fun res!1030378 () Bool)

(declare-fun e!843309 () Bool)

(assert (=> b!1510270 (=> (not res!1030378) (not e!843309))))

(declare-datatypes ((SeekEntryResult!12777 0))(
  ( (MissingZero!12777 (index!53503 (_ BitVec 32))) (Found!12777 (index!53504 (_ BitVec 32))) (Intermediate!12777 (undefined!13589 Bool) (index!53505 (_ BitVec 32)) (x!135249 (_ BitVec 32))) (Undefined!12777) (MissingVacant!12777 (index!53506 (_ BitVec 32))) )
))
(declare-fun lt!654919 () SeekEntryResult!12777)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100690 (_ BitVec 32)) SeekEntryResult!12777)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510270 (= res!1030378 (= lt!654919 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48583 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48583 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100691 (store (arr!48583 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49135 a!2804)) mask!2512)))))

(declare-fun b!1510271 () Bool)

(declare-fun res!1030387 () Bool)

(assert (=> b!1510271 (=> (not res!1030387) (not e!843307))))

(assert (=> b!1510271 (= res!1030387 (validKeyInArray!0 (select (arr!48583 a!2804) j!70)))))

(declare-fun b!1510272 () Bool)

(assert (=> b!1510272 (= e!843307 e!843309)))

(declare-fun res!1030385 () Bool)

(assert (=> b!1510272 (=> (not res!1030385) (not e!843309))))

(declare-fun lt!654920 () SeekEntryResult!12777)

(assert (=> b!1510272 (= res!1030385 (= lt!654919 lt!654920))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510272 (= lt!654920 (Intermediate!12777 false resIndex!21 resX!21))))

(assert (=> b!1510272 (= lt!654919 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48583 a!2804) j!70) mask!2512) (select (arr!48583 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510273 () Bool)

(declare-fun e!843306 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100690 (_ BitVec 32)) SeekEntryResult!12777)

(assert (=> b!1510273 (= e!843306 (= (seekEntry!0 (select (arr!48583 a!2804) j!70) a!2804 mask!2512) (Found!12777 j!70)))))

(declare-fun b!1510274 () Bool)

(declare-fun res!1030386 () Bool)

(assert (=> b!1510274 (=> (not res!1030386) (not e!843307))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1510274 (= res!1030386 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49135 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49135 a!2804))))))

(declare-fun res!1030381 () Bool)

(assert (=> start!128834 (=> (not res!1030381) (not e!843307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128834 (= res!1030381 (validMask!0 mask!2512))))

(assert (=> start!128834 e!843307))

(assert (=> start!128834 true))

(declare-fun array_inv!37816 (array!100690) Bool)

(assert (=> start!128834 (array_inv!37816 a!2804)))

(declare-fun b!1510275 () Bool)

(declare-fun res!1030382 () Bool)

(assert (=> b!1510275 (=> (not res!1030382) (not e!843309))))

(assert (=> b!1510275 (= res!1030382 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48583 a!2804) j!70) a!2804 mask!2512) lt!654920))))

(declare-fun b!1510276 () Bool)

(declare-fun res!1030383 () Bool)

(assert (=> b!1510276 (=> (not res!1030383) (not e!843307))))

(assert (=> b!1510276 (= res!1030383 (and (= (size!49135 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49135 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49135 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510277 () Bool)

(declare-fun res!1030379 () Bool)

(assert (=> b!1510277 (=> (not res!1030379) (not e!843307))))

(declare-datatypes ((List!35144 0))(
  ( (Nil!35141) (Cons!35140 (h!36553 (_ BitVec 64)) (t!49830 List!35144)) )
))
(declare-fun arrayNoDuplicates!0 (array!100690 (_ BitVec 32) List!35144) Bool)

(assert (=> b!1510277 (= res!1030379 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35141))))

(declare-fun b!1510278 () Bool)

(declare-fun res!1030388 () Bool)

(assert (=> b!1510278 (=> (not res!1030388) (not e!843307))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100690 (_ BitVec 32)) Bool)

(assert (=> b!1510278 (= res!1030388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510279 () Bool)

(assert (=> b!1510279 (= e!843309 (not true))))

(assert (=> b!1510279 e!843306))

(declare-fun res!1030380 () Bool)

(assert (=> b!1510279 (=> (not res!1030380) (not e!843306))))

(assert (=> b!1510279 (= res!1030380 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50261 0))(
  ( (Unit!50262) )
))
(declare-fun lt!654921 () Unit!50261)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100690 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50261)

(assert (=> b!1510279 (= lt!654921 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!128834 res!1030381) b!1510276))

(assert (= (and b!1510276 res!1030383) b!1510269))

(assert (= (and b!1510269 res!1030384) b!1510271))

(assert (= (and b!1510271 res!1030387) b!1510278))

(assert (= (and b!1510278 res!1030388) b!1510277))

(assert (= (and b!1510277 res!1030379) b!1510274))

(assert (= (and b!1510274 res!1030386) b!1510272))

(assert (= (and b!1510272 res!1030385) b!1510275))

(assert (= (and b!1510275 res!1030382) b!1510270))

(assert (= (and b!1510270 res!1030378) b!1510279))

(assert (= (and b!1510279 res!1030380) b!1510273))

(declare-fun m!1392311 () Bool)

(assert (=> b!1510269 m!1392311))

(assert (=> b!1510269 m!1392311))

(declare-fun m!1392313 () Bool)

(assert (=> b!1510269 m!1392313))

(declare-fun m!1392315 () Bool)

(assert (=> b!1510278 m!1392315))

(declare-fun m!1392317 () Bool)

(assert (=> start!128834 m!1392317))

(declare-fun m!1392319 () Bool)

(assert (=> start!128834 m!1392319))

(declare-fun m!1392321 () Bool)

(assert (=> b!1510271 m!1392321))

(assert (=> b!1510271 m!1392321))

(declare-fun m!1392323 () Bool)

(assert (=> b!1510271 m!1392323))

(assert (=> b!1510273 m!1392321))

(assert (=> b!1510273 m!1392321))

(declare-fun m!1392325 () Bool)

(assert (=> b!1510273 m!1392325))

(declare-fun m!1392327 () Bool)

(assert (=> b!1510279 m!1392327))

(declare-fun m!1392329 () Bool)

(assert (=> b!1510279 m!1392329))

(assert (=> b!1510272 m!1392321))

(assert (=> b!1510272 m!1392321))

(declare-fun m!1392331 () Bool)

(assert (=> b!1510272 m!1392331))

(assert (=> b!1510272 m!1392331))

(assert (=> b!1510272 m!1392321))

(declare-fun m!1392333 () Bool)

(assert (=> b!1510272 m!1392333))

(declare-fun m!1392335 () Bool)

(assert (=> b!1510270 m!1392335))

(declare-fun m!1392337 () Bool)

(assert (=> b!1510270 m!1392337))

(assert (=> b!1510270 m!1392337))

(declare-fun m!1392339 () Bool)

(assert (=> b!1510270 m!1392339))

(assert (=> b!1510270 m!1392339))

(assert (=> b!1510270 m!1392337))

(declare-fun m!1392341 () Bool)

(assert (=> b!1510270 m!1392341))

(declare-fun m!1392343 () Bool)

(assert (=> b!1510277 m!1392343))

(assert (=> b!1510275 m!1392321))

(assert (=> b!1510275 m!1392321))

(declare-fun m!1392345 () Bool)

(assert (=> b!1510275 m!1392345))

(check-sat (not b!1510278) (not b!1510273) (not b!1510269) (not b!1510279) (not b!1510271) (not b!1510272) (not b!1510270) (not b!1510277) (not start!128834) (not b!1510275))
(check-sat)
