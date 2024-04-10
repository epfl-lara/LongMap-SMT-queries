; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130066 () Bool)

(assert start!130066)

(declare-fun e!850750 () Bool)

(declare-fun lt!661015 () (_ BitVec 64))

(declare-datatypes ((array!101479 0))(
  ( (array!101480 (arr!48966 (Array (_ BitVec 32) (_ BitVec 64))) (size!49516 (_ BitVec 32))) )
))
(declare-fun lt!661018 () array!101479)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun b!1526272 () Bool)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13131 0))(
  ( (MissingZero!13131 (index!54919 (_ BitVec 32))) (Found!13131 (index!54920 (_ BitVec 32))) (Intermediate!13131 (undefined!13943 Bool) (index!54921 (_ BitVec 32)) (x!136617 (_ BitVec 32))) (Undefined!13131) (MissingVacant!13131 (index!54922 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101479 (_ BitVec 32)) SeekEntryResult!13131)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101479 (_ BitVec 32)) SeekEntryResult!13131)

(assert (=> b!1526272 (= e!850750 (= (seekEntryOrOpen!0 lt!661015 lt!661018 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661015 lt!661018 mask!2512)))))

(declare-fun b!1526273 () Bool)

(declare-fun e!850747 () Bool)

(declare-fun e!850753 () Bool)

(assert (=> b!1526273 (= e!850747 e!850753)))

(declare-fun res!1044311 () Bool)

(assert (=> b!1526273 (=> (not res!1044311) (not e!850753))))

