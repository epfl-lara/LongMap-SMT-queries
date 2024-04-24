; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135264 () Bool)

(assert start!135264)

(declare-fun res!1074882 () Bool)

(declare-fun e!877994 () Bool)

(assert (=> start!135264 (=> (not res!1074882) (not e!877994))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135264 (= res!1074882 (validMask!0 mask!889))))

(assert (=> start!135264 e!877994))

(assert (=> start!135264 true))

(declare-datatypes ((array!105071 0))(
  ( (array!105072 (arr!50698 (Array (_ BitVec 32) (_ BitVec 64))) (size!51249 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105071)

(declare-fun array_inv!39653 (array!105071) Bool)

(assert (=> start!135264 (array_inv!39653 _keys!600)))

(declare-fun b!1574341 () Bool)

(declare-fun res!1074884 () Bool)

(assert (=> b!1574341 (=> (not res!1074884) (not e!877994))))

(assert (=> b!1574341 (= res!1074884 (= (size!51249 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1574342 () Bool)

(declare-fun res!1074883 () Bool)

(assert (=> b!1574342 (=> (not res!1074883) (not e!877994))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574342 (= res!1074883 (validKeyInArray!0 k0!754))))

(declare-fun b!1574343 () Bool)

(declare-datatypes ((SeekEntryResult!13505 0))(
  ( (MissingZero!13505 (index!56418 (_ BitVec 32))) (Found!13505 (index!56419 (_ BitVec 32))) (Intermediate!13505 (undefined!14317 Bool) (index!56420 (_ BitVec 32)) (x!141392 (_ BitVec 32))) (Undefined!13505) (MissingVacant!13505 (index!56421 (_ BitVec 32))) )
))
(declare-fun lt!674688 () SeekEntryResult!13505)

(get-info :version)

(assert (=> b!1574343 (= e!877994 (and ((_ is Intermediate!13505) lt!674688) (not (undefined!14317 lt!674688)) (not (= (select (arr!50698 _keys!600) (index!56420 lt!674688)) k0!754)) (not (= (select (arr!50698 _keys!600) (index!56420 lt!674688)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50698 _keys!600) (index!56420 lt!674688)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56420 lt!674688) #b00000000000000000000000000000000) (bvslt (index!56420 lt!674688) (bvadd #b00000000000000000000000000000001 mask!889)) (bvsge mask!889 #b00000000000000000000000000000000) (or (bvsgt (x!141392 lt!674688) #b01111111111111111111111111111110) (bvslt (x!141392 lt!674688) #b00000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105071 (_ BitVec 32)) SeekEntryResult!13505)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574343 (= lt!674688 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!135264 res!1074882) b!1574341))

(assert (= (and b!1574341 res!1074884) b!1574342))

(assert (= (and b!1574342 res!1074883) b!1574343))

(declare-fun m!1448055 () Bool)

(assert (=> start!135264 m!1448055))

(declare-fun m!1448057 () Bool)

(assert (=> start!135264 m!1448057))

(declare-fun m!1448059 () Bool)

(assert (=> b!1574342 m!1448059))

(declare-fun m!1448061 () Bool)

(assert (=> b!1574343 m!1448061))

(declare-fun m!1448063 () Bool)

(assert (=> b!1574343 m!1448063))

(assert (=> b!1574343 m!1448063))

(declare-fun m!1448065 () Bool)

(assert (=> b!1574343 m!1448065))

(check-sat (not start!135264) (not b!1574343) (not b!1574342))
(check-sat)
(get-model)

(declare-fun d!165375 () Bool)

(assert (=> d!165375 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135264 d!165375))

(declare-fun d!165379 () Bool)

(assert (=> d!165379 (= (array_inv!39653 _keys!600) (bvsge (size!51249 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135264 d!165379))

(declare-fun b!1574407 () Bool)

(declare-fun lt!674710 () SeekEntryResult!13505)

(assert (=> b!1574407 (and (bvsge (index!56420 lt!674710) #b00000000000000000000000000000000) (bvslt (index!56420 lt!674710) (size!51249 _keys!600)))))

(declare-fun e!878035 () Bool)

(assert (=> b!1574407 (= e!878035 (= (select (arr!50698 _keys!600) (index!56420 lt!674710)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1574408 () Bool)

(assert (=> b!1574408 (and (bvsge (index!56420 lt!674710) #b00000000000000000000000000000000) (bvslt (index!56420 lt!674710) (size!51249 _keys!600)))))

(declare-fun res!1074920 () Bool)

(assert (=> b!1574408 (= res!1074920 (= (select (arr!50698 _keys!600) (index!56420 lt!674710)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1574408 (=> res!1074920 e!878035)))

(declare-fun b!1574409 () Bool)

(declare-fun e!878036 () SeekEntryResult!13505)

(declare-fun e!878034 () SeekEntryResult!13505)

(assert (=> b!1574409 (= e!878036 e!878034)))

(declare-fun c!145996 () Bool)

(declare-fun lt!674709 () (_ BitVec 64))

(assert (=> b!1574409 (= c!145996 (or (= lt!674709 k0!754) (= (bvadd lt!674709 lt!674709) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1574410 () Bool)

(declare-fun e!878032 () Bool)

(assert (=> b!1574410 (= e!878032 (bvsge (x!141392 lt!674710) #b01111111111111111111111111111110))))

(declare-fun b!1574411 () Bool)

(assert (=> b!1574411 (= e!878036 (Intermediate!13505 true (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun d!165381 () Bool)

(assert (=> d!165381 e!878032))

(declare-fun c!145995 () Bool)

(assert (=> d!165381 (= c!145995 (and ((_ is Intermediate!13505) lt!674710) (undefined!14317 lt!674710)))))

(assert (=> d!165381 (= lt!674710 e!878036)))

(declare-fun c!145997 () Bool)

(assert (=> d!165381 (= c!145997 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165381 (= lt!674709 (select (arr!50698 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!165381 (validMask!0 mask!889)))

(assert (=> d!165381 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!674710)))

(declare-fun b!1574412 () Bool)

(declare-fun e!878033 () Bool)

(assert (=> b!1574412 (= e!878032 e!878033)))

(declare-fun res!1074918 () Bool)

(assert (=> b!1574412 (= res!1074918 (and ((_ is Intermediate!13505) lt!674710) (not (undefined!14317 lt!674710)) (bvslt (x!141392 lt!674710) #b01111111111111111111111111111110) (bvsge (x!141392 lt!674710) #b00000000000000000000000000000000) (bvsge (x!141392 lt!674710) #b00000000000000000000000000000000)))))

(assert (=> b!1574412 (=> (not res!1074918) (not e!878033))))

(declare-fun b!1574413 () Bool)

(assert (=> b!1574413 (and (bvsge (index!56420 lt!674710) #b00000000000000000000000000000000) (bvslt (index!56420 lt!674710) (size!51249 _keys!600)))))

(declare-fun res!1074919 () Bool)

(assert (=> b!1574413 (= res!1074919 (= (select (arr!50698 _keys!600) (index!56420 lt!674710)) k0!754))))

(assert (=> b!1574413 (=> res!1074919 e!878035)))

(assert (=> b!1574413 (= e!878033 e!878035)))

(declare-fun b!1574414 () Bool)

(assert (=> b!1574414 (= e!878034 (Intermediate!13505 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1574415 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574415 (= e!878034 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and d!165381 c!145997) b!1574411))

(assert (= (and d!165381 (not c!145997)) b!1574409))

(assert (= (and b!1574409 c!145996) b!1574414))

(assert (= (and b!1574409 (not c!145996)) b!1574415))

(assert (= (and d!165381 c!145995) b!1574410))

(assert (= (and d!165381 (not c!145995)) b!1574412))

(assert (= (and b!1574412 res!1074918) b!1574413))

(assert (= (and b!1574413 (not res!1074919)) b!1574408))

(assert (= (and b!1574408 (not res!1074920)) b!1574407))

(declare-fun m!1448099 () Bool)

(assert (=> b!1574408 m!1448099))

(assert (=> d!165381 m!1448063))

(declare-fun m!1448101 () Bool)

(assert (=> d!165381 m!1448101))

(assert (=> d!165381 m!1448055))

(assert (=> b!1574407 m!1448099))

(assert (=> b!1574415 m!1448063))

(declare-fun m!1448103 () Bool)

(assert (=> b!1574415 m!1448103))

(assert (=> b!1574415 m!1448103))

(declare-fun m!1448105 () Bool)

(assert (=> b!1574415 m!1448105))

(assert (=> b!1574413 m!1448099))

(assert (=> b!1574343 d!165381))

(declare-fun d!165395 () Bool)

(declare-fun lt!674722 () (_ BitVec 32))

(declare-fun lt!674721 () (_ BitVec 32))

(assert (=> d!165395 (= lt!674722 (bvmul (bvxor lt!674721 (bvlshr lt!674721 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165395 (= lt!674721 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165395 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074924 (let ((h!38261 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141399 (bvmul (bvxor h!38261 (bvlshr h!38261 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141399 (bvlshr x!141399 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074924 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074924 #b00000000000000000000000000000000))))))

(assert (=> d!165395 (= (toIndex!0 k0!754 mask!889) (bvand (bvxor lt!674722 (bvlshr lt!674722 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1574343 d!165395))

(declare-fun d!165399 () Bool)

(assert (=> d!165399 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1574342 d!165399))

(check-sat (not d!165381) (not b!1574415))
(check-sat)
