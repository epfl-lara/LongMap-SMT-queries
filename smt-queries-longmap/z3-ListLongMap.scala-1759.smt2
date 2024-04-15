; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32138 () Bool)

(assert start!32138)

(declare-fun b!320163 () Bool)

(declare-fun res!174558 () Bool)

(declare-fun e!198638 () Bool)

(assert (=> b!320163 (=> (not res!174558) (not e!198638))))

(declare-datatypes ((array!16377 0))(
  ( (array!16378 (arr!7749 (Array (_ BitVec 32) (_ BitVec 64))) (size!8102 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16377)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!320163 (= res!174558 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!320164 () Bool)

(declare-fun res!174553 () Bool)

(assert (=> b!320164 (=> (not res!174553) (not e!198638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!320164 (= res!174553 (validKeyInArray!0 k0!2497))))

(declare-fun b!320165 () Bool)

(declare-fun res!174557 () Bool)

(assert (=> b!320165 (=> (not res!174557) (not e!198638))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!320165 (= res!174557 (and (= (size!8102 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8102 a!3305))))))

(declare-fun res!174552 () Bool)

(assert (=> start!32138 (=> (not res!174552) (not e!198638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32138 (= res!174552 (validMask!0 mask!3777))))

(assert (=> start!32138 e!198638))

(declare-fun array_inv!5721 (array!16377) Bool)

(assert (=> start!32138 (array_inv!5721 a!3305)))

(assert (=> start!32138 true))

(declare-fun b!320166 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!320166 (= e!198638 (and (= (select (arr!7749 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8102 a!3305)) (bvsge mask!3777 #b00000000000000000000000000000000) (bvslt index!1840 (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsgt x!1490 #b01111111111111111111111111111110)))))

(declare-fun b!320167 () Bool)

(declare-fun res!174556 () Bool)

(assert (=> b!320167 (=> (not res!174556) (not e!198638))))

(declare-datatypes ((SeekEntryResult!2879 0))(
  ( (MissingZero!2879 (index!13692 (_ BitVec 32))) (Found!2879 (index!13693 (_ BitVec 32))) (Intermediate!2879 (undefined!3691 Bool) (index!13694 (_ BitVec 32)) (x!31975 (_ BitVec 32))) (Undefined!2879) (MissingVacant!2879 (index!13695 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16377 (_ BitVec 32)) SeekEntryResult!2879)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320167 (= res!174556 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) (Intermediate!2879 false resIndex!58 resX!58)))))

(declare-fun b!320168 () Bool)

(declare-fun res!174554 () Bool)

(assert (=> b!320168 (=> (not res!174554) (not e!198638))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16377 (_ BitVec 32)) SeekEntryResult!2879)

(assert (=> b!320168 (= res!174554 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2879 i!1250)))))

(declare-fun b!320169 () Bool)

(declare-fun res!174555 () Bool)

(assert (=> b!320169 (=> (not res!174555) (not e!198638))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16377 (_ BitVec 32)) Bool)

(assert (=> b!320169 (= res!174555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(assert (= (and start!32138 res!174552) b!320165))

(assert (= (and b!320165 res!174557) b!320164))

(assert (= (and b!320164 res!174553) b!320163))

(assert (= (and b!320163 res!174558) b!320168))

(assert (= (and b!320168 res!174554) b!320169))

(assert (= (and b!320169 res!174555) b!320167))

(assert (= (and b!320167 res!174556) b!320166))

(declare-fun m!328087 () Bool)

(assert (=> b!320166 m!328087))

(declare-fun m!328089 () Bool)

(assert (=> b!320167 m!328089))

(assert (=> b!320167 m!328089))

(declare-fun m!328091 () Bool)

(assert (=> b!320167 m!328091))

(declare-fun m!328093 () Bool)

(assert (=> start!32138 m!328093))

(declare-fun m!328095 () Bool)

(assert (=> start!32138 m!328095))

(declare-fun m!328097 () Bool)

(assert (=> b!320168 m!328097))

(declare-fun m!328099 () Bool)

(assert (=> b!320164 m!328099))

(declare-fun m!328101 () Bool)

(assert (=> b!320163 m!328101))

(declare-fun m!328103 () Bool)

(assert (=> b!320169 m!328103))

(check-sat (not b!320167) (not b!320168) (not b!320169) (not start!32138) (not b!320164) (not b!320163))
(check-sat)
(get-model)

(declare-fun b!320254 () Bool)

(declare-fun e!198681 () Bool)

(declare-fun lt!155786 () SeekEntryResult!2879)

(assert (=> b!320254 (= e!198681 (bvsge (x!31975 lt!155786) #b01111111111111111111111111111110))))

(declare-fun b!320255 () Bool)

(declare-fun e!198678 () SeekEntryResult!2879)

(declare-fun e!198677 () SeekEntryResult!2879)

(assert (=> b!320255 (= e!198678 e!198677)))

(declare-fun c!50444 () Bool)

(declare-fun lt!155787 () (_ BitVec 64))

(assert (=> b!320255 (= c!50444 (or (= lt!155787 k0!2497) (= (bvadd lt!155787 lt!155787) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!320256 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!320256 (= e!198677 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!320257 () Bool)

(assert (=> b!320257 (= e!198678 (Intermediate!2879 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!320258 () Bool)

(assert (=> b!320258 (= e!198677 (Intermediate!2879 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!320259 () Bool)

(declare-fun e!198679 () Bool)

(assert (=> b!320259 (= e!198681 e!198679)))

(declare-fun res!174620 () Bool)

(get-info :version)

(assert (=> b!320259 (= res!174620 (and ((_ is Intermediate!2879) lt!155786) (not (undefined!3691 lt!155786)) (bvslt (x!31975 lt!155786) #b01111111111111111111111111111110) (bvsge (x!31975 lt!155786) #b00000000000000000000000000000000) (bvsge (x!31975 lt!155786) #b00000000000000000000000000000000)))))

(assert (=> b!320259 (=> (not res!174620) (not e!198679))))

(declare-fun b!320260 () Bool)

(assert (=> b!320260 (and (bvsge (index!13694 lt!155786) #b00000000000000000000000000000000) (bvslt (index!13694 lt!155786) (size!8102 a!3305)))))

(declare-fun e!198680 () Bool)

(assert (=> b!320260 (= e!198680 (= (select (arr!7749 a!3305) (index!13694 lt!155786)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!69239 () Bool)

(assert (=> d!69239 e!198681))

(declare-fun c!50443 () Bool)

(assert (=> d!69239 (= c!50443 (and ((_ is Intermediate!2879) lt!155786) (undefined!3691 lt!155786)))))

(assert (=> d!69239 (= lt!155786 e!198678)))

(declare-fun c!50442 () Bool)

(assert (=> d!69239 (= c!50442 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!69239 (= lt!155787 (select (arr!7749 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!69239 (validMask!0 mask!3777)))

(assert (=> d!69239 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!155786)))

(declare-fun b!320261 () Bool)

(assert (=> b!320261 (and (bvsge (index!13694 lt!155786) #b00000000000000000000000000000000) (bvslt (index!13694 lt!155786) (size!8102 a!3305)))))

(declare-fun res!174619 () Bool)

(assert (=> b!320261 (= res!174619 (= (select (arr!7749 a!3305) (index!13694 lt!155786)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!320261 (=> res!174619 e!198680)))

(declare-fun b!320262 () Bool)

(assert (=> b!320262 (and (bvsge (index!13694 lt!155786) #b00000000000000000000000000000000) (bvslt (index!13694 lt!155786) (size!8102 a!3305)))))

(declare-fun res!174621 () Bool)

(assert (=> b!320262 (= res!174621 (= (select (arr!7749 a!3305) (index!13694 lt!155786)) k0!2497))))

(assert (=> b!320262 (=> res!174621 e!198680)))

(assert (=> b!320262 (= e!198679 e!198680)))

(assert (= (and d!69239 c!50442) b!320257))

(assert (= (and d!69239 (not c!50442)) b!320255))

(assert (= (and b!320255 c!50444) b!320258))

(assert (= (and b!320255 (not c!50444)) b!320256))

(assert (= (and d!69239 c!50443) b!320254))

(assert (= (and d!69239 (not c!50443)) b!320259))

(assert (= (and b!320259 res!174620) b!320262))

(assert (= (and b!320262 (not res!174621)) b!320261))

(assert (= (and b!320261 (not res!174619)) b!320260))

(declare-fun m!328145 () Bool)

(assert (=> b!320261 m!328145))

(assert (=> b!320256 m!328089))

(declare-fun m!328147 () Bool)

(assert (=> b!320256 m!328147))

(assert (=> b!320256 m!328147))

(declare-fun m!328149 () Bool)

(assert (=> b!320256 m!328149))

(assert (=> b!320262 m!328145))

(assert (=> d!69239 m!328089))

(declare-fun m!328151 () Bool)

(assert (=> d!69239 m!328151))

(assert (=> d!69239 m!328093))

(assert (=> b!320260 m!328145))

(assert (=> b!320167 d!69239))

(declare-fun d!69249 () Bool)

(declare-fun lt!155795 () (_ BitVec 32))

(declare-fun lt!155794 () (_ BitVec 32))

(assert (=> d!69249 (= lt!155795 (bvmul (bvxor lt!155794 (bvlshr lt!155794 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69249 (= lt!155794 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69249 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!174622 (let ((h!5353 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31980 (bvmul (bvxor h!5353 (bvlshr h!5353 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31980 (bvlshr x!31980 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!174622 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!174622 #b00000000000000000000000000000000))))))

(assert (=> d!69249 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!155795 (bvlshr lt!155795 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!320167 d!69249))

(declare-fun b!320320 () Bool)

(declare-fun e!198718 () SeekEntryResult!2879)

(declare-fun e!198717 () SeekEntryResult!2879)

(assert (=> b!320320 (= e!198718 e!198717)))

(declare-fun lt!155827 () (_ BitVec 64))

(declare-fun lt!155826 () SeekEntryResult!2879)

(assert (=> b!320320 (= lt!155827 (select (arr!7749 a!3305) (index!13694 lt!155826)))))

(declare-fun c!50468 () Bool)

(assert (=> b!320320 (= c!50468 (= lt!155827 k0!2497))))

(declare-fun d!69253 () Bool)

(declare-fun lt!155828 () SeekEntryResult!2879)

(assert (=> d!69253 (and (or ((_ is Undefined!2879) lt!155828) (not ((_ is Found!2879) lt!155828)) (and (bvsge (index!13693 lt!155828) #b00000000000000000000000000000000) (bvslt (index!13693 lt!155828) (size!8102 a!3305)))) (or ((_ is Undefined!2879) lt!155828) ((_ is Found!2879) lt!155828) (not ((_ is MissingZero!2879) lt!155828)) (and (bvsge (index!13692 lt!155828) #b00000000000000000000000000000000) (bvslt (index!13692 lt!155828) (size!8102 a!3305)))) (or ((_ is Undefined!2879) lt!155828) ((_ is Found!2879) lt!155828) ((_ is MissingZero!2879) lt!155828) (not ((_ is MissingVacant!2879) lt!155828)) (and (bvsge (index!13695 lt!155828) #b00000000000000000000000000000000) (bvslt (index!13695 lt!155828) (size!8102 a!3305)))) (or ((_ is Undefined!2879) lt!155828) (ite ((_ is Found!2879) lt!155828) (= (select (arr!7749 a!3305) (index!13693 lt!155828)) k0!2497) (ite ((_ is MissingZero!2879) lt!155828) (= (select (arr!7749 a!3305) (index!13692 lt!155828)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2879) lt!155828) (= (select (arr!7749 a!3305) (index!13695 lt!155828)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69253 (= lt!155828 e!198718)))

(declare-fun c!50466 () Bool)

(assert (=> d!69253 (= c!50466 (and ((_ is Intermediate!2879) lt!155826) (undefined!3691 lt!155826)))))

(assert (=> d!69253 (= lt!155826 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69253 (validMask!0 mask!3777)))

(assert (=> d!69253 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!155828)))

(declare-fun b!320321 () Bool)

(assert (=> b!320321 (= e!198718 Undefined!2879)))

(declare-fun b!320322 () Bool)

(assert (=> b!320322 (= e!198717 (Found!2879 (index!13694 lt!155826)))))

(declare-fun b!320323 () Bool)

(declare-fun c!50467 () Bool)

(assert (=> b!320323 (= c!50467 (= lt!155827 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!198719 () SeekEntryResult!2879)

(assert (=> b!320323 (= e!198717 e!198719)))

(declare-fun b!320324 () Bool)

(assert (=> b!320324 (= e!198719 (MissingZero!2879 (index!13694 lt!155826)))))

(declare-fun b!320325 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16377 (_ BitVec 32)) SeekEntryResult!2879)

(assert (=> b!320325 (= e!198719 (seekKeyOrZeroReturnVacant!0 (x!31975 lt!155826) (index!13694 lt!155826) (index!13694 lt!155826) k0!2497 a!3305 mask!3777))))

(assert (= (and d!69253 c!50466) b!320321))

(assert (= (and d!69253 (not c!50466)) b!320320))

(assert (= (and b!320320 c!50468) b!320322))

(assert (= (and b!320320 (not c!50468)) b!320323))

(assert (= (and b!320323 c!50467) b!320324))

(assert (= (and b!320323 (not c!50467)) b!320325))

(declare-fun m!328185 () Bool)

(assert (=> b!320320 m!328185))

(assert (=> d!69253 m!328093))

(assert (=> d!69253 m!328089))

(assert (=> d!69253 m!328091))

(assert (=> d!69253 m!328089))

(declare-fun m!328187 () Bool)

(assert (=> d!69253 m!328187))

(declare-fun m!328189 () Bool)

(assert (=> d!69253 m!328189))

(declare-fun m!328191 () Bool)

(assert (=> d!69253 m!328191))

(declare-fun m!328193 () Bool)

(assert (=> b!320325 m!328193))

(assert (=> b!320168 d!69253))

(declare-fun d!69269 () Bool)

(declare-fun res!174647 () Bool)

(declare-fun e!198730 () Bool)

(assert (=> d!69269 (=> res!174647 e!198730)))

(assert (=> d!69269 (= res!174647 (= (select (arr!7749 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69269 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!198730)))

(declare-fun b!320338 () Bool)

(declare-fun e!198731 () Bool)

(assert (=> b!320338 (= e!198730 e!198731)))

(declare-fun res!174648 () Bool)

(assert (=> b!320338 (=> (not res!174648) (not e!198731))))

(assert (=> b!320338 (= res!174648 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8102 a!3305)))))

(declare-fun b!320339 () Bool)

(assert (=> b!320339 (= e!198731 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69269 (not res!174647)) b!320338))

(assert (= (and b!320338 res!174648) b!320339))

(declare-fun m!328195 () Bool)

(assert (=> d!69269 m!328195))

(declare-fun m!328197 () Bool)

(assert (=> b!320339 m!328197))

(assert (=> b!320163 d!69269))

(declare-fun b!320352 () Bool)

(declare-fun e!198741 () Bool)

(declare-fun e!198743 () Bool)

(assert (=> b!320352 (= e!198741 e!198743)))

(declare-fun lt!155844 () (_ BitVec 64))

(assert (=> b!320352 (= lt!155844 (select (arr!7749 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9790 0))(
  ( (Unit!9791) )
))
(declare-fun lt!155845 () Unit!9790)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16377 (_ BitVec 64) (_ BitVec 32)) Unit!9790)

(assert (=> b!320352 (= lt!155845 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!155844 #b00000000000000000000000000000000))))

(assert (=> b!320352 (arrayContainsKey!0 a!3305 lt!155844 #b00000000000000000000000000000000)))

(declare-fun lt!155846 () Unit!9790)

(assert (=> b!320352 (= lt!155846 lt!155845)))

(declare-fun res!174655 () Bool)

(assert (=> b!320352 (= res!174655 (= (seekEntryOrOpen!0 (select (arr!7749 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!2879 #b00000000000000000000000000000000)))))

(assert (=> b!320352 (=> (not res!174655) (not e!198743))))

(declare-fun b!320353 () Bool)

(declare-fun e!198742 () Bool)

(assert (=> b!320353 (= e!198742 e!198741)))

(declare-fun c!50474 () Bool)

(assert (=> b!320353 (= c!50474 (validKeyInArray!0 (select (arr!7749 a!3305) #b00000000000000000000000000000000)))))

(declare-fun bm!26033 () Bool)

(declare-fun call!26036 () Bool)

(assert (=> bm!26033 (= call!26036 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun d!69271 () Bool)

(declare-fun res!174656 () Bool)

(assert (=> d!69271 (=> res!174656 e!198742)))

(assert (=> d!69271 (= res!174656 (bvsge #b00000000000000000000000000000000 (size!8102 a!3305)))))

(assert (=> d!69271 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!198742)))

(declare-fun b!320354 () Bool)

(assert (=> b!320354 (= e!198743 call!26036)))

(declare-fun b!320355 () Bool)

(assert (=> b!320355 (= e!198741 call!26036)))

(assert (= (and d!69271 (not res!174656)) b!320353))

(assert (= (and b!320353 c!50474) b!320352))

(assert (= (and b!320353 (not c!50474)) b!320355))

(assert (= (and b!320352 res!174655) b!320354))

(assert (= (or b!320354 b!320355) bm!26033))

(assert (=> b!320352 m!328195))

(declare-fun m!328209 () Bool)

(assert (=> b!320352 m!328209))

(declare-fun m!328211 () Bool)

(assert (=> b!320352 m!328211))

(assert (=> b!320352 m!328195))

(declare-fun m!328213 () Bool)

(assert (=> b!320352 m!328213))

(assert (=> b!320353 m!328195))

(assert (=> b!320353 m!328195))

(declare-fun m!328215 () Bool)

(assert (=> b!320353 m!328215))

(declare-fun m!328217 () Bool)

(assert (=> bm!26033 m!328217))

(assert (=> b!320169 d!69271))

(declare-fun d!69279 () Bool)

(assert (=> d!69279 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32138 d!69279))

(declare-fun d!69281 () Bool)

(assert (=> d!69281 (= (array_inv!5721 a!3305) (bvsge (size!8102 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32138 d!69281))

(declare-fun d!69283 () Bool)

(assert (=> d!69283 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!320164 d!69283))

(check-sat (not bm!26033) (not b!320325) (not d!69239) (not b!320353) (not b!320339) (not d!69253) (not b!320352) (not b!320256))
(check-sat)
