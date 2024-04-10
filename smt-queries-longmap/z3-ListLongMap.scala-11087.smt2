; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129438 () Bool)

(assert start!129438)

(declare-fun b!1520206 () Bool)

(declare-fun res!1039794 () Bool)

(declare-fun e!847987 () Bool)

(assert (=> b!1520206 (=> (not res!1039794) (not e!847987))))

(declare-datatypes ((array!101215 0))(
  ( (array!101216 (arr!48843 (Array (_ BitVec 32) (_ BitVec 64))) (size!49393 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101215)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1520206 (= res!1039794 (validKeyInArray!0 (select (arr!48843 a!2804) i!961)))))

(declare-fun res!1039802 () Bool)

(assert (=> start!129438 (=> (not res!1039802) (not e!847987))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129438 (= res!1039802 (validMask!0 mask!2512))))

(assert (=> start!129438 e!847987))

(assert (=> start!129438 true))

(declare-fun array_inv!37871 (array!101215) Bool)

(assert (=> start!129438 (array_inv!37871 a!2804)))

(declare-fun e!847985 () Bool)

(declare-fun b!1520207 () Bool)

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1520207 (= e!847985 (not (or (not (= (select (arr!48843 a!2804) j!70) (select (store (arr!48843 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (not (= (select (arr!48843 a!2804) index!487) (select (arr!48843 a!2804) j!70))) (= j!70 index!487))))))

(declare-fun e!847986 () Bool)

(assert (=> b!1520207 e!847986))

(declare-fun res!1039796 () Bool)

(assert (=> b!1520207 (=> (not res!1039796) (not e!847986))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101215 (_ BitVec 32)) Bool)

(assert (=> b!1520207 (= res!1039796 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50896 0))(
  ( (Unit!50897) )
))
(declare-fun lt!658970 () Unit!50896)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101215 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50896)

(assert (=> b!1520207 (= lt!658970 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1520208 () Bool)

(declare-fun res!1039798 () Bool)

(assert (=> b!1520208 (=> (not res!1039798) (not e!847985))))

(declare-datatypes ((SeekEntryResult!13014 0))(
  ( (MissingZero!13014 (index!54451 (_ BitVec 32))) (Found!13014 (index!54452 (_ BitVec 32))) (Intermediate!13014 (undefined!13826 Bool) (index!54453 (_ BitVec 32)) (x!136126 (_ BitVec 32))) (Undefined!13014) (MissingVacant!13014 (index!54454 (_ BitVec 32))) )
))
(declare-fun lt!658971 () SeekEntryResult!13014)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101215 (_ BitVec 32)) SeekEntryResult!13014)

(assert (=> b!1520208 (= res!1039798 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48843 a!2804) j!70) a!2804 mask!2512) lt!658971))))

(declare-fun b!1520209 () Bool)

(declare-fun res!1039799 () Bool)

(assert (=> b!1520209 (=> (not res!1039799) (not e!847987))))

(assert (=> b!1520209 (= res!1039799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1520210 () Bool)

(declare-fun res!1039801 () Bool)

(assert (=> b!1520210 (=> (not res!1039801) (not e!847987))))

(assert (=> b!1520210 (= res!1039801 (validKeyInArray!0 (select (arr!48843 a!2804) j!70)))))

(declare-fun b!1520211 () Bool)

(declare-fun res!1039803 () Bool)

(assert (=> b!1520211 (=> (not res!1039803) (not e!847987))))

(assert (=> b!1520211 (= res!1039803 (and (= (size!49393 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49393 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49393 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1520212 () Bool)

(declare-fun res!1039800 () Bool)

(assert (=> b!1520212 (=> (not res!1039800) (not e!847985))))

(declare-fun lt!658972 () SeekEntryResult!13014)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520212 (= res!1039800 (= lt!658972 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48843 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48843 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101216 (store (arr!48843 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49393 a!2804)) mask!2512)))))

(declare-fun b!1520213 () Bool)

(declare-fun res!1039797 () Bool)

(assert (=> b!1520213 (=> (not res!1039797) (not e!847987))))

(declare-datatypes ((List!35326 0))(
  ( (Nil!35323) (Cons!35322 (h!36737 (_ BitVec 64)) (t!50020 List!35326)) )
))
(declare-fun arrayNoDuplicates!0 (array!101215 (_ BitVec 32) List!35326) Bool)

(assert (=> b!1520213 (= res!1039797 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35323))))

(declare-fun b!1520214 () Bool)

(declare-fun res!1039795 () Bool)

(assert (=> b!1520214 (=> (not res!1039795) (not e!847987))))

(assert (=> b!1520214 (= res!1039795 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49393 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49393 a!2804))))))

(declare-fun b!1520215 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101215 (_ BitVec 32)) SeekEntryResult!13014)

(assert (=> b!1520215 (= e!847986 (= (seekEntry!0 (select (arr!48843 a!2804) j!70) a!2804 mask!2512) (Found!13014 j!70)))))

(declare-fun b!1520216 () Bool)

(assert (=> b!1520216 (= e!847987 e!847985)))

(declare-fun res!1039804 () Bool)

(assert (=> b!1520216 (=> (not res!1039804) (not e!847985))))

(assert (=> b!1520216 (= res!1039804 (= lt!658972 lt!658971))))

