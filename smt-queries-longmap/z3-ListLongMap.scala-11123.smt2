; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129970 () Bool)

(assert start!129970)

(declare-fun e!850186 () Bool)

(declare-fun b!1525216 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101446 0))(
  ( (array!101447 (arr!48951 (Array (_ BitVec 32) (_ BitVec 64))) (size!49501 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101446)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13116 0))(
  ( (MissingZero!13116 (index!54859 (_ BitVec 32))) (Found!13116 (index!54860 (_ BitVec 32))) (Intermediate!13116 (undefined!13928 Bool) (index!54861 (_ BitVec 32)) (x!136553 (_ BitVec 32))) (Undefined!13116) (MissingVacant!13116 (index!54862 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101446 (_ BitVec 32)) SeekEntryResult!13116)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101446 (_ BitVec 32)) SeekEntryResult!13116)

(assert (=> b!1525216 (= e!850186 (= (seekEntryOrOpen!0 (select (arr!48951 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48951 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1525217 () Bool)

(declare-fun res!1043589 () Bool)

(declare-fun e!850192 () Bool)

(assert (=> b!1525217 (=> (not res!1043589) (not e!850192))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525217 (= res!1043589 (validKeyInArray!0 (select (arr!48951 a!2804) j!70)))))

(declare-fun res!1043583 () Bool)

(assert (=> start!129970 (=> (not res!1043583) (not e!850192))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129970 (= res!1043583 (validMask!0 mask!2512))))

(assert (=> start!129970 e!850192))

(assert (=> start!129970 true))

(declare-fun array_inv!37979 (array!101446) Bool)

(assert (=> start!129970 (array_inv!37979 a!2804)))

(declare-fun b!1525218 () Bool)

(declare-fun res!1043582 () Bool)

(assert (=> b!1525218 (=> (not res!1043582) (not e!850192))))

(declare-datatypes ((List!35434 0))(
  ( (Nil!35431) (Cons!35430 (h!36860 (_ BitVec 64)) (t!50128 List!35434)) )
))
(declare-fun arrayNoDuplicates!0 (array!101446 (_ BitVec 32) List!35434) Bool)

(assert (=> b!1525218 (= res!1043582 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35431))))

(declare-fun b!1525219 () Bool)

(declare-fun res!1043588 () Bool)

(declare-fun e!850189 () Bool)

(assert (=> b!1525219 (=> (not res!1043588) (not e!850189))))

(declare-fun lt!660595 () SeekEntryResult!13116)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101446 (_ BitVec 32)) SeekEntryResult!13116)

(assert (=> b!1525219 (= res!1043588 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48951 a!2804) j!70) a!2804 mask!2512) lt!660595))))

(declare-fun b!1525220 () Bool)

(declare-fun res!1043584 () Bool)

