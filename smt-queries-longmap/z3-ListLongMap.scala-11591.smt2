; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135048 () Bool)

(assert start!135048)

(declare-fun res!1074475 () Bool)

(declare-fun e!876800 () Bool)

(assert (=> start!135048 (=> (not res!1074475) (not e!876800))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135048 (= res!1074475 (validMask!0 mask!889))))

(assert (=> start!135048 e!876800))

(assert (=> start!135048 true))

(declare-datatypes ((array!104988 0))(
  ( (array!104989 (arr!50657 (Array (_ BitVec 32) (_ BitVec 64))) (size!51209 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104988)

(declare-fun array_inv!39593 (array!104988) Bool)

(assert (=> start!135048 (array_inv!39593 _keys!600)))

(declare-fun b!1572429 () Bool)

(declare-fun res!1074477 () Bool)

(assert (=> b!1572429 (=> (not res!1074477) (not e!876800))))

(assert (=> b!1572429 (= res!1074477 (= (size!51209 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572430 () Bool)

(declare-fun res!1074476 () Bool)

(assert (=> b!1572430 (=> (not res!1074476) (not e!876800))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572430 (= res!1074476 (validKeyInArray!0 k0!754))))

(declare-fun b!1572431 () Bool)

(declare-datatypes ((SeekEntryResult!13605 0))(
  ( (MissingZero!13605 (index!56818 (_ BitVec 32))) (Found!13605 (index!56819 (_ BitVec 32))) (Intermediate!13605 (undefined!14417 Bool) (index!56820 (_ BitVec 32)) (x!141594 (_ BitVec 32))) (Undefined!13605) (MissingVacant!13605 (index!56821 (_ BitVec 32))) )
))
(declare-fun lt!673818 () SeekEntryResult!13605)

(get-info :version)

(assert (=> b!1572431 (= e!876800 (and ((_ is Intermediate!13605) lt!673818) (not (undefined!14417 lt!673818)) (not (= (select (arr!50657 _keys!600) (index!56820 lt!673818)) k0!754)) (not (= (select (arr!50657 _keys!600) (index!56820 lt!673818)) #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvslt (index!56820 lt!673818) #b00000000000000000000000000000000) (bvsge (index!56820 lt!673818) (size!51209 _keys!600)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104988 (_ BitVec 32)) SeekEntryResult!13605)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572431 (= lt!673818 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!135048 res!1074475) b!1572429))

(assert (= (and b!1572429 res!1074477) b!1572430))

(assert (= (and b!1572430 res!1074476) b!1572431))

(declare-fun m!1445529 () Bool)

(assert (=> start!135048 m!1445529))

(declare-fun m!1445531 () Bool)

(assert (=> start!135048 m!1445531))

(declare-fun m!1445533 () Bool)

(assert (=> b!1572430 m!1445533))

(declare-fun m!1445535 () Bool)

(assert (=> b!1572431 m!1445535))

(declare-fun m!1445537 () Bool)

(assert (=> b!1572431 m!1445537))

(assert (=> b!1572431 m!1445537))

(declare-fun m!1445539 () Bool)

(assert (=> b!1572431 m!1445539))

(check-sat (not b!1572431) (not start!135048) (not b!1572430))
(check-sat)
(get-model)

(declare-fun b!1572484 () Bool)

(declare-fun e!876835 () Bool)

(declare-fun lt!673833 () SeekEntryResult!13605)

(assert (=> b!1572484 (= e!876835 (bvsge (x!141594 lt!673833) #b01111111111111111111111111111110))))

(declare-fun b!1572485 () Bool)

(declare-fun e!876837 () Bool)

(assert (=> b!1572485 (= e!876835 e!876837)))

(declare-fun res!1074507 () Bool)

(assert (=> b!1572485 (= res!1074507 (and ((_ is Intermediate!13605) lt!673833) (not (undefined!14417 lt!673833)) (bvslt (x!141594 lt!673833) #b01111111111111111111111111111110) (bvsge (x!141594 lt!673833) #b00000000000000000000000000000000) (bvsge (x!141594 lt!673833) #b00000000000000000000000000000000)))))

(assert (=> b!1572485 (=> (not res!1074507) (not e!876837))))

(declare-fun d!164601 () Bool)

(assert (=> d!164601 e!876835))

(declare-fun c!145239 () Bool)

(assert (=> d!164601 (= c!145239 (and ((_ is Intermediate!13605) lt!673833) (undefined!14417 lt!673833)))))

(declare-fun e!876833 () SeekEntryResult!13605)

(assert (=> d!164601 (= lt!673833 e!876833)))

(declare-fun c!145238 () Bool)

(assert (=> d!164601 (= c!145238 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!673834 () (_ BitVec 64))

(assert (=> d!164601 (= lt!673834 (select (arr!50657 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!164601 (validMask!0 mask!889)))

(assert (=> d!164601 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!673833)))

(declare-fun b!1572486 () Bool)

(assert (=> b!1572486 (and (bvsge (index!56820 lt!673833) #b00000000000000000000000000000000) (bvslt (index!56820 lt!673833) (size!51209 _keys!600)))))

(declare-fun e!876834 () Bool)

(assert (=> b!1572486 (= e!876834 (= (select (arr!50657 _keys!600) (index!56820 lt!673833)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1572487 () Bool)

(assert (=> b!1572487 (= e!876833 (Intermediate!13605 true (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572488 () Bool)

(declare-fun e!876836 () SeekEntryResult!13605)

(assert (=> b!1572488 (= e!876833 e!876836)))

(declare-fun c!145240 () Bool)

(assert (=> b!1572488 (= c!145240 (or (= lt!673834 k0!754) (= (bvadd lt!673834 lt!673834) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1572489 () Bool)

(assert (=> b!1572489 (= e!876836 (Intermediate!13605 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572490 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572490 (= e!876836 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1572491 () Bool)

(assert (=> b!1572491 (and (bvsge (index!56820 lt!673833) #b00000000000000000000000000000000) (bvslt (index!56820 lt!673833) (size!51209 _keys!600)))))

(declare-fun res!1074506 () Bool)

(assert (=> b!1572491 (= res!1074506 (= (select (arr!50657 _keys!600) (index!56820 lt!673833)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1572491 (=> res!1074506 e!876834)))

(declare-fun b!1572492 () Bool)

(assert (=> b!1572492 (and (bvsge (index!56820 lt!673833) #b00000000000000000000000000000000) (bvslt (index!56820 lt!673833) (size!51209 _keys!600)))))

(declare-fun res!1074508 () Bool)

(assert (=> b!1572492 (= res!1074508 (= (select (arr!50657 _keys!600) (index!56820 lt!673833)) k0!754))))

(assert (=> b!1572492 (=> res!1074508 e!876834)))

(assert (=> b!1572492 (= e!876837 e!876834)))

(assert (= (and d!164601 c!145238) b!1572487))

(assert (= (and d!164601 (not c!145238)) b!1572488))

(assert (= (and b!1572488 c!145240) b!1572489))

(assert (= (and b!1572488 (not c!145240)) b!1572490))

(assert (= (and d!164601 c!145239) b!1572484))

(assert (= (and d!164601 (not c!145239)) b!1572485))

(assert (= (and b!1572485 res!1074507) b!1572492))

(assert (= (and b!1572492 (not res!1074508)) b!1572491))

(assert (= (and b!1572491 (not res!1074506)) b!1572486))

(declare-fun m!1445565 () Bool)

(assert (=> b!1572486 m!1445565))

(assert (=> d!164601 m!1445537))

(declare-fun m!1445567 () Bool)

(assert (=> d!164601 m!1445567))

(assert (=> d!164601 m!1445529))

(assert (=> b!1572491 m!1445565))

(assert (=> b!1572490 m!1445537))

(declare-fun m!1445569 () Bool)

(assert (=> b!1572490 m!1445569))

(assert (=> b!1572490 m!1445569))

(declare-fun m!1445571 () Bool)

(assert (=> b!1572490 m!1445571))

(assert (=> b!1572492 m!1445565))

(assert (=> b!1572431 d!164601))

(declare-fun d!164609 () Bool)

(declare-fun lt!673842 () (_ BitVec 32))

(declare-fun lt!673841 () (_ BitVec 32))

(assert (=> d!164609 (= lt!673842 (bvmul (bvxor lt!673841 (bvlshr lt!673841 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!164609 (= lt!673841 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!164609 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1074511 (let ((h!38267 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141599 (bvmul (bvxor h!38267 (bvlshr h!38267 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141599 (bvlshr x!141599 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1074511 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1074511 #b00000000000000000000000000000000))))))

(assert (=> d!164609 (= (toIndex!0 k0!754 mask!889) (bvand (bvxor lt!673842 (bvlshr lt!673842 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1572431 d!164609))

(declare-fun d!164613 () Bool)

(assert (=> d!164613 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135048 d!164613))

(declare-fun d!164619 () Bool)

(assert (=> d!164619 (= (array_inv!39593 _keys!600) (bvsge (size!51209 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135048 d!164619))

(declare-fun d!164621 () Bool)

(assert (=> d!164621 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1572430 d!164621))

(check-sat (not b!1572490) (not d!164601))
(check-sat)
