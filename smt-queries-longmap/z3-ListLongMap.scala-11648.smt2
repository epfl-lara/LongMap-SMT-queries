; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136438 () Bool)

(assert start!136438)

(declare-fun b!1578369 () Bool)

(declare-fun e!880489 () Bool)

(declare-datatypes ((SeekEntryResult!13676 0))(
  ( (MissingZero!13676 (index!57102 (_ BitVec 32))) (Found!13676 (index!57103 (_ BitVec 32))) (Intermediate!13676 (undefined!14488 Bool) (index!57104 (_ BitVec 32)) (x!142288 (_ BitVec 32))) (Undefined!13676) (MissingVacant!13676 (index!57105 (_ BitVec 32))) )
))
(declare-fun lt!676302 () SeekEntryResult!13676)

(declare-datatypes ((array!105584 0))(
  ( (array!105585 (arr!50917 (Array (_ BitVec 32) (_ BitVec 64))) (size!51468 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105584)

(get-info :version)

(assert (=> b!1578369 (= e!880489 (and (not ((_ is Undefined!13676) lt!676302)) (not ((_ is Found!13676) lt!676302)) ((_ is MissingZero!13676) lt!676302) (or (bvslt (index!57102 lt!676302) #b00000000000000000000000000000000) (bvsge (index!57102 lt!676302) (size!51468 _keys!605)))))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun lt!676301 () SeekEntryResult!13676)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105584 (_ BitVec 32)) SeekEntryResult!13676)

(assert (=> b!1578369 (= lt!676302 (seekKeyOrZeroReturnVacant!0 (x!142288 lt!676301) (index!57104 lt!676301) (index!57104 lt!676301) k0!761 _keys!605 mask!898))))

(declare-fun b!1578366 () Bool)

(declare-fun res!1077625 () Bool)

(declare-fun e!880490 () Bool)

(assert (=> b!1578366 (=> (not res!1077625) (not e!880490))))

(assert (=> b!1578366 (= res!1077625 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51468 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1578367 () Bool)

(declare-fun res!1077623 () Bool)

(assert (=> b!1578367 (=> (not res!1077623) (not e!880490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578367 (= res!1077623 (validKeyInArray!0 k0!761))))

(declare-fun res!1077626 () Bool)

(assert (=> start!136438 (=> (not res!1077626) (not e!880490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136438 (= res!1077626 (validMask!0 mask!898))))

(assert (=> start!136438 e!880490))

(assert (=> start!136438 true))

(declare-fun array_inv!39872 (array!105584) Bool)

(assert (=> start!136438 (array_inv!39872 _keys!605)))

(declare-fun b!1578368 () Bool)

(assert (=> b!1578368 (= e!880490 e!880489)))

(declare-fun res!1077624 () Bool)

(assert (=> b!1578368 (=> (not res!1077624) (not e!880489))))

(assert (=> b!1578368 (= res!1077624 (and (not (undefined!14488 lt!676301)) ((_ is Intermediate!13676) lt!676301) (not (= (select (arr!50917 _keys!605) (index!57104 lt!676301)) k0!761)) (not (= (select (arr!50917 _keys!605) (index!57104 lt!676301)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50917 _keys!605) (index!57104 lt!676301)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!57104 lt!676301) #b00000000000000000000000000000000) (bvslt (index!57104 lt!676301) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105584 (_ BitVec 32)) SeekEntryResult!13676)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578368 (= lt!676301 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!136438 res!1077626) b!1578366))

(assert (= (and b!1578366 res!1077625) b!1578367))

(assert (= (and b!1578367 res!1077623) b!1578368))

(assert (= (and b!1578368 res!1077624) b!1578369))

(declare-fun m!1451037 () Bool)

(assert (=> b!1578369 m!1451037))

(declare-fun m!1451039 () Bool)

(assert (=> b!1578367 m!1451039))

(declare-fun m!1451041 () Bool)

(assert (=> start!136438 m!1451041))

(declare-fun m!1451043 () Bool)

(assert (=> start!136438 m!1451043))

(declare-fun m!1451045 () Bool)

(assert (=> b!1578368 m!1451045))

(declare-fun m!1451047 () Bool)

(assert (=> b!1578368 m!1451047))

(assert (=> b!1578368 m!1451047))

(declare-fun m!1451049 () Bool)

(assert (=> b!1578368 m!1451049))

(check-sat (not b!1578367) (not start!136438) (not b!1578368) (not b!1578369))
(check-sat)
(get-model)

(declare-fun d!166257 () Bool)

(assert (=> d!166257 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1578367 d!166257))

(declare-fun d!166259 () Bool)

(assert (=> d!166259 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136438 d!166259))

(declare-fun d!166265 () Bool)

(assert (=> d!166265 (= (array_inv!39872 _keys!605) (bvsge (size!51468 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136438 d!166265))

(declare-fun b!1578412 () Bool)

(declare-fun e!880521 () SeekEntryResult!13676)

(declare-fun e!880519 () SeekEntryResult!13676)

(assert (=> b!1578412 (= e!880521 e!880519)))

(declare-fun c!146661 () Bool)

(declare-fun lt!676320 () (_ BitVec 64))

(assert (=> b!1578412 (= c!146661 (or (= lt!676320 k0!761) (= (bvadd lt!676320 lt!676320) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578413 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578413 (= e!880519 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1578414 () Bool)

(declare-fun lt!676319 () SeekEntryResult!13676)

(assert (=> b!1578414 (and (bvsge (index!57104 lt!676319) #b00000000000000000000000000000000) (bvslt (index!57104 lt!676319) (size!51468 _keys!605)))))

(declare-fun e!880523 () Bool)

(assert (=> b!1578414 (= e!880523 (= (select (arr!50917 _keys!605) (index!57104 lt!676319)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1578415 () Bool)

(assert (=> b!1578415 (= e!880521 (Intermediate!13676 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1578416 () Bool)

(assert (=> b!1578416 (= e!880519 (Intermediate!13676 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun d!166267 () Bool)

(declare-fun e!880522 () Bool)

(assert (=> d!166267 e!880522))

(declare-fun c!146662 () Bool)

(assert (=> d!166267 (= c!146662 (and ((_ is Intermediate!13676) lt!676319) (undefined!14488 lt!676319)))))

(assert (=> d!166267 (= lt!676319 e!880521)))

(declare-fun c!146663 () Bool)

(assert (=> d!166267 (= c!146663 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!166267 (= lt!676320 (select (arr!50917 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!166267 (validMask!0 mask!898)))

(assert (=> d!166267 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!676319)))

(declare-fun b!1578417 () Bool)

(assert (=> b!1578417 (and (bvsge (index!57104 lt!676319) #b00000000000000000000000000000000) (bvslt (index!57104 lt!676319) (size!51468 _keys!605)))))

(declare-fun res!1077659 () Bool)

(assert (=> b!1578417 (= res!1077659 (= (select (arr!50917 _keys!605) (index!57104 lt!676319)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1578417 (=> res!1077659 e!880523)))

(declare-fun b!1578418 () Bool)

(assert (=> b!1578418 (and (bvsge (index!57104 lt!676319) #b00000000000000000000000000000000) (bvslt (index!57104 lt!676319) (size!51468 _keys!605)))))

(declare-fun res!1077657 () Bool)

(assert (=> b!1578418 (= res!1077657 (= (select (arr!50917 _keys!605) (index!57104 lt!676319)) k0!761))))

(assert (=> b!1578418 (=> res!1077657 e!880523)))

(declare-fun e!880520 () Bool)

(assert (=> b!1578418 (= e!880520 e!880523)))

(declare-fun b!1578419 () Bool)

(assert (=> b!1578419 (= e!880522 (bvsge (x!142288 lt!676319) #b01111111111111111111111111111110))))

(declare-fun b!1578420 () Bool)

(assert (=> b!1578420 (= e!880522 e!880520)))

(declare-fun res!1077658 () Bool)

(assert (=> b!1578420 (= res!1077658 (and ((_ is Intermediate!13676) lt!676319) (not (undefined!14488 lt!676319)) (bvslt (x!142288 lt!676319) #b01111111111111111111111111111110) (bvsge (x!142288 lt!676319) #b00000000000000000000000000000000) (bvsge (x!142288 lt!676319) #b00000000000000000000000000000000)))))

(assert (=> b!1578420 (=> (not res!1077658) (not e!880520))))

(assert (= (and d!166267 c!146663) b!1578415))

(assert (= (and d!166267 (not c!146663)) b!1578412))

(assert (= (and b!1578412 c!146661) b!1578416))

(assert (= (and b!1578412 (not c!146661)) b!1578413))

(assert (= (and d!166267 c!146662) b!1578419))

(assert (= (and d!166267 (not c!146662)) b!1578420))

(assert (= (and b!1578420 res!1077658) b!1578418))

(assert (= (and b!1578418 (not res!1077657)) b!1578417))

(assert (= (and b!1578417 (not res!1077659)) b!1578414))

(assert (=> d!166267 m!1451047))

(declare-fun m!1451079 () Bool)

(assert (=> d!166267 m!1451079))

(assert (=> d!166267 m!1451041))

(declare-fun m!1451081 () Bool)

(assert (=> b!1578417 m!1451081))

(assert (=> b!1578413 m!1451047))

(declare-fun m!1451083 () Bool)

(assert (=> b!1578413 m!1451083))

(assert (=> b!1578413 m!1451083))

(declare-fun m!1451085 () Bool)

(assert (=> b!1578413 m!1451085))

(assert (=> b!1578414 m!1451081))

(assert (=> b!1578418 m!1451081))

(assert (=> b!1578368 d!166267))

(declare-fun d!166275 () Bool)

(declare-fun lt!676334 () (_ BitVec 32))

(declare-fun lt!676333 () (_ BitVec 32))

(assert (=> d!166275 (= lt!676334 (bvmul (bvxor lt!676333 (bvlshr lt!676333 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!166275 (= lt!676333 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!166275 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1077660 (let ((h!38326 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142294 (bvmul (bvxor h!38326 (bvlshr h!38326 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142294 (bvlshr x!142294 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1077660 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1077660 #b00000000000000000000000000000000))))))

(assert (=> d!166275 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!676334 (bvlshr lt!676334 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1578368 d!166275))

(declare-fun b!1578487 () Bool)

(declare-fun c!146690 () Bool)

(declare-fun lt!676356 () (_ BitVec 64))

(assert (=> b!1578487 (= c!146690 (= lt!676356 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!880562 () SeekEntryResult!13676)

(declare-fun e!880561 () SeekEntryResult!13676)

(assert (=> b!1578487 (= e!880562 e!880561)))

(declare-fun b!1578488 () Bool)

(declare-fun e!880560 () SeekEntryResult!13676)

(assert (=> b!1578488 (= e!880560 Undefined!13676)))

(declare-fun b!1578489 () Bool)

(assert (=> b!1578489 (= e!880561 (seekKeyOrZeroReturnVacant!0 (bvadd (x!142288 lt!676301) #b00000000000000000000000000000001) (nextIndex!0 (index!57104 lt!676301) (bvadd (x!142288 lt!676301) #b00000000000000000000000000000001) mask!898) (index!57104 lt!676301) k0!761 _keys!605 mask!898))))

(declare-fun d!166277 () Bool)

(declare-fun lt!676355 () SeekEntryResult!13676)

(assert (=> d!166277 (and (or ((_ is Undefined!13676) lt!676355) (not ((_ is Found!13676) lt!676355)) (and (bvsge (index!57103 lt!676355) #b00000000000000000000000000000000) (bvslt (index!57103 lt!676355) (size!51468 _keys!605)))) (or ((_ is Undefined!13676) lt!676355) ((_ is Found!13676) lt!676355) (not ((_ is MissingVacant!13676) lt!676355)) (not (= (index!57105 lt!676355) (index!57104 lt!676301))) (and (bvsge (index!57105 lt!676355) #b00000000000000000000000000000000) (bvslt (index!57105 lt!676355) (size!51468 _keys!605)))) (or ((_ is Undefined!13676) lt!676355) (ite ((_ is Found!13676) lt!676355) (= (select (arr!50917 _keys!605) (index!57103 lt!676355)) k0!761) (and ((_ is MissingVacant!13676) lt!676355) (= (index!57105 lt!676355) (index!57104 lt!676301)) (= (select (arr!50917 _keys!605) (index!57105 lt!676355)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!166277 (= lt!676355 e!880560)))

(declare-fun c!146689 () Bool)

(assert (=> d!166277 (= c!146689 (bvsge (x!142288 lt!676301) #b01111111111111111111111111111110))))

(assert (=> d!166277 (= lt!676356 (select (arr!50917 _keys!605) (index!57104 lt!676301)))))

(assert (=> d!166277 (validMask!0 mask!898)))

(assert (=> d!166277 (= (seekKeyOrZeroReturnVacant!0 (x!142288 lt!676301) (index!57104 lt!676301) (index!57104 lt!676301) k0!761 _keys!605 mask!898) lt!676355)))

(declare-fun b!1578490 () Bool)

(assert (=> b!1578490 (= e!880561 (MissingVacant!13676 (index!57104 lt!676301)))))

(declare-fun b!1578491 () Bool)

(assert (=> b!1578491 (= e!880562 (Found!13676 (index!57104 lt!676301)))))

(declare-fun b!1578492 () Bool)

(assert (=> b!1578492 (= e!880560 e!880562)))

(declare-fun c!146688 () Bool)

(assert (=> b!1578492 (= c!146688 (= lt!676356 k0!761))))

(assert (= (and d!166277 c!146689) b!1578488))

(assert (= (and d!166277 (not c!146689)) b!1578492))

(assert (= (and b!1578492 c!146688) b!1578491))

(assert (= (and b!1578492 (not c!146688)) b!1578487))

(assert (= (and b!1578487 c!146690) b!1578490))

(assert (= (and b!1578487 (not c!146690)) b!1578489))

(declare-fun m!1451103 () Bool)

(assert (=> b!1578489 m!1451103))

(assert (=> b!1578489 m!1451103))

(declare-fun m!1451105 () Bool)

(assert (=> b!1578489 m!1451105))

(declare-fun m!1451107 () Bool)

(assert (=> d!166277 m!1451107))

(declare-fun m!1451109 () Bool)

(assert (=> d!166277 m!1451109))

(assert (=> d!166277 m!1451045))

(assert (=> d!166277 m!1451041))

(assert (=> b!1578369 d!166277))

(check-sat (not d!166267) (not b!1578489) (not b!1578413) (not d!166277))
(check-sat)