(assert (=> b!1525220 (=> (not res!1043584) (not e!850192))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1525220 (= res!1043584 (and (= (size!49501 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49501 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49501 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1525221 () Bool)

(declare-fun e!850191 () Bool)

(assert (=> b!1525221 (= e!850189 e!850191)))

(declare-fun res!1043590 () Bool)

(assert (=> b!1525221 (=> (not res!1043590) (not e!850191))))

(declare-fun lt!660594 () SeekEntryResult!13116)

(declare-fun lt!660597 () array!101446)

(declare-fun lt!660596 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525221 (= res!1043590 (= lt!660594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660596 mask!2512) lt!660596 lt!660597 mask!2512)))))

(assert (=> b!1525221 (= lt!660596 (select (store (arr!48951 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1525221 (= lt!660597 (array!101447 (store (arr!48951 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49501 a!2804)))))

(declare-fun b!1525222 () Bool)

(declare-fun res!1043581 () Bool)

(assert (=> b!1525222 (=> (not res!1043581) (not e!850192))))

(assert (=> b!1525222 (= res!1043581 (validKeyInArray!0 (select (arr!48951 a!2804) i!961)))))

(declare-fun b!1525223 () Bool)

(declare-fun e!850187 () Bool)

(assert (=> b!1525223 (= e!850191 (not e!850187))))

(declare-fun res!1043580 () Bool)

(assert (=> b!1525223 (=> res!1043580 e!850187)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1525223 (= res!1043580 (or (not (= (select (arr!48951 a!2804) j!70) lt!660596)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48951 a!2804) index!487) (select (arr!48951 a!2804) j!70)) (not (= (select (arr!48951 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!850188 () Bool)

(assert (=> b!1525223 e!850188))

(declare-fun res!1043578 () Bool)

(assert (=> b!1525223 (=> (not res!1043578) (not e!850188))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101446 (_ BitVec 32)) Bool)

(assert (=> b!1525223 (= res!1043578 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51016 0))(
  ( (Unit!51017) )
))
(declare-fun lt!660598 () Unit!51016)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101446 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51016)

(assert (=> b!1525223 (= lt!660598 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1525224 () Bool)

(assert (=> b!1525224 (= e!850187 (= (seekEntryOrOpen!0 lt!660596 lt!660597 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660596 lt!660597 mask!2512)))))

(declare-fun b!1525225 () Bool)

(declare-fun res!1043587 () Bool)

(assert (=> b!1525225 (=> (not res!1043587) (not e!850192))))

(assert (=> b!1525225 (= res!1043587 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49501 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49501 a!2804))))))

(declare-fun b!1525226 () Bool)

(assert (=> b!1525226 (= e!850188 e!850186)))

(declare-fun res!1043579 () Bool)

(assert (=> b!1525226 (=> res!1043579 e!850186)))

(assert (=> b!1525226 (= res!1043579 (or (not (= (select (arr!48951 a!2804) j!70) lt!660596)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48951 a!2804) index!487) (select (arr!48951 a!2804) j!70)) (not (= (select (arr!48951 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1525227 () Bool)

(assert (=> b!1525227 (= e!850192 e!850189)))

(declare-fun res!1043577 () Bool)

(assert (=> b!1525227 (=> (not res!1043577) (not e!850189))))

(assert (=> b!1525227 (= res!1043577 (= lt!660594 lt!660595))))

(assert (=> b!1525227 (= lt!660595 (Intermediate!13116 false resIndex!21 resX!21))))

(assert (=> b!1525227 (= lt!660594 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48951 a!2804) j!70) mask!2512) (select (arr!48951 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525228 () Bool)

(declare-fun res!1043586 () Bool)

(assert (=> b!1525228 (=> (not res!1043586) (not e!850192))))

(assert (=> b!1525228 (= res!1043586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1525229 () Bool)

(declare-fun res!1043585 () Bool)

(assert (=> b!1525229 (=> (not res!1043585) (not e!850188))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101446 (_ BitVec 32)) SeekEntryResult!13116)

(assert (=> b!1525229 (= res!1043585 (= (seekEntry!0 (select (arr!48951 a!2804) j!70) a!2804 mask!2512) (Found!13116 j!70)))))

(assert (= (and start!129970 res!1043583) b!1525220))

(assert (= (and b!1525220 res!1043584) b!1525222))

(assert (= (and b!1525222 res!1043581) b!1525217))

(assert (= (and b!1525217 res!1043589) b!1525228))

(assert (= (and b!1525228 res!1043586) b!1525218))

(assert (= (and b!1525218 res!1043582) b!1525225))

(assert (= (and b!1525225 res!1043587) b!1525227))

(assert (= (and b!1525227 res!1043577) b!1525219))

(assert (= (and b!1525219 res!1043588) b!1525221))

(assert (= (and b!1525221 res!1043590) b!1525223))

(assert (= (and b!1525223 res!1043578) b!1525229))

(assert (= (and b!1525229 res!1043585) b!1525226))

(assert (= (and b!1525226 (not res!1043579)) b!1525216))

(assert (= (and b!1525223 (not res!1043580)) b!1525224))

(declare-fun m!1408111 () Bool)

(assert (=> b!1525218 m!1408111))

(declare-fun m!1408113 () Bool)

(assert (=> b!1525227 m!1408113))

(assert (=> b!1525227 m!1408113))

(declare-fun m!1408115 () Bool)

(assert (=> b!1525227 m!1408115))

(assert (=> b!1525227 m!1408115))

(assert (=> b!1525227 m!1408113))

(declare-fun m!1408117 () Bool)

(assert (=> b!1525227 m!1408117))

(declare-fun m!1408119 () Bool)

(assert (=> b!1525221 m!1408119))

(assert (=> b!1525221 m!1408119))

(declare-fun m!1408121 () Bool)

(assert (=> b!1525221 m!1408121))

(declare-fun m!1408123 () Bool)

(assert (=> b!1525221 m!1408123))

(declare-fun m!1408125 () Bool)

(assert (=> b!1525221 m!1408125))

(assert (=> b!1525216 m!1408113))

(assert (=> b!1525216 m!1408113))

(declare-fun m!1408127 () Bool)

(assert (=> b!1525216 m!1408127))

(assert (=> b!1525216 m!1408113))

(declare-fun m!1408129 () Bool)

(assert (=> b!1525216 m!1408129))

(assert (=> b!1525229 m!1408113))

(assert (=> b!1525229 m!1408113))

(declare-fun m!1408131 () Bool)

(assert (=> b!1525229 m!1408131))

(assert (=> b!1525223 m!1408113))

(declare-fun m!1408133 () Bool)

(assert (=> b!1525223 m!1408133))

(declare-fun m!1408135 () Bool)

(assert (=> b!1525223 m!1408135))

(declare-fun m!1408137 () Bool)

(assert (=> b!1525223 m!1408137))

(declare-fun m!1408139 () Bool)

(assert (=> start!129970 m!1408139))

(declare-fun m!1408141 () Bool)

(assert (=> start!129970 m!1408141))

(declare-fun m!1408143 () Bool)

(assert (=> b!1525224 m!1408143))

(declare-fun m!1408145 () Bool)

(assert (=> b!1525224 m!1408145))

(assert (=> b!1525217 m!1408113))

(assert (=> b!1525217 m!1408113))

(declare-fun m!1408147 () Bool)

(assert (=> b!1525217 m!1408147))

(declare-fun m!1408149 () Bool)

(assert (=> b!1525222 m!1408149))

(assert (=> b!1525222 m!1408149))

(declare-fun m!1408151 () Bool)

(assert (=> b!1525222 m!1408151))

(declare-fun m!1408153 () Bool)

(assert (=> b!1525228 m!1408153))

(assert (=> b!1525219 m!1408113))

(assert (=> b!1525219 m!1408113))

(declare-fun m!1408155 () Bool)

(assert (=> b!1525219 m!1408155))

(assert (=> b!1525226 m!1408113))

(assert (=> b!1525226 m!1408133))

(check-sat (not b!1525228) (not b!1525219) (not b!1525217) (not b!1525224) (not b!1525216) (not start!129970) (not b!1525227) (not b!1525222) (not b!1525229) (not b!1525218) (not b!1525221) (not b!1525223))
(check-sat)
(get-model)

(declare-fun b!1525290 () Bool)

(declare-fun e!850225 () SeekEntryResult!13116)

(assert (=> b!1525290 (= e!850225 (Intermediate!13116 false index!487 x!534))))

(declare-fun b!1525291 () Bool)

(declare-fun lt!660619 () SeekEntryResult!13116)

(assert (=> b!1525291 (and (bvsge (index!54861 lt!660619) #b00000000000000000000000000000000) (bvslt (index!54861 lt!660619) (size!49501 a!2804)))))

(declare-fun e!850224 () Bool)

(assert (=> b!1525291 (= e!850224 (= (select (arr!48951 a!2804) (index!54861 lt!660619)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1525292 () Bool)

(assert (=> b!1525292 (and (bvsge (index!54861 lt!660619) #b00000000000000000000000000000000) (bvslt (index!54861 lt!660619) (size!49501 a!2804)))))

(declare-fun res!1043641 () Bool)

(assert (=> b!1525292 (= res!1043641 (= (select (arr!48951 a!2804) (index!54861 lt!660619)) (select (arr!48951 a!2804) j!70)))))

(assert (=> b!1525292 (=> res!1043641 e!850224)))

(declare-fun e!850228 () Bool)

(assert (=> b!1525292 (= e!850228 e!850224)))

(declare-fun b!1525293 () Bool)

(declare-fun e!850227 () Bool)

(assert (=> b!1525293 (= e!850227 (bvsge (x!136553 lt!660619) #b01111111111111111111111111111110))))

(declare-fun d!159455 () Bool)

(assert (=> d!159455 e!850227))

(declare-fun c!140376 () Bool)

(get-info :version)

(assert (=> d!159455 (= c!140376 (and ((_ is Intermediate!13116) lt!660619) (undefined!13928 lt!660619)))))

(declare-fun e!850226 () SeekEntryResult!13116)

(assert (=> d!159455 (= lt!660619 e!850226)))

(declare-fun c!140378 () Bool)

(assert (=> d!159455 (= c!140378 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!660618 () (_ BitVec 64))

(assert (=> d!159455 (= lt!660618 (select (arr!48951 a!2804) index!487))))

(assert (=> d!159455 (validMask!0 mask!2512)))

(assert (=> d!159455 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48951 a!2804) j!70) a!2804 mask!2512) lt!660619)))

(declare-fun b!1525294 () Bool)

(assert (=> b!1525294 (= e!850226 (Intermediate!13116 true index!487 x!534))))

(declare-fun b!1525295 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525295 (= e!850225 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48951 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525296 () Bool)

(assert (=> b!1525296 (= e!850227 e!850228)))

(declare-fun res!1043639 () Bool)

(assert (=> b!1525296 (= res!1043639 (and ((_ is Intermediate!13116) lt!660619) (not (undefined!13928 lt!660619)) (bvslt (x!136553 lt!660619) #b01111111111111111111111111111110) (bvsge (x!136553 lt!660619) #b00000000000000000000000000000000) (bvsge (x!136553 lt!660619) x!534)))))

(assert (=> b!1525296 (=> (not res!1043639) (not e!850228))))

(declare-fun b!1525297 () Bool)

(assert (=> b!1525297 (and (bvsge (index!54861 lt!660619) #b00000000000000000000000000000000) (bvslt (index!54861 lt!660619) (size!49501 a!2804)))))

(declare-fun res!1043640 () Bool)

(assert (=> b!1525297 (= res!1043640 (= (select (arr!48951 a!2804) (index!54861 lt!660619)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1525297 (=> res!1043640 e!850224)))

(declare-fun b!1525298 () Bool)

(assert (=> b!1525298 (= e!850226 e!850225)))

(declare-fun c!140377 () Bool)

(assert (=> b!1525298 (= c!140377 (or (= lt!660618 (select (arr!48951 a!2804) j!70)) (= (bvadd lt!660618 lt!660618) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!159455 c!140378) b!1525294))

(assert (= (and d!159455 (not c!140378)) b!1525298))

(assert (= (and b!1525298 c!140377) b!1525290))

(assert (= (and b!1525298 (not c!140377)) b!1525295))

(assert (= (and d!159455 c!140376) b!1525293))

(assert (= (and d!159455 (not c!140376)) b!1525296))

(assert (= (and b!1525296 res!1043639) b!1525292))

(assert (= (and b!1525292 (not res!1043641)) b!1525297))

(assert (= (and b!1525297 (not res!1043640)) b!1525291))

(declare-fun m!1408203 () Bool)

(assert (=> b!1525292 m!1408203))

(assert (=> b!1525297 m!1408203))

(declare-fun m!1408205 () Bool)

(assert (=> b!1525295 m!1408205))

(assert (=> b!1525295 m!1408205))

(assert (=> b!1525295 m!1408113))

(declare-fun m!1408207 () Bool)

(assert (=> b!1525295 m!1408207))

(assert (=> b!1525291 m!1408203))

(assert (=> d!159455 m!1408133))

(assert (=> d!159455 m!1408139))

(assert (=> b!1525219 d!159455))

(declare-fun b!1525312 () Bool)

(declare-fun c!140386 () Bool)

(declare-fun lt!660630 () (_ BitVec 64))

(assert (=> b!1525312 (= c!140386 (= lt!660630 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!850237 () SeekEntryResult!13116)

(declare-fun e!850235 () SeekEntryResult!13116)

(assert (=> b!1525312 (= e!850237 e!850235)))

(declare-fun b!1525313 () Bool)

(declare-fun e!850236 () SeekEntryResult!13116)

(assert (=> b!1525313 (= e!850236 e!850237)))

(declare-fun lt!660631 () SeekEntryResult!13116)

(assert (=> b!1525313 (= lt!660630 (select (arr!48951 a!2804) (index!54861 lt!660631)))))

(declare-fun c!140387 () Bool)

(assert (=> b!1525313 (= c!140387 (= lt!660630 (select (arr!48951 a!2804) j!70)))))

(declare-fun b!1525314 () Bool)

(assert (=> b!1525314 (= e!850236 Undefined!13116)))

(declare-fun b!1525315 () Bool)

(declare-fun lt!660628 () SeekEntryResult!13116)

(assert (=> b!1525315 (= e!850235 (ite ((_ is MissingVacant!13116) lt!660628) (MissingZero!13116 (index!54862 lt!660628)) lt!660628))))

(assert (=> b!1525315 (= lt!660628 (seekKeyOrZeroReturnVacant!0 (x!136553 lt!660631) (index!54861 lt!660631) (index!54861 lt!660631) (select (arr!48951 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525316 () Bool)

(assert (=> b!1525316 (= e!850235 (MissingZero!13116 (index!54861 lt!660631)))))

(declare-fun b!1525311 () Bool)

(assert (=> b!1525311 (= e!850237 (Found!13116 (index!54861 lt!660631)))))

(declare-fun d!159457 () Bool)

(declare-fun lt!660629 () SeekEntryResult!13116)

(assert (=> d!159457 (and (or ((_ is MissingVacant!13116) lt!660629) (not ((_ is Found!13116) lt!660629)) (and (bvsge (index!54860 lt!660629) #b00000000000000000000000000000000) (bvslt (index!54860 lt!660629) (size!49501 a!2804)))) (not ((_ is MissingVacant!13116) lt!660629)) (or (not ((_ is Found!13116) lt!660629)) (= (select (arr!48951 a!2804) (index!54860 lt!660629)) (select (arr!48951 a!2804) j!70))))))

(assert (=> d!159457 (= lt!660629 e!850236)))

(declare-fun c!140385 () Bool)

(assert (=> d!159457 (= c!140385 (and ((_ is Intermediate!13116) lt!660631) (undefined!13928 lt!660631)))))

(assert (=> d!159457 (= lt!660631 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48951 a!2804) j!70) mask!2512) (select (arr!48951 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159457 (validMask!0 mask!2512)))

(assert (=> d!159457 (= (seekEntry!0 (select (arr!48951 a!2804) j!70) a!2804 mask!2512) lt!660629)))

(assert (= (and d!159457 c!140385) b!1525314))

(assert (= (and d!159457 (not c!140385)) b!1525313))

(assert (= (and b!1525313 c!140387) b!1525311))

(assert (= (and b!1525313 (not c!140387)) b!1525312))

(assert (= (and b!1525312 c!140386) b!1525316))

(assert (= (and b!1525312 (not c!140386)) b!1525315))

(declare-fun m!1408209 () Bool)

(assert (=> b!1525313 m!1408209))

(assert (=> b!1525315 m!1408113))

(declare-fun m!1408211 () Bool)

(assert (=> b!1525315 m!1408211))

(declare-fun m!1408213 () Bool)

(assert (=> d!159457 m!1408213))

(assert (=> d!159457 m!1408113))

(assert (=> d!159457 m!1408115))

(assert (=> d!159457 m!1408115))

(assert (=> d!159457 m!1408113))

(assert (=> d!159457 m!1408117))

(assert (=> d!159457 m!1408139))

(assert (=> b!1525229 d!159457))

(declare-fun d!159459 () Bool)

(declare-fun res!1043648 () Bool)

(declare-fun e!850246 () Bool)

(assert (=> d!159459 (=> res!1043648 e!850246)))

(assert (=> d!159459 (= res!1043648 (bvsge #b00000000000000000000000000000000 (size!49501 a!2804)))))

(assert (=> d!159459 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35431) e!850246)))

(declare-fun b!1525327 () Bool)

(declare-fun e!850247 () Bool)

(declare-fun e!850249 () Bool)

(assert (=> b!1525327 (= e!850247 e!850249)))

(declare-fun c!140390 () Bool)

(assert (=> b!1525327 (= c!140390 (validKeyInArray!0 (select (arr!48951 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1525328 () Bool)

(assert (=> b!1525328 (= e!850246 e!850247)))

(declare-fun res!1043649 () Bool)

(assert (=> b!1525328 (=> (not res!1043649) (not e!850247))))

(declare-fun e!850248 () Bool)

(assert (=> b!1525328 (= res!1043649 (not e!850248))))

(declare-fun res!1043650 () Bool)

(assert (=> b!1525328 (=> (not res!1043650) (not e!850248))))

(assert (=> b!1525328 (= res!1043650 (validKeyInArray!0 (select (arr!48951 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1525329 () Bool)

(declare-fun call!68451 () Bool)

(assert (=> b!1525329 (= e!850249 call!68451)))

(declare-fun b!1525330 () Bool)

(declare-fun contains!9992 (List!35434 (_ BitVec 64)) Bool)

(assert (=> b!1525330 (= e!850248 (contains!9992 Nil!35431 (select (arr!48951 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1525331 () Bool)

(assert (=> b!1525331 (= e!850249 call!68451)))

(declare-fun bm!68448 () Bool)

(assert (=> bm!68448 (= call!68451 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!140390 (Cons!35430 (select (arr!48951 a!2804) #b00000000000000000000000000000000) Nil!35431) Nil!35431)))))

(assert (= (and d!159459 (not res!1043648)) b!1525328))

(assert (= (and b!1525328 res!1043650) b!1525330))

(assert (= (and b!1525328 res!1043649) b!1525327))

(assert (= (and b!1525327 c!140390) b!1525331))

(assert (= (and b!1525327 (not c!140390)) b!1525329))

(assert (= (or b!1525331 b!1525329) bm!68448))

(declare-fun m!1408215 () Bool)

(assert (=> b!1525327 m!1408215))

(assert (=> b!1525327 m!1408215))

(declare-fun m!1408217 () Bool)

(assert (=> b!1525327 m!1408217))

(assert (=> b!1525328 m!1408215))

(assert (=> b!1525328 m!1408215))

(assert (=> b!1525328 m!1408217))

(assert (=> b!1525330 m!1408215))

(assert (=> b!1525330 m!1408215))

(declare-fun m!1408219 () Bool)

(assert (=> b!1525330 m!1408219))

(assert (=> bm!68448 m!1408215))

(declare-fun m!1408221 () Bool)

(assert (=> bm!68448 m!1408221))

(assert (=> b!1525218 d!159459))

(declare-fun d!159461 () Bool)

(assert (=> d!159461 (= (validKeyInArray!0 (select (arr!48951 a!2804) j!70)) (and (not (= (select (arr!48951 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48951 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1525217 d!159461))

(declare-fun b!1525340 () Bool)

(declare-fun e!850258 () Bool)

(declare-fun e!850257 () Bool)

(assert (=> b!1525340 (= e!850258 e!850257)))

(declare-fun c!140393 () Bool)

(assert (=> b!1525340 (= c!140393 (validKeyInArray!0 (select (arr!48951 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1525341 () Bool)

(declare-fun e!850256 () Bool)

(assert (=> b!1525341 (= e!850257 e!850256)))

(declare-fun lt!660640 () (_ BitVec 64))

(assert (=> b!1525341 (= lt!660640 (select (arr!48951 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!660639 () Unit!51016)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101446 (_ BitVec 64) (_ BitVec 32)) Unit!51016)

(assert (=> b!1525341 (= lt!660639 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660640 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101446 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1525341 (arrayContainsKey!0 a!2804 lt!660640 #b00000000000000000000000000000000)))

(declare-fun lt!660638 () Unit!51016)

(assert (=> b!1525341 (= lt!660638 lt!660639)))

(declare-fun res!1043656 () Bool)

(assert (=> b!1525341 (= res!1043656 (= (seekEntryOrOpen!0 (select (arr!48951 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13116 #b00000000000000000000000000000000)))))

(assert (=> b!1525341 (=> (not res!1043656) (not e!850256))))

(declare-fun b!1525342 () Bool)

(declare-fun call!68454 () Bool)

(assert (=> b!1525342 (= e!850256 call!68454)))

(declare-fun b!1525343 () Bool)

(assert (=> b!1525343 (= e!850257 call!68454)))

(declare-fun bm!68451 () Bool)

(assert (=> bm!68451 (= call!68454 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!159463 () Bool)

(declare-fun res!1043655 () Bool)

(assert (=> d!159463 (=> res!1043655 e!850258)))

(assert (=> d!159463 (= res!1043655 (bvsge #b00000000000000000000000000000000 (size!49501 a!2804)))))

(assert (=> d!159463 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!850258)))

(assert (= (and d!159463 (not res!1043655)) b!1525340))

(assert (= (and b!1525340 c!140393) b!1525341))

(assert (= (and b!1525340 (not c!140393)) b!1525343))

(assert (= (and b!1525341 res!1043656) b!1525342))

(assert (= (or b!1525342 b!1525343) bm!68451))

(assert (=> b!1525340 m!1408215))

(assert (=> b!1525340 m!1408215))

(assert (=> b!1525340 m!1408217))

(assert (=> b!1525341 m!1408215))

(declare-fun m!1408223 () Bool)

(assert (=> b!1525341 m!1408223))

(declare-fun m!1408225 () Bool)

(assert (=> b!1525341 m!1408225))

(assert (=> b!1525341 m!1408215))

(declare-fun m!1408227 () Bool)

(assert (=> b!1525341 m!1408227))

(declare-fun m!1408229 () Bool)

(assert (=> bm!68451 m!1408229))

(assert (=> b!1525228 d!159463))

(declare-fun d!159465 () Bool)

(assert (=> d!159465 (= (validKeyInArray!0 (select (arr!48951 a!2804) i!961)) (and (not (= (select (arr!48951 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48951 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1525222 d!159465))

(declare-fun b!1525344 () Bool)

(declare-fun e!850260 () SeekEntryResult!13116)

(assert (=> b!1525344 (= e!850260 (Intermediate!13116 false (toIndex!0 lt!660596 mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1525345 () Bool)

(declare-fun lt!660642 () SeekEntryResult!13116)

(assert (=> b!1525345 (and (bvsge (index!54861 lt!660642) #b00000000000000000000000000000000) (bvslt (index!54861 lt!660642) (size!49501 lt!660597)))))

(declare-fun e!850259 () Bool)

(assert (=> b!1525345 (= e!850259 (= (select (arr!48951 lt!660597) (index!54861 lt!660642)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1525346 () Bool)

(assert (=> b!1525346 (and (bvsge (index!54861 lt!660642) #b00000000000000000000000000000000) (bvslt (index!54861 lt!660642) (size!49501 lt!660597)))))

(declare-fun res!1043659 () Bool)

(assert (=> b!1525346 (= res!1043659 (= (select (arr!48951 lt!660597) (index!54861 lt!660642)) lt!660596))))

(assert (=> b!1525346 (=> res!1043659 e!850259)))

(declare-fun e!850263 () Bool)

(assert (=> b!1525346 (= e!850263 e!850259)))

(declare-fun b!1525347 () Bool)

(declare-fun e!850262 () Bool)

(assert (=> b!1525347 (= e!850262 (bvsge (x!136553 lt!660642) #b01111111111111111111111111111110))))

(declare-fun d!159467 () Bool)

(assert (=> d!159467 e!850262))

(declare-fun c!140394 () Bool)

(assert (=> d!159467 (= c!140394 (and ((_ is Intermediate!13116) lt!660642) (undefined!13928 lt!660642)))))

(declare-fun e!850261 () SeekEntryResult!13116)

(assert (=> d!159467 (= lt!660642 e!850261)))

(declare-fun c!140396 () Bool)

(assert (=> d!159467 (= c!140396 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!660641 () (_ BitVec 64))

(assert (=> d!159467 (= lt!660641 (select (arr!48951 lt!660597) (toIndex!0 lt!660596 mask!2512)))))

(assert (=> d!159467 (validMask!0 mask!2512)))

(assert (=> d!159467 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660596 mask!2512) lt!660596 lt!660597 mask!2512) lt!660642)))

(declare-fun b!1525348 () Bool)

(assert (=> b!1525348 (= e!850261 (Intermediate!13116 true (toIndex!0 lt!660596 mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1525349 () Bool)

(assert (=> b!1525349 (= e!850260 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!660596 mask!2512) #b00000000000000000000000000000000 mask!2512) lt!660596 lt!660597 mask!2512))))

(declare-fun b!1525350 () Bool)

(assert (=> b!1525350 (= e!850262 e!850263)))

(declare-fun res!1043657 () Bool)

(assert (=> b!1525350 (= res!1043657 (and ((_ is Intermediate!13116) lt!660642) (not (undefined!13928 lt!660642)) (bvslt (x!136553 lt!660642) #b01111111111111111111111111111110) (bvsge (x!136553 lt!660642) #b00000000000000000000000000000000) (bvsge (x!136553 lt!660642) #b00000000000000000000000000000000)))))

(assert (=> b!1525350 (=> (not res!1043657) (not e!850263))))

(declare-fun b!1525351 () Bool)

(assert (=> b!1525351 (and (bvsge (index!54861 lt!660642) #b00000000000000000000000000000000) (bvslt (index!54861 lt!660642) (size!49501 lt!660597)))))

(declare-fun res!1043658 () Bool)

(assert (=> b!1525351 (= res!1043658 (= (select (arr!48951 lt!660597) (index!54861 lt!660642)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1525351 (=> res!1043658 e!850259)))

(declare-fun b!1525352 () Bool)

(assert (=> b!1525352 (= e!850261 e!850260)))

(declare-fun c!140395 () Bool)

(assert (=> b!1525352 (= c!140395 (or (= lt!660641 lt!660596) (= (bvadd lt!660641 lt!660641) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!159467 c!140396) b!1525348))

(assert (= (and d!159467 (not c!140396)) b!1525352))

(assert (= (and b!1525352 c!140395) b!1525344))

(assert (= (and b!1525352 (not c!140395)) b!1525349))

(assert (= (and d!159467 c!140394) b!1525347))

(assert (= (and d!159467 (not c!140394)) b!1525350))

(assert (= (and b!1525350 res!1043657) b!1525346))

(assert (= (and b!1525346 (not res!1043659)) b!1525351))

(assert (= (and b!1525351 (not res!1043658)) b!1525345))

(declare-fun m!1408231 () Bool)

(assert (=> b!1525346 m!1408231))

(assert (=> b!1525351 m!1408231))

(assert (=> b!1525349 m!1408119))

(declare-fun m!1408233 () Bool)

(assert (=> b!1525349 m!1408233))

(assert (=> b!1525349 m!1408233))

(declare-fun m!1408235 () Bool)

(assert (=> b!1525349 m!1408235))

(assert (=> b!1525345 m!1408231))

(assert (=> d!159467 m!1408119))

(declare-fun m!1408237 () Bool)

(assert (=> d!159467 m!1408237))

(assert (=> d!159467 m!1408139))

(assert (=> b!1525221 d!159467))

(declare-fun d!159469 () Bool)

(declare-fun lt!660648 () (_ BitVec 32))

(declare-fun lt!660647 () (_ BitVec 32))

(assert (=> d!159469 (= lt!660648 (bvmul (bvxor lt!660647 (bvlshr lt!660647 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159469 (= lt!660647 ((_ extract 31 0) (bvand (bvxor lt!660596 (bvlshr lt!660596 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159469 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1043660 (let ((h!36862 ((_ extract 31 0) (bvand (bvxor lt!660596 (bvlshr lt!660596 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136556 (bvmul (bvxor h!36862 (bvlshr h!36862 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136556 (bvlshr x!136556 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1043660 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1043660 #b00000000000000000000000000000000))))))

(assert (=> d!159469 (= (toIndex!0 lt!660596 mask!2512) (bvand (bvxor lt!660648 (bvlshr lt!660648 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1525221 d!159469))

(declare-fun b!1525365 () Bool)

(declare-fun e!850271 () SeekEntryResult!13116)

(declare-fun lt!660657 () SeekEntryResult!13116)

(assert (=> b!1525365 (= e!850271 (seekKeyOrZeroReturnVacant!0 (x!136553 lt!660657) (index!54861 lt!660657) (index!54861 lt!660657) lt!660596 lt!660597 mask!2512))))

(declare-fun b!1525366 () Bool)

(declare-fun e!850272 () SeekEntryResult!13116)

(assert (=> b!1525366 (= e!850272 (Found!13116 (index!54861 lt!660657)))))

(declare-fun b!1525367 () Bool)

(declare-fun c!140405 () Bool)

(declare-fun lt!660656 () (_ BitVec 64))

(assert (=> b!1525367 (= c!140405 (= lt!660656 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1525367 (= e!850272 e!850271)))

(declare-fun b!1525368 () Bool)

(declare-fun e!850270 () SeekEntryResult!13116)

(assert (=> b!1525368 (= e!850270 e!850272)))

(assert (=> b!1525368 (= lt!660656 (select (arr!48951 lt!660597) (index!54861 lt!660657)))))

(declare-fun c!140404 () Bool)

(assert (=> b!1525368 (= c!140404 (= lt!660656 lt!660596))))

(declare-fun b!1525369 () Bool)

(assert (=> b!1525369 (= e!850271 (MissingZero!13116 (index!54861 lt!660657)))))

(declare-fun b!1525370 () Bool)

(assert (=> b!1525370 (= e!850270 Undefined!13116)))

(declare-fun d!159471 () Bool)

(declare-fun lt!660655 () SeekEntryResult!13116)

(assert (=> d!159471 (and (or ((_ is Undefined!13116) lt!660655) (not ((_ is Found!13116) lt!660655)) (and (bvsge (index!54860 lt!660655) #b00000000000000000000000000000000) (bvslt (index!54860 lt!660655) (size!49501 lt!660597)))) (or ((_ is Undefined!13116) lt!660655) ((_ is Found!13116) lt!660655) (not ((_ is MissingZero!13116) lt!660655)) (and (bvsge (index!54859 lt!660655) #b00000000000000000000000000000000) (bvslt (index!54859 lt!660655) (size!49501 lt!660597)))) (or ((_ is Undefined!13116) lt!660655) ((_ is Found!13116) lt!660655) ((_ is MissingZero!13116) lt!660655) (not ((_ is MissingVacant!13116) lt!660655)) (and (bvsge (index!54862 lt!660655) #b00000000000000000000000000000000) (bvslt (index!54862 lt!660655) (size!49501 lt!660597)))) (or ((_ is Undefined!13116) lt!660655) (ite ((_ is Found!13116) lt!660655) (= (select (arr!48951 lt!660597) (index!54860 lt!660655)) lt!660596) (ite ((_ is MissingZero!13116) lt!660655) (= (select (arr!48951 lt!660597) (index!54859 lt!660655)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13116) lt!660655) (= (select (arr!48951 lt!660597) (index!54862 lt!660655)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!159471 (= lt!660655 e!850270)))

(declare-fun c!140403 () Bool)

(assert (=> d!159471 (= c!140403 (and ((_ is Intermediate!13116) lt!660657) (undefined!13928 lt!660657)))))

(assert (=> d!159471 (= lt!660657 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660596 mask!2512) lt!660596 lt!660597 mask!2512))))

(assert (=> d!159471 (validMask!0 mask!2512)))

(assert (=> d!159471 (= (seekEntryOrOpen!0 lt!660596 lt!660597 mask!2512) lt!660655)))

(assert (= (and d!159471 c!140403) b!1525370))

(assert (= (and d!159471 (not c!140403)) b!1525368))

(assert (= (and b!1525368 c!140404) b!1525366))

(assert (= (and b!1525368 (not c!140404)) b!1525367))

(assert (= (and b!1525367 c!140405) b!1525369))

(assert (= (and b!1525367 (not c!140405)) b!1525365))

(declare-fun m!1408239 () Bool)

(assert (=> b!1525365 m!1408239))

(declare-fun m!1408241 () Bool)

(assert (=> b!1525368 m!1408241))

(declare-fun m!1408243 () Bool)

(assert (=> d!159471 m!1408243))

(declare-fun m!1408245 () Bool)

(assert (=> d!159471 m!1408245))

(declare-fun m!1408247 () Bool)

(assert (=> d!159471 m!1408247))

(assert (=> d!159471 m!1408119))

(assert (=> d!159471 m!1408139))

(assert (=> d!159471 m!1408119))

(assert (=> d!159471 m!1408121))

(assert (=> b!1525224 d!159471))

(declare-fun e!850291 () SeekEntryResult!13116)

(declare-fun b!1525399 () Bool)

(assert (=> b!1525399 (= e!850291 (seekKeyOrZeroReturnVacant!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) index!487 lt!660596 lt!660597 mask!2512))))

(declare-fun b!1525400 () Bool)

(assert (=> b!1525400 (= e!850291 (MissingVacant!13116 index!487))))

(declare-fun lt!660675 () SeekEntryResult!13116)

(declare-fun d!159473 () Bool)

(assert (=> d!159473 (and (or ((_ is Undefined!13116) lt!660675) (not ((_ is Found!13116) lt!660675)) (and (bvsge (index!54860 lt!660675) #b00000000000000000000000000000000) (bvslt (index!54860 lt!660675) (size!49501 lt!660597)))) (or ((_ is Undefined!13116) lt!660675) ((_ is Found!13116) lt!660675) (not ((_ is MissingVacant!13116) lt!660675)) (not (= (index!54862 lt!660675) index!487)) (and (bvsge (index!54862 lt!660675) #b00000000000000000000000000000000) (bvslt (index!54862 lt!660675) (size!49501 lt!660597)))) (or ((_ is Undefined!13116) lt!660675) (ite ((_ is Found!13116) lt!660675) (= (select (arr!48951 lt!660597) (index!54860 lt!660675)) lt!660596) (and ((_ is MissingVacant!13116) lt!660675) (= (index!54862 lt!660675) index!487) (= (select (arr!48951 lt!660597) (index!54862 lt!660675)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!850292 () SeekEntryResult!13116)

(assert (=> d!159473 (= lt!660675 e!850292)))

(declare-fun c!140417 () Bool)

(assert (=> d!159473 (= c!140417 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!660674 () (_ BitVec 64))

(assert (=> d!159473 (= lt!660674 (select (arr!48951 lt!660597) index!487))))

(assert (=> d!159473 (validMask!0 mask!2512)))

(assert (=> d!159473 (= (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660596 lt!660597 mask!2512) lt!660675)))

(declare-fun b!1525401 () Bool)

(declare-fun e!850293 () SeekEntryResult!13116)

(assert (=> b!1525401 (= e!850292 e!850293)))

(declare-fun c!140416 () Bool)

(assert (=> b!1525401 (= c!140416 (= lt!660674 lt!660596))))

(declare-fun b!1525402 () Bool)

(assert (=> b!1525402 (= e!850293 (Found!13116 index!487))))

(declare-fun b!1525403 () Bool)

(assert (=> b!1525403 (= e!850292 Undefined!13116)))

(declare-fun b!1525404 () Bool)

(declare-fun c!140418 () Bool)

(assert (=> b!1525404 (= c!140418 (= lt!660674 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1525404 (= e!850293 e!850291)))

(assert (= (and d!159473 c!140417) b!1525403))

(assert (= (and d!159473 (not c!140417)) b!1525401))

(assert (= (and b!1525401 c!140416) b!1525402))

(assert (= (and b!1525401 (not c!140416)) b!1525404))

(assert (= (and b!1525404 c!140418) b!1525400))

(assert (= (and b!1525404 (not c!140418)) b!1525399))

(assert (=> b!1525399 m!1408205))

(assert (=> b!1525399 m!1408205))

(declare-fun m!1408267 () Bool)

(assert (=> b!1525399 m!1408267))

(declare-fun m!1408269 () Bool)

(assert (=> d!159473 m!1408269))

(declare-fun m!1408271 () Bool)

(assert (=> d!159473 m!1408271))

(declare-fun m!1408273 () Bool)

(assert (=> d!159473 m!1408273))

(assert (=> d!159473 m!1408139))

(assert (=> b!1525224 d!159473))

(declare-fun b!1525405 () Bool)

(declare-fun e!850296 () Bool)

(declare-fun e!850295 () Bool)

(assert (=> b!1525405 (= e!850296 e!850295)))

(declare-fun c!140419 () Bool)

(assert (=> b!1525405 (= c!140419 (validKeyInArray!0 (select (arr!48951 a!2804) j!70)))))

(declare-fun b!1525406 () Bool)

(declare-fun e!850294 () Bool)

(assert (=> b!1525406 (= e!850295 e!850294)))

(declare-fun lt!660678 () (_ BitVec 64))

(assert (=> b!1525406 (= lt!660678 (select (arr!48951 a!2804) j!70))))

(declare-fun lt!660677 () Unit!51016)

(assert (=> b!1525406 (= lt!660677 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660678 j!70))))

(assert (=> b!1525406 (arrayContainsKey!0 a!2804 lt!660678 #b00000000000000000000000000000000)))

(declare-fun lt!660676 () Unit!51016)

(assert (=> b!1525406 (= lt!660676 lt!660677)))

(declare-fun res!1043670 () Bool)

(assert (=> b!1525406 (= res!1043670 (= (seekEntryOrOpen!0 (select (arr!48951 a!2804) j!70) a!2804 mask!2512) (Found!13116 j!70)))))

(assert (=> b!1525406 (=> (not res!1043670) (not e!850294))))

(declare-fun b!1525407 () Bool)

(declare-fun call!68459 () Bool)

(assert (=> b!1525407 (= e!850294 call!68459)))

(declare-fun b!1525408 () Bool)

(assert (=> b!1525408 (= e!850295 call!68459)))

(declare-fun bm!68456 () Bool)

(assert (=> bm!68456 (= call!68459 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!159483 () Bool)

(declare-fun res!1043669 () Bool)

(assert (=> d!159483 (=> res!1043669 e!850296)))

(assert (=> d!159483 (= res!1043669 (bvsge j!70 (size!49501 a!2804)))))

(assert (=> d!159483 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!850296)))

(assert (= (and d!159483 (not res!1043669)) b!1525405))

(assert (= (and b!1525405 c!140419) b!1525406))

(assert (= (and b!1525405 (not c!140419)) b!1525408))

(assert (= (and b!1525406 res!1043670) b!1525407))

(assert (= (or b!1525407 b!1525408) bm!68456))

(assert (=> b!1525405 m!1408113))

(assert (=> b!1525405 m!1408113))

(assert (=> b!1525405 m!1408147))

(assert (=> b!1525406 m!1408113))

(declare-fun m!1408275 () Bool)

(assert (=> b!1525406 m!1408275))

(declare-fun m!1408277 () Bool)

(assert (=> b!1525406 m!1408277))

(assert (=> b!1525406 m!1408113))

(assert (=> b!1525406 m!1408127))

(declare-fun m!1408279 () Bool)

(assert (=> bm!68456 m!1408279))

(assert (=> b!1525223 d!159483))

(declare-fun d!159485 () Bool)

(assert (=> d!159485 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!660684 () Unit!51016)

(declare-fun choose!38 (array!101446 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51016)

(assert (=> d!159485 (= lt!660684 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159485 (validMask!0 mask!2512)))

(assert (=> d!159485 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!660684)))

(declare-fun bs!43769 () Bool)

(assert (= bs!43769 d!159485))

(assert (=> bs!43769 m!1408135))

(declare-fun m!1408283 () Bool)

(assert (=> bs!43769 m!1408283))

(assert (=> bs!43769 m!1408139))

(assert (=> b!1525223 d!159485))

(declare-fun e!850298 () SeekEntryResult!13116)

(declare-fun b!1525409 () Bool)

(assert (=> b!1525409 (= e!850298 (Intermediate!13116 false (toIndex!0 (select (arr!48951 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1525410 () Bool)

(declare-fun lt!660686 () SeekEntryResult!13116)

(assert (=> b!1525410 (and (bvsge (index!54861 lt!660686) #b00000000000000000000000000000000) (bvslt (index!54861 lt!660686) (size!49501 a!2804)))))

(declare-fun e!850297 () Bool)

(assert (=> b!1525410 (= e!850297 (= (select (arr!48951 a!2804) (index!54861 lt!660686)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1525411 () Bool)

(assert (=> b!1525411 (and (bvsge (index!54861 lt!660686) #b00000000000000000000000000000000) (bvslt (index!54861 lt!660686) (size!49501 a!2804)))))

(declare-fun res!1043673 () Bool)

(assert (=> b!1525411 (= res!1043673 (= (select (arr!48951 a!2804) (index!54861 lt!660686)) (select (arr!48951 a!2804) j!70)))))

(assert (=> b!1525411 (=> res!1043673 e!850297)))

(declare-fun e!850301 () Bool)

(assert (=> b!1525411 (= e!850301 e!850297)))

(declare-fun b!1525412 () Bool)

(declare-fun e!850300 () Bool)

(assert (=> b!1525412 (= e!850300 (bvsge (x!136553 lt!660686) #b01111111111111111111111111111110))))

(declare-fun d!159489 () Bool)

(assert (=> d!159489 e!850300))

(declare-fun c!140420 () Bool)

(assert (=> d!159489 (= c!140420 (and ((_ is Intermediate!13116) lt!660686) (undefined!13928 lt!660686)))))

(declare-fun e!850299 () SeekEntryResult!13116)

(assert (=> d!159489 (= lt!660686 e!850299)))

(declare-fun c!140422 () Bool)

(assert (=> d!159489 (= c!140422 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!660685 () (_ BitVec 64))

(assert (=> d!159489 (= lt!660685 (select (arr!48951 a!2804) (toIndex!0 (select (arr!48951 a!2804) j!70) mask!2512)))))

(assert (=> d!159489 (validMask!0 mask!2512)))

(assert (=> d!159489 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48951 a!2804) j!70) mask!2512) (select (arr!48951 a!2804) j!70) a!2804 mask!2512) lt!660686)))

(declare-fun b!1525413 () Bool)

(assert (=> b!1525413 (= e!850299 (Intermediate!13116 true (toIndex!0 (select (arr!48951 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1525414 () Bool)

(assert (=> b!1525414 (= e!850298 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48951 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48951 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525415 () Bool)

(assert (=> b!1525415 (= e!850300 e!850301)))

(declare-fun res!1043671 () Bool)

(assert (=> b!1525415 (= res!1043671 (and ((_ is Intermediate!13116) lt!660686) (not (undefined!13928 lt!660686)) (bvslt (x!136553 lt!660686) #b01111111111111111111111111111110) (bvsge (x!136553 lt!660686) #b00000000000000000000000000000000) (bvsge (x!136553 lt!660686) #b00000000000000000000000000000000)))))

(assert (=> b!1525415 (=> (not res!1043671) (not e!850301))))

(declare-fun b!1525416 () Bool)

(assert (=> b!1525416 (and (bvsge (index!54861 lt!660686) #b00000000000000000000000000000000) (bvslt (index!54861 lt!660686) (size!49501 a!2804)))))

(declare-fun res!1043672 () Bool)

(assert (=> b!1525416 (= res!1043672 (= (select (arr!48951 a!2804) (index!54861 lt!660686)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1525416 (=> res!1043672 e!850297)))

(declare-fun b!1525417 () Bool)

(assert (=> b!1525417 (= e!850299 e!850298)))

(declare-fun c!140421 () Bool)

(assert (=> b!1525417 (= c!140421 (or (= lt!660685 (select (arr!48951 a!2804) j!70)) (= (bvadd lt!660685 lt!660685) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!159489 c!140422) b!1525413))

(assert (= (and d!159489 (not c!140422)) b!1525417))

(assert (= (and b!1525417 c!140421) b!1525409))

(assert (= (and b!1525417 (not c!140421)) b!1525414))

(assert (= (and d!159489 c!140420) b!1525412))

(assert (= (and d!159489 (not c!140420)) b!1525415))

(assert (= (and b!1525415 res!1043671) b!1525411))

(assert (= (and b!1525411 (not res!1043673)) b!1525416))

(assert (= (and b!1525416 (not res!1043672)) b!1525410))

(declare-fun m!1408285 () Bool)

(assert (=> b!1525411 m!1408285))

(assert (=> b!1525416 m!1408285))

(assert (=> b!1525414 m!1408115))

(declare-fun m!1408287 () Bool)

(assert (=> b!1525414 m!1408287))

(assert (=> b!1525414 m!1408287))

(assert (=> b!1525414 m!1408113))

(declare-fun m!1408289 () Bool)

(assert (=> b!1525414 m!1408289))

(assert (=> b!1525410 m!1408285))

(assert (=> d!159489 m!1408115))

(declare-fun m!1408291 () Bool)

(assert (=> d!159489 m!1408291))

(assert (=> d!159489 m!1408139))

(assert (=> b!1525227 d!159489))

(declare-fun d!159491 () Bool)

(declare-fun lt!660688 () (_ BitVec 32))

(declare-fun lt!660687 () (_ BitVec 32))

(assert (=> d!159491 (= lt!660688 (bvmul (bvxor lt!660687 (bvlshr lt!660687 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159491 (= lt!660687 ((_ extract 31 0) (bvand (bvxor (select (arr!48951 a!2804) j!70) (bvlshr (select (arr!48951 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159491 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1043660 (let ((h!36862 ((_ extract 31 0) (bvand (bvxor (select (arr!48951 a!2804) j!70) (bvlshr (select (arr!48951 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136556 (bvmul (bvxor h!36862 (bvlshr h!36862 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136556 (bvlshr x!136556 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1043660 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1043660 #b00000000000000000000000000000000))))))

(assert (=> d!159491 (= (toIndex!0 (select (arr!48951 a!2804) j!70) mask!2512) (bvand (bvxor lt!660688 (bvlshr lt!660688 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1525227 d!159491))

(declare-fun d!159493 () Bool)

(assert (=> d!159493 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129970 d!159493))

(declare-fun d!159497 () Bool)

(assert (=> d!159497 (= (array_inv!37979 a!2804) (bvsge (size!49501 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129970 d!159497))

(declare-fun b!1525436 () Bool)

(declare-fun e!850312 () SeekEntryResult!13116)

(declare-fun lt!660700 () SeekEntryResult!13116)

(assert (=> b!1525436 (= e!850312 (seekKeyOrZeroReturnVacant!0 (x!136553 lt!660700) (index!54861 lt!660700) (index!54861 lt!660700) (select (arr!48951 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525437 () Bool)

(declare-fun e!850313 () SeekEntryResult!13116)

(assert (=> b!1525437 (= e!850313 (Found!13116 (index!54861 lt!660700)))))

(declare-fun b!1525438 () Bool)

(declare-fun c!140434 () Bool)

(declare-fun lt!660699 () (_ BitVec 64))

(assert (=> b!1525438 (= c!140434 (= lt!660699 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1525438 (= e!850313 e!850312)))

(declare-fun b!1525439 () Bool)

(declare-fun e!850311 () SeekEntryResult!13116)

(assert (=> b!1525439 (= e!850311 e!850313)))

(assert (=> b!1525439 (= lt!660699 (select (arr!48951 a!2804) (index!54861 lt!660700)))))

(declare-fun c!140433 () Bool)

(assert (=> b!1525439 (= c!140433 (= lt!660699 (select (arr!48951 a!2804) j!70)))))

(declare-fun b!1525440 () Bool)

(assert (=> b!1525440 (= e!850312 (MissingZero!13116 (index!54861 lt!660700)))))

(declare-fun b!1525441 () Bool)

(assert (=> b!1525441 (= e!850311 Undefined!13116)))

(declare-fun d!159499 () Bool)

(declare-fun lt!660698 () SeekEntryResult!13116)

(assert (=> d!159499 (and (or ((_ is Undefined!13116) lt!660698) (not ((_ is Found!13116) lt!660698)) (and (bvsge (index!54860 lt!660698) #b00000000000000000000000000000000) (bvslt (index!54860 lt!660698) (size!49501 a!2804)))) (or ((_ is Undefined!13116) lt!660698) ((_ is Found!13116) lt!660698) (not ((_ is MissingZero!13116) lt!660698)) (and (bvsge (index!54859 lt!660698) #b00000000000000000000000000000000) (bvslt (index!54859 lt!660698) (size!49501 a!2804)))) (or ((_ is Undefined!13116) lt!660698) ((_ is Found!13116) lt!660698) ((_ is MissingZero!13116) lt!660698) (not ((_ is MissingVacant!13116) lt!660698)) (and (bvsge (index!54862 lt!660698) #b00000000000000000000000000000000) (bvslt (index!54862 lt!660698) (size!49501 a!2804)))) (or ((_ is Undefined!13116) lt!660698) (ite ((_ is Found!13116) lt!660698) (= (select (arr!48951 a!2804) (index!54860 lt!660698)) (select (arr!48951 a!2804) j!70)) (ite ((_ is MissingZero!13116) lt!660698) (= (select (arr!48951 a!2804) (index!54859 lt!660698)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13116) lt!660698) (= (select (arr!48951 a!2804) (index!54862 lt!660698)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!159499 (= lt!660698 e!850311)))

(declare-fun c!140432 () Bool)

(assert (=> d!159499 (= c!140432 (and ((_ is Intermediate!13116) lt!660700) (undefined!13928 lt!660700)))))

(assert (=> d!159499 (= lt!660700 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48951 a!2804) j!70) mask!2512) (select (arr!48951 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159499 (validMask!0 mask!2512)))

(assert (=> d!159499 (= (seekEntryOrOpen!0 (select (arr!48951 a!2804) j!70) a!2804 mask!2512) lt!660698)))

(assert (= (and d!159499 c!140432) b!1525441))

(assert (= (and d!159499 (not c!140432)) b!1525439))

(assert (= (and b!1525439 c!140433) b!1525437))

(assert (= (and b!1525439 (not c!140433)) b!1525438))

(assert (= (and b!1525438 c!140434) b!1525440))

(assert (= (and b!1525438 (not c!140434)) b!1525436))

(assert (=> b!1525436 m!1408113))

(declare-fun m!1408303 () Bool)

(assert (=> b!1525436 m!1408303))

(declare-fun m!1408305 () Bool)

(assert (=> b!1525439 m!1408305))

(declare-fun m!1408307 () Bool)

(assert (=> d!159499 m!1408307))

(declare-fun m!1408309 () Bool)

(assert (=> d!159499 m!1408309))

(declare-fun m!1408311 () Bool)

(assert (=> d!159499 m!1408311))

(assert (=> d!159499 m!1408113))

(assert (=> d!159499 m!1408115))

(assert (=> d!159499 m!1408139))

(assert (=> d!159499 m!1408115))

(assert (=> d!159499 m!1408113))

(assert (=> d!159499 m!1408117))

(assert (=> b!1525216 d!159499))

(declare-fun b!1525442 () Bool)

(declare-fun e!850314 () SeekEntryResult!13116)

(assert (=> b!1525442 (= e!850314 (seekKeyOrZeroReturnVacant!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) index!487 (select (arr!48951 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525443 () Bool)

(assert (=> b!1525443 (= e!850314 (MissingVacant!13116 index!487))))

(declare-fun d!159501 () Bool)

(declare-fun lt!660702 () SeekEntryResult!13116)

(assert (=> d!159501 (and (or ((_ is Undefined!13116) lt!660702) (not ((_ is Found!13116) lt!660702)) (and (bvsge (index!54860 lt!660702) #b00000000000000000000000000000000) (bvslt (index!54860 lt!660702) (size!49501 a!2804)))) (or ((_ is Undefined!13116) lt!660702) ((_ is Found!13116) lt!660702) (not ((_ is MissingVacant!13116) lt!660702)) (not (= (index!54862 lt!660702) index!487)) (and (bvsge (index!54862 lt!660702) #b00000000000000000000000000000000) (bvslt (index!54862 lt!660702) (size!49501 a!2804)))) (or ((_ is Undefined!13116) lt!660702) (ite ((_ is Found!13116) lt!660702) (= (select (arr!48951 a!2804) (index!54860 lt!660702)) (select (arr!48951 a!2804) j!70)) (and ((_ is MissingVacant!13116) lt!660702) (= (index!54862 lt!660702) index!487) (= (select (arr!48951 a!2804) (index!54862 lt!660702)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!850315 () SeekEntryResult!13116)

(assert (=> d!159501 (= lt!660702 e!850315)))

(declare-fun c!140436 () Bool)

(assert (=> d!159501 (= c!140436 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!660701 () (_ BitVec 64))

(assert (=> d!159501 (= lt!660701 (select (arr!48951 a!2804) index!487))))

(assert (=> d!159501 (validMask!0 mask!2512)))

(assert (=> d!159501 (= (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48951 a!2804) j!70) a!2804 mask!2512) lt!660702)))

(declare-fun b!1525444 () Bool)

(declare-fun e!850316 () SeekEntryResult!13116)

(assert (=> b!1525444 (= e!850315 e!850316)))

(declare-fun c!140435 () Bool)

(assert (=> b!1525444 (= c!140435 (= lt!660701 (select (arr!48951 a!2804) j!70)))))

(declare-fun b!1525445 () Bool)

(assert (=> b!1525445 (= e!850316 (Found!13116 index!487))))

(declare-fun b!1525446 () Bool)

(assert (=> b!1525446 (= e!850315 Undefined!13116)))

(declare-fun b!1525447 () Bool)

(declare-fun c!140437 () Bool)

(assert (=> b!1525447 (= c!140437 (= lt!660701 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1525447 (= e!850316 e!850314)))

(assert (= (and d!159501 c!140436) b!1525446))

(assert (= (and d!159501 (not c!140436)) b!1525444))

(assert (= (and b!1525444 c!140435) b!1525445))

(assert (= (and b!1525444 (not c!140435)) b!1525447))

(assert (= (and b!1525447 c!140437) b!1525443))

(assert (= (and b!1525447 (not c!140437)) b!1525442))

(assert (=> b!1525442 m!1408205))

(assert (=> b!1525442 m!1408205))

(assert (=> b!1525442 m!1408113))

(declare-fun m!1408313 () Bool)

(assert (=> b!1525442 m!1408313))

(declare-fun m!1408315 () Bool)

(assert (=> d!159501 m!1408315))

(declare-fun m!1408317 () Bool)

(assert (=> d!159501 m!1408317))

(assert (=> d!159501 m!1408133))

(assert (=> d!159501 m!1408139))

(assert (=> b!1525216 d!159501))

(check-sat (not b!1525405) (not b!1525295) (not d!159489) (not b!1525349) (not b!1525436) (not d!159501) (not b!1525327) (not bm!68448) (not b!1525315) (not d!159499) (not b!1525328) (not bm!68451) (not b!1525330) (not d!159485) (not d!159467) (not d!159471) (not b!1525341) (not b!1525406) (not b!1525365) (not b!1525414) (not d!159455) (not b!1525442) (not d!159457) (not d!159473) (not bm!68456) (not b!1525340) (not b!1525399))
(check-sat)
