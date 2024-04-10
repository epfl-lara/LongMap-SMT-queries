; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129972 () Bool)

(assert start!129972)

(declare-fun b!1525258 () Bool)

(declare-fun res!1043625 () Bool)

(declare-fun e!850210 () Bool)

(assert (=> b!1525258 (=> (not res!1043625) (not e!850210))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101448 0))(
  ( (array!101449 (arr!48952 (Array (_ BitVec 32) (_ BitVec 64))) (size!49502 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101448)

(declare-datatypes ((SeekEntryResult!13117 0))(
  ( (MissingZero!13117 (index!54863 (_ BitVec 32))) (Found!13117 (index!54864 (_ BitVec 32))) (Intermediate!13117 (undefined!13929 Bool) (index!54865 (_ BitVec 32)) (x!136554 (_ BitVec 32))) (Undefined!13117) (MissingVacant!13117 (index!54866 (_ BitVec 32))) )
))
(declare-fun lt!660609 () SeekEntryResult!13117)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101448 (_ BitVec 32)) SeekEntryResult!13117)

(assert (=> b!1525258 (= res!1043625 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48952 a!2804) j!70) a!2804 mask!2512) lt!660609))))

(declare-fun b!1525259 () Bool)

(declare-fun res!1043619 () Bool)

(declare-fun e!850207 () Bool)

(assert (=> b!1525259 (=> (not res!1043619) (not e!850207))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1525259 (= res!1043619 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49502 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49502 a!2804))))))

(declare-fun b!1525260 () Bool)

(declare-fun res!1043627 () Bool)

(assert (=> b!1525260 (=> (not res!1043627) (not e!850207))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525260 (= res!1043627 (validKeyInArray!0 (select (arr!48952 a!2804) j!70)))))

(declare-fun b!1525261 () Bool)

(declare-fun e!850213 () Bool)

(declare-fun e!850208 () Bool)

(assert (=> b!1525261 (= e!850213 (not e!850208))))

(declare-fun res!1043628 () Bool)

(assert (=> b!1525261 (=> res!1043628 e!850208)))

(declare-fun lt!660612 () (_ BitVec 64))

