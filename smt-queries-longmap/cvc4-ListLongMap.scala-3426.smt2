; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47548 () Bool)

(assert start!47548)

(declare-fun b!523417 () Bool)

(declare-fun res!320780 () Bool)

(declare-fun e!305252 () Bool)

(assert (=> b!523417 (=> (not res!320780) (not e!305252))))

(declare-datatypes ((array!33311 0))(
  ( (array!33312 (arr!16010 (Array (_ BitVec 32) (_ BitVec 64))) (size!16374 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33311)

(declare-datatypes ((List!10168 0))(
  ( (Nil!10165) (Cons!10164 (h!11089 (_ BitVec 64)) (t!16396 List!10168)) )
))
(declare-fun arrayNoDuplicates!0 (array!33311 (_ BitVec 32) List!10168) Bool)

(assert (=> b!523417 (= res!320780 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10165))))

(declare-fun b!523418 () Bool)

(declare-fun res!320779 () Bool)

(assert (=> b!523418 (=> (not res!320779) (not e!305252))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33311 (_ BitVec 32)) Bool)

(assert (=> b!523418 (= res!320779 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!523419 () Bool)

(declare-fun e!305253 () Bool)

(assert (=> b!523419 (= e!305253 e!305252)))

(declare-fun res!320789 () Bool)

(assert (=> b!523419 (=> (not res!320789) (not e!305252))))

(declare-datatypes ((SeekEntryResult!4477 0))(
  ( (MissingZero!4477 (index!20114 (_ BitVec 32))) (Found!4477 (index!20115 (_ BitVec 32))) (Intermediate!4477 (undefined!5289 Bool) (index!20116 (_ BitVec 32)) (x!49088 (_ BitVec 32))) (Undefined!4477) (MissingVacant!4477 (index!20117 (_ BitVec 32))) )
))
(declare-fun lt!240164 () SeekEntryResult!4477)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!523419 (= res!320789 (or (= lt!240164 (MissingZero!4477 i!1204)) (= lt!240164 (MissingVacant!4477 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33311 (_ BitVec 32)) SeekEntryResult!4477)

(assert (=> b!523419 (= lt!240164 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!523420 () Bool)

(declare-fun res!320782 () Bool)

(assert (=> b!523420 (=> (not res!320782) (not e!305253))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!523420 (= res!320782 (validKeyInArray!0 k!2280))))

(declare-fun b!523421 () Bool)

(declare-datatypes ((Unit!16360 0))(
  ( (Unit!16361) )
))
(declare-fun e!305255 () Unit!16360)

(declare-fun Unit!16362 () Unit!16360)

(assert (=> b!523421 (= e!305255 Unit!16362)))

(declare-fun lt!240167 () Unit!16360)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!240171 () (_ BitVec 32))

(declare-fun lt!240166 () SeekEntryResult!4477)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33311 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16360)

(assert (=> b!523421 (= lt!240167 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!240171 #b00000000000000000000000000000000 (index!20116 lt!240166) (x!49088 lt!240166) mask!3524))))

(declare-fun lt!240170 () array!33311)

(declare-fun res!320784 () Bool)

(declare-fun lt!240172 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33311 (_ BitVec 32)) SeekEntryResult!4477)

(assert (=> b!523421 (= res!320784 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240171 lt!240172 lt!240170 mask!3524) (Intermediate!4477 false (index!20116 lt!240166) (x!49088 lt!240166))))))

(declare-fun e!305250 () Bool)

(assert (=> b!523421 (=> (not res!320784) (not e!305250))))

(assert (=> b!523421 e!305250))

(declare-fun b!523422 () Bool)

(declare-fun e!305256 () Bool)

(assert (=> b!523422 (= e!305252 (not e!305256))))

(declare-fun res!320778 () Bool)

(assert (=> b!523422 (=> res!320778 e!305256)))

(declare-fun lt!240165 () (_ BitVec 32))

(assert (=> b!523422 (= res!320778 (= lt!240166 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240165 lt!240172 lt!240170 mask!3524)))))

(assert (=> b!523422 (= lt!240166 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240171 (select (arr!16010 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!523422 (= lt!240165 (toIndex!0 lt!240172 mask!3524))))

(assert (=> b!523422 (= lt!240172 (select (store (arr!16010 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!523422 (= lt!240171 (toIndex!0 (select (arr!16010 a!3235) j!176) mask!3524))))

(assert (=> b!523422 (= lt!240170 (array!33312 (store (arr!16010 a!3235) i!1204 k!2280) (size!16374 a!3235)))))

(declare-fun e!305251 () Bool)

(assert (=> b!523422 e!305251))

(declare-fun res!320783 () Bool)

(assert (=> b!523422 (=> (not res!320783) (not e!305251))))

(assert (=> b!523422 (= res!320783 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240168 () Unit!16360)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33311 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16360)

(assert (=> b!523422 (= lt!240168 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!523423 () Bool)

(assert (=> b!523423 (= e!305250 false)))

(declare-fun res!320787 () Bool)

(assert (=> start!47548 (=> (not res!320787) (not e!305253))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47548 (= res!320787 (validMask!0 mask!3524))))

(assert (=> start!47548 e!305253))

(assert (=> start!47548 true))

(declare-fun array_inv!11806 (array!33311) Bool)

(assert (=> start!47548 (array_inv!11806 a!3235)))

(declare-fun b!523424 () Bool)

(declare-fun res!320786 () Bool)

(assert (=> b!523424 (=> (not res!320786) (not e!305253))))

(assert (=> b!523424 (= res!320786 (and (= (size!16374 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16374 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16374 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!523425 () Bool)

(declare-fun res!320781 () Bool)

(assert (=> b!523425 (=> (not res!320781) (not e!305253))))

(assert (=> b!523425 (= res!320781 (validKeyInArray!0 (select (arr!16010 a!3235) j!176)))))

(declare-fun b!523426 () Bool)

(assert (=> b!523426 (= e!305251 (= (seekEntryOrOpen!0 (select (arr!16010 a!3235) j!176) a!3235 mask!3524) (Found!4477 j!176)))))

(declare-fun b!523427 () Bool)

(declare-fun res!320788 () Bool)

(assert (=> b!523427 (=> res!320788 e!305256)))

(assert (=> b!523427 (= res!320788 (or (undefined!5289 lt!240166) (not (is-Intermediate!4477 lt!240166))))))

(declare-fun b!523428 () Bool)

(assert (=> b!523428 (= e!305256 (or (bvsgt #b00000000000000000000000000000000 (x!49088 lt!240166)) (bvsgt (x!49088 lt!240166) #b01111111111111111111111111111110) (and (bvsge lt!240171 #b00000000000000000000000000000000) (bvslt lt!240171 (size!16374 a!3235)))))))

(assert (=> b!523428 (and (or (= (select (arr!16010 a!3235) (index!20116 lt!240166)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16010 a!3235) (index!20116 lt!240166)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16010 a!3235) (index!20116 lt!240166)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16010 a!3235) (index!20116 lt!240166)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240169 () Unit!16360)

(assert (=> b!523428 (= lt!240169 e!305255)))

(declare-fun c!61622 () Bool)

(assert (=> b!523428 (= c!61622 (= (select (arr!16010 a!3235) (index!20116 lt!240166)) (select (arr!16010 a!3235) j!176)))))

(assert (=> b!523428 (and (bvslt (x!49088 lt!240166) #b01111111111111111111111111111110) (or (= (select (arr!16010 a!3235) (index!20116 lt!240166)) (select (arr!16010 a!3235) j!176)) (= (select (arr!16010 a!3235) (index!20116 lt!240166)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16010 a!3235) (index!20116 lt!240166)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523429 () Bool)

(declare-fun res!320785 () Bool)

(assert (=> b!523429 (=> (not res!320785) (not e!305253))))

(declare-fun arrayContainsKey!0 (array!33311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!523429 (= res!320785 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!523430 () Bool)

(declare-fun Unit!16363 () Unit!16360)

(assert (=> b!523430 (= e!305255 Unit!16363)))

(assert (= (and start!47548 res!320787) b!523424))

(assert (= (and b!523424 res!320786) b!523425))

(assert (= (and b!523425 res!320781) b!523420))

(assert (= (and b!523420 res!320782) b!523429))

(assert (= (and b!523429 res!320785) b!523419))

(assert (= (and b!523419 res!320789) b!523418))

(assert (= (and b!523418 res!320779) b!523417))

(assert (= (and b!523417 res!320780) b!523422))

(assert (= (and b!523422 res!320783) b!523426))

(assert (= (and b!523422 (not res!320778)) b!523427))

(assert (= (and b!523427 (not res!320788)) b!523428))

(assert (= (and b!523428 c!61622) b!523421))

(assert (= (and b!523428 (not c!61622)) b!523430))

(assert (= (and b!523421 res!320784) b!523423))

(declare-fun m!504237 () Bool)

(assert (=> b!523421 m!504237))

(declare-fun m!504239 () Bool)

(assert (=> b!523421 m!504239))

(declare-fun m!504241 () Bool)

(assert (=> start!47548 m!504241))

(declare-fun m!504243 () Bool)

(assert (=> start!47548 m!504243))

(declare-fun m!504245 () Bool)

(assert (=> b!523420 m!504245))

(declare-fun m!504247 () Bool)

(assert (=> b!523419 m!504247))

(declare-fun m!504249 () Bool)

(assert (=> b!523418 m!504249))

(declare-fun m!504251 () Bool)

(assert (=> b!523426 m!504251))

(assert (=> b!523426 m!504251))

(declare-fun m!504253 () Bool)

(assert (=> b!523426 m!504253))

(declare-fun m!504255 () Bool)

(assert (=> b!523422 m!504255))

(declare-fun m!504257 () Bool)

(assert (=> b!523422 m!504257))

(declare-fun m!504259 () Bool)

(assert (=> b!523422 m!504259))

(declare-fun m!504261 () Bool)

(assert (=> b!523422 m!504261))

(assert (=> b!523422 m!504251))

(declare-fun m!504263 () Bool)

(assert (=> b!523422 m!504263))

(assert (=> b!523422 m!504251))

(declare-fun m!504265 () Bool)

(assert (=> b!523422 m!504265))

(declare-fun m!504267 () Bool)

(assert (=> b!523422 m!504267))

(assert (=> b!523422 m!504251))

(declare-fun m!504269 () Bool)

(assert (=> b!523422 m!504269))

(declare-fun m!504271 () Bool)

(assert (=> b!523428 m!504271))

(assert (=> b!523428 m!504251))

(declare-fun m!504273 () Bool)

(assert (=> b!523417 m!504273))

(declare-fun m!504275 () Bool)

(assert (=> b!523429 m!504275))

(assert (=> b!523425 m!504251))

(assert (=> b!523425 m!504251))

(declare-fun m!504277 () Bool)

(assert (=> b!523425 m!504277))

(push 1)

(assert (not b!523425))

(assert (not b!523426))

(assert (not b!523417))

(assert (not b!523418))

(assert (not b!523421))

(assert (not b!523429))

(assert (not b!523419))

(assert (not b!523422))

(assert (not b!523420))

(assert (not start!47548))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!523515 () Bool)

(declare-fun e!305310 () SeekEntryResult!4477)

(assert (=> b!523515 (= e!305310 Undefined!4477)))

(declare-fun b!523516 () Bool)

(declare-fun c!61658 () Bool)

(declare-fun lt!240212 () (_ BitVec 64))

(assert (=> b!523516 (= c!61658 (= lt!240212 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!305309 () SeekEntryResult!4477)

(declare-fun e!305308 () SeekEntryResult!4477)

(assert (=> b!523516 (= e!305309 e!305308)))

(declare-fun b!523517 () Bool)

(assert (=> b!523517 (= e!305310 e!305309)))

(declare-fun lt!240213 () SeekEntryResult!4477)

(assert (=> b!523517 (= lt!240212 (select (arr!16010 a!3235) (index!20116 lt!240213)))))

(declare-fun c!61656 () Bool)

(assert (=> b!523517 (= c!61656 (= lt!240212 k!2280))))

(declare-fun b!523518 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33311 (_ BitVec 32)) SeekEntryResult!4477)

(assert (=> b!523518 (= e!305308 (seekKeyOrZeroReturnVacant!0 (x!49088 lt!240213) (index!20116 lt!240213) (index!20116 lt!240213) k!2280 a!3235 mask!3524))))

(declare-fun b!523519 () Bool)

(assert (=> b!523519 (= e!305309 (Found!4477 (index!20116 lt!240213)))))

(declare-fun d!80527 () Bool)

(declare-fun lt!240214 () SeekEntryResult!4477)

(assert (=> d!80527 (and (or (is-Undefined!4477 lt!240214) (not (is-Found!4477 lt!240214)) (and (bvsge (index!20115 lt!240214) #b00000000000000000000000000000000) (bvslt (index!20115 lt!240214) (size!16374 a!3235)))) (or (is-Undefined!4477 lt!240214) (is-Found!4477 lt!240214) (not (is-MissingZero!4477 lt!240214)) (and (bvsge (index!20114 lt!240214) #b00000000000000000000000000000000) (bvslt (index!20114 lt!240214) (size!16374 a!3235)))) (or (is-Undefined!4477 lt!240214) (is-Found!4477 lt!240214) (is-MissingZero!4477 lt!240214) (not (is-MissingVacant!4477 lt!240214)) (and (bvsge (index!20117 lt!240214) #b00000000000000000000000000000000) (bvslt (index!20117 lt!240214) (size!16374 a!3235)))) (or (is-Undefined!4477 lt!240214) (ite (is-Found!4477 lt!240214) (= (select (arr!16010 a!3235) (index!20115 lt!240214)) k!2280) (ite (is-MissingZero!4477 lt!240214) (= (select (arr!16010 a!3235) (index!20114 lt!240214)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4477 lt!240214) (= (select (arr!16010 a!3235) (index!20117 lt!240214)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80527 (= lt!240214 e!305310)))

(declare-fun c!61657 () Bool)

(assert (=> d!80527 (= c!61657 (and (is-Intermediate!4477 lt!240213) (undefined!5289 lt!240213)))))

(assert (=> d!80527 (= lt!240213 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!80527 (validMask!0 mask!3524)))

(assert (=> d!80527 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!240214)))

(declare-fun b!523520 () Bool)

(assert (=> b!523520 (= e!305308 (MissingZero!4477 (index!20116 lt!240213)))))

(assert (= (and d!80527 c!61657) b!523515))

(assert (= (and d!80527 (not c!61657)) b!523517))

(assert (= (and b!523517 c!61656) b!523519))

(assert (= (and b!523517 (not c!61656)) b!523516))

(assert (= (and b!523516 c!61658) b!523520))

(assert (= (and b!523516 (not c!61658)) b!523518))

(declare-fun m!504343 () Bool)

(assert (=> b!523517 m!504343))

(declare-fun m!504345 () Bool)

(assert (=> b!523518 m!504345))

(assert (=> d!80527 m!504241))

(declare-fun m!504347 () Bool)

(assert (=> d!80527 m!504347))

(declare-fun m!504349 () Bool)

(assert (=> d!80527 m!504349))

(assert (=> d!80527 m!504347))

(declare-fun m!504351 () Bool)

(assert (=> d!80527 m!504351))

(declare-fun m!504353 () Bool)

(assert (=> d!80527 m!504353))

(declare-fun m!504355 () Bool)

(assert (=> d!80527 m!504355))

(assert (=> b!523419 d!80527))

(declare-fun b!523531 () Bool)

(declare-fun e!305319 () Bool)

(declare-fun e!305320 () Bool)

(assert (=> b!523531 (= e!305319 e!305320)))

(declare-fun c!61661 () Bool)

(assert (=> b!523531 (= c!61661 (validKeyInArray!0 (select (arr!16010 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80545 () Bool)

(declare-fun res!320815 () Bool)

(assert (=> d!80545 (=> res!320815 e!305319)))

(assert (=> d!80545 (= res!320815 (bvsge #b00000000000000000000000000000000 (size!16374 a!3235)))))

(assert (=> d!80545 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!305319)))

(declare-fun b!523532 () Bool)

(declare-fun call!31838 () Bool)

(assert (=> b!523532 (= e!305320 call!31838)))

(declare-fun b!523533 () Bool)

(declare-fun e!305321 () Bool)

(assert (=> b!523533 (= e!305320 e!305321)))

(declare-fun lt!240224 () (_ BitVec 64))

(assert (=> b!523533 (= lt!240224 (select (arr!16010 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!240225 () Unit!16360)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33311 (_ BitVec 64) (_ BitVec 32)) Unit!16360)

(assert (=> b!523533 (= lt!240225 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!240224 #b00000000000000000000000000000000))))

(assert (=> b!523533 (arrayContainsKey!0 a!3235 lt!240224 #b00000000000000000000000000000000)))

(declare-fun lt!240223 () Unit!16360)

(assert (=> b!523533 (= lt!240223 lt!240225)))

(declare-fun res!320814 () Bool)

(assert (=> b!523533 (= res!320814 (= (seekEntryOrOpen!0 (select (arr!16010 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4477 #b00000000000000000000000000000000)))))

(assert (=> b!523533 (=> (not res!320814) (not e!305321))))

(declare-fun b!523534 () Bool)

(assert (=> b!523534 (= e!305321 call!31838)))

(declare-fun bm!31835 () Bool)

(assert (=> bm!31835 (= call!31838 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!80545 (not res!320815)) b!523531))

(assert (= (and b!523531 c!61661) b!523533))

(assert (= (and b!523531 (not c!61661)) b!523532))

(assert (= (and b!523533 res!320814) b!523534))

(assert (= (or b!523534 b!523532) bm!31835))

(declare-fun m!504357 () Bool)

(assert (=> b!523531 m!504357))

(assert (=> b!523531 m!504357))

(declare-fun m!504359 () Bool)

(assert (=> b!523531 m!504359))

(assert (=> b!523533 m!504357))

(declare-fun m!504361 () Bool)

(assert (=> b!523533 m!504361))

(declare-fun m!504363 () Bool)

(assert (=> b!523533 m!504363))

(assert (=> b!523533 m!504357))

(declare-fun m!504365 () Bool)

(assert (=> b!523533 m!504365))

(declare-fun m!504367 () Bool)

(assert (=> bm!31835 m!504367))

(assert (=> b!523418 d!80545))

(declare-fun d!80547 () Bool)

(declare-fun res!320821 () Bool)

(declare-fun e!305331 () Bool)

(assert (=> d!80547 (=> res!320821 e!305331)))

(assert (=> d!80547 (= res!320821 (= (select (arr!16010 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!80547 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!305331)))

(declare-fun b!523548 () Bool)

(declare-fun e!305332 () Bool)

(assert (=> b!523548 (= e!305331 e!305332)))

(declare-fun res!320822 () Bool)

(assert (=> b!523548 (=> (not res!320822) (not e!305332))))

(assert (=> b!523548 (= res!320822 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16374 a!3235)))))

(declare-fun b!523549 () Bool)

(assert (=> b!523549 (= e!305332 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80547 (not res!320821)) b!523548))

(assert (= (and b!523548 res!320822) b!523549))

(assert (=> d!80547 m!504357))

(declare-fun m!504373 () Bool)

(assert (=> b!523549 m!504373))

(assert (=> b!523429 d!80547))

(declare-fun d!80551 () Bool)

(assert (=> d!80551 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!523420 d!80551))

(declare-fun d!80553 () Bool)

(assert (=> d!80553 (= (validKeyInArray!0 (select (arr!16010 a!3235) j!176)) (and (not (= (select (arr!16010 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16010 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!523425 d!80553))

(declare-fun b!523560 () Bool)

(declare-fun e!305341 () SeekEntryResult!4477)

(assert (=> b!523560 (= e!305341 Undefined!4477)))

(declare-fun b!523561 () Bool)

(declare-fun c!61670 () Bool)

(declare-fun lt!240231 () (_ BitVec 64))

(assert (=> b!523561 (= c!61670 (= lt!240231 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!305340 () SeekEntryResult!4477)

(declare-fun e!305339 () SeekEntryResult!4477)

(assert (=> b!523561 (= e!305340 e!305339)))

(declare-fun b!523562 () Bool)

(assert (=> b!523562 (= e!305341 e!305340)))

(declare-fun lt!240232 () SeekEntryResult!4477)

(assert (=> b!523562 (= lt!240231 (select (arr!16010 a!3235) (index!20116 lt!240232)))))

(declare-fun c!61668 () Bool)

(assert (=> b!523562 (= c!61668 (= lt!240231 (select (arr!16010 a!3235) j!176)))))

(declare-fun b!523563 () Bool)

(assert (=> b!523563 (= e!305339 (seekKeyOrZeroReturnVacant!0 (x!49088 lt!240232) (index!20116 lt!240232) (index!20116 lt!240232) (select (arr!16010 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!523564 () Bool)

(assert (=> b!523564 (= e!305340 (Found!4477 (index!20116 lt!240232)))))

(declare-fun d!80555 () Bool)

(declare-fun lt!240233 () SeekEntryResult!4477)

(assert (=> d!80555 (and (or (is-Undefined!4477 lt!240233) (not (is-Found!4477 lt!240233)) (and (bvsge (index!20115 lt!240233) #b00000000000000000000000000000000) (bvslt (index!20115 lt!240233) (size!16374 a!3235)))) (or (is-Undefined!4477 lt!240233) (is-Found!4477 lt!240233) (not (is-MissingZero!4477 lt!240233)) (and (bvsge (index!20114 lt!240233) #b00000000000000000000000000000000) (bvslt (index!20114 lt!240233) (size!16374 a!3235)))) (or (is-Undefined!4477 lt!240233) (is-Found!4477 lt!240233) (is-MissingZero!4477 lt!240233) (not (is-MissingVacant!4477 lt!240233)) (and (bvsge (index!20117 lt!240233) #b00000000000000000000000000000000) (bvslt (index!20117 lt!240233) (size!16374 a!3235)))) (or (is-Undefined!4477 lt!240233) (ite (is-Found!4477 lt!240233) (= (select (arr!16010 a!3235) (index!20115 lt!240233)) (select (arr!16010 a!3235) j!176)) (ite (is-MissingZero!4477 lt!240233) (= (select (arr!16010 a!3235) (index!20114 lt!240233)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4477 lt!240233) (= (select (arr!16010 a!3235) (index!20117 lt!240233)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80555 (= lt!240233 e!305341)))

(declare-fun c!61669 () Bool)

(assert (=> d!80555 (= c!61669 (and (is-Intermediate!4477 lt!240232) (undefined!5289 lt!240232)))))

(assert (=> d!80555 (= lt!240232 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16010 a!3235) j!176) mask!3524) (select (arr!16010 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80555 (validMask!0 mask!3524)))

(assert (=> d!80555 (= (seekEntryOrOpen!0 (select (arr!16010 a!3235) j!176) a!3235 mask!3524) lt!240233)))

(declare-fun b!523565 () Bool)

(assert (=> b!523565 (= e!305339 (MissingZero!4477 (index!20116 lt!240232)))))

(assert (= (and d!80555 c!61669) b!523560))

(assert (= (and d!80555 (not c!61669)) b!523562))

(assert (= (and b!523562 c!61668) b!523564))

(assert (= (and b!523562 (not c!61668)) b!523561))

(assert (= (and b!523561 c!61670) b!523565))

(assert (= (and b!523561 (not c!61670)) b!523563))

(declare-fun m!504375 () Bool)

(assert (=> b!523562 m!504375))

(assert (=> b!523563 m!504251))

(declare-fun m!504377 () Bool)

(assert (=> b!523563 m!504377))

(assert (=> d!80555 m!504241))

(assert (=> d!80555 m!504269))

(assert (=> d!80555 m!504251))

(declare-fun m!504379 () Bool)

(assert (=> d!80555 m!504379))

(assert (=> d!80555 m!504251))

(assert (=> d!80555 m!504269))

(declare-fun m!504381 () Bool)

(assert (=> d!80555 m!504381))

(declare-fun m!504383 () Bool)

(assert (=> d!80555 m!504383))

(declare-fun m!504385 () Bool)

(assert (=> d!80555 m!504385))

(assert (=> b!523426 d!80555))

(declare-fun d!80557 () Bool)

(declare-fun e!305365 () Bool)

(assert (=> d!80557 e!305365))

(declare-fun res!320844 () Bool)

(assert (=> d!80557 (=> (not res!320844) (not e!305365))))

(assert (=> d!80557 (= res!320844 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16374 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16374 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16374 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16374 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16374 a!3235))))))

(declare-fun lt!240248 () Unit!16360)

(declare-fun choose!47 (array!33311 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16360)

(assert (=> d!80557 (= lt!240248 (choose!47 a!3235 i!1204 k!2280 j!176 lt!240171 #b00000000000000000000000000000000 (index!20116 lt!240166) (x!49088 lt!240166) mask!3524))))

(assert (=> d!80557 (validMask!0 mask!3524)))

(assert (=> d!80557 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!240171 #b00000000000000000000000000000000 (index!20116 lt!240166) (x!49088 lt!240166) mask!3524) lt!240248)))

(declare-fun b!523603 () Bool)

(assert (=> b!523603 (= e!305365 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240171 (select (store (arr!16010 a!3235) i!1204 k!2280) j!176) (array!33312 (store (arr!16010 a!3235) i!1204 k!2280) (size!16374 a!3235)) mask!3524) (Intermediate!4477 false (index!20116 lt!240166) (x!49088 lt!240166))))))

(assert (= (and d!80557 res!320844) b!523603))

(declare-fun m!504395 () Bool)

(assert (=> d!80557 m!504395))

(assert (=> d!80557 m!504241))

(assert (=> b!523603 m!504255))

(assert (=> b!523603 m!504259))

(assert (=> b!523603 m!504259))

(declare-fun m!504397 () Bool)

(assert (=> b!523603 m!504397))

(assert (=> b!523421 d!80557))

(declare-fun b!523697 () Bool)

(declare-fun lt!240297 () SeekEntryResult!4477)

(assert (=> b!523697 (and (bvsge (index!20116 lt!240297) #b00000000000000000000000000000000) (bvslt (index!20116 lt!240297) (size!16374 lt!240170)))))

(declare-fun res!320887 () Bool)

(assert (=> b!523697 (= res!320887 (= (select (arr!16010 lt!240170) (index!20116 lt!240297)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!305427 () Bool)

(assert (=> b!523697 (=> res!320887 e!305427)))

(declare-fun b!523698 () Bool)

(assert (=> b!523698 (and (bvsge (index!20116 lt!240297) #b00000000000000000000000000000000) (bvslt (index!20116 lt!240297) (size!16374 lt!240170)))))

(assert (=> b!523698 (= e!305427 (= (select (arr!16010 lt!240170) (index!20116 lt!240297)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!523699 () Bool)

(declare-fun e!305425 () SeekEntryResult!4477)

(declare-fun e!305428 () SeekEntryResult!4477)

(assert (=> b!523699 (= e!305425 e!305428)))

(declare-fun c!61709 () Bool)

(declare-fun lt!240298 () (_ BitVec 64))

(assert (=> b!523699 (= c!61709 (or (= lt!240298 lt!240172) (= (bvadd lt!240298 lt!240298) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523700 () Bool)

(assert (=> b!523700 (and (bvsge (index!20116 lt!240297) #b00000000000000000000000000000000) (bvslt (index!20116 lt!240297) (size!16374 lt!240170)))))

(declare-fun res!320888 () Bool)

(assert (=> b!523700 (= res!320888 (= (select (arr!16010 lt!240170) (index!20116 lt!240297)) lt!240172))))

(assert (=> b!523700 (=> res!320888 e!305427)))

(declare-fun e!305429 () Bool)

(assert (=> b!523700 (= e!305429 e!305427)))

(declare-fun b!523701 () Bool)

(declare-fun e!305426 () Bool)

(assert (=> b!523701 (= e!305426 e!305429)))

(declare-fun res!320886 () Bool)

(assert (=> b!523701 (= res!320886 (and (is-Intermediate!4477 lt!240297) (not (undefined!5289 lt!240297)) (bvslt (x!49088 lt!240297) #b01111111111111111111111111111110) (bvsge (x!49088 lt!240297) #b00000000000000000000000000000000) (bvsge (x!49088 lt!240297) #b00000000000000000000000000000000)))))

(assert (=> b!523701 (=> (not res!320886) (not e!305429))))

(declare-fun b!523702 () Bool)

(assert (=> b!523702 (= e!305426 (bvsge (x!49088 lt!240297) #b01111111111111111111111111111110))))

(declare-fun b!523703 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!523703 (= e!305428 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!240171 #b00000000000000000000000000000000 mask!3524) lt!240172 lt!240170 mask!3524))))

(declare-fun b!523704 () Bool)

(assert (=> b!523704 (= e!305428 (Intermediate!4477 false lt!240171 #b00000000000000000000000000000000))))

(declare-fun b!523705 () Bool)

(assert (=> b!523705 (= e!305425 (Intermediate!4477 true lt!240171 #b00000000000000000000000000000000))))

(declare-fun d!80565 () Bool)

(assert (=> d!80565 e!305426))

(declare-fun c!61710 () Bool)

(assert (=> d!80565 (= c!61710 (and (is-Intermediate!4477 lt!240297) (undefined!5289 lt!240297)))))

(assert (=> d!80565 (= lt!240297 e!305425)))

(declare-fun c!61711 () Bool)

(assert (=> d!80565 (= c!61711 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80565 (= lt!240298 (select (arr!16010 lt!240170) lt!240171))))

(assert (=> d!80565 (validMask!0 mask!3524)))

(assert (=> d!80565 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240171 lt!240172 lt!240170 mask!3524) lt!240297)))

(assert (= (and d!80565 c!61711) b!523705))

(assert (= (and d!80565 (not c!61711)) b!523699))

(assert (= (and b!523699 c!61709) b!523704))

(assert (= (and b!523699 (not c!61709)) b!523703))

(assert (= (and d!80565 c!61710) b!523702))

(assert (= (and d!80565 (not c!61710)) b!523701))

(assert (= (and b!523701 res!320886) b!523700))

(assert (= (and b!523700 (not res!320888)) b!523697))

(assert (= (and b!523697 (not res!320887)) b!523698))

(declare-fun m!504475 () Bool)

(assert (=> b!523698 m!504475))

(assert (=> b!523697 m!504475))

(declare-fun m!504477 () Bool)

(assert (=> b!523703 m!504477))

(assert (=> b!523703 m!504477))

(declare-fun m!504479 () Bool)

(assert (=> b!523703 m!504479))

(declare-fun m!504481 () Bool)

(assert (=> d!80565 m!504481))

(assert (=> d!80565 m!504241))

(assert (=> b!523700 m!504475))

(assert (=> b!523421 d!80565))

(declare-fun d!80601 () Bool)

(assert (=> d!80601 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47548 d!80601))

(declare-fun d!80607 () Bool)

(assert (=> d!80607 (= (array_inv!11806 a!3235) (bvsge (size!16374 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47548 d!80607))

(declare-fun d!80609 () Bool)

(declare-fun lt!240304 () (_ BitVec 32))

(declare-fun lt!240303 () (_ BitVec 32))

(assert (=> d!80609 (= lt!240304 (bvmul (bvxor lt!240303 (bvlshr lt!240303 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80609 (= lt!240303 ((_ extract 31 0) (bvand (bvxor lt!240172 (bvlshr lt!240172 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80609 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!320895 (let ((h!11092 ((_ extract 31 0) (bvand (bvxor lt!240172 (bvlshr lt!240172 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49097 (bvmul (bvxor h!11092 (bvlshr h!11092 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49097 (bvlshr x!49097 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!320895 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!320895 #b00000000000000000000000000000000))))))

(assert (=> d!80609 (= (toIndex!0 lt!240172 mask!3524) (bvand (bvxor lt!240304 (bvlshr lt!240304 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!523422 d!80609))

(declare-fun d!80611 () Bool)

(declare-fun lt!240306 () (_ BitVec 32))

(declare-fun lt!240305 () (_ BitVec 32))

(assert (=> d!80611 (= lt!240306 (bvmul (bvxor lt!240305 (bvlshr lt!240305 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80611 (= lt!240305 ((_ extract 31 0) (bvand (bvxor (select (arr!16010 a!3235) j!176) (bvlshr (select (arr!16010 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80611 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!320895 (let ((h!11092 ((_ extract 31 0) (bvand (bvxor (select (arr!16010 a!3235) j!176) (bvlshr (select (arr!16010 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49097 (bvmul (bvxor h!11092 (bvlshr h!11092 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49097 (bvlshr x!49097 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!320895 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!320895 #b00000000000000000000000000000000))))))

(assert (=> d!80611 (= (toIndex!0 (select (arr!16010 a!3235) j!176) mask!3524) (bvand (bvxor lt!240306 (bvlshr lt!240306 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!523422 d!80611))

(declare-fun b!523721 () Bool)

(declare-fun e!305442 () Bool)

(declare-fun e!305443 () Bool)

(assert (=> b!523721 (= e!305442 e!305443)))

(declare-fun c!61715 () Bool)

(assert (=> b!523721 (= c!61715 (validKeyInArray!0 (select (arr!16010 a!3235) j!176)))))

(declare-fun d!80613 () Bool)

(declare-fun res!320900 () Bool)

(assert (=> d!80613 (=> res!320900 e!305442)))

(assert (=> d!80613 (= res!320900 (bvsge j!176 (size!16374 a!3235)))))

(assert (=> d!80613 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!305442)))

(declare-fun b!523722 () Bool)

(declare-fun call!31847 () Bool)

(assert (=> b!523722 (= e!305443 call!31847)))

(declare-fun b!523723 () Bool)

(declare-fun e!305444 () Bool)

(assert (=> b!523723 (= e!305443 e!305444)))

(declare-fun lt!240308 () (_ BitVec 64))

(assert (=> b!523723 (= lt!240308 (select (arr!16010 a!3235) j!176))))

(declare-fun lt!240309 () Unit!16360)

(assert (=> b!523723 (= lt!240309 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!240308 j!176))))

(assert (=> b!523723 (arrayContainsKey!0 a!3235 lt!240308 #b00000000000000000000000000000000)))

(declare-fun lt!240307 () Unit!16360)

(assert (=> b!523723 (= lt!240307 lt!240309)))

(declare-fun res!320899 () Bool)

(assert (=> b!523723 (= res!320899 (= (seekEntryOrOpen!0 (select (arr!16010 a!3235) j!176) a!3235 mask!3524) (Found!4477 j!176)))))

(assert (=> b!523723 (=> (not res!320899) (not e!305444))))

(declare-fun b!523724 () Bool)

(assert (=> b!523724 (= e!305444 call!31847)))

(declare-fun bm!31844 () Bool)

(assert (=> bm!31844 (= call!31847 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!80613 (not res!320900)) b!523721))

(assert (= (and b!523721 c!61715) b!523723))

(assert (= (and b!523721 (not c!61715)) b!523722))

(assert (= (and b!523723 res!320899) b!523724))

(assert (= (or b!523724 b!523722) bm!31844))

(assert (=> b!523721 m!504251))

(assert (=> b!523721 m!504251))

(assert (=> b!523721 m!504277))

(assert (=> b!523723 m!504251))

(declare-fun m!504487 () Bool)

(assert (=> b!523723 m!504487))

(declare-fun m!504489 () Bool)

(assert (=> b!523723 m!504489))

(assert (=> b!523723 m!504251))

(assert (=> b!523723 m!504253))

(declare-fun m!504491 () Bool)

(assert (=> bm!31844 m!504491))

(assert (=> b!523422 d!80613))

(declare-fun d!80615 () Bool)

(assert (=> d!80615 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!240312 () Unit!16360)

(declare-fun choose!38 (array!33311 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16360)

(assert (=> d!80615 (= lt!240312 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80615 (validMask!0 mask!3524)))

(assert (=> d!80615 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!240312)))

(declare-fun bs!16452 () Bool)

(assert (= bs!16452 d!80615))

(assert (=> bs!16452 m!504263))

(declare-fun m!504493 () Bool)

(assert (=> bs!16452 m!504493))

(assert (=> bs!16452 m!504241))

(assert (=> b!523422 d!80615))

(declare-fun b!523725 () Bool)

(declare-fun lt!240313 () SeekEntryResult!4477)

(assert (=> b!523725 (and (bvsge (index!20116 lt!240313) #b00000000000000000000000000000000) (bvslt (index!20116 lt!240313) (size!16374 a!3235)))))

(declare-fun res!320902 () Bool)

(assert (=> b!523725 (= res!320902 (= (select (arr!16010 a!3235) (index!20116 lt!240313)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!305447 () Bool)

(assert (=> b!523725 (=> res!320902 e!305447)))

(declare-fun b!523726 () Bool)

(assert (=> b!523726 (and (bvsge (index!20116 lt!240313) #b00000000000000000000000000000000) (bvslt (index!20116 lt!240313) (size!16374 a!3235)))))

(assert (=> b!523726 (= e!305447 (= (select (arr!16010 a!3235) (index!20116 lt!240313)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!523727 () Bool)

(declare-fun e!305445 () SeekEntryResult!4477)

(declare-fun e!305448 () SeekEntryResult!4477)

(assert (=> b!523727 (= e!305445 e!305448)))

(declare-fun lt!240314 () (_ BitVec 64))

(declare-fun c!61716 () Bool)

(assert (=> b!523727 (= c!61716 (or (= lt!240314 (select (arr!16010 a!3235) j!176)) (= (bvadd lt!240314 lt!240314) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523728 () Bool)

(assert (=> b!523728 (and (bvsge (index!20116 lt!240313) #b00000000000000000000000000000000) (bvslt (index!20116 lt!240313) (size!16374 a!3235)))))

(declare-fun res!320903 () Bool)

(assert (=> b!523728 (= res!320903 (= (select (arr!16010 a!3235) (index!20116 lt!240313)) (select (arr!16010 a!3235) j!176)))))

(assert (=> b!523728 (=> res!320903 e!305447)))

(declare-fun e!305449 () Bool)

(assert (=> b!523728 (= e!305449 e!305447)))

(declare-fun b!523729 () Bool)

(declare-fun e!305446 () Bool)

(assert (=> b!523729 (= e!305446 e!305449)))

(declare-fun res!320901 () Bool)

(assert (=> b!523729 (= res!320901 (and (is-Intermediate!4477 lt!240313) (not (undefined!5289 lt!240313)) (bvslt (x!49088 lt!240313) #b01111111111111111111111111111110) (bvsge (x!49088 lt!240313) #b00000000000000000000000000000000) (bvsge (x!49088 lt!240313) #b00000000000000000000000000000000)))))

(assert (=> b!523729 (=> (not res!320901) (not e!305449))))

(declare-fun b!523730 () Bool)

(assert (=> b!523730 (= e!305446 (bvsge (x!49088 lt!240313) #b01111111111111111111111111111110))))

(declare-fun b!523731 () Bool)

(assert (=> b!523731 (= e!305448 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!240171 #b00000000000000000000000000000000 mask!3524) (select (arr!16010 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!523732 () Bool)

(assert (=> b!523732 (= e!305448 (Intermediate!4477 false lt!240171 #b00000000000000000000000000000000))))

(declare-fun b!523733 () Bool)

(assert (=> b!523733 (= e!305445 (Intermediate!4477 true lt!240171 #b00000000000000000000000000000000))))

(declare-fun d!80617 () Bool)

(assert (=> d!80617 e!305446))

(declare-fun c!61717 () Bool)

(assert (=> d!80617 (= c!61717 (and (is-Intermediate!4477 lt!240313) (undefined!5289 lt!240313)))))

(assert (=> d!80617 (= lt!240313 e!305445)))

(declare-fun c!61718 () Bool)

(assert (=> d!80617 (= c!61718 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80617 (= lt!240314 (select (arr!16010 a!3235) lt!240171))))

(assert (=> d!80617 (validMask!0 mask!3524)))

(assert (=> d!80617 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240171 (select (arr!16010 a!3235) j!176) a!3235 mask!3524) lt!240313)))

(assert (= (and d!80617 c!61718) b!523733))

(assert (= (and d!80617 (not c!61718)) b!523727))

(assert (= (and b!523727 c!61716) b!523732))

(assert (= (and b!523727 (not c!61716)) b!523731))

(assert (= (and d!80617 c!61717) b!523730))

(assert (= (and d!80617 (not c!61717)) b!523729))

(assert (= (and b!523729 res!320901) b!523728))

(assert (= (and b!523728 (not res!320903)) b!523725))

(assert (= (and b!523725 (not res!320902)) b!523726))

(declare-fun m!504495 () Bool)

(assert (=> b!523726 m!504495))

(assert (=> b!523725 m!504495))

(assert (=> b!523731 m!504477))

(assert (=> b!523731 m!504477))

(assert (=> b!523731 m!504251))

(declare-fun m!504497 () Bool)

(assert (=> b!523731 m!504497))

(declare-fun m!504499 () Bool)

(assert (=> d!80617 m!504499))

(assert (=> d!80617 m!504241))

(assert (=> b!523728 m!504495))

(assert (=> b!523422 d!80617))

(declare-fun b!523734 () Bool)

(declare-fun lt!240315 () SeekEntryResult!4477)

(assert (=> b!523734 (and (bvsge (index!20116 lt!240315) #b00000000000000000000000000000000) (bvslt (index!20116 lt!240315) (size!16374 lt!240170)))))

(declare-fun res!320905 () Bool)

(assert (=> b!523734 (= res!320905 (= (select (arr!16010 lt!240170) (index!20116 lt!240315)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!305452 () Bool)

(assert (=> b!523734 (=> res!320905 e!305452)))

(declare-fun b!523735 () Bool)

(assert (=> b!523735 (and (bvsge (index!20116 lt!240315) #b00000000000000000000000000000000) (bvslt (index!20116 lt!240315) (size!16374 lt!240170)))))

(assert (=> b!523735 (= e!305452 (= (select (arr!16010 lt!240170) (index!20116 lt!240315)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!523736 () Bool)

(declare-fun e!305450 () SeekEntryResult!4477)

(declare-fun e!305453 () SeekEntryResult!4477)

(assert (=> b!523736 (= e!305450 e!305453)))

(declare-fun c!61719 () Bool)

(declare-fun lt!240316 () (_ BitVec 64))

(assert (=> b!523736 (= c!61719 (or (= lt!240316 lt!240172) (= (bvadd lt!240316 lt!240316) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523737 () Bool)

(assert (=> b!523737 (and (bvsge (index!20116 lt!240315) #b00000000000000000000000000000000) (bvslt (index!20116 lt!240315) (size!16374 lt!240170)))))

(declare-fun res!320906 () Bool)

(assert (=> b!523737 (= res!320906 (= (select (arr!16010 lt!240170) (index!20116 lt!240315)) lt!240172))))

(assert (=> b!523737 (=> res!320906 e!305452)))

(declare-fun e!305454 () Bool)

(assert (=> b!523737 (= e!305454 e!305452)))

(declare-fun b!523738 () Bool)

(declare-fun e!305451 () Bool)

(assert (=> b!523738 (= e!305451 e!305454)))

(declare-fun res!320904 () Bool)

(assert (=> b!523738 (= res!320904 (and (is-Intermediate!4477 lt!240315) (not (undefined!5289 lt!240315)) (bvslt (x!49088 lt!240315) #b01111111111111111111111111111110) (bvsge (x!49088 lt!240315) #b00000000000000000000000000000000) (bvsge (x!49088 lt!240315) #b00000000000000000000000000000000)))))

(assert (=> b!523738 (=> (not res!320904) (not e!305454))))

(declare-fun b!523739 () Bool)

(assert (=> b!523739 (= e!305451 (bvsge (x!49088 lt!240315) #b01111111111111111111111111111110))))

(declare-fun b!523740 () Bool)

(assert (=> b!523740 (= e!305453 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!240165 #b00000000000000000000000000000000 mask!3524) lt!240172 lt!240170 mask!3524))))

(declare-fun b!523741 () Bool)

(assert (=> b!523741 (= e!305453 (Intermediate!4477 false lt!240165 #b00000000000000000000000000000000))))

(declare-fun b!523742 () Bool)

(assert (=> b!523742 (= e!305450 (Intermediate!4477 true lt!240165 #b00000000000000000000000000000000))))

(declare-fun d!80619 () Bool)

(assert (=> d!80619 e!305451))

(declare-fun c!61720 () Bool)

(assert (=> d!80619 (= c!61720 (and (is-Intermediate!4477 lt!240315) (undefined!5289 lt!240315)))))

(assert (=> d!80619 (= lt!240315 e!305450)))

(declare-fun c!61721 () Bool)

(assert (=> d!80619 (= c!61721 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80619 (= lt!240316 (select (arr!16010 lt!240170) lt!240165))))

(assert (=> d!80619 (validMask!0 mask!3524)))

(assert (=> d!80619 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240165 lt!240172 lt!240170 mask!3524) lt!240315)))

(assert (= (and d!80619 c!61721) b!523742))

(assert (= (and d!80619 (not c!61721)) b!523736))

(assert (= (and b!523736 c!61719) b!523741))

(assert (= (and b!523736 (not c!61719)) b!523740))

(assert (= (and d!80619 c!61720) b!523739))

(assert (= (and d!80619 (not c!61720)) b!523738))

(assert (= (and b!523738 res!320904) b!523737))

(assert (= (and b!523737 (not res!320906)) b!523734))

(assert (= (and b!523734 (not res!320905)) b!523735))

(declare-fun m!504501 () Bool)

(assert (=> b!523735 m!504501))

(assert (=> b!523734 m!504501))

(declare-fun m!504503 () Bool)

(assert (=> b!523740 m!504503))

(assert (=> b!523740 m!504503))

(declare-fun m!504505 () Bool)

(assert (=> b!523740 m!504505))

(declare-fun m!504507 () Bool)

(assert (=> d!80619 m!504507))

(assert (=> d!80619 m!504241))

(assert (=> b!523737 m!504501))

(assert (=> b!523422 d!80619))

(declare-fun b!523753 () Bool)

(declare-fun e!305464 () Bool)

(declare-fun e!305463 () Bool)

(assert (=> b!523753 (= e!305464 e!305463)))

(declare-fun res!320915 () Bool)

(assert (=> b!523753 (=> (not res!320915) (not e!305463))))

(declare-fun e!305465 () Bool)

(assert (=> b!523753 (= res!320915 (not e!305465))))

(declare-fun res!320914 () Bool)

(assert (=> b!523753 (=> (not res!320914) (not e!305465))))

(assert (=> b!523753 (= res!320914 (validKeyInArray!0 (select (arr!16010 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31847 () Bool)

(declare-fun call!31850 () Bool)

(declare-fun c!61724 () Bool)

(assert (=> bm!31847 (= call!31850 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61724 (Cons!10164 (select (arr!16010 a!3235) #b00000000000000000000000000000000) Nil!10165) Nil!10165)))))

(declare-fun d!80621 () Bool)

(declare-fun res!320913 () Bool)

(assert (=> d!80621 (=> res!320913 e!305464)))

(assert (=> d!80621 (= res!320913 (bvsge #b00000000000000000000000000000000 (size!16374 a!3235)))))

(assert (=> d!80621 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10165) e!305464)))

(declare-fun b!523754 () Bool)

(declare-fun e!305466 () Bool)

(assert (=> b!523754 (= e!305466 call!31850)))

(declare-fun b!523755 () Bool)

(assert (=> b!523755 (= e!305466 call!31850)))

(declare-fun b!523756 () Bool)

(declare-fun contains!2769 (List!10168 (_ BitVec 64)) Bool)

(assert (=> b!523756 (= e!305465 (contains!2769 Nil!10165 (select (arr!16010 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!523757 () Bool)

(assert (=> b!523757 (= e!305463 e!305466)))

(assert (=> b!523757 (= c!61724 (validKeyInArray!0 (select (arr!16010 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!80621 (not res!320913)) b!523753))

(assert (= (and b!523753 res!320914) b!523756))

(assert (= (and b!523753 res!320915) b!523757))

(assert (= (and b!523757 c!61724) b!523755))

(assert (= (and b!523757 (not c!61724)) b!523754))

(assert (= (or b!523755 b!523754) bm!31847))

(assert (=> b!523753 m!504357))

(assert (=> b!523753 m!504357))

(assert (=> b!523753 m!504359))

(assert (=> bm!31847 m!504357))

(declare-fun m!504509 () Bool)

(assert (=> bm!31847 m!504509))

(assert (=> b!523756 m!504357))

(assert (=> b!523756 m!504357))

(declare-fun m!504511 () Bool)

(assert (=> b!523756 m!504511))

(assert (=> b!523757 m!504357))

(assert (=> b!523757 m!504357))

(assert (=> b!523757 m!504359))

(assert (=> b!523417 d!80621))

(push 1)