(declare-fun lt!661016 () SeekEntryResult!13131)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101479 (_ BitVec 32)) SeekEntryResult!13131)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526273 (= res!1044311 (= lt!661016 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661015 mask!2512) lt!661015 lt!661018 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun a!2804 () array!101479)

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1526273 (= lt!661015 (select (store (arr!48966 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526273 (= lt!661018 (array!101480 (store (arr!48966 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49516 a!2804)))))

(declare-fun b!1526274 () Bool)

(declare-fun e!850751 () Bool)

(assert (=> b!1526274 (= e!850751 e!850747)))

(declare-fun res!1044314 () Bool)

(assert (=> b!1526274 (=> (not res!1044314) (not e!850747))))

(declare-fun lt!661017 () SeekEntryResult!13131)

(assert (=> b!1526274 (= res!1044314 (= lt!661016 lt!661017))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1526274 (= lt!661017 (Intermediate!13131 false resIndex!21 resX!21))))

(assert (=> b!1526274 (= lt!661016 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48966 a!2804) j!70) mask!2512) (select (arr!48966 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526275 () Bool)

(declare-fun e!850749 () Bool)

(declare-fun e!850752 () Bool)

(assert (=> b!1526275 (= e!850749 e!850752)))

(declare-fun res!1044310 () Bool)

(assert (=> b!1526275 (=> res!1044310 e!850752)))

(assert (=> b!1526275 (= res!1044310 (or (not (= (select (arr!48966 a!2804) j!70) lt!661015)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48966 a!2804) index!487) (select (arr!48966 a!2804) j!70)) (not (= (select (arr!48966 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1526276 () Bool)

(declare-fun res!1044315 () Bool)

(assert (=> b!1526276 (=> (not res!1044315) (not e!850751))))

(assert (=> b!1526276 (= res!1044315 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49516 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49516 a!2804))))))

(declare-fun res!1044318 () Bool)

(assert (=> start!130066 (=> (not res!1044318) (not e!850751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130066 (= res!1044318 (validMask!0 mask!2512))))

(assert (=> start!130066 e!850751))

(assert (=> start!130066 true))

(declare-fun array_inv!37994 (array!101479) Bool)

(assert (=> start!130066 (array_inv!37994 a!2804)))

(declare-fun b!1526277 () Bool)

(assert (=> b!1526277 (= e!850753 (not true))))

(assert (=> b!1526277 e!850749))

(declare-fun res!1044306 () Bool)

(assert (=> b!1526277 (=> (not res!1044306) (not e!850749))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101479 (_ BitVec 32)) Bool)

(assert (=> b!1526277 (= res!1044306 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51046 0))(
  ( (Unit!51047) )
))
(declare-fun lt!661014 () Unit!51046)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101479 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51046)

(assert (=> b!1526277 (= lt!661014 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526278 () Bool)

(declare-fun res!1044316 () Bool)

(assert (=> b!1526278 (=> (not res!1044316) (not e!850751))))

(assert (=> b!1526278 (= res!1044316 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526279 () Bool)

(declare-fun res!1044307 () Bool)

(assert (=> b!1526279 (=> (not res!1044307) (not e!850749))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101479 (_ BitVec 32)) SeekEntryResult!13131)

(assert (=> b!1526279 (= res!1044307 (= (seekEntry!0 (select (arr!48966 a!2804) j!70) a!2804 mask!2512) (Found!13131 j!70)))))

(declare-fun b!1526280 () Bool)

(declare-fun res!1044313 () Bool)

(assert (=> b!1526280 (=> (not res!1044313) (not e!850751))))

(declare-datatypes ((List!35449 0))(
  ( (Nil!35446) (Cons!35445 (h!36878 (_ BitVec 64)) (t!50143 List!35449)) )
))
(declare-fun arrayNoDuplicates!0 (array!101479 (_ BitVec 32) List!35449) Bool)

(assert (=> b!1526280 (= res!1044313 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35446))))

(declare-fun b!1526281 () Bool)

(declare-fun res!1044319 () Bool)

(assert (=> b!1526281 (=> (not res!1044319) (not e!850751))))

(assert (=> b!1526281 (= res!1044319 (and (= (size!49516 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49516 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49516 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526282 () Bool)

(declare-fun res!1044309 () Bool)

(assert (=> b!1526282 (=> (not res!1044309) (not e!850751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526282 (= res!1044309 (validKeyInArray!0 (select (arr!48966 a!2804) j!70)))))

(declare-fun b!1526283 () Bool)

(declare-fun res!1044308 () Bool)

(assert (=> b!1526283 (=> (not res!1044308) (not e!850747))))

(assert (=> b!1526283 (= res!1044308 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48966 a!2804) j!70) a!2804 mask!2512) lt!661017))))

(declare-fun b!1526284 () Bool)

(declare-fun res!1044317 () Bool)

(assert (=> b!1526284 (=> (not res!1044317) (not e!850751))))

(assert (=> b!1526284 (= res!1044317 (validKeyInArray!0 (select (arr!48966 a!2804) i!961)))))

(declare-fun b!1526285 () Bool)

(assert (=> b!1526285 (= e!850752 e!850750)))

(declare-fun res!1044312 () Bool)

(assert (=> b!1526285 (=> (not res!1044312) (not e!850750))))

(assert (=> b!1526285 (= res!1044312 (= (seekEntryOrOpen!0 (select (arr!48966 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48966 a!2804) j!70) a!2804 mask!2512)))))

(assert (= (and start!130066 res!1044318) b!1526281))

(assert (= (and b!1526281 res!1044319) b!1526284))

(assert (= (and b!1526284 res!1044317) b!1526282))

(assert (= (and b!1526282 res!1044309) b!1526278))

(assert (= (and b!1526278 res!1044316) b!1526280))

(assert (= (and b!1526280 res!1044313) b!1526276))

(assert (= (and b!1526276 res!1044315) b!1526274))

(assert (= (and b!1526274 res!1044314) b!1526283))

(assert (= (and b!1526283 res!1044308) b!1526273))

(assert (= (and b!1526273 res!1044311) b!1526277))

(assert (= (and b!1526277 res!1044306) b!1526279))

(assert (= (and b!1526279 res!1044307) b!1526275))

(assert (= (and b!1526275 (not res!1044310)) b!1526285))

(assert (= (and b!1526285 res!1044312) b!1526272))

(declare-fun m!1409059 () Bool)

(assert (=> b!1526282 m!1409059))

(assert (=> b!1526282 m!1409059))

(declare-fun m!1409061 () Bool)

(assert (=> b!1526282 m!1409061))

(assert (=> b!1526274 m!1409059))

(assert (=> b!1526274 m!1409059))

(declare-fun m!1409063 () Bool)

(assert (=> b!1526274 m!1409063))

(assert (=> b!1526274 m!1409063))

(assert (=> b!1526274 m!1409059))

(declare-fun m!1409065 () Bool)

(assert (=> b!1526274 m!1409065))

(declare-fun m!1409067 () Bool)

(assert (=> b!1526280 m!1409067))

(assert (=> b!1526283 m!1409059))

(assert (=> b!1526283 m!1409059))

(declare-fun m!1409069 () Bool)

(assert (=> b!1526283 m!1409069))

(declare-fun m!1409071 () Bool)

(assert (=> b!1526272 m!1409071))

(declare-fun m!1409073 () Bool)

(assert (=> b!1526272 m!1409073))

(assert (=> b!1526279 m!1409059))

(assert (=> b!1526279 m!1409059))

(declare-fun m!1409075 () Bool)

(assert (=> b!1526279 m!1409075))

(declare-fun m!1409077 () Bool)

(assert (=> b!1526278 m!1409077))

(declare-fun m!1409079 () Bool)

(assert (=> b!1526277 m!1409079))

(declare-fun m!1409081 () Bool)

(assert (=> b!1526277 m!1409081))

(declare-fun m!1409083 () Bool)

(assert (=> b!1526284 m!1409083))

(assert (=> b!1526284 m!1409083))

(declare-fun m!1409085 () Bool)

(assert (=> b!1526284 m!1409085))

(assert (=> b!1526275 m!1409059))

(declare-fun m!1409087 () Bool)

(assert (=> b!1526275 m!1409087))

(assert (=> b!1526285 m!1409059))

(assert (=> b!1526285 m!1409059))

(declare-fun m!1409089 () Bool)

(assert (=> b!1526285 m!1409089))

(assert (=> b!1526285 m!1409059))

(declare-fun m!1409091 () Bool)

(assert (=> b!1526285 m!1409091))

(declare-fun m!1409093 () Bool)

(assert (=> start!130066 m!1409093))

(declare-fun m!1409095 () Bool)

(assert (=> start!130066 m!1409095))

(declare-fun m!1409097 () Bool)

(assert (=> b!1526273 m!1409097))

(assert (=> b!1526273 m!1409097))

(declare-fun m!1409099 () Bool)

(assert (=> b!1526273 m!1409099))

(declare-fun m!1409101 () Bool)

(assert (=> b!1526273 m!1409101))

(declare-fun m!1409103 () Bool)

(assert (=> b!1526273 m!1409103))

(check-sat (not b!1526279) (not b!1526282) (not b!1526274) (not b!1526280) (not b!1526273) (not b!1526277) (not b!1526285) (not start!130066) (not b!1526284) (not b!1526283) (not b!1526278) (not b!1526272))
(check-sat)