(assert (=> b!1525261 (= res!1043628 (or (not (= (select (arr!48952 a!2804) j!70) lt!660612)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48952 a!2804) index!487) (select (arr!48952 a!2804) j!70)) (not (= (select (arr!48952 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!850212 () Bool)

(assert (=> b!1525261 e!850212))

(declare-fun res!1043632 () Bool)

(assert (=> b!1525261 (=> (not res!1043632) (not e!850212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101448 (_ BitVec 32)) Bool)

(assert (=> b!1525261 (= res!1043632 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51018 0))(
  ( (Unit!51019) )
))
(declare-fun lt!660610 () Unit!51018)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101448 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51018)

(assert (=> b!1525261 (= lt!660610 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1525262 () Bool)

(declare-fun e!850209 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101448 (_ BitVec 32)) SeekEntryResult!13117)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101448 (_ BitVec 32)) SeekEntryResult!13117)

(assert (=> b!1525262 (= e!850209 (= (seekEntryOrOpen!0 (select (arr!48952 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48952 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1525263 () Bool)

(declare-fun res!1043631 () Bool)

(assert (=> b!1525263 (=> (not res!1043631) (not e!850212))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101448 (_ BitVec 32)) SeekEntryResult!13117)

(assert (=> b!1525263 (= res!1043631 (= (seekEntry!0 (select (arr!48952 a!2804) j!70) a!2804 mask!2512) (Found!13117 j!70)))))

(declare-fun b!1525264 () Bool)

(assert (=> b!1525264 (= e!850207 e!850210)))

(declare-fun res!1043622 () Bool)

(assert (=> b!1525264 (=> (not res!1043622) (not e!850210))))

(declare-fun lt!660611 () SeekEntryResult!13117)

(assert (=> b!1525264 (= res!1043622 (= lt!660611 lt!660609))))

(assert (=> b!1525264 (= lt!660609 (Intermediate!13117 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525264 (= lt!660611 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48952 a!2804) j!70) mask!2512) (select (arr!48952 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525265 () Bool)

(declare-fun res!1043623 () Bool)

(assert (=> b!1525265 (=> (not res!1043623) (not e!850207))))

(declare-datatypes ((List!35435 0))(
  ( (Nil!35432) (Cons!35431 (h!36861 (_ BitVec 64)) (t!50129 List!35435)) )
))
(declare-fun arrayNoDuplicates!0 (array!101448 (_ BitVec 32) List!35435) Bool)

(assert (=> b!1525265 (= res!1043623 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35432))))

(declare-fun b!1525266 () Bool)

(assert (=> b!1525266 (= e!850212 e!850209)))

(declare-fun res!1043630 () Bool)

(assert (=> b!1525266 (=> res!1043630 e!850209)))

(assert (=> b!1525266 (= res!1043630 (or (not (= (select (arr!48952 a!2804) j!70) lt!660612)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48952 a!2804) index!487) (select (arr!48952 a!2804) j!70)) (not (= (select (arr!48952 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1525267 () Bool)

(declare-fun res!1043620 () Bool)

(assert (=> b!1525267 (=> (not res!1043620) (not e!850207))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1525267 (= res!1043620 (and (= (size!49502 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49502 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49502 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1525269 () Bool)

(declare-fun lt!660613 () array!101448)

(assert (=> b!1525269 (= e!850208 (= (seekEntryOrOpen!0 lt!660612 lt!660613 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660612 lt!660613 mask!2512)))))

(declare-fun b!1525268 () Bool)

(declare-fun res!1043624 () Bool)

(assert (=> b!1525268 (=> (not res!1043624) (not e!850207))))

(assert (=> b!1525268 (= res!1043624 (validKeyInArray!0 (select (arr!48952 a!2804) i!961)))))

(declare-fun res!1043621 () Bool)

(assert (=> start!129972 (=> (not res!1043621) (not e!850207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129972 (= res!1043621 (validMask!0 mask!2512))))

(assert (=> start!129972 e!850207))

(assert (=> start!129972 true))

(declare-fun array_inv!37980 (array!101448) Bool)

(assert (=> start!129972 (array_inv!37980 a!2804)))

(declare-fun b!1525270 () Bool)

(assert (=> b!1525270 (= e!850210 e!850213)))

(declare-fun res!1043626 () Bool)

(assert (=> b!1525270 (=> (not res!1043626) (not e!850213))))

(assert (=> b!1525270 (= res!1043626 (= lt!660611 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660612 mask!2512) lt!660612 lt!660613 mask!2512)))))

(assert (=> b!1525270 (= lt!660612 (select (store (arr!48952 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1525270 (= lt!660613 (array!101449 (store (arr!48952 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49502 a!2804)))))

(declare-fun b!1525271 () Bool)

(declare-fun res!1043629 () Bool)

(assert (=> b!1525271 (=> (not res!1043629) (not e!850207))))

(assert (=> b!1525271 (= res!1043629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129972 res!1043621) b!1525267))

(assert (= (and b!1525267 res!1043620) b!1525268))

(assert (= (and b!1525268 res!1043624) b!1525260))

(assert (= (and b!1525260 res!1043627) b!1525271))

(assert (= (and b!1525271 res!1043629) b!1525265))

(assert (= (and b!1525265 res!1043623) b!1525259))

(assert (= (and b!1525259 res!1043619) b!1525264))

(assert (= (and b!1525264 res!1043622) b!1525258))

(assert (= (and b!1525258 res!1043625) b!1525270))

(assert (= (and b!1525270 res!1043626) b!1525261))

(assert (= (and b!1525261 res!1043632) b!1525263))

(assert (= (and b!1525263 res!1043631) b!1525266))

(assert (= (and b!1525266 (not res!1043630)) b!1525262))

(assert (= (and b!1525261 (not res!1043628)) b!1525269))

(declare-fun m!1408157 () Bool)

(assert (=> b!1525271 m!1408157))

(declare-fun m!1408159 () Bool)

(assert (=> b!1525260 m!1408159))

(assert (=> b!1525260 m!1408159))

(declare-fun m!1408161 () Bool)

(assert (=> b!1525260 m!1408161))

(declare-fun m!1408163 () Bool)

(assert (=> b!1525268 m!1408163))

(assert (=> b!1525268 m!1408163))

(declare-fun m!1408165 () Bool)

(assert (=> b!1525268 m!1408165))

(declare-fun m!1408167 () Bool)

(assert (=> b!1525269 m!1408167))

(declare-fun m!1408169 () Bool)

(assert (=> b!1525269 m!1408169))

(assert (=> b!1525266 m!1408159))

(declare-fun m!1408171 () Bool)

(assert (=> b!1525266 m!1408171))

(assert (=> b!1525258 m!1408159))

(assert (=> b!1525258 m!1408159))

(declare-fun m!1408173 () Bool)

(assert (=> b!1525258 m!1408173))

(declare-fun m!1408175 () Bool)

(assert (=> b!1525270 m!1408175))

(assert (=> b!1525270 m!1408175))

(declare-fun m!1408177 () Bool)

(assert (=> b!1525270 m!1408177))

(declare-fun m!1408179 () Bool)

(assert (=> b!1525270 m!1408179))

(declare-fun m!1408181 () Bool)

(assert (=> b!1525270 m!1408181))

(declare-fun m!1408183 () Bool)

(assert (=> b!1525265 m!1408183))

(assert (=> b!1525264 m!1408159))

(assert (=> b!1525264 m!1408159))

(declare-fun m!1408185 () Bool)

(assert (=> b!1525264 m!1408185))

(assert (=> b!1525264 m!1408185))

(assert (=> b!1525264 m!1408159))

(declare-fun m!1408187 () Bool)

(assert (=> b!1525264 m!1408187))

(assert (=> b!1525263 m!1408159))

(assert (=> b!1525263 m!1408159))

(declare-fun m!1408189 () Bool)

(assert (=> b!1525263 m!1408189))

(assert (=> b!1525261 m!1408159))

(assert (=> b!1525261 m!1408171))

(declare-fun m!1408191 () Bool)

(assert (=> b!1525261 m!1408191))

(declare-fun m!1408193 () Bool)

(assert (=> b!1525261 m!1408193))

(declare-fun m!1408195 () Bool)

(assert (=> start!129972 m!1408195))

(declare-fun m!1408197 () Bool)

(assert (=> start!129972 m!1408197))

(assert (=> b!1525262 m!1408159))

(assert (=> b!1525262 m!1408159))

(declare-fun m!1408199 () Bool)

(assert (=> b!1525262 m!1408199))

(assert (=> b!1525262 m!1408159))

(declare-fun m!1408201 () Bool)

(assert (=> b!1525262 m!1408201))

(push 1)

(assert (not b!1525265))

(assert (not b!1525262))

(assert (not b!1525260))

(assert (not b!1525269))

(assert (not b!1525258))

(assert (not start!129972))

(assert (not b!1525263))

(assert (not b!1525271))

(assert (not b!1525270))

(assert (not b!1525261))

(assert (not b!1525264))

(assert (not b!1525268))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1525391 () Bool)

(declare-fun e!850286 () Bool)

(declare-fun call!68457 () Bool)

(assert (=> b!1525391 (= e!850286 call!68457)))

(declare-fun b!1525392 () Bool)

(declare-fun e!850285 () Bool)

(assert (=> b!1525392 (= e!850285 call!68457)))

(declare-fun d!159475 () Bool)

(declare-fun res!1043666 () Bool)

(declare-fun e!850287 () Bool)

(assert (=> d!159475 (=> res!1043666 e!850287)))

(assert (=> d!159475 (= res!1043666 (bvsge #b00000000000000000000000000000000 (size!49502 a!2804)))))

(assert (=> d!159475 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!850287)))

(declare-fun b!1525393 () Bool)

(assert (=> b!1525393 (= e!850287 e!850285)))

(declare-fun c!140414 () Bool)

(assert (=> b!1525393 (= c!140414 (validKeyInArray!0 (select (arr!48952 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1525394 () Bool)

(assert (=> b!1525394 (= e!850285 e!850286)))

(declare-fun lt!660668 () (_ BitVec 64))

(assert (=> b!1525394 (= lt!660668 (select (arr!48952 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!660669 () Unit!51018)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101448 (_ BitVec 64) (_ BitVec 32)) Unit!51018)

(assert (=> b!1525394 (= lt!660669 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660668 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101448 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1525394 (arrayContainsKey!0 a!2804 lt!660668 #b00000000000000000000000000000000)))

(declare-fun lt!660670 () Unit!51018)

(assert (=> b!1525394 (= lt!660670 lt!660669)))

(declare-fun res!1043665 () Bool)

(assert (=> b!1525394 (= res!1043665 (= (seekEntryOrOpen!0 (select (arr!48952 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13117 #b00000000000000000000000000000000)))))

(assert (=> b!1525394 (=> (not res!1043665) (not e!850286))))

(declare-fun bm!68454 () Bool)

(assert (=> bm!68454 (= call!68457 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!159475 (not res!1043666)) b!1525393))

(assert (= (and b!1525393 c!140414) b!1525394))

(assert (= (and b!1525393 (not c!140414)) b!1525392))

(assert (= (and b!1525394 res!1043665) b!1525391))

(assert (= (or b!1525391 b!1525392) bm!68454))

(declare-fun m!1408249 () Bool)

(assert (=> b!1525393 m!1408249))

(assert (=> b!1525393 m!1408249))

(declare-fun m!1408251 () Bool)

(assert (=> b!1525393 m!1408251))

(assert (=> b!1525394 m!1408249))

(declare-fun m!1408253 () Bool)

(assert (=> b!1525394 m!1408253))

(declare-fun m!1408255 () Bool)

(assert (=> b!1525394 m!1408255))

(assert (=> b!1525394 m!1408249))

(declare-fun m!1408257 () Bool)

(assert (=> b!1525394 m!1408257))

(declare-fun m!1408259 () Bool)

(assert (=> bm!68454 m!1408259))

(assert (=> b!1525271 d!159475))

(declare-fun b!1525395 () Bool)

(declare-fun e!850289 () Bool)

(declare-fun call!68458 () Bool)

(assert (=> b!1525395 (= e!850289 call!68458)))

(declare-fun b!1525396 () Bool)

(declare-fun e!850288 () Bool)

(assert (=> b!1525396 (= e!850288 call!68458)))

(declare-fun d!159479 () Bool)

(declare-fun res!1043668 () Bool)

(declare-fun e!850290 () Bool)

(assert (=> d!159479 (=> res!1043668 e!850290)))

(assert (=> d!159479 (= res!1043668 (bvsge j!70 (size!49502 a!2804)))))

(assert (=> d!159479 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!850290)))

(declare-fun b!1525397 () Bool)

(assert (=> b!1525397 (= e!850290 e!850288)))

(declare-fun c!140415 () Bool)

(assert (=> b!1525397 (= c!140415 (validKeyInArray!0 (select (arr!48952 a!2804) j!70)))))

(declare-fun b!1525398 () Bool)

(assert (=> b!1525398 (= e!850288 e!850289)))

(declare-fun lt!660671 () (_ BitVec 64))

(assert (=> b!1525398 (= lt!660671 (select (arr!48952 a!2804) j!70))))

(declare-fun lt!660672 () Unit!51018)

(assert (=> b!1525398 (= lt!660672 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!660671 j!70))))

(assert (=> b!1525398 (arrayContainsKey!0 a!2804 lt!660671 #b00000000000000000000000000000000)))

(declare-fun lt!660673 () Unit!51018)

(assert (=> b!1525398 (= lt!660673 lt!660672)))

(declare-fun res!1043667 () Bool)

(assert (=> b!1525398 (= res!1043667 (= (seekEntryOrOpen!0 (select (arr!48952 a!2804) j!70) a!2804 mask!2512) (Found!13117 j!70)))))

(assert (=> b!1525398 (=> (not res!1043667) (not e!850289))))

(declare-fun bm!68455 () Bool)

(assert (=> bm!68455 (= call!68458 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!159479 (not res!1043668)) b!1525397))

(assert (= (and b!1525397 c!140415) b!1525398))

(assert (= (and b!1525397 (not c!140415)) b!1525396))

(assert (= (and b!1525398 res!1043667) b!1525395))

(assert (= (or b!1525395 b!1525396) bm!68455))

(assert (=> b!1525397 m!1408159))

(assert (=> b!1525397 m!1408159))

(assert (=> b!1525397 m!1408161))

(assert (=> b!1525398 m!1408159))

(declare-fun m!1408261 () Bool)

(assert (=> b!1525398 m!1408261))

(declare-fun m!1408263 () Bool)

(assert (=> b!1525398 m!1408263))

(assert (=> b!1525398 m!1408159))

(assert (=> b!1525398 m!1408199))

(declare-fun m!1408265 () Bool)

(assert (=> bm!68455 m!1408265))

(assert (=> b!1525261 d!159479))

(declare-fun d!159481 () Bool)

(assert (=> d!159481 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!660681 () Unit!51018)

(declare-fun choose!38 (array!101448 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51018)

(assert (=> d!159481 (= lt!660681 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159481 (validMask!0 mask!2512)))

(assert (=> d!159481 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!660681)))

(declare-fun bs!43768 () Bool)

(assert (= bs!43768 d!159481))

(assert (=> bs!43768 m!1408191))

(declare-fun m!1408281 () Bool)

(assert (=> bs!43768 m!1408281))

(assert (=> bs!43768 m!1408195))

(assert (=> b!1525261 d!159481))

(declare-fun b!1525467 () Bool)

(declare-fun e!850331 () SeekEntryResult!13117)

(assert (=> b!1525467 (= e!850331 (Intermediate!13117 true (toIndex!0 lt!660612 mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1525468 () Bool)

(declare-fun e!850328 () Bool)

(declare-fun e!850327 () Bool)

(assert (=> b!1525468 (= e!850328 e!850327)))

(declare-fun res!1043681 () Bool)

(declare-fun lt!660708 () SeekEntryResult!13117)

(assert (=> b!1525468 (= res!1043681 (and (is-Intermediate!13117 lt!660708) (not (undefined!13929 lt!660708)) (bvslt (x!136554 lt!660708) #b01111111111111111111111111111110) (bvsge (x!136554 lt!660708) #b00000000000000000000000000000000) (bvsge (x!136554 lt!660708) #b00000000000000000000000000000000)))))

(assert (=> b!1525468 (=> (not res!1043681) (not e!850327))))

(declare-fun b!1525469 () Bool)

(declare-fun e!850330 () SeekEntryResult!13117)

(assert (=> b!1525469 (= e!850331 e!850330)))

(declare-fun c!140445 () Bool)

(declare-fun lt!660707 () (_ BitVec 64))

(assert (=> b!1525469 (= c!140445 (or (= lt!660707 lt!660612) (= (bvadd lt!660707 lt!660707) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1525470 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525470 (= e!850330 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!660612 mask!2512) #b00000000000000000000000000000000 mask!2512) lt!660612 lt!660613 mask!2512))))

(declare-fun d!159487 () Bool)

(assert (=> d!159487 e!850328))

(declare-fun c!140444 () Bool)

(assert (=> d!159487 (= c!140444 (and (is-Intermediate!13117 lt!660708) (undefined!13929 lt!660708)))))

(assert (=> d!159487 (= lt!660708 e!850331)))

(declare-fun c!140446 () Bool)

(assert (=> d!159487 (= c!140446 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159487 (= lt!660707 (select (arr!48952 lt!660613) (toIndex!0 lt!660612 mask!2512)))))

(assert (=> d!159487 (validMask!0 mask!2512)))

(assert (=> d!159487 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660612 mask!2512) lt!660612 lt!660613 mask!2512) lt!660708)))

(declare-fun b!1525466 () Bool)

(assert (=> b!1525466 (and (bvsge (index!54865 lt!660708) #b00000000000000000000000000000000) (bvslt (index!54865 lt!660708) (size!49502 lt!660613)))))

(declare-fun res!1043682 () Bool)

(assert (=> b!1525466 (= res!1043682 (= (select (arr!48952 lt!660613) (index!54865 lt!660708)) lt!660612))))

(declare-fun e!850329 () Bool)

(assert (=> b!1525466 (=> res!1043682 e!850329)))

(assert (=> b!1525466 (= e!850327 e!850329)))

(declare-fun b!1525471 () Bool)

(assert (=> b!1525471 (and (bvsge (index!54865 lt!660708) #b00000000000000000000000000000000) (bvslt (index!54865 lt!660708) (size!49502 lt!660613)))))

(declare-fun res!1043680 () Bool)

(assert (=> b!1525471 (= res!1043680 (= (select (arr!48952 lt!660613) (index!54865 lt!660708)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1525471 (=> res!1043680 e!850329)))

(declare-fun b!1525472 () Bool)

(assert (=> b!1525472 (= e!850328 (bvsge (x!136554 lt!660708) #b01111111111111111111111111111110))))

(declare-fun b!1525473 () Bool)

(assert (=> b!1525473 (= e!850330 (Intermediate!13117 false (toIndex!0 lt!660612 mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1525474 () Bool)

(assert (=> b!1525474 (and (bvsge (index!54865 lt!660708) #b00000000000000000000000000000000) (bvslt (index!54865 lt!660708) (size!49502 lt!660613)))))

(assert (=> b!1525474 (= e!850329 (= (select (arr!48952 lt!660613) (index!54865 lt!660708)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!159487 c!140446) b!1525467))

(assert (= (and d!159487 (not c!140446)) b!1525469))

(assert (= (and b!1525469 c!140445) b!1525473))

(assert (= (and b!1525469 (not c!140445)) b!1525470))

(assert (= (and d!159487 c!140444) b!1525472))

(assert (= (and d!159487 (not c!140444)) b!1525468))

(assert (= (and b!1525468 res!1043681) b!1525466))

(assert (= (and b!1525466 (not res!1043682)) b!1525471))

(assert (= (and b!1525471 (not res!1043680)) b!1525474))

(declare-fun m!1408319 () Bool)

(assert (=> b!1525474 m!1408319))

(assert (=> b!1525470 m!1408175))

(declare-fun m!1408321 () Bool)

(assert (=> b!1525470 m!1408321))

(assert (=> b!1525470 m!1408321))

(declare-fun m!1408323 () Bool)

(assert (=> b!1525470 m!1408323))

(assert (=> b!1525466 m!1408319))

(assert (=> b!1525471 m!1408319))

(assert (=> d!159487 m!1408175))

(declare-fun m!1408325 () Bool)

(assert (=> d!159487 m!1408325))

(assert (=> d!159487 m!1408195))

(assert (=> b!1525270 d!159487))

(declare-fun d!159503 () Bool)

(declare-fun lt!660718 () (_ BitVec 32))

(declare-fun lt!660717 () (_ BitVec 32))

(assert (=> d!159503 (= lt!660718 (bvmul (bvxor lt!660717 (bvlshr lt!660717 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159503 (= lt!660717 ((_ extract 31 0) (bvand (bvxor lt!660612 (bvlshr lt!660612 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159503 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1043683 (let ((h!36863 ((_ extract 31 0) (bvand (bvxor lt!660612 (bvlshr lt!660612 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136559 (bvmul (bvxor h!36863 (bvlshr h!36863 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136559 (bvlshr x!136559 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1043683 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1043683 #b00000000000000000000000000000000))))))

(assert (=> d!159503 (= (toIndex!0 lt!660612 mask!2512) (bvand (bvxor lt!660718 (bvlshr lt!660718 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1525270 d!159503))

(declare-fun d!159505 () Bool)

(assert (=> d!159505 (= (validKeyInArray!0 (select (arr!48952 a!2804) j!70)) (and (not (= (select (arr!48952 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48952 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1525260 d!159505))

(declare-fun b!1525528 () Bool)

(declare-fun e!850365 () SeekEntryResult!13117)

(declare-fun e!850366 () SeekEntryResult!13117)

(assert (=> b!1525528 (= e!850365 e!850366)))

(declare-fun lt!660736 () (_ BitVec 64))

(declare-fun lt!660735 () SeekEntryResult!13117)

(assert (=> b!1525528 (= lt!660736 (select (arr!48952 a!2804) (index!54865 lt!660735)))))

(declare-fun c!140468 () Bool)

(assert (=> b!1525528 (= c!140468 (= lt!660736 (select (arr!48952 a!2804) j!70)))))

(declare-fun b!1525529 () Bool)

(assert (=> b!1525529 (= e!850365 Undefined!13117)))

(declare-fun b!1525530 () Bool)

(declare-fun e!850367 () SeekEntryResult!13117)

(declare-fun lt!660737 () SeekEntryResult!13117)

(assert (=> b!1525530 (= e!850367 (ite (is-MissingVacant!13117 lt!660737) (MissingZero!13117 (index!54866 lt!660737)) lt!660737))))

(assert (=> b!1525530 (= lt!660737 (seekKeyOrZeroReturnVacant!0 (x!136554 lt!660735) (index!54865 lt!660735) (index!54865 lt!660735) (select (arr!48952 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525531 () Bool)

(declare-fun c!140469 () Bool)

(assert (=> b!1525531 (= c!140469 (= lt!660736 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1525531 (= e!850366 e!850367)))

(declare-fun d!159509 () Bool)

(declare-fun lt!660738 () SeekEntryResult!13117)

(assert (=> d!159509 (and (or (is-MissingVacant!13117 lt!660738) (not (is-Found!13117 lt!660738)) (and (bvsge (index!54864 lt!660738) #b00000000000000000000000000000000) (bvslt (index!54864 lt!660738) (size!49502 a!2804)))) (not (is-MissingVacant!13117 lt!660738)) (or (not (is-Found!13117 lt!660738)) (= (select (arr!48952 a!2804) (index!54864 lt!660738)) (select (arr!48952 a!2804) j!70))))))

(assert (=> d!159509 (= lt!660738 e!850365)))

(declare-fun c!140467 () Bool)

(assert (=> d!159509 (= c!140467 (and (is-Intermediate!13117 lt!660735) (undefined!13929 lt!660735)))))

(assert (=> d!159509 (= lt!660735 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48952 a!2804) j!70) mask!2512) (select (arr!48952 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159509 (validMask!0 mask!2512)))

(assert (=> d!159509 (= (seekEntry!0 (select (arr!48952 a!2804) j!70) a!2804 mask!2512) lt!660738)))

(declare-fun b!1525532 () Bool)

(assert (=> b!1525532 (= e!850367 (MissingZero!13117 (index!54865 lt!660735)))))

(declare-fun b!1525533 () Bool)

(assert (=> b!1525533 (= e!850366 (Found!13117 (index!54865 lt!660735)))))

(assert (= (and d!159509 c!140467) b!1525529))

(assert (= (and d!159509 (not c!140467)) b!1525528))

(assert (= (and b!1525528 c!140468) b!1525533))

(assert (= (and b!1525528 (not c!140468)) b!1525531))

(assert (= (and b!1525531 c!140469) b!1525532))

(assert (= (and b!1525531 (not c!140469)) b!1525530))

(declare-fun m!1408345 () Bool)

(assert (=> b!1525528 m!1408345))

(assert (=> b!1525530 m!1408159))

(declare-fun m!1408347 () Bool)

(assert (=> b!1525530 m!1408347))

(declare-fun m!1408349 () Bool)

(assert (=> d!159509 m!1408349))

(assert (=> d!159509 m!1408159))

(assert (=> d!159509 m!1408185))

(assert (=> d!159509 m!1408185))

(assert (=> d!159509 m!1408159))

(assert (=> d!159509 m!1408187))

(assert (=> d!159509 m!1408195))

(assert (=> b!1525263 d!159509))

(declare-fun e!850372 () SeekEntryResult!13117)

(declare-fun b!1525535 () Bool)

(assert (=> b!1525535 (= e!850372 (Intermediate!13117 true (toIndex!0 (select (arr!48952 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1525536 () Bool)

(declare-fun e!850369 () Bool)

(declare-fun e!850368 () Bool)

(assert (=> b!1525536 (= e!850369 e!850368)))

(declare-fun res!1043698 () Bool)

(declare-fun lt!660740 () SeekEntryResult!13117)

(assert (=> b!1525536 (= res!1043698 (and (is-Intermediate!13117 lt!660740) (not (undefined!13929 lt!660740)) (bvslt (x!136554 lt!660740) #b01111111111111111111111111111110) (bvsge (x!136554 lt!660740) #b00000000000000000000000000000000) (bvsge (x!136554 lt!660740) #b00000000000000000000000000000000)))))

(assert (=> b!1525536 (=> (not res!1043698) (not e!850368))))

(declare-fun b!1525537 () Bool)

(declare-fun e!850371 () SeekEntryResult!13117)

(assert (=> b!1525537 (= e!850372 e!850371)))

(declare-fun c!140471 () Bool)

(declare-fun lt!660739 () (_ BitVec 64))

(assert (=> b!1525537 (= c!140471 (or (= lt!660739 (select (arr!48952 a!2804) j!70)) (= (bvadd lt!660739 lt!660739) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1525538 () Bool)

(assert (=> b!1525538 (= e!850371 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48952 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48952 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!159515 () Bool)

(assert (=> d!159515 e!850369))

(declare-fun c!140470 () Bool)

(assert (=> d!159515 (= c!140470 (and (is-Intermediate!13117 lt!660740) (undefined!13929 lt!660740)))))

(assert (=> d!159515 (= lt!660740 e!850372)))

(declare-fun c!140472 () Bool)

(assert (=> d!159515 (= c!140472 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!159515 (= lt!660739 (select (arr!48952 a!2804) (toIndex!0 (select (arr!48952 a!2804) j!70) mask!2512)))))

(assert (=> d!159515 (validMask!0 mask!2512)))

(assert (=> d!159515 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48952 a!2804) j!70) mask!2512) (select (arr!48952 a!2804) j!70) a!2804 mask!2512) lt!660740)))

(declare-fun b!1525534 () Bool)

(assert (=> b!1525534 (and (bvsge (index!54865 lt!660740) #b00000000000000000000000000000000) (bvslt (index!54865 lt!660740) (size!49502 a!2804)))))

(declare-fun res!1043699 () Bool)

(assert (=> b!1525534 (= res!1043699 (= (select (arr!48952 a!2804) (index!54865 lt!660740)) (select (arr!48952 a!2804) j!70)))))

(declare-fun e!850370 () Bool)

(assert (=> b!1525534 (=> res!1043699 e!850370)))

(assert (=> b!1525534 (= e!850368 e!850370)))

(declare-fun b!1525539 () Bool)

(assert (=> b!1525539 (and (bvsge (index!54865 lt!660740) #b00000000000000000000000000000000) (bvslt (index!54865 lt!660740) (size!49502 a!2804)))))

(declare-fun res!1043697 () Bool)

(assert (=> b!1525539 (= res!1043697 (= (select (arr!48952 a!2804) (index!54865 lt!660740)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1525539 (=> res!1043697 e!850370)))

(declare-fun b!1525540 () Bool)

(assert (=> b!1525540 (= e!850369 (bvsge (x!136554 lt!660740) #b01111111111111111111111111111110))))

(declare-fun b!1525541 () Bool)

(assert (=> b!1525541 (= e!850371 (Intermediate!13117 false (toIndex!0 (select (arr!48952 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1525542 () Bool)

(assert (=> b!1525542 (and (bvsge (index!54865 lt!660740) #b00000000000000000000000000000000) (bvslt (index!54865 lt!660740) (size!49502 a!2804)))))

(assert (=> b!1525542 (= e!850370 (= (select (arr!48952 a!2804) (index!54865 lt!660740)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!159515 c!140472) b!1525535))

(assert (= (and d!159515 (not c!140472)) b!1525537))

(assert (= (and b!1525537 c!140471) b!1525541))

(assert (= (and b!1525537 (not c!140471)) b!1525538))

(assert (= (and d!159515 c!140470) b!1525540))

(assert (= (and d!159515 (not c!140470)) b!1525536))

(assert (= (and b!1525536 res!1043698) b!1525534))

(assert (= (and b!1525534 (not res!1043699)) b!1525539))

(assert (= (and b!1525539 (not res!1043697)) b!1525542))

(declare-fun m!1408351 () Bool)

(assert (=> b!1525542 m!1408351))

(assert (=> b!1525538 m!1408185))

(declare-fun m!1408353 () Bool)

(assert (=> b!1525538 m!1408353))

(assert (=> b!1525538 m!1408353))

(assert (=> b!1525538 m!1408159))

(declare-fun m!1408355 () Bool)

(assert (=> b!1525538 m!1408355))

(assert (=> b!1525534 m!1408351))

(assert (=> b!1525539 m!1408351))

(assert (=> d!159515 m!1408185))

(declare-fun m!1408357 () Bool)

(assert (=> d!159515 m!1408357))

(assert (=> d!159515 m!1408195))

(assert (=> b!1525264 d!159515))

(declare-fun d!159517 () Bool)

(declare-fun lt!660742 () (_ BitVec 32))

(declare-fun lt!660741 () (_ BitVec 32))

(assert (=> d!159517 (= lt!660742 (bvmul (bvxor lt!660741 (bvlshr lt!660741 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