(assert (=> b!1520216 (= lt!658971 (Intermediate!13014 false resIndex!21 resX!21))))

(assert (=> b!1520216 (= lt!658972 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48843 a!2804) j!70) mask!2512) (select (arr!48843 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!129438 res!1039802) b!1520211))

(assert (= (and b!1520211 res!1039803) b!1520206))

(assert (= (and b!1520206 res!1039794) b!1520210))

(assert (= (and b!1520210 res!1039801) b!1520209))

(assert (= (and b!1520209 res!1039799) b!1520213))

(assert (= (and b!1520213 res!1039797) b!1520214))

(assert (= (and b!1520214 res!1039795) b!1520216))

(assert (= (and b!1520216 res!1039804) b!1520208))

(assert (= (and b!1520208 res!1039798) b!1520212))

(assert (= (and b!1520212 res!1039800) b!1520207))

(assert (= (and b!1520207 res!1039796) b!1520215))

(declare-fun m!1403545 () Bool)

(assert (=> b!1520209 m!1403545))

(declare-fun m!1403547 () Bool)

(assert (=> b!1520207 m!1403547))

(declare-fun m!1403549 () Bool)

(assert (=> b!1520207 m!1403549))

(declare-fun m!1403551 () Bool)

(assert (=> b!1520207 m!1403551))

(declare-fun m!1403553 () Bool)

(assert (=> b!1520207 m!1403553))

(declare-fun m!1403555 () Bool)

(assert (=> b!1520207 m!1403555))

(declare-fun m!1403557 () Bool)

(assert (=> b!1520207 m!1403557))

(declare-fun m!1403559 () Bool)

(assert (=> start!129438 m!1403559))

(declare-fun m!1403561 () Bool)

(assert (=> start!129438 m!1403561))

(assert (=> b!1520208 m!1403547))

(assert (=> b!1520208 m!1403547))

(declare-fun m!1403563 () Bool)

(assert (=> b!1520208 m!1403563))

(declare-fun m!1403565 () Bool)

(assert (=> b!1520206 m!1403565))

(assert (=> b!1520206 m!1403565))

(declare-fun m!1403567 () Bool)

(assert (=> b!1520206 m!1403567))

(assert (=> b!1520215 m!1403547))

(assert (=> b!1520215 m!1403547))

(declare-fun m!1403569 () Bool)

(assert (=> b!1520215 m!1403569))

(assert (=> b!1520210 m!1403547))

(assert (=> b!1520210 m!1403547))

(declare-fun m!1403571 () Bool)

(assert (=> b!1520210 m!1403571))

(assert (=> b!1520216 m!1403547))

(assert (=> b!1520216 m!1403547))

(declare-fun m!1403573 () Bool)

(assert (=> b!1520216 m!1403573))

(assert (=> b!1520216 m!1403573))

(assert (=> b!1520216 m!1403547))

(declare-fun m!1403575 () Bool)

(assert (=> b!1520216 m!1403575))

(assert (=> b!1520212 m!1403551))

(assert (=> b!1520212 m!1403555))

(assert (=> b!1520212 m!1403555))

(declare-fun m!1403577 () Bool)

(assert (=> b!1520212 m!1403577))

(assert (=> b!1520212 m!1403577))

(assert (=> b!1520212 m!1403555))

(declare-fun m!1403579 () Bool)

(assert (=> b!1520212 m!1403579))

(declare-fun m!1403581 () Bool)

(assert (=> b!1520213 m!1403581))

(check-sat (not start!129438) (not b!1520207) (not b!1520206) (not b!1520208) (not b!1520215) (not b!1520212) (not b!1520213) (not b!1520210) (not b!1520216) (not b!1520209))
(check-sat)
(get-model)

(declare-fun b!1520268 () Bool)

(declare-fun e!848012 () SeekEntryResult!13014)

(assert (=> b!1520268 (= e!848012 (Intermediate!13014 true index!487 x!534))))

(declare-fun b!1520269 () Bool)

(declare-fun lt!658987 () SeekEntryResult!13014)

