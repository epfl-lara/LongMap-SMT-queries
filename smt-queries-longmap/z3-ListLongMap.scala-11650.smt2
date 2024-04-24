; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136522 () Bool)

(assert start!136522)

(declare-datatypes ((array!105602 0))(
  ( (array!105603 (arr!50923 (Array (_ BitVec 32) (_ BitVec 64))) (size!51474 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105602)

(declare-fun b!1578711 () Bool)

(declare-fun e!880688 () Bool)

(declare-datatypes ((SeekEntryResult!13682 0))(
  ( (MissingZero!13682 (index!57126 (_ BitVec 32))) (Found!13682 (index!57127 (_ BitVec 32))) (Intermediate!13682 (undefined!14494 Bool) (index!57128 (_ BitVec 32)) (x!142328 (_ BitVec 32))) (Undefined!13682) (MissingVacant!13682 (index!57129 (_ BitVec 32))) )
))
(declare-fun lt!676446 () SeekEntryResult!13682)

(declare-fun k0!761 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1578711 (= e!880688 (and (not ((_ is Undefined!13682) lt!676446)) (ite ((_ is Found!13682) lt!676446) (not (= (select (arr!50923 _keys!605) (index!57127 lt!676446)) k0!761)) (ite ((_ is MissingZero!13682) lt!676446) (not (= (select (arr!50923 _keys!605) (index!57126 lt!676446)) #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not ((_ is MissingVacant!13682) lt!676446)) (not (= (select (arr!50923 _keys!605) (index!57129 lt!676446)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun lt!676445 () SeekEntryResult!13682)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105602 (_ BitVec 32)) SeekEntryResult!13682)

(assert (=> b!1578711 (= lt!676446 (seekKeyOrZeroReturnVacant!0 (x!142328 lt!676445) (index!57128 lt!676445) (index!57128 lt!676445) k0!761 _keys!605 mask!898))))

(declare-fun b!1578710 () Bool)

(declare-fun e!880686 () Bool)

(assert (=> b!1578710 (= e!880686 e!880688)))

(declare-fun res!1077756 () Bool)

(assert (=> b!1578710 (=> (not res!1077756) (not e!880688))))

(assert (=> b!1578710 (= res!1077756 (and (not (undefined!14494 lt!676445)) ((_ is Intermediate!13682) lt!676445) (not (= (select (arr!50923 _keys!605) (index!57128 lt!676445)) k0!761)) (not (= (select (arr!50923 _keys!605) (index!57128 lt!676445)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50923 _keys!605) (index!57128 lt!676445)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!57128 lt!676445) #b00000000000000000000000000000000) (bvslt (index!57128 lt!676445) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105602 (_ BitVec 32)) SeekEntryResult!13682)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578710 (= lt!676445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun res!1077758 () Bool)

(assert (=> start!136522 (=> (not res!1077758) (not e!880686))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136522 (= res!1077758 (validMask!0 mask!898))))

(assert (=> start!136522 e!880686))

(assert (=> start!136522 true))

(declare-fun array_inv!39878 (array!105602) Bool)

(assert (=> start!136522 (array_inv!39878 _keys!605)))

(declare-fun b!1578708 () Bool)

(declare-fun res!1077755 () Bool)

(assert (=> b!1578708 (=> (not res!1077755) (not e!880686))))

(assert (=> b!1578708 (= res!1077755 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51474 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1578709 () Bool)

(declare-fun res!1077757 () Bool)

(assert (=> b!1578709 (=> (not res!1077757) (not e!880686))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578709 (= res!1077757 (validKeyInArray!0 k0!761))))

(assert (= (and start!136522 res!1077758) b!1578708))

(assert (= (and b!1578708 res!1077755) b!1578709))

(assert (= (and b!1578709 res!1077757) b!1578710))

(assert (= (and b!1578710 res!1077756) b!1578711))

(declare-fun m!1451217 () Bool)

(assert (=> b!1578711 m!1451217))

(declare-fun m!1451219 () Bool)

(assert (=> b!1578711 m!1451219))

(declare-fun m!1451221 () Bool)

(assert (=> b!1578711 m!1451221))

(declare-fun m!1451223 () Bool)

(assert (=> b!1578711 m!1451223))

(declare-fun m!1451225 () Bool)

(assert (=> b!1578710 m!1451225))

(declare-fun m!1451227 () Bool)

(assert (=> b!1578710 m!1451227))

(assert (=> b!1578710 m!1451227))

(declare-fun m!1451229 () Bool)

(assert (=> b!1578710 m!1451229))

(declare-fun m!1451231 () Bool)

(assert (=> start!136522 m!1451231))

(declare-fun m!1451233 () Bool)

(assert (=> start!136522 m!1451233))

(declare-fun m!1451235 () Bool)

(assert (=> b!1578709 m!1451235))

(check-sat (not b!1578709) (not start!136522) (not b!1578710) (not b!1578711))
(check-sat)
(get-model)

(declare-fun d!166333 () Bool)

(assert (=> d!166333 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1578709 d!166333))

(declare-fun d!166335 () Bool)

(assert (=> d!166335 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136522 d!166335))

(declare-fun d!166337 () Bool)

(assert (=> d!166337 (= (array_inv!39878 _keys!605) (bvsge (size!51474 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136522 d!166337))

(declare-fun b!1578754 () Bool)

(declare-fun e!880718 () SeekEntryResult!13682)

(assert (=> b!1578754 (= e!880718 (Intermediate!13682 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1578755 () Bool)

(declare-fun e!880721 () Bool)

(declare-fun e!880717 () Bool)

(assert (=> b!1578755 (= e!880721 e!880717)))

(declare-fun res!1077790 () Bool)

(declare-fun lt!676464 () SeekEntryResult!13682)

(assert (=> b!1578755 (= res!1077790 (and ((_ is Intermediate!13682) lt!676464) (not (undefined!14494 lt!676464)) (bvslt (x!142328 lt!676464) #b01111111111111111111111111111110) (bvsge (x!142328 lt!676464) #b00000000000000000000000000000000) (bvsge (x!142328 lt!676464) #b00000000000000000000000000000000)))))

(assert (=> b!1578755 (=> (not res!1077790) (not e!880717))))

(declare-fun d!166339 () Bool)

(assert (=> d!166339 e!880721))

(declare-fun c!146769 () Bool)

(assert (=> d!166339 (= c!146769 (and ((_ is Intermediate!13682) lt!676464) (undefined!14494 lt!676464)))))

(assert (=> d!166339 (= lt!676464 e!880718)))

(declare-fun c!146771 () Bool)

(assert (=> d!166339 (= c!146771 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!676463 () (_ BitVec 64))

(assert (=> d!166339 (= lt!676463 (select (arr!50923 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!166339 (validMask!0 mask!898)))

(assert (=> d!166339 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!676464)))

(declare-fun b!1578756 () Bool)

(assert (=> b!1578756 (and (bvsge (index!57128 lt!676464) #b00000000000000000000000000000000) (bvslt (index!57128 lt!676464) (size!51474 _keys!605)))))

(declare-fun e!880720 () Bool)

(assert (=> b!1578756 (= e!880720 (= (select (arr!50923 _keys!605) (index!57128 lt!676464)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1578757 () Bool)

(assert (=> b!1578757 (and (bvsge (index!57128 lt!676464) #b00000000000000000000000000000000) (bvslt (index!57128 lt!676464) (size!51474 _keys!605)))))

(declare-fun res!1077789 () Bool)

(assert (=> b!1578757 (= res!1077789 (= (select (arr!50923 _keys!605) (index!57128 lt!676464)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1578757 (=> res!1077789 e!880720)))

(declare-fun b!1578758 () Bool)

(declare-fun e!880719 () SeekEntryResult!13682)

(assert (=> b!1578758 (= e!880718 e!880719)))

(declare-fun c!146770 () Bool)

(assert (=> b!1578758 (= c!146770 (or (= lt!676463 k0!761) (= (bvadd lt!676463 lt!676463) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578759 () Bool)

(assert (=> b!1578759 (and (bvsge (index!57128 lt!676464) #b00000000000000000000000000000000) (bvslt (index!57128 lt!676464) (size!51474 _keys!605)))))

(declare-fun res!1077791 () Bool)

(assert (=> b!1578759 (= res!1077791 (= (select (arr!50923 _keys!605) (index!57128 lt!676464)) k0!761))))

(assert (=> b!1578759 (=> res!1077791 e!880720)))

(assert (=> b!1578759 (= e!880717 e!880720)))

(declare-fun b!1578760 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578760 (= e!880719 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1578761 () Bool)

(assert (=> b!1578761 (= e!880719 (Intermediate!13682 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1578762 () Bool)

(assert (=> b!1578762 (= e!880721 (bvsge (x!142328 lt!676464) #b01111111111111111111111111111110))))

(assert (= (and d!166339 c!146771) b!1578754))

(assert (= (and d!166339 (not c!146771)) b!1578758))

(assert (= (and b!1578758 c!146770) b!1578761))

(assert (= (and b!1578758 (not c!146770)) b!1578760))

(assert (= (and d!166339 c!146769) b!1578762))

(assert (= (and d!166339 (not c!146769)) b!1578755))

(assert (= (and b!1578755 res!1077790) b!1578759))

(assert (= (and b!1578759 (not res!1077791)) b!1578757))

(assert (= (and b!1578757 (not res!1077789)) b!1578756))

(declare-fun m!1451277 () Bool)

(assert (=> b!1578756 m!1451277))

(assert (=> b!1578759 m!1451277))

(assert (=> d!166339 m!1451227))

(declare-fun m!1451279 () Bool)

(assert (=> d!166339 m!1451279))

(assert (=> d!166339 m!1451231))

(assert (=> b!1578757 m!1451277))

(assert (=> b!1578760 m!1451227))

(declare-fun m!1451281 () Bool)

(assert (=> b!1578760 m!1451281))

(assert (=> b!1578760 m!1451281))

(declare-fun m!1451283 () Bool)

(assert (=> b!1578760 m!1451283))

(assert (=> b!1578710 d!166339))

(declare-fun d!166347 () Bool)

(declare-fun lt!676470 () (_ BitVec 32))

(declare-fun lt!676469 () (_ BitVec 32))

(assert (=> d!166347 (= lt!676470 (bvmul (bvxor lt!676469 (bvlshr lt!676469 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!166347 (= lt!676469 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!166347 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1077792 (let ((h!38332 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142332 (bvmul (bvxor h!38332 (bvlshr h!38332 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142332 (bvlshr x!142332 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1077792 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1077792 #b00000000000000000000000000000000))))))

(assert (=> d!166347 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!676470 (bvlshr lt!676470 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1578710 d!166347))

(declare-fun lt!676482 () SeekEntryResult!13682)

(declare-fun d!166351 () Bool)

(assert (=> d!166351 (and (or ((_ is Undefined!13682) lt!676482) (not ((_ is Found!13682) lt!676482)) (and (bvsge (index!57127 lt!676482) #b00000000000000000000000000000000) (bvslt (index!57127 lt!676482) (size!51474 _keys!605)))) (or ((_ is Undefined!13682) lt!676482) ((_ is Found!13682) lt!676482) (not ((_ is MissingVacant!13682) lt!676482)) (not (= (index!57129 lt!676482) (index!57128 lt!676445))) (and (bvsge (index!57129 lt!676482) #b00000000000000000000000000000000) (bvslt (index!57129 lt!676482) (size!51474 _keys!605)))) (or ((_ is Undefined!13682) lt!676482) (ite ((_ is Found!13682) lt!676482) (= (select (arr!50923 _keys!605) (index!57127 lt!676482)) k0!761) (and ((_ is MissingVacant!13682) lt!676482) (= (index!57129 lt!676482) (index!57128 lt!676445)) (= (select (arr!50923 _keys!605) (index!57129 lt!676482)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!880744 () SeekEntryResult!13682)

(assert (=> d!166351 (= lt!676482 e!880744)))

(declare-fun c!146787 () Bool)

(assert (=> d!166351 (= c!146787 (bvsge (x!142328 lt!676445) #b01111111111111111111111111111110))))

(declare-fun lt!676481 () (_ BitVec 64))

(assert (=> d!166351 (= lt!676481 (select (arr!50923 _keys!605) (index!57128 lt!676445)))))

(assert (=> d!166351 (validMask!0 mask!898)))

(assert (=> d!166351 (= (seekKeyOrZeroReturnVacant!0 (x!142328 lt!676445) (index!57128 lt!676445) (index!57128 lt!676445) k0!761 _keys!605 mask!898) lt!676482)))

(declare-fun b!1578802 () Bool)

(declare-fun e!880745 () SeekEntryResult!13682)

(assert (=> b!1578802 (= e!880744 e!880745)))

(declare-fun c!146788 () Bool)

(assert (=> b!1578802 (= c!146788 (= lt!676481 k0!761))))

(declare-fun b!1578803 () Bool)

(assert (=> b!1578803 (= e!880744 Undefined!13682)))

(declare-fun b!1578804 () Bool)

(assert (=> b!1578804 (= e!880745 (Found!13682 (index!57128 lt!676445)))))

(declare-fun b!1578805 () Bool)

(declare-fun c!146789 () Bool)

(assert (=> b!1578805 (= c!146789 (= lt!676481 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!880743 () SeekEntryResult!13682)

(assert (=> b!1578805 (= e!880745 e!880743)))

(declare-fun b!1578806 () Bool)

(assert (=> b!1578806 (= e!880743 (MissingVacant!13682 (index!57128 lt!676445)))))

(declare-fun b!1578807 () Bool)

(assert (=> b!1578807 (= e!880743 (seekKeyOrZeroReturnVacant!0 (bvadd (x!142328 lt!676445) #b00000000000000000000000000000001) (nextIndex!0 (index!57128 lt!676445) (bvadd (x!142328 lt!676445) #b00000000000000000000000000000001) mask!898) (index!57128 lt!676445) k0!761 _keys!605 mask!898))))

(assert (= (and d!166351 c!146787) b!1578803))

(assert (= (and d!166351 (not c!146787)) b!1578802))

(assert (= (and b!1578802 c!146788) b!1578804))

(assert (= (and b!1578802 (not c!146788)) b!1578805))

(assert (= (and b!1578805 c!146789) b!1578806))

(assert (= (and b!1578805 (not c!146789)) b!1578807))

(declare-fun m!1451293 () Bool)

(assert (=> d!166351 m!1451293))

(declare-fun m!1451295 () Bool)

(assert (=> d!166351 m!1451295))

(assert (=> d!166351 m!1451225))

(assert (=> d!166351 m!1451231))

(declare-fun m!1451297 () Bool)

(assert (=> b!1578807 m!1451297))

(assert (=> b!1578807 m!1451297))

(declare-fun m!1451299 () Bool)

(assert (=> b!1578807 m!1451299))

(assert (=> b!1578711 d!166351))

(check-sat (not d!166351) (not b!1578760) (not b!1578807) (not d!166339))
(check-sat)
