; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!136480 () Bool)

(assert start!136480)

(declare-fun b!1578538 () Bool)

(declare-fun res!1077690 () Bool)

(declare-fun e!880589 () Bool)

(assert (=> b!1578538 (=> (not res!1077690) (not e!880589))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1578538 (= res!1077690 (validKeyInArray!0 k0!761))))

(declare-fun b!1578537 () Bool)

(declare-fun res!1077692 () Bool)

(assert (=> b!1578537 (=> (not res!1077692) (not e!880589))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-datatypes ((array!105593 0))(
  ( (array!105594 (arr!50920 (Array (_ BitVec 32) (_ BitVec 64))) (size!51471 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105593)

(assert (=> b!1578537 (= res!1077692 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51471 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1578539 () Bool)

(declare-fun e!880588 () Bool)

(assert (=> b!1578539 (= e!880589 e!880588)))

(declare-fun res!1077691 () Bool)

(assert (=> b!1578539 (=> (not res!1077691) (not e!880588))))

(declare-datatypes ((SeekEntryResult!13679 0))(
  ( (MissingZero!13679 (index!57114 (_ BitVec 32))) (Found!13679 (index!57115 (_ BitVec 32))) (Intermediate!13679 (undefined!14491 Bool) (index!57116 (_ BitVec 32)) (x!142308 (_ BitVec 32))) (Undefined!13679) (MissingVacant!13679 (index!57117 (_ BitVec 32))) )
))
(declare-fun lt!676373 () SeekEntryResult!13679)

(get-info :version)

(assert (=> b!1578539 (= res!1077691 (and (not (undefined!14491 lt!676373)) ((_ is Intermediate!13679) lt!676373) (not (= (select (arr!50920 _keys!605) (index!57116 lt!676373)) k0!761)) (not (= (select (arr!50920 _keys!605) (index!57116 lt!676373)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50920 _keys!605) (index!57116 lt!676373)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!57116 lt!676373) #b00000000000000000000000000000000) (bvslt (index!57116 lt!676373) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105593 (_ BitVec 32)) SeekEntryResult!13679)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578539 (= lt!676373 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun res!1077689 () Bool)

(assert (=> start!136480 (=> (not res!1077689) (not e!880589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136480 (= res!1077689 (validMask!0 mask!898))))

(assert (=> start!136480 e!880589))

(assert (=> start!136480 true))

(declare-fun array_inv!39875 (array!105593) Bool)

(assert (=> start!136480 (array_inv!39875 _keys!605)))

(declare-fun b!1578540 () Bool)

(declare-fun lt!676374 () SeekEntryResult!13679)

(assert (=> b!1578540 (= e!880588 (and (not ((_ is Undefined!13679) lt!676374)) (not ((_ is Found!13679) lt!676374)) (not ((_ is MissingZero!13679) lt!676374)) ((_ is MissingVacant!13679) lt!676374) (or (bvslt (index!57117 lt!676374) #b00000000000000000000000000000000) (bvsge (index!57117 lt!676374) (size!51471 _keys!605)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105593 (_ BitVec 32)) SeekEntryResult!13679)

(assert (=> b!1578540 (= lt!676374 (seekKeyOrZeroReturnVacant!0 (x!142308 lt!676373) (index!57116 lt!676373) (index!57116 lt!676373) k0!761 _keys!605 mask!898))))

(assert (= (and start!136480 res!1077689) b!1578537))

(assert (= (and b!1578537 res!1077692) b!1578538))

(assert (= (and b!1578538 res!1077690) b!1578539))

(assert (= (and b!1578539 res!1077691) b!1578540))

(declare-fun m!1451127 () Bool)

(assert (=> b!1578538 m!1451127))

(declare-fun m!1451129 () Bool)

(assert (=> b!1578539 m!1451129))

(declare-fun m!1451131 () Bool)

(assert (=> b!1578539 m!1451131))

(assert (=> b!1578539 m!1451131))

(declare-fun m!1451133 () Bool)

(assert (=> b!1578539 m!1451133))

(declare-fun m!1451135 () Bool)

(assert (=> start!136480 m!1451135))

(declare-fun m!1451137 () Bool)

(assert (=> start!136480 m!1451137))

(declare-fun m!1451139 () Bool)

(assert (=> b!1578540 m!1451139))

(check-sat (not b!1578538) (not start!136480) (not b!1578539) (not b!1578540))
(check-sat)
(get-model)

(declare-fun d!166297 () Bool)

(assert (=> d!166297 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1578538 d!166297))

(declare-fun d!166301 () Bool)

(assert (=> d!166301 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!136480 d!166301))

(declare-fun d!166307 () Bool)

(assert (=> d!166307 (= (array_inv!39875 _keys!605) (bvsge (size!51471 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!136480 d!166307))

(declare-fun b!1578610 () Bool)

(declare-fun e!880633 () SeekEntryResult!13679)

(assert (=> b!1578610 (= e!880633 (Intermediate!13679 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1578611 () Bool)

(declare-fun lt!676397 () SeekEntryResult!13679)

(assert (=> b!1578611 (and (bvsge (index!57116 lt!676397) #b00000000000000000000000000000000) (bvslt (index!57116 lt!676397) (size!51471 _keys!605)))))

(declare-fun res!1077732 () Bool)

(assert (=> b!1578611 (= res!1077732 (= (select (arr!50920 _keys!605) (index!57116 lt!676397)) k0!761))))

(declare-fun e!880637 () Bool)

(assert (=> b!1578611 (=> res!1077732 e!880637)))

(declare-fun e!880634 () Bool)

(assert (=> b!1578611 (= e!880634 e!880637)))

(declare-fun b!1578612 () Bool)

(declare-fun e!880636 () SeekEntryResult!13679)

(assert (=> b!1578612 (= e!880636 e!880633)))

(declare-fun c!146725 () Bool)

(declare-fun lt!676398 () (_ BitVec 64))

(assert (=> b!1578612 (= c!146725 (or (= lt!676398 k0!761) (= (bvadd lt!676398 lt!676398) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1578613 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1578613 (= e!880633 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1578615 () Bool)

(assert (=> b!1578615 (= e!880636 (Intermediate!13679 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1578616 () Bool)

(assert (=> b!1578616 (and (bvsge (index!57116 lt!676397) #b00000000000000000000000000000000) (bvslt (index!57116 lt!676397) (size!51471 _keys!605)))))

(declare-fun res!1077733 () Bool)

(assert (=> b!1578616 (= res!1077733 (= (select (arr!50920 _keys!605) (index!57116 lt!676397)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1578616 (=> res!1077733 e!880637)))

(declare-fun b!1578617 () Bool)

(declare-fun e!880635 () Bool)

(assert (=> b!1578617 (= e!880635 e!880634)))

(declare-fun res!1077734 () Bool)

(assert (=> b!1578617 (= res!1077734 (and ((_ is Intermediate!13679) lt!676397) (not (undefined!14491 lt!676397)) (bvslt (x!142308 lt!676397) #b01111111111111111111111111111110) (bvsge (x!142308 lt!676397) #b00000000000000000000000000000000) (bvsge (x!142308 lt!676397) #b00000000000000000000000000000000)))))

(assert (=> b!1578617 (=> (not res!1077734) (not e!880634))))

(declare-fun b!1578618 () Bool)

(assert (=> b!1578618 (and (bvsge (index!57116 lt!676397) #b00000000000000000000000000000000) (bvslt (index!57116 lt!676397) (size!51471 _keys!605)))))

(assert (=> b!1578618 (= e!880637 (= (select (arr!50920 _keys!605) (index!57116 lt!676397)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!166309 () Bool)

(assert (=> d!166309 e!880635))

(declare-fun c!146726 () Bool)

(assert (=> d!166309 (= c!146726 (and ((_ is Intermediate!13679) lt!676397) (undefined!14491 lt!676397)))))

(assert (=> d!166309 (= lt!676397 e!880636)))

(declare-fun c!146724 () Bool)

(assert (=> d!166309 (= c!146724 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!166309 (= lt!676398 (select (arr!50920 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!166309 (validMask!0 mask!898)))

(assert (=> d!166309 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!676397)))

(declare-fun b!1578614 () Bool)

(assert (=> b!1578614 (= e!880635 (bvsge (x!142308 lt!676397) #b01111111111111111111111111111110))))

(assert (= (and d!166309 c!146724) b!1578615))

(assert (= (and d!166309 (not c!146724)) b!1578612))

(assert (= (and b!1578612 c!146725) b!1578610))

(assert (= (and b!1578612 (not c!146725)) b!1578613))

(assert (= (and d!166309 c!146726) b!1578614))

(assert (= (and d!166309 (not c!146726)) b!1578617))

(assert (= (and b!1578617 res!1077734) b!1578611))

(assert (= (and b!1578611 (not res!1077732)) b!1578616))

(assert (= (and b!1578616 (not res!1077733)) b!1578618))

(declare-fun m!1451177 () Bool)

(assert (=> b!1578611 m!1451177))

(assert (=> d!166309 m!1451131))

(declare-fun m!1451179 () Bool)

(assert (=> d!166309 m!1451179))

(assert (=> d!166309 m!1451135))

(assert (=> b!1578618 m!1451177))

(assert (=> b!1578613 m!1451131))

(declare-fun m!1451181 () Bool)

(assert (=> b!1578613 m!1451181))

(assert (=> b!1578613 m!1451181))

(declare-fun m!1451183 () Bool)

(assert (=> b!1578613 m!1451183))

(assert (=> b!1578616 m!1451177))

(assert (=> b!1578539 d!166309))

(declare-fun d!166321 () Bool)

(declare-fun lt!676410 () (_ BitVec 32))

(declare-fun lt!676409 () (_ BitVec 32))

(assert (=> d!166321 (= lt!676410 (bvmul (bvxor lt!676409 (bvlshr lt!676409 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!166321 (= lt!676409 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!166321 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1077736 (let ((h!38330 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142314 (bvmul (bvxor h!38330 (bvlshr h!38330 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142314 (bvlshr x!142314 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1077736 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1077736 #b00000000000000000000000000000000))))))

(assert (=> d!166321 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!676410 (bvlshr lt!676410 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1578539 d!166321))

(declare-fun b!1578676 () Bool)

(declare-fun e!880668 () SeekEntryResult!13679)

(declare-fun e!880669 () SeekEntryResult!13679)

(assert (=> b!1578676 (= e!880668 e!880669)))

(declare-fun c!146751 () Bool)

(declare-fun lt!676432 () (_ BitVec 64))

(assert (=> b!1578676 (= c!146751 (= lt!676432 k0!761))))

(declare-fun b!1578677 () Bool)

(declare-fun c!146753 () Bool)

(assert (=> b!1578677 (= c!146753 (= lt!676432 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!880670 () SeekEntryResult!13679)

(assert (=> b!1578677 (= e!880669 e!880670)))

(declare-fun d!166325 () Bool)

(declare-fun lt!676431 () SeekEntryResult!13679)

(assert (=> d!166325 (and (or ((_ is Undefined!13679) lt!676431) (not ((_ is Found!13679) lt!676431)) (and (bvsge (index!57115 lt!676431) #b00000000000000000000000000000000) (bvslt (index!57115 lt!676431) (size!51471 _keys!605)))) (or ((_ is Undefined!13679) lt!676431) ((_ is Found!13679) lt!676431) (not ((_ is MissingVacant!13679) lt!676431)) (not (= (index!57117 lt!676431) (index!57116 lt!676373))) (and (bvsge (index!57117 lt!676431) #b00000000000000000000000000000000) (bvslt (index!57117 lt!676431) (size!51471 _keys!605)))) (or ((_ is Undefined!13679) lt!676431) (ite ((_ is Found!13679) lt!676431) (= (select (arr!50920 _keys!605) (index!57115 lt!676431)) k0!761) (and ((_ is MissingVacant!13679) lt!676431) (= (index!57117 lt!676431) (index!57116 lt!676373)) (= (select (arr!50920 _keys!605) (index!57117 lt!676431)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!166325 (= lt!676431 e!880668)))

(declare-fun c!146752 () Bool)

(assert (=> d!166325 (= c!146752 (bvsge (x!142308 lt!676373) #b01111111111111111111111111111110))))

(assert (=> d!166325 (= lt!676432 (select (arr!50920 _keys!605) (index!57116 lt!676373)))))

(assert (=> d!166325 (validMask!0 mask!898)))

(assert (=> d!166325 (= (seekKeyOrZeroReturnVacant!0 (x!142308 lt!676373) (index!57116 lt!676373) (index!57116 lt!676373) k0!761 _keys!605 mask!898) lt!676431)))

(declare-fun b!1578678 () Bool)

(assert (=> b!1578678 (= e!880669 (Found!13679 (index!57116 lt!676373)))))

(declare-fun b!1578679 () Bool)

(assert (=> b!1578679 (= e!880670 (seekKeyOrZeroReturnVacant!0 (bvadd (x!142308 lt!676373) #b00000000000000000000000000000001) (nextIndex!0 (index!57116 lt!676373) (bvadd (x!142308 lt!676373) #b00000000000000000000000000000001) mask!898) (index!57116 lt!676373) k0!761 _keys!605 mask!898))))

(declare-fun b!1578680 () Bool)

(assert (=> b!1578680 (= e!880670 (MissingVacant!13679 (index!57116 lt!676373)))))

(declare-fun b!1578681 () Bool)

(assert (=> b!1578681 (= e!880668 Undefined!13679)))

(assert (= (and d!166325 c!146752) b!1578681))

(assert (= (and d!166325 (not c!146752)) b!1578676))

(assert (= (and b!1578676 c!146751) b!1578678))

(assert (= (and b!1578676 (not c!146751)) b!1578677))

(assert (= (and b!1578677 c!146753) b!1578680))

(assert (= (and b!1578677 (not c!146753)) b!1578679))

(declare-fun m!1451201 () Bool)

(assert (=> d!166325 m!1451201))

(declare-fun m!1451203 () Bool)

(assert (=> d!166325 m!1451203))

(assert (=> d!166325 m!1451129))

(assert (=> d!166325 m!1451135))

(declare-fun m!1451205 () Bool)

(assert (=> b!1578679 m!1451205))

(assert (=> b!1578679 m!1451205))

(declare-fun m!1451207 () Bool)

(assert (=> b!1578679 m!1451207))

(assert (=> b!1578540 d!166325))

(check-sat (not d!166309) (not b!1578613) (not b!1578679) (not d!166325))
(check-sat)