(assert (=> b!1520269 (and (bvsge (index!54453 lt!658987) #b00000000000000000000000000000000) (bvslt (index!54453 lt!658987) (size!49393 a!2804)))))

(declare-fun e!848010 () Bool)

(assert (=> b!1520269 (= e!848010 (= (select (arr!48843 a!2804) (index!54453 lt!658987)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1520270 () Bool)

(declare-fun e!848011 () Bool)

(declare-fun e!848013 () Bool)

(assert (=> b!1520270 (= e!848011 e!848013)))

(declare-fun res!1039846 () Bool)

(get-info :version)

(assert (=> b!1520270 (= res!1039846 (and ((_ is Intermediate!13014) lt!658987) (not (undefined!13826 lt!658987)) (bvslt (x!136126 lt!658987) #b01111111111111111111111111111110) (bvsge (x!136126 lt!658987) #b00000000000000000000000000000000) (bvsge (x!136126 lt!658987) x!534)))))

(assert (=> b!1520270 (=> (not res!1039846) (not e!848013))))

(declare-fun b!1520271 () Bool)

(declare-fun e!848014 () SeekEntryResult!13014)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520271 (= e!848014 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48843 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520272 () Bool)

(assert (=> b!1520272 (= e!848012 e!848014)))

(declare-fun lt!658986 () (_ BitVec 64))

(declare-fun c!139756 () Bool)

(assert (=> b!1520272 (= c!139756 (or (= lt!658986 (select (arr!48843 a!2804) j!70)) (= (bvadd lt!658986 lt!658986) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1520273 () Bool)

(assert (=> b!1520273 (and (bvsge (index!54453 lt!658987) #b00000000000000000000000000000000) (bvslt (index!54453 lt!658987) (size!49393 a!2804)))))

(declare-fun res!1039844 () Bool)

(assert (=> b!1520273 (= res!1039844 (= (select (arr!48843 a!2804) (index!54453 lt!658987)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1520273 (=> res!1039844 e!848010)))

(declare-fun b!1520274 () Bool)

(assert (=> b!1520274 (= e!848014 (Intermediate!13014 false index!487 x!534))))

(declare-fun b!1520275 () Bool)

(assert (=> b!1520275 (and (bvsge (index!54453 lt!658987) #b00000000000000000000000000000000) (bvslt (index!54453 lt!658987) (size!49393 a!2804)))))

(declare-fun res!1039845 () Bool)

(assert (=> b!1520275 (= res!1039845 (= (select (arr!48843 a!2804) (index!54453 lt!658987)) (select (arr!48843 a!2804) j!70)))))

(assert (=> b!1520275 (=> res!1039845 e!848010)))

(assert (=> b!1520275 (= e!848013 e!848010)))

(declare-fun b!1520276 () Bool)

(assert (=> b!1520276 (= e!848011 (bvsge (x!136126 lt!658987) #b01111111111111111111111111111110))))

(declare-fun d!158863 () Bool)

(assert (=> d!158863 e!848011))

(declare-fun c!139757 () Bool)

(assert (=> d!158863 (= c!139757 (and ((_ is Intermediate!13014) lt!658987) (undefined!13826 lt!658987)))))

(assert (=> d!158863 (= lt!658987 e!848012)))

(declare-fun c!139755 () Bool)

(assert (=> d!158863 (= c!139755 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!158863 (= lt!658986 (select (arr!48843 a!2804) index!487))))

(assert (=> d!158863 (validMask!0 mask!2512)))

(assert (=> d!158863 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48843 a!2804) j!70) a!2804 mask!2512) lt!658987)))

(assert (= (and d!158863 c!139755) b!1520268))

(assert (= (and d!158863 (not c!139755)) b!1520272))

(assert (= (and b!1520272 c!139756) b!1520274))

(assert (= (and b!1520272 (not c!139756)) b!1520271))

(assert (= (and d!158863 c!139757) b!1520276))

(assert (= (and d!158863 (not c!139757)) b!1520270))

(assert (= (and b!1520270 res!1039846) b!1520275))

(assert (= (and b!1520275 (not res!1039845)) b!1520273))

(assert (= (and b!1520273 (not res!1039844)) b!1520269))

(declare-fun m!1403621 () Bool)

(assert (=> b!1520275 m!1403621))

(assert (=> b!1520273 m!1403621))

(assert (=> d!158863 m!1403553))

(assert (=> d!158863 m!1403559))

(declare-fun m!1403623 () Bool)

(assert (=> b!1520271 m!1403623))

(assert (=> b!1520271 m!1403623))

(assert (=> b!1520271 m!1403547))

(declare-fun m!1403625 () Bool)

(assert (=> b!1520271 m!1403625))

(assert (=> b!1520269 m!1403621))

(assert (=> b!1520208 d!158863))

(declare-fun b!1520287 () Bool)

(declare-fun e!848025 () Bool)

(declare-fun contains!9979 (List!35326 (_ BitVec 64)) Bool)

(assert (=> b!1520287 (= e!848025 (contains!9979 Nil!35323 (select (arr!48843 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1520288 () Bool)

(declare-fun e!848023 () Bool)

(declare-fun call!68340 () Bool)

(assert (=> b!1520288 (= e!848023 call!68340)))

(declare-fun b!1520289 () Bool)

(declare-fun e!848026 () Bool)

(assert (=> b!1520289 (= e!848026 e!848023)))

(declare-fun c!139760 () Bool)

(assert (=> b!1520289 (= c!139760 (validKeyInArray!0 (select (arr!48843 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68337 () Bool)

(assert (=> bm!68337 (= call!68340 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139760 (Cons!35322 (select (arr!48843 a!2804) #b00000000000000000000000000000000) Nil!35323) Nil!35323)))))

(declare-fun d!158865 () Bool)

(declare-fun res!1039855 () Bool)

(declare-fun e!848024 () Bool)

(assert (=> d!158865 (=> res!1039855 e!848024)))

(assert (=> d!158865 (= res!1039855 (bvsge #b00000000000000000000000000000000 (size!49393 a!2804)))))

(assert (=> d!158865 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35323) e!848024)))

(declare-fun b!1520290 () Bool)

(assert (=> b!1520290 (= e!848024 e!848026)))

(declare-fun res!1039854 () Bool)

(assert (=> b!1520290 (=> (not res!1039854) (not e!848026))))

(assert (=> b!1520290 (= res!1039854 (not e!848025))))

(declare-fun res!1039853 () Bool)

(assert (=> b!1520290 (=> (not res!1039853) (not e!848025))))

(assert (=> b!1520290 (= res!1039853 (validKeyInArray!0 (select (arr!48843 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1520291 () Bool)

(assert (=> b!1520291 (= e!848023 call!68340)))

(assert (= (and d!158865 (not res!1039855)) b!1520290))

(assert (= (and b!1520290 res!1039853) b!1520287))

(assert (= (and b!1520290 res!1039854) b!1520289))

(assert (= (and b!1520289 c!139760) b!1520288))

(assert (= (and b!1520289 (not c!139760)) b!1520291))

(assert (= (or b!1520288 b!1520291) bm!68337))

(declare-fun m!1403627 () Bool)

(assert (=> b!1520287 m!1403627))

(assert (=> b!1520287 m!1403627))

(declare-fun m!1403629 () Bool)

(assert (=> b!1520287 m!1403629))

(assert (=> b!1520289 m!1403627))

(assert (=> b!1520289 m!1403627))

(declare-fun m!1403631 () Bool)

(assert (=> b!1520289 m!1403631))

(assert (=> bm!68337 m!1403627))

(declare-fun m!1403633 () Bool)

(assert (=> bm!68337 m!1403633))

(assert (=> b!1520290 m!1403627))

(assert (=> b!1520290 m!1403627))

(assert (=> b!1520290 m!1403631))

(assert (=> b!1520213 d!158865))

(declare-fun call!68346 () Bool)

(declare-fun bm!68343 () Bool)

(assert (=> bm!68343 (= call!68346 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1520315 () Bool)

(declare-fun e!848045 () Bool)

(assert (=> b!1520315 (= e!848045 call!68346)))

(declare-fun b!1520316 () Bool)

(declare-fun e!848046 () Bool)

(assert (=> b!1520316 (= e!848046 call!68346)))

(declare-fun b!1520317 () Bool)

(assert (=> b!1520317 (= e!848045 e!848046)))

(declare-fun lt!658996 () (_ BitVec 64))

(assert (=> b!1520317 (= lt!658996 (select (arr!48843 a!2804) j!70))))

(declare-fun lt!658994 () Unit!50896)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101215 (_ BitVec 64) (_ BitVec 32)) Unit!50896)

(assert (=> b!1520317 (= lt!658994 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!658996 j!70))))

(declare-fun arrayContainsKey!0 (array!101215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1520317 (arrayContainsKey!0 a!2804 lt!658996 #b00000000000000000000000000000000)))

(declare-fun lt!658995 () Unit!50896)

(assert (=> b!1520317 (= lt!658995 lt!658994)))

(declare-fun res!1039869 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101215 (_ BitVec 32)) SeekEntryResult!13014)

(assert (=> b!1520317 (= res!1039869 (= (seekEntryOrOpen!0 (select (arr!48843 a!2804) j!70) a!2804 mask!2512) (Found!13014 j!70)))))

(assert (=> b!1520317 (=> (not res!1039869) (not e!848046))))

(declare-fun b!1520318 () Bool)

(declare-fun e!848047 () Bool)

(assert (=> b!1520318 (= e!848047 e!848045)))

(declare-fun c!139766 () Bool)

(assert (=> b!1520318 (= c!139766 (validKeyInArray!0 (select (arr!48843 a!2804) j!70)))))

(declare-fun d!158869 () Bool)

(declare-fun res!1039870 () Bool)

(assert (=> d!158869 (=> res!1039870 e!848047)))

(assert (=> d!158869 (= res!1039870 (bvsge j!70 (size!49393 a!2804)))))

(assert (=> d!158869 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!848047)))

(assert (= (and d!158869 (not res!1039870)) b!1520318))

(assert (= (and b!1520318 c!139766) b!1520317))

(assert (= (and b!1520318 (not c!139766)) b!1520315))

(assert (= (and b!1520317 res!1039869) b!1520316))

(assert (= (or b!1520316 b!1520315) bm!68343))

(declare-fun m!1403643 () Bool)

(assert (=> bm!68343 m!1403643))

(assert (=> b!1520317 m!1403547))

(declare-fun m!1403645 () Bool)

(assert (=> b!1520317 m!1403645))

(declare-fun m!1403647 () Bool)

(assert (=> b!1520317 m!1403647))

(assert (=> b!1520317 m!1403547))

(declare-fun m!1403649 () Bool)

(assert (=> b!1520317 m!1403649))

(assert (=> b!1520318 m!1403547))

(assert (=> b!1520318 m!1403547))

(assert (=> b!1520318 m!1403571))

(assert (=> b!1520207 d!158869))

(declare-fun d!158879 () Bool)

(assert (=> d!158879 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!658999 () Unit!50896)

(declare-fun choose!38 (array!101215 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50896)

(assert (=> d!158879 (= lt!658999 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!158879 (validMask!0 mask!2512)))

(assert (=> d!158879 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!658999)))

(declare-fun bs!43633 () Bool)

(assert (= bs!43633 d!158879))

(assert (=> bs!43633 m!1403557))

(declare-fun m!1403651 () Bool)

(assert (=> bs!43633 m!1403651))

(assert (=> bs!43633 m!1403559))

(assert (=> b!1520207 d!158879))

(declare-fun b!1520319 () Bool)

(declare-fun e!848050 () SeekEntryResult!13014)

(assert (=> b!1520319 (= e!848050 (Intermediate!13014 true (toIndex!0 (select (store (arr!48843 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1520320 () Bool)

(declare-fun lt!659001 () SeekEntryResult!13014)

(assert (=> b!1520320 (and (bvsge (index!54453 lt!659001) #b00000000000000000000000000000000) (bvslt (index!54453 lt!659001) (size!49393 (array!101216 (store (arr!48843 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49393 a!2804)))))))

(declare-fun e!848048 () Bool)

(assert (=> b!1520320 (= e!848048 (= (select (arr!48843 (array!101216 (store (arr!48843 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49393 a!2804))) (index!54453 lt!659001)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1520321 () Bool)

(declare-fun e!848049 () Bool)

(declare-fun e!848051 () Bool)

(assert (=> b!1520321 (= e!848049 e!848051)))

(declare-fun res!1039873 () Bool)

(assert (=> b!1520321 (= res!1039873 (and ((_ is Intermediate!13014) lt!659001) (not (undefined!13826 lt!659001)) (bvslt (x!136126 lt!659001) #b01111111111111111111111111111110) (bvsge (x!136126 lt!659001) #b00000000000000000000000000000000) (bvsge (x!136126 lt!659001) #b00000000000000000000000000000000)))))

(assert (=> b!1520321 (=> (not res!1039873) (not e!848051))))

(declare-fun b!1520322 () Bool)

(declare-fun e!848052 () SeekEntryResult!13014)

(assert (=> b!1520322 (= e!848052 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48843 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!48843 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101216 (store (arr!48843 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49393 a!2804)) mask!2512))))

(declare-fun b!1520323 () Bool)

(assert (=> b!1520323 (= e!848050 e!848052)))

(declare-fun c!139768 () Bool)

(declare-fun lt!659000 () (_ BitVec 64))

(assert (=> b!1520323 (= c!139768 (or (= lt!659000 (select (store (arr!48843 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!659000 lt!659000) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1520324 () Bool)

(assert (=> b!1520324 (and (bvsge (index!54453 lt!659001) #b00000000000000000000000000000000) (bvslt (index!54453 lt!659001) (size!49393 (array!101216 (store (arr!48843 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49393 a!2804)))))))

(declare-fun res!1039871 () Bool)

(assert (=> b!1520324 (= res!1039871 (= (select (arr!48843 (array!101216 (store (arr!48843 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49393 a!2804))) (index!54453 lt!659001)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1520324 (=> res!1039871 e!848048)))

(declare-fun b!1520325 () Bool)

(assert (=> b!1520325 (= e!848052 (Intermediate!13014 false (toIndex!0 (select (store (arr!48843 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1520326 () Bool)

(assert (=> b!1520326 (and (bvsge (index!54453 lt!659001) #b00000000000000000000000000000000) (bvslt (index!54453 lt!659001) (size!49393 (array!101216 (store (arr!48843 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49393 a!2804)))))))

(declare-fun res!1039872 () Bool)

(assert (=> b!1520326 (= res!1039872 (= (select (arr!48843 (array!101216 (store (arr!48843 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49393 a!2804))) (index!54453 lt!659001)) (select (store (arr!48843 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1520326 (=> res!1039872 e!848048)))

(assert (=> b!1520326 (= e!848051 e!848048)))

(declare-fun b!1520327 () Bool)

(assert (=> b!1520327 (= e!848049 (bvsge (x!136126 lt!659001) #b01111111111111111111111111111110))))

(declare-fun d!158881 () Bool)

(assert (=> d!158881 e!848049))

(declare-fun c!139769 () Bool)

(assert (=> d!158881 (= c!139769 (and ((_ is Intermediate!13014) lt!659001) (undefined!13826 lt!659001)))))

(assert (=> d!158881 (= lt!659001 e!848050)))

(declare-fun c!139767 () Bool)

(assert (=> d!158881 (= c!139767 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!158881 (= lt!659000 (select (arr!48843 (array!101216 (store (arr!48843 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49393 a!2804))) (toIndex!0 (select (store (arr!48843 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!158881 (validMask!0 mask!2512)))

(assert (=> d!158881 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48843 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48843 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101216 (store (arr!48843 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49393 a!2804)) mask!2512) lt!659001)))

(assert (= (and d!158881 c!139767) b!1520319))

(assert (= (and d!158881 (not c!139767)) b!1520323))

(assert (= (and b!1520323 c!139768) b!1520325))

(assert (= (and b!1520323 (not c!139768)) b!1520322))

(assert (= (and d!158881 c!139769) b!1520327))

(assert (= (and d!158881 (not c!139769)) b!1520321))

(assert (= (and b!1520321 res!1039873) b!1520326))

(assert (= (and b!1520326 (not res!1039872)) b!1520324))

(assert (= (and b!1520324 (not res!1039871)) b!1520320))

(declare-fun m!1403653 () Bool)

(assert (=> b!1520326 m!1403653))

(assert (=> b!1520324 m!1403653))

(assert (=> d!158881 m!1403577))

(declare-fun m!1403655 () Bool)

(assert (=> d!158881 m!1403655))

(assert (=> d!158881 m!1403559))

(assert (=> b!1520322 m!1403577))

(declare-fun m!1403657 () Bool)

(assert (=> b!1520322 m!1403657))

(assert (=> b!1520322 m!1403657))

(assert (=> b!1520322 m!1403555))

(declare-fun m!1403659 () Bool)

(assert (=> b!1520322 m!1403659))

(assert (=> b!1520320 m!1403653))

(assert (=> b!1520212 d!158881))

(declare-fun d!158883 () Bool)

(declare-fun lt!659007 () (_ BitVec 32))

(declare-fun lt!659006 () (_ BitVec 32))

(assert (=> d!158883 (= lt!659007 (bvmul (bvxor lt!659006 (bvlshr lt!659006 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158883 (= lt!659006 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48843 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48843 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158883 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1039874 (let ((h!36739 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48843 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48843 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136129 (bvmul (bvxor h!36739 (bvlshr h!36739 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136129 (bvlshr x!136129 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1039874 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1039874 #b00000000000000000000000000000000))))))

(assert (=> d!158883 (= (toIndex!0 (select (store (arr!48843 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!659007 (bvlshr lt!659007 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1520212 d!158883))

(declare-fun d!158885 () Bool)

(assert (=> d!158885 (= (validKeyInArray!0 (select (arr!48843 a!2804) i!961)) (and (not (= (select (arr!48843 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48843 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1520206 d!158885))

(declare-fun b!1520336 () Bool)

(declare-fun e!848059 () SeekEntryResult!13014)

(assert (=> b!1520336 (= e!848059 (Intermediate!13014 true (toIndex!0 (select (arr!48843 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1520337 () Bool)

(declare-fun lt!659013 () SeekEntryResult!13014)

(assert (=> b!1520337 (and (bvsge (index!54453 lt!659013) #b00000000000000000000000000000000) (bvslt (index!54453 lt!659013) (size!49393 a!2804)))))

(declare-fun e!848057 () Bool)

(assert (=> b!1520337 (= e!848057 (= (select (arr!48843 a!2804) (index!54453 lt!659013)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1520338 () Bool)

(declare-fun e!848058 () Bool)

(declare-fun e!848060 () Bool)

(assert (=> b!1520338 (= e!848058 e!848060)))

(declare-fun res!1039877 () Bool)

(assert (=> b!1520338 (= res!1039877 (and ((_ is Intermediate!13014) lt!659013) (not (undefined!13826 lt!659013)) (bvslt (x!136126 lt!659013) #b01111111111111111111111111111110) (bvsge (x!136126 lt!659013) #b00000000000000000000000000000000) (bvsge (x!136126 lt!659013) #b00000000000000000000000000000000)))))

(assert (=> b!1520338 (=> (not res!1039877) (not e!848060))))

(declare-fun e!848061 () SeekEntryResult!13014)

(declare-fun b!1520339 () Bool)

(assert (=> b!1520339 (= e!848061 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48843 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48843 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520340 () Bool)

(assert (=> b!1520340 (= e!848059 e!848061)))

(declare-fun lt!659012 () (_ BitVec 64))

(declare-fun c!139775 () Bool)

(assert (=> b!1520340 (= c!139775 (or (= lt!659012 (select (arr!48843 a!2804) j!70)) (= (bvadd lt!659012 lt!659012) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1520341 () Bool)

(assert (=> b!1520341 (and (bvsge (index!54453 lt!659013) #b00000000000000000000000000000000) (bvslt (index!54453 lt!659013) (size!49393 a!2804)))))

(declare-fun res!1039875 () Bool)

(assert (=> b!1520341 (= res!1039875 (= (select (arr!48843 a!2804) (index!54453 lt!659013)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1520341 (=> res!1039875 e!848057)))

(declare-fun b!1520342 () Bool)

(assert (=> b!1520342 (= e!848061 (Intermediate!13014 false (toIndex!0 (select (arr!48843 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1520343 () Bool)

(assert (=> b!1520343 (and (bvsge (index!54453 lt!659013) #b00000000000000000000000000000000) (bvslt (index!54453 lt!659013) (size!49393 a!2804)))))

(declare-fun res!1039876 () Bool)

(assert (=> b!1520343 (= res!1039876 (= (select (arr!48843 a!2804) (index!54453 lt!659013)) (select (arr!48843 a!2804) j!70)))))

(assert (=> b!1520343 (=> res!1039876 e!848057)))

(assert (=> b!1520343 (= e!848060 e!848057)))

(declare-fun b!1520344 () Bool)

(assert (=> b!1520344 (= e!848058 (bvsge (x!136126 lt!659013) #b01111111111111111111111111111110))))

(declare-fun d!158887 () Bool)

(assert (=> d!158887 e!848058))

(declare-fun c!139776 () Bool)

(assert (=> d!158887 (= c!139776 (and ((_ is Intermediate!13014) lt!659013) (undefined!13826 lt!659013)))))

(assert (=> d!158887 (= lt!659013 e!848059)))

(declare-fun c!139774 () Bool)

(assert (=> d!158887 (= c!139774 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!158887 (= lt!659012 (select (arr!48843 a!2804) (toIndex!0 (select (arr!48843 a!2804) j!70) mask!2512)))))

(assert (=> d!158887 (validMask!0 mask!2512)))

(assert (=> d!158887 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48843 a!2804) j!70) mask!2512) (select (arr!48843 a!2804) j!70) a!2804 mask!2512) lt!659013)))

(assert (= (and d!158887 c!139774) b!1520336))

(assert (= (and d!158887 (not c!139774)) b!1520340))

(assert (= (and b!1520340 c!139775) b!1520342))

(assert (= (and b!1520340 (not c!139775)) b!1520339))

(assert (= (and d!158887 c!139776) b!1520344))

(assert (= (and d!158887 (not c!139776)) b!1520338))

(assert (= (and b!1520338 res!1039877) b!1520343))

(assert (= (and b!1520343 (not res!1039876)) b!1520341))

(assert (= (and b!1520341 (not res!1039875)) b!1520337))

(declare-fun m!1403661 () Bool)

(assert (=> b!1520343 m!1403661))

(assert (=> b!1520341 m!1403661))

(assert (=> d!158887 m!1403573))

(declare-fun m!1403663 () Bool)

(assert (=> d!158887 m!1403663))

(assert (=> d!158887 m!1403559))

(assert (=> b!1520339 m!1403573))

(declare-fun m!1403665 () Bool)

(assert (=> b!1520339 m!1403665))

(assert (=> b!1520339 m!1403665))

(assert (=> b!1520339 m!1403547))

(declare-fun m!1403667 () Bool)

(assert (=> b!1520339 m!1403667))

(assert (=> b!1520337 m!1403661))

(assert (=> b!1520216 d!158887))

(declare-fun d!158889 () Bool)

(declare-fun lt!659015 () (_ BitVec 32))

(declare-fun lt!659014 () (_ BitVec 32))

(assert (=> d!158889 (= lt!659015 (bvmul (bvxor lt!659014 (bvlshr lt!659014 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158889 (= lt!659014 ((_ extract 31 0) (bvand (bvxor (select (arr!48843 a!2804) j!70) (bvlshr (select (arr!48843 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158889 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1039874 (let ((h!36739 ((_ extract 31 0) (bvand (bvxor (select (arr!48843 a!2804) j!70) (bvlshr (select (arr!48843 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136129 (bvmul (bvxor h!36739 (bvlshr h!36739 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136129 (bvlshr x!136129 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1039874 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1039874 #b00000000000000000000000000000000))))))

(assert (=> d!158889 (= (toIndex!0 (select (arr!48843 a!2804) j!70) mask!2512) (bvand (bvxor lt!659015 (bvlshr lt!659015 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1520216 d!158889))

(declare-fun d!158891 () Bool)

(assert (=> d!158891 (= (validKeyInArray!0 (select (arr!48843 a!2804) j!70)) (and (not (= (select (arr!48843 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48843 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1520210 d!158891))

(declare-fun b!1520423 () Bool)

(declare-fun e!848109 () SeekEntryResult!13014)

(declare-fun e!848111 () SeekEntryResult!13014)

(assert (=> b!1520423 (= e!848109 e!848111)))

(declare-fun lt!659048 () (_ BitVec 64))

(declare-fun lt!659050 () SeekEntryResult!13014)

(assert (=> b!1520423 (= lt!659048 (select (arr!48843 a!2804) (index!54453 lt!659050)))))

(declare-fun c!139802 () Bool)

(assert (=> b!1520423 (= c!139802 (= lt!659048 (select (arr!48843 a!2804) j!70)))))

(declare-fun b!1520424 () Bool)

(declare-fun e!848110 () SeekEntryResult!13014)

(assert (=> b!1520424 (= e!848110 (MissingZero!13014 (index!54453 lt!659050)))))

(declare-fun b!1520426 () Bool)

(assert (=> b!1520426 (= e!848111 (Found!13014 (index!54453 lt!659050)))))

(declare-fun b!1520427 () Bool)

(assert (=> b!1520427 (= e!848109 Undefined!13014)))

(declare-fun b!1520428 () Bool)

(declare-fun c!139803 () Bool)

(assert (=> b!1520428 (= c!139803 (= lt!659048 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1520428 (= e!848111 e!848110)))

(declare-fun d!158893 () Bool)

(declare-fun lt!659047 () SeekEntryResult!13014)

(assert (=> d!158893 (and (or ((_ is MissingVacant!13014) lt!659047) (not ((_ is Found!13014) lt!659047)) (and (bvsge (index!54452 lt!659047) #b00000000000000000000000000000000) (bvslt (index!54452 lt!659047) (size!49393 a!2804)))) (not ((_ is MissingVacant!13014) lt!659047)) (or (not ((_ is Found!13014) lt!659047)) (= (select (arr!48843 a!2804) (index!54452 lt!659047)) (select (arr!48843 a!2804) j!70))))))

(assert (=> d!158893 (= lt!659047 e!848109)))

(declare-fun c!139804 () Bool)

(assert (=> d!158893 (= c!139804 (and ((_ is Intermediate!13014) lt!659050) (undefined!13826 lt!659050)))))

(assert (=> d!158893 (= lt!659050 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48843 a!2804) j!70) mask!2512) (select (arr!48843 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!158893 (validMask!0 mask!2512)))

(assert (=> d!158893 (= (seekEntry!0 (select (arr!48843 a!2804) j!70) a!2804 mask!2512) lt!659047)))

(declare-fun b!1520425 () Bool)

(declare-fun lt!659049 () SeekEntryResult!13014)

(assert (=> b!1520425 (= e!848110 (ite ((_ is MissingVacant!13014) lt!659049) (MissingZero!13014 (index!54454 lt!659049)) lt!659049))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101215 (_ BitVec 32)) SeekEntryResult!13014)

(assert (=> b!1520425 (= lt!659049 (seekKeyOrZeroReturnVacant!0 (x!136126 lt!659050) (index!54453 lt!659050) (index!54453 lt!659050) (select (arr!48843 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and d!158893 c!139804) b!1520427))

(assert (= (and d!158893 (not c!139804)) b!1520423))

(assert (= (and b!1520423 c!139802) b!1520426))

(assert (= (and b!1520423 (not c!139802)) b!1520428))

(assert (= (and b!1520428 c!139803) b!1520424))

(assert (= (and b!1520428 (not c!139803)) b!1520425))

(declare-fun m!1403689 () Bool)

(assert (=> b!1520423 m!1403689))

(declare-fun m!1403691 () Bool)

(assert (=> d!158893 m!1403691))

(assert (=> d!158893 m!1403547))

(assert (=> d!158893 m!1403573))

(assert (=> d!158893 m!1403573))

(assert (=> d!158893 m!1403547))

(assert (=> d!158893 m!1403575))

(assert (=> d!158893 m!1403559))

(assert (=> b!1520425 m!1403547))

(declare-fun m!1403693 () Bool)

(assert (=> b!1520425 m!1403693))

(assert (=> b!1520215 d!158893))

(declare-fun d!158905 () Bool)

(assert (=> d!158905 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129438 d!158905))

(declare-fun d!158911 () Bool)

(assert (=> d!158911 (= (array_inv!37871 a!2804) (bvsge (size!49393 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129438 d!158911))

(declare-fun bm!68350 () Bool)

(declare-fun call!68353 () Bool)

(assert (=> bm!68350 (= call!68353 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1520433 () Bool)

(declare-fun e!848115 () Bool)

(assert (=> b!1520433 (= e!848115 call!68353)))

(declare-fun b!1520434 () Bool)

(declare-fun e!848116 () Bool)

(assert (=> b!1520434 (= e!848116 call!68353)))

(declare-fun b!1520435 () Bool)

(assert (=> b!1520435 (= e!848115 e!848116)))

(declare-fun lt!659059 () (_ BitVec 64))

(assert (=> b!1520435 (= lt!659059 (select (arr!48843 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!659057 () Unit!50896)

(assert (=> b!1520435 (= lt!659057 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659059 #b00000000000000000000000000000000))))

(assert (=> b!1520435 (arrayContainsKey!0 a!2804 lt!659059 #b00000000000000000000000000000000)))

(declare-fun lt!659058 () Unit!50896)

(assert (=> b!1520435 (= lt!659058 lt!659057)))

(declare-fun res!1039908 () Bool)

(assert (=> b!1520435 (= res!1039908 (= (seekEntryOrOpen!0 (select (arr!48843 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13014 #b00000000000000000000000000000000)))))

(assert (=> b!1520435 (=> (not res!1039908) (not e!848116))))

(declare-fun b!1520436 () Bool)

(declare-fun e!848117 () Bool)

(assert (=> b!1520436 (= e!848117 e!848115)))

(declare-fun c!139806 () Bool)

(assert (=> b!1520436 (= c!139806 (validKeyInArray!0 (select (arr!48843 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!158913 () Bool)

(declare-fun res!1039909 () Bool)

(assert (=> d!158913 (=> res!1039909 e!848117)))

(assert (=> d!158913 (= res!1039909 (bvsge #b00000000000000000000000000000000 (size!49393 a!2804)))))

(assert (=> d!158913 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!848117)))

(assert (= (and d!158913 (not res!1039909)) b!1520436))

(assert (= (and b!1520436 c!139806) b!1520435))

(assert (= (and b!1520436 (not c!139806)) b!1520433))

(assert (= (and b!1520435 res!1039908) b!1520434))

(assert (= (or b!1520434 b!1520433) bm!68350))

(declare-fun m!1403705 () Bool)

(assert (=> bm!68350 m!1403705))

(assert (=> b!1520435 m!1403627))

(declare-fun m!1403707 () Bool)

(assert (=> b!1520435 m!1403707))

(declare-fun m!1403709 () Bool)

(assert (=> b!1520435 m!1403709))

(assert (=> b!1520435 m!1403627))

(declare-fun m!1403711 () Bool)

(assert (=> b!1520435 m!1403711))

(assert (=> b!1520436 m!1403627))

(assert (=> b!1520436 m!1403627))

(assert (=> b!1520436 m!1403631))

(assert (=> b!1520209 d!158913))

(check-sat (not bm!68337) (not b!1520339) (not b!1520271) (not d!158879) (not d!158863) (not b!1520287) (not d!158881) (not d!158893) (not b!1520290) (not b!1520425) (not b!1520436) (not d!158887) (not b!1520435) (not b!1520289) (not b!1520322) (not bm!68350) (not b!1520317) (not bm!68343) (not b!1520318))
(check-sat)
