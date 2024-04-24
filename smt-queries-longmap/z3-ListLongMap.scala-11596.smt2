; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135606 () Bool)

(assert start!135606)

(declare-fun b!1575569 () Bool)

(declare-fun e!878752 () Bool)

(declare-fun e!878751 () Bool)

(assert (=> b!1575569 (= e!878752 e!878751)))

(declare-fun res!1075697 () Bool)

(assert (=> b!1575569 (=> (not res!1075697) (not e!878751))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!13568 0))(
  ( (MissingZero!13568 (index!56670 (_ BitVec 32))) (Found!13568 (index!56671 (_ BitVec 32))) (Intermediate!13568 (undefined!14380 Bool) (index!56672 (_ BitVec 32)) (x!141668 (_ BitVec 32))) (Undefined!13568) (MissingVacant!13568 (index!56673 (_ BitVec 32))) )
))
(declare-fun lt!675185 () SeekEntryResult!13568)

(declare-fun mask!889 () (_ BitVec 32))

(declare-datatypes ((array!105218 0))(
  ( (array!105219 (arr!50761 (Array (_ BitVec 32) (_ BitVec 64))) (size!51312 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105218)

(get-info :version)

(assert (=> b!1575569 (= res!1075697 (and (not (undefined!14380 lt!675185)) ((_ is Intermediate!13568) lt!675185) (not (= (select (arr!50761 _keys!600) (index!56672 lt!675185)) k0!754)) (not (= (select (arr!50761 _keys!600) (index!56672 lt!675185)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50761 _keys!600) (index!56672 lt!675185)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56672 lt!675185) #b00000000000000000000000000000000) (bvslt (index!56672 lt!675185) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105218 (_ BitVec 32)) SeekEntryResult!13568)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575569 (= lt!675185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun res!1075698 () Bool)

(assert (=> start!135606 (=> (not res!1075698) (not e!878752))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135606 (= res!1075698 (validMask!0 mask!889))))

(assert (=> start!135606 e!878752))

(assert (=> start!135606 true))

(declare-fun array_inv!39716 (array!105218) Bool)

(assert (=> start!135606 (array_inv!39716 _keys!600)))

(declare-fun b!1575567 () Bool)

(declare-fun res!1075700 () Bool)

(assert (=> b!1575567 (=> (not res!1075700) (not e!878752))))

(assert (=> b!1575567 (= res!1075700 (= (size!51312 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1575570 () Bool)

(declare-fun lt!675186 () SeekEntryResult!13568)

(assert (=> b!1575570 (= e!878751 (and (not ((_ is MissingVacant!13568) lt!675186)) (not ((_ is Found!13568) lt!675186)) (not ((_ is MissingZero!13568) lt!675186)) (not ((_ is Undefined!13568) lt!675186))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105218 (_ BitVec 32)) SeekEntryResult!13568)

(assert (=> b!1575570 (= lt!675186 (seekKeyOrZeroReturnVacant!0 (x!141668 lt!675185) (index!56672 lt!675185) (index!56672 lt!675185) k0!754 _keys!600 mask!889))))

(declare-fun b!1575568 () Bool)

(declare-fun res!1075699 () Bool)

(assert (=> b!1575568 (=> (not res!1075699) (not e!878752))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575568 (= res!1075699 (validKeyInArray!0 k0!754))))

(assert (= (and start!135606 res!1075698) b!1575567))

(assert (= (and b!1575567 res!1075700) b!1575568))

(assert (= (and b!1575568 res!1075699) b!1575569))

(assert (= (and b!1575569 res!1075697) b!1575570))

(declare-fun m!1448955 () Bool)

(assert (=> b!1575569 m!1448955))

(declare-fun m!1448957 () Bool)

(assert (=> b!1575569 m!1448957))

(assert (=> b!1575569 m!1448957))

(declare-fun m!1448959 () Bool)

(assert (=> b!1575569 m!1448959))

(declare-fun m!1448961 () Bool)

(assert (=> start!135606 m!1448961))

(declare-fun m!1448963 () Bool)

(assert (=> start!135606 m!1448963))

(declare-fun m!1448965 () Bool)

(assert (=> b!1575570 m!1448965))

(declare-fun m!1448967 () Bool)

(assert (=> b!1575568 m!1448967))

(check-sat (not b!1575570) (not b!1575569) (not b!1575568) (not start!135606))
(check-sat)
(get-model)

(declare-fun b!1575607 () Bool)

(declare-fun c!146202 () Bool)

(declare-fun lt!675204 () (_ BitVec 64))

(assert (=> b!1575607 (= c!146202 (= lt!675204 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!878778 () SeekEntryResult!13568)

(declare-fun e!878780 () SeekEntryResult!13568)

(assert (=> b!1575607 (= e!878778 e!878780)))

(declare-fun b!1575608 () Bool)

(assert (=> b!1575608 (= e!878778 (Found!13568 (index!56672 lt!675185)))))

(declare-fun b!1575609 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575609 (= e!878780 (seekKeyOrZeroReturnVacant!0 (bvadd (x!141668 lt!675185) #b00000000000000000000000000000001) (nextIndex!0 (index!56672 lt!675185) (bvadd (x!141668 lt!675185) #b00000000000000000000000000000001) mask!889) (index!56672 lt!675185) k0!754 _keys!600 mask!889))))

(declare-fun b!1575610 () Bool)

(declare-fun e!878779 () SeekEntryResult!13568)

(assert (=> b!1575610 (= e!878779 e!878778)))

(declare-fun c!146204 () Bool)

(assert (=> b!1575610 (= c!146204 (= lt!675204 k0!754))))

(declare-fun b!1575611 () Bool)

(assert (=> b!1575611 (= e!878780 (MissingVacant!13568 (index!56672 lt!675185)))))

(declare-fun b!1575612 () Bool)

(assert (=> b!1575612 (= e!878779 Undefined!13568)))

(declare-fun lt!675203 () SeekEntryResult!13568)

(declare-fun d!165633 () Bool)

(assert (=> d!165633 (and (or ((_ is Undefined!13568) lt!675203) (not ((_ is Found!13568) lt!675203)) (and (bvsge (index!56671 lt!675203) #b00000000000000000000000000000000) (bvslt (index!56671 lt!675203) (size!51312 _keys!600)))) (or ((_ is Undefined!13568) lt!675203) ((_ is Found!13568) lt!675203) (not ((_ is MissingVacant!13568) lt!675203)) (not (= (index!56673 lt!675203) (index!56672 lt!675185))) (and (bvsge (index!56673 lt!675203) #b00000000000000000000000000000000) (bvslt (index!56673 lt!675203) (size!51312 _keys!600)))) (or ((_ is Undefined!13568) lt!675203) (ite ((_ is Found!13568) lt!675203) (= (select (arr!50761 _keys!600) (index!56671 lt!675203)) k0!754) (and ((_ is MissingVacant!13568) lt!675203) (= (index!56673 lt!675203) (index!56672 lt!675185)) (= (select (arr!50761 _keys!600) (index!56673 lt!675203)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!165633 (= lt!675203 e!878779)))

(declare-fun c!146203 () Bool)

(assert (=> d!165633 (= c!146203 (bvsge (x!141668 lt!675185) #b01111111111111111111111111111110))))

(assert (=> d!165633 (= lt!675204 (select (arr!50761 _keys!600) (index!56672 lt!675185)))))

(assert (=> d!165633 (validMask!0 mask!889)))

(assert (=> d!165633 (= (seekKeyOrZeroReturnVacant!0 (x!141668 lt!675185) (index!56672 lt!675185) (index!56672 lt!675185) k0!754 _keys!600 mask!889) lt!675203)))

(assert (= (and d!165633 c!146203) b!1575612))

(assert (= (and d!165633 (not c!146203)) b!1575610))

(assert (= (and b!1575610 c!146204) b!1575608))

(assert (= (and b!1575610 (not c!146204)) b!1575607))

(assert (= (and b!1575607 c!146202) b!1575611))

(assert (= (and b!1575607 (not c!146202)) b!1575609))

(declare-fun m!1448997 () Bool)

(assert (=> b!1575609 m!1448997))

(assert (=> b!1575609 m!1448997))

(declare-fun m!1448999 () Bool)

(assert (=> b!1575609 m!1448999))

(declare-fun m!1449001 () Bool)

(assert (=> d!165633 m!1449001))

(declare-fun m!1449003 () Bool)

(assert (=> d!165633 m!1449003))

(assert (=> d!165633 m!1448955))

(assert (=> d!165633 m!1448961))

(assert (=> b!1575570 d!165633))

(declare-fun e!878824 () SeekEntryResult!13568)

(declare-fun b!1575694 () Bool)

(assert (=> b!1575694 (= e!878824 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1575695 () Bool)

(declare-fun e!878825 () Bool)

(declare-fun lt!675235 () SeekEntryResult!13568)

(assert (=> b!1575695 (= e!878825 (bvsge (x!141668 lt!675235) #b01111111111111111111111111111110))))

(declare-fun b!1575696 () Bool)

(assert (=> b!1575696 (and (bvsge (index!56672 lt!675235) #b00000000000000000000000000000000) (bvslt (index!56672 lt!675235) (size!51312 _keys!600)))))

(declare-fun res!1075741 () Bool)

(assert (=> b!1575696 (= res!1075741 (= (select (arr!50761 _keys!600) (index!56672 lt!675235)) k0!754))))

(declare-fun e!878828 () Bool)

(assert (=> b!1575696 (=> res!1075741 e!878828)))

(declare-fun e!878827 () Bool)

(assert (=> b!1575696 (= e!878827 e!878828)))

(declare-fun b!1575697 () Bool)

(assert (=> b!1575697 (= e!878824 (Intermediate!13568 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun d!165639 () Bool)

(assert (=> d!165639 e!878825))

(declare-fun c!146240 () Bool)

(assert (=> d!165639 (= c!146240 (and ((_ is Intermediate!13568) lt!675235) (undefined!14380 lt!675235)))))

(declare-fun e!878826 () SeekEntryResult!13568)

(assert (=> d!165639 (= lt!675235 e!878826)))

(declare-fun c!146238 () Bool)

(assert (=> d!165639 (= c!146238 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675236 () (_ BitVec 64))

(assert (=> d!165639 (= lt!675236 (select (arr!50761 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!165639 (validMask!0 mask!889)))

(assert (=> d!165639 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!675235)))

(declare-fun b!1575698 () Bool)

(assert (=> b!1575698 (and (bvsge (index!56672 lt!675235) #b00000000000000000000000000000000) (bvslt (index!56672 lt!675235) (size!51312 _keys!600)))))

(assert (=> b!1575698 (= e!878828 (= (select (arr!50761 _keys!600) (index!56672 lt!675235)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1575699 () Bool)

(assert (=> b!1575699 (= e!878826 (Intermediate!13568 true (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1575700 () Bool)

(assert (=> b!1575700 (and (bvsge (index!56672 lt!675235) #b00000000000000000000000000000000) (bvslt (index!56672 lt!675235) (size!51312 _keys!600)))))

(declare-fun res!1075743 () Bool)

(assert (=> b!1575700 (= res!1075743 (= (select (arr!50761 _keys!600) (index!56672 lt!675235)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1575700 (=> res!1075743 e!878828)))

(declare-fun b!1575701 () Bool)

(assert (=> b!1575701 (= e!878826 e!878824)))

(declare-fun c!146239 () Bool)

(assert (=> b!1575701 (= c!146239 (or (= lt!675236 k0!754) (= (bvadd lt!675236 lt!675236) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1575702 () Bool)

(assert (=> b!1575702 (= e!878825 e!878827)))

(declare-fun res!1075742 () Bool)

(assert (=> b!1575702 (= res!1075742 (and ((_ is Intermediate!13568) lt!675235) (not (undefined!14380 lt!675235)) (bvslt (x!141668 lt!675235) #b01111111111111111111111111111110) (bvsge (x!141668 lt!675235) #b00000000000000000000000000000000) (bvsge (x!141668 lt!675235) #b00000000000000000000000000000000)))))

(assert (=> b!1575702 (=> (not res!1075742) (not e!878827))))

(assert (= (and d!165639 c!146238) b!1575699))

(assert (= (and d!165639 (not c!146238)) b!1575701))

(assert (= (and b!1575701 c!146239) b!1575697))

(assert (= (and b!1575701 (not c!146239)) b!1575694))

(assert (= (and d!165639 c!146240) b!1575695))

(assert (= (and d!165639 (not c!146240)) b!1575702))

(assert (= (and b!1575702 res!1075742) b!1575696))

(assert (= (and b!1575696 (not res!1075741)) b!1575700))

(assert (= (and b!1575700 (not res!1075743)) b!1575698))

(assert (=> d!165639 m!1448957))

(declare-fun m!1449029 () Bool)

(assert (=> d!165639 m!1449029))

(assert (=> d!165639 m!1448961))

(declare-fun m!1449031 () Bool)

(assert (=> b!1575700 m!1449031))

(assert (=> b!1575698 m!1449031))

(assert (=> b!1575694 m!1448957))

(declare-fun m!1449033 () Bool)

(assert (=> b!1575694 m!1449033))

(assert (=> b!1575694 m!1449033))

(declare-fun m!1449035 () Bool)

(assert (=> b!1575694 m!1449035))

(assert (=> b!1575696 m!1449031))

(assert (=> b!1575569 d!165639))

(declare-fun d!165651 () Bool)

(declare-fun lt!675244 () (_ BitVec 32))

(declare-fun lt!675243 () (_ BitVec 32))

(assert (=> d!165651 (= lt!675244 (bvmul (bvxor lt!675243 (bvlshr lt!675243 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165651 (= lt!675243 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165651 (and (bvsge mask!889 #b00000000000000000000000000000000) (let ((res!1075746 (let ((h!38282 ((_ extract 31 0) (bvand (bvxor k0!754 (bvlshr k0!754 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!141678 (bvmul (bvxor h!38282 (bvlshr h!38282 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!141678 (bvlshr x!141678 #b00000000000000000000000000001101)) mask!889))))) (and (bvslt res!1075746 (bvadd mask!889 #b00000000000000000000000000000001)) (bvsge res!1075746 #b00000000000000000000000000000000))))))

(assert (=> d!165651 (= (toIndex!0 k0!754 mask!889) (bvand (bvxor lt!675244 (bvlshr lt!675244 #b00000000000000000000000000001101)) mask!889))))

(assert (=> b!1575569 d!165651))

(declare-fun d!165653 () Bool)

(assert (=> d!165653 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1575568 d!165653))

(declare-fun d!165655 () Bool)

(assert (=> d!165655 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135606 d!165655))

(declare-fun d!165665 () Bool)

(assert (=> d!165665 (= (array_inv!39716 _keys!600) (bvsge (size!51312 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135606 d!165665))

(check-sat (not b!1575609) (not b!1575694) (not d!165639) (not d!165633))
(check-sat)
