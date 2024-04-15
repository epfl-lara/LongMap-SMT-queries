; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135604 () Bool)

(assert start!135604)

(declare-fun res!1075817 () Bool)

(declare-fun e!878005 () Bool)

(assert (=> start!135604 (=> (not res!1075817) (not e!878005))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135604 (= res!1075817 (validMask!0 mask!898))))

(assert (=> start!135604 e!878005))

(assert (=> start!135604 true))

(declare-datatypes ((array!105239 0))(
  ( (array!105240 (arr!50765 (Array (_ BitVec 32) (_ BitVec 64))) (size!51317 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105239)

(declare-fun array_inv!39701 (array!105239) Bool)

(assert (=> start!135604 (array_inv!39701 _keys!605)))

(declare-fun b!1574337 () Bool)

(declare-fun res!1075816 () Bool)

(assert (=> b!1574337 (=> (not res!1075816) (not e!878005))))

(assert (=> b!1574337 (= res!1075816 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51317 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1574338 () Bool)

(declare-fun res!1075818 () Bool)

(assert (=> b!1574338 (=> (not res!1075818) (not e!878005))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1574338 (= res!1075818 (validKeyInArray!0 k0!761))))

(declare-datatypes ((SeekEntryResult!13665 0))(
  ( (MissingZero!13665 (index!57058 (_ BitVec 32))) (Found!13665 (index!57059 (_ BitVec 32))) (Intermediate!13665 (undefined!14477 Bool) (index!57060 (_ BitVec 32)) (x!142002 (_ BitVec 32))) (Undefined!13665) (MissingVacant!13665 (index!57061 (_ BitVec 32))) )
))
(declare-fun lt!674601 () SeekEntryResult!13665)

(declare-fun b!1574339 () Bool)

(get-info :version)

(assert (=> b!1574339 (= e!878005 (and ((_ is Intermediate!13665) lt!674601) (not (undefined!14477 lt!674601)) (not (= (select (arr!50765 _keys!605) (index!57060 lt!674601)) k0!761)) (not (= (select (arr!50765 _keys!605) (index!57060 lt!674601)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50765 _keys!605) (index!57060 lt!674601)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!57060 lt!674601) #b00000000000000000000000000000000) (bvslt (index!57060 lt!674601) (bvadd #b00000000000000000000000000000001 mask!898)) (or (bvsgt (x!142002 lt!674601) #b01111111111111111111111111111110) (bvslt (x!142002 lt!674601) #b00000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105239 (_ BitVec 32)) SeekEntryResult!13665)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574339 (= lt!674601 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!135604 res!1075817) b!1574337))

(assert (= (and b!1574337 res!1075816) b!1574338))

(assert (= (and b!1574338 res!1075818) b!1574339))

(declare-fun m!1446993 () Bool)

(assert (=> start!135604 m!1446993))

(declare-fun m!1446995 () Bool)

(assert (=> start!135604 m!1446995))

(declare-fun m!1446997 () Bool)

(assert (=> b!1574338 m!1446997))

(declare-fun m!1446999 () Bool)

(assert (=> b!1574339 m!1446999))

(declare-fun m!1447001 () Bool)

(assert (=> b!1574339 m!1447001))

(assert (=> b!1574339 m!1447001))

(declare-fun m!1447003 () Bool)

(assert (=> b!1574339 m!1447003))

(check-sat (not b!1574339) (not start!135604) (not b!1574338))
(check-sat)
(get-model)

(declare-fun d!165013 () Bool)

(declare-fun e!878033 () Bool)

(assert (=> d!165013 e!878033))

(declare-fun c!145530 () Bool)

(declare-fun lt!674613 () SeekEntryResult!13665)

(assert (=> d!165013 (= c!145530 (and ((_ is Intermediate!13665) lt!674613) (undefined!14477 lt!674613)))))

(declare-fun e!878032 () SeekEntryResult!13665)

(assert (=> d!165013 (= lt!674613 e!878032)))

(declare-fun c!145531 () Bool)

(assert (=> d!165013 (= c!145531 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!674612 () (_ BitVec 64))

(assert (=> d!165013 (= lt!674612 (select (arr!50765 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!165013 (validMask!0 mask!898)))

(assert (=> d!165013 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!674613)))

(declare-fun b!1574376 () Bool)

(declare-fun e!878031 () Bool)

(assert (=> b!1574376 (= e!878033 e!878031)))

(declare-fun res!1075843 () Bool)

(assert (=> b!1574376 (= res!1075843 (and ((_ is Intermediate!13665) lt!674613) (not (undefined!14477 lt!674613)) (bvslt (x!142002 lt!674613) #b01111111111111111111111111111110) (bvsge (x!142002 lt!674613) #b00000000000000000000000000000000) (bvsge (x!142002 lt!674613) #b00000000000000000000000000000000)))))

(assert (=> b!1574376 (=> (not res!1075843) (not e!878031))))

(declare-fun b!1574377 () Bool)

(declare-fun e!878029 () SeekEntryResult!13665)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1574377 (= e!878029 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1574378 () Bool)

(assert (=> b!1574378 (= e!878033 (bvsge (x!142002 lt!674613) #b01111111111111111111111111111110))))

(declare-fun b!1574379 () Bool)

(assert (=> b!1574379 (and (bvsge (index!57060 lt!674613) #b00000000000000000000000000000000) (bvslt (index!57060 lt!674613) (size!51317 _keys!605)))))

(declare-fun res!1075844 () Bool)

(assert (=> b!1574379 (= res!1075844 (= (select (arr!50765 _keys!605) (index!57060 lt!674613)) k0!761))))

(declare-fun e!878030 () Bool)

(assert (=> b!1574379 (=> res!1075844 e!878030)))

(assert (=> b!1574379 (= e!878031 e!878030)))

(declare-fun b!1574380 () Bool)

(assert (=> b!1574380 (= e!878032 (Intermediate!13665 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1574381 () Bool)

(assert (=> b!1574381 (and (bvsge (index!57060 lt!674613) #b00000000000000000000000000000000) (bvslt (index!57060 lt!674613) (size!51317 _keys!605)))))

(declare-fun res!1075845 () Bool)

(assert (=> b!1574381 (= res!1075845 (= (select (arr!50765 _keys!605) (index!57060 lt!674613)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1574381 (=> res!1075845 e!878030)))

(declare-fun b!1574382 () Bool)

(assert (=> b!1574382 (= e!878029 (Intermediate!13665 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1574383 () Bool)

(assert (=> b!1574383 (= e!878032 e!878029)))

(declare-fun c!145529 () Bool)

(assert (=> b!1574383 (= c!145529 (or (= lt!674612 k0!761) (= (bvadd lt!674612 lt!674612) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1574384 () Bool)

(assert (=> b!1574384 (and (bvsge (index!57060 lt!674613) #b00000000000000000000000000000000) (bvslt (index!57060 lt!674613) (size!51317 _keys!605)))))

(assert (=> b!1574384 (= e!878030 (= (select (arr!50765 _keys!605) (index!57060 lt!674613)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!165013 c!145531) b!1574380))

(assert (= (and d!165013 (not c!145531)) b!1574383))

(assert (= (and b!1574383 c!145529) b!1574382))

(assert (= (and b!1574383 (not c!145529)) b!1574377))

(assert (= (and d!165013 c!145530) b!1574378))

(assert (= (and d!165013 (not c!145530)) b!1574376))

(assert (= (and b!1574376 res!1075843) b!1574379))

(assert (= (and b!1574379 (not res!1075844)) b!1574381))

(assert (= (and b!1574381 (not res!1075845)) b!1574384))

(declare-fun m!1447029 () Bool)

(assert (=> b!1574379 m!1447029))

(assert (=> b!1574377 m!1447001))

(declare-fun m!1447031 () Bool)

(assert (=> b!1574377 m!1447031))

(assert (=> b!1574377 m!1447031))

(declare-fun m!1447033 () Bool)

(assert (=> b!1574377 m!1447033))

(assert (=> b!1574384 m!1447029))

(assert (=> d!165013 m!1447001))

(declare-fun m!1447035 () Bool)

(assert (=> d!165013 m!1447035))

(assert (=> d!165013 m!1446993))

(assert (=> b!1574381 m!1447029))

(assert (=> b!1574339 d!165013))

(declare-fun d!165019 () Bool)

(declare-fun lt!674623 () (_ BitVec 32))

(declare-fun lt!674622 () (_ BitVec 32))

(assert (=> d!165019 (= lt!674623 (bvmul (bvxor lt!674622 (bvlshr lt!674622 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165019 (= lt!674622 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165019 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1075846 (let ((h!38294 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142007 (bvmul (bvxor h!38294 (bvlshr h!38294 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142007 (bvlshr x!142007 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1075846 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1075846 #b00000000000000000000000000000000))))))

(assert (=> d!165019 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!674623 (bvlshr lt!674623 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1574339 d!165019))

(declare-fun d!165021 () Bool)

(assert (=> d!165021 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135604 d!165021))

(declare-fun d!165027 () Bool)

(assert (=> d!165027 (= (array_inv!39701 _keys!605) (bvsge (size!51317 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135604 d!165027))

(declare-fun d!165031 () Bool)

(assert (=> d!165031 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1574338 d!165031))

(check-sat (not b!1574377) (not d!165013))
(check-sat)
