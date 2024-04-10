; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128426 () Bool)

(assert start!128426)

(declare-fun b!1506257 () Bool)

(declare-fun res!1026616 () Bool)

(declare-fun e!841816 () Bool)

(assert (=> b!1506257 (=> (not res!1026616) (not e!841816))))

(declare-datatypes ((array!100471 0))(
  ( (array!100472 (arr!48480 (Array (_ BitVec 32) (_ BitVec 64))) (size!49030 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100471)

(declare-datatypes ((List!34963 0))(
  ( (Nil!34960) (Cons!34959 (h!36356 (_ BitVec 64)) (t!49657 List!34963)) )
))
(declare-fun arrayNoDuplicates!0 (array!100471 (_ BitVec 32) List!34963) Bool)

(assert (=> b!1506257 (= res!1026616 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34960))))

(declare-fun b!1506258 () Bool)

(declare-fun res!1026614 () Bool)

(assert (=> b!1506258 (=> (not res!1026614) (not e!841816))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1506258 (= res!1026614 (and (= (size!49030 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49030 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49030 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506259 () Bool)

(declare-fun res!1026618 () Bool)

(assert (=> b!1506259 (=> (not res!1026618) (not e!841816))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506259 (= res!1026618 (validKeyInArray!0 (select (arr!48480 a!2804) i!961)))))

(declare-fun b!1506260 () Bool)

(declare-fun lt!654175 () (_ BitVec 32))

(assert (=> b!1506260 (= e!841816 (and (bvsge mask!2512 #b00000000000000000000000000000000) (or (bvslt lt!654175 #b00000000000000000000000000000000) (bvsge lt!654175 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506260 (= lt!654175 (toIndex!0 (select (arr!48480 a!2804) j!70) mask!2512))))

(declare-fun b!1506261 () Bool)

(declare-fun res!1026615 () Bool)

(assert (=> b!1506261 (=> (not res!1026615) (not e!841816))))

(assert (=> b!1506261 (= res!1026615 (validKeyInArray!0 (select (arr!48480 a!2804) j!70)))))

(declare-fun b!1506263 () Bool)

(declare-fun res!1026617 () Bool)

(assert (=> b!1506263 (=> (not res!1026617) (not e!841816))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100471 (_ BitVec 32)) Bool)

(assert (=> b!1506263 (= res!1026617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506262 () Bool)

(declare-fun res!1026613 () Bool)

(assert (=> b!1506262 (=> (not res!1026613) (not e!841816))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506262 (= res!1026613 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49030 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49030 a!2804))))))

(declare-fun res!1026619 () Bool)

(assert (=> start!128426 (=> (not res!1026619) (not e!841816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128426 (= res!1026619 (validMask!0 mask!2512))))

(assert (=> start!128426 e!841816))

(assert (=> start!128426 true))

(declare-fun array_inv!37508 (array!100471) Bool)

(assert (=> start!128426 (array_inv!37508 a!2804)))

(assert (= (and start!128426 res!1026619) b!1506258))

(assert (= (and b!1506258 res!1026614) b!1506259))

(assert (= (and b!1506259 res!1026618) b!1506261))

(assert (= (and b!1506261 res!1026615) b!1506263))

(assert (= (and b!1506263 res!1026617) b!1506257))

(assert (= (and b!1506257 res!1026616) b!1506262))

(assert (= (and b!1506262 res!1026613) b!1506260))

(declare-fun m!1389247 () Bool)

(assert (=> b!1506263 m!1389247))

(declare-fun m!1389249 () Bool)

(assert (=> start!128426 m!1389249))

(declare-fun m!1389251 () Bool)

(assert (=> start!128426 m!1389251))

(declare-fun m!1389253 () Bool)

(assert (=> b!1506257 m!1389253))

(declare-fun m!1389255 () Bool)

(assert (=> b!1506259 m!1389255))

(assert (=> b!1506259 m!1389255))

(declare-fun m!1389257 () Bool)

(assert (=> b!1506259 m!1389257))

(declare-fun m!1389259 () Bool)

(assert (=> b!1506261 m!1389259))

(assert (=> b!1506261 m!1389259))

(declare-fun m!1389261 () Bool)

(assert (=> b!1506261 m!1389261))

(assert (=> b!1506260 m!1389259))

(assert (=> b!1506260 m!1389259))

(declare-fun m!1389263 () Bool)

(assert (=> b!1506260 m!1389263))

(check-sat (not b!1506260) (not b!1506261) (not b!1506259) (not b!1506263) (not start!128426) (not b!1506257))
(check-sat)
(get-model)

(declare-fun d!158197 () Bool)

(assert (=> d!158197 (= (validKeyInArray!0 (select (arr!48480 a!2804) j!70)) (and (not (= (select (arr!48480 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48480 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1506261 d!158197))

(declare-fun d!158199 () Bool)

(declare-fun res!1026649 () Bool)

(declare-fun e!841831 () Bool)

(assert (=> d!158199 (=> res!1026649 e!841831)))

(assert (=> d!158199 (= res!1026649 (bvsge #b00000000000000000000000000000000 (size!49030 a!2804)))))

(assert (=> d!158199 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34960) e!841831)))

(declare-fun b!1506295 () Bool)

(declare-fun e!841832 () Bool)

(declare-fun call!68223 () Bool)

(assert (=> b!1506295 (= e!841832 call!68223)))

(declare-fun b!1506296 () Bool)

(declare-fun e!841833 () Bool)

(assert (=> b!1506296 (= e!841833 e!841832)))

(declare-fun c!139358 () Bool)

(assert (=> b!1506296 (= c!139358 (validKeyInArray!0 (select (arr!48480 a!2804) #b00000000000000000000000000000000)))))

(declare-fun bm!68220 () Bool)

(assert (=> bm!68220 (= call!68223 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139358 (Cons!34959 (select (arr!48480 a!2804) #b00000000000000000000000000000000) Nil!34960) Nil!34960)))))

(declare-fun b!1506297 () Bool)

(assert (=> b!1506297 (= e!841831 e!841833)))

(declare-fun res!1026648 () Bool)

(assert (=> b!1506297 (=> (not res!1026648) (not e!841833))))

(declare-fun e!841834 () Bool)

(assert (=> b!1506297 (= res!1026648 (not e!841834))))

(declare-fun res!1026647 () Bool)

(assert (=> b!1506297 (=> (not res!1026647) (not e!841834))))

(assert (=> b!1506297 (= res!1026647 (validKeyInArray!0 (select (arr!48480 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1506298 () Bool)

(declare-fun contains!9963 (List!34963 (_ BitVec 64)) Bool)

(assert (=> b!1506298 (= e!841834 (contains!9963 Nil!34960 (select (arr!48480 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1506299 () Bool)

(assert (=> b!1506299 (= e!841832 call!68223)))

(assert (= (and d!158199 (not res!1026649)) b!1506297))

(assert (= (and b!1506297 res!1026647) b!1506298))

(assert (= (and b!1506297 res!1026648) b!1506296))

(assert (= (and b!1506296 c!139358) b!1506295))

(assert (= (and b!1506296 (not c!139358)) b!1506299))

(assert (= (or b!1506295 b!1506299) bm!68220))

(declare-fun m!1389283 () Bool)

(assert (=> b!1506296 m!1389283))

(assert (=> b!1506296 m!1389283))

(declare-fun m!1389285 () Bool)

(assert (=> b!1506296 m!1389285))

(assert (=> bm!68220 m!1389283))

(declare-fun m!1389287 () Bool)

(assert (=> bm!68220 m!1389287))

(assert (=> b!1506297 m!1389283))

(assert (=> b!1506297 m!1389283))

(assert (=> b!1506297 m!1389285))

(assert (=> b!1506298 m!1389283))

(assert (=> b!1506298 m!1389283))

(declare-fun m!1389289 () Bool)

(assert (=> b!1506298 m!1389289))

(assert (=> b!1506257 d!158199))

(declare-fun d!158205 () Bool)

(declare-fun res!1026663 () Bool)

(declare-fun e!841853 () Bool)

(assert (=> d!158205 (=> res!1026663 e!841853)))

(assert (=> d!158205 (= res!1026663 (bvsge #b00000000000000000000000000000000 (size!49030 a!2804)))))

(assert (=> d!158205 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!841853)))

(declare-fun bm!68226 () Bool)

(declare-fun call!68229 () Bool)

(assert (=> bm!68226 (= call!68229 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1506323 () Bool)

(declare-fun e!841854 () Bool)

(assert (=> b!1506323 (= e!841854 call!68229)))

(declare-fun b!1506324 () Bool)

(assert (=> b!1506324 (= e!841853 e!841854)))

(declare-fun c!139364 () Bool)

(assert (=> b!1506324 (= c!139364 (validKeyInArray!0 (select (arr!48480 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1506325 () Bool)

(declare-fun e!841855 () Bool)

(assert (=> b!1506325 (= e!841855 call!68229)))

(declare-fun b!1506326 () Bool)

(assert (=> b!1506326 (= e!841854 e!841855)))

(declare-fun lt!654186 () (_ BitVec 64))

(assert (=> b!1506326 (= lt!654186 (select (arr!48480 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50318 0))(
  ( (Unit!50319) )
))
(declare-fun lt!654185 () Unit!50318)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100471 (_ BitVec 64) (_ BitVec 32)) Unit!50318)

(assert (=> b!1506326 (= lt!654185 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654186 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1506326 (arrayContainsKey!0 a!2804 lt!654186 #b00000000000000000000000000000000)))

(declare-fun lt!654187 () Unit!50318)

(assert (=> b!1506326 (= lt!654187 lt!654185)))

(declare-fun res!1026664 () Bool)

(declare-datatypes ((SeekEntryResult!12656 0))(
  ( (MissingZero!12656 (index!53019 (_ BitVec 32))) (Found!12656 (index!53020 (_ BitVec 32))) (Intermediate!12656 (undefined!13468 Bool) (index!53021 (_ BitVec 32)) (x!134765 (_ BitVec 32))) (Undefined!12656) (MissingVacant!12656 (index!53022 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100471 (_ BitVec 32)) SeekEntryResult!12656)

(assert (=> b!1506326 (= res!1026664 (= (seekEntryOrOpen!0 (select (arr!48480 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12656 #b00000000000000000000000000000000)))))

(assert (=> b!1506326 (=> (not res!1026664) (not e!841855))))

(assert (= (and d!158205 (not res!1026663)) b!1506324))

(assert (= (and b!1506324 c!139364) b!1506326))

(assert (= (and b!1506324 (not c!139364)) b!1506323))

(assert (= (and b!1506326 res!1026664) b!1506325))

(assert (= (or b!1506325 b!1506323) bm!68226))

(declare-fun m!1389299 () Bool)

(assert (=> bm!68226 m!1389299))

(assert (=> b!1506324 m!1389283))

(assert (=> b!1506324 m!1389283))

(assert (=> b!1506324 m!1389285))

(assert (=> b!1506326 m!1389283))

(declare-fun m!1389301 () Bool)

(assert (=> b!1506326 m!1389301))

(declare-fun m!1389303 () Bool)

(assert (=> b!1506326 m!1389303))

(assert (=> b!1506326 m!1389283))

(declare-fun m!1389305 () Bool)

(assert (=> b!1506326 m!1389305))

(assert (=> b!1506263 d!158205))

(declare-fun d!158211 () Bool)

(assert (=> d!158211 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128426 d!158211))

(declare-fun d!158219 () Bool)

(assert (=> d!158219 (= (array_inv!37508 a!2804) (bvsge (size!49030 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128426 d!158219))

(declare-fun d!158221 () Bool)

(declare-fun lt!654214 () (_ BitVec 32))

(declare-fun lt!654213 () (_ BitVec 32))

(assert (=> d!158221 (= lt!654214 (bvmul (bvxor lt!654213 (bvlshr lt!654213 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158221 (= lt!654213 ((_ extract 31 0) (bvand (bvxor (select (arr!48480 a!2804) j!70) (bvlshr (select (arr!48480 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158221 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1026666 (let ((h!36359 ((_ extract 31 0) (bvand (bvxor (select (arr!48480 a!2804) j!70) (bvlshr (select (arr!48480 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!134764 (bvmul (bvxor h!36359 (bvlshr h!36359 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!134764 (bvlshr x!134764 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1026666 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1026666 #b00000000000000000000000000000000))))))

(assert (=> d!158221 (= (toIndex!0 (select (arr!48480 a!2804) j!70) mask!2512) (bvand (bvxor lt!654214 (bvlshr lt!654214 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1506260 d!158221))

(declare-fun d!158223 () Bool)

(assert (=> d!158223 (= (validKeyInArray!0 (select (arr!48480 a!2804) i!961)) (and (not (= (select (arr!48480 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48480 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1506259 d!158223))

(check-sat (not bm!68220) (not b!1506297) (not b!1506298) (not b!1506326) (not b!1506324) (not bm!68226) (not b!1506296))
(check-sat)
