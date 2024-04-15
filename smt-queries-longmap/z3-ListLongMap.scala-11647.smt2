; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135934 () Bool)

(assert start!135934)

(declare-fun res!1076568 () Bool)

(declare-fun e!878683 () Bool)

(assert (=> start!135934 (=> (not res!1076568) (not e!878683))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135934 (= res!1076568 (validMask!0 mask!898))))

(assert (=> start!135934 e!878683))

(assert (=> start!135934 true))

(declare-datatypes ((array!105380 0))(
  ( (array!105381 (arr!50825 (Array (_ BitVec 32) (_ BitVec 64))) (size!51377 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105380)

(declare-fun array_inv!39761 (array!105380) Bool)

(assert (=> start!135934 (array_inv!39761 _keys!605)))

(declare-fun b!1575446 () Bool)

(declare-fun res!1076569 () Bool)

(assert (=> b!1575446 (=> (not res!1076569) (not e!878683))))

(assert (=> b!1575446 (= res!1076569 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51377 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575448 () Bool)

(declare-fun e!878682 () Bool)

(assert (=> b!1575448 (= e!878683 e!878682)))

(declare-fun res!1076571 () Bool)

(assert (=> b!1575448 (=> (not res!1076571) (not e!878682))))

(declare-datatypes ((SeekEntryResult!13725 0))(
  ( (MissingZero!13725 (index!57298 (_ BitVec 32))) (Found!13725 (index!57299 (_ BitVec 32))) (Intermediate!13725 (undefined!14537 Bool) (index!57300 (_ BitVec 32)) (x!142264 (_ BitVec 32))) (Undefined!13725) (MissingVacant!13725 (index!57301 (_ BitVec 32))) )
))
(declare-fun lt!675036 () SeekEntryResult!13725)

(declare-fun k0!761 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1575448 (= res!1076571 (and (not (undefined!14537 lt!675036)) ((_ is Intermediate!13725) lt!675036) (not (= (select (arr!50825 _keys!605) (index!57300 lt!675036)) k0!761)) (not (= (select (arr!50825 _keys!605) (index!57300 lt!675036)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50825 _keys!605) (index!57300 lt!675036)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!57300 lt!675036) #b00000000000000000000000000000000) (bvslt (index!57300 lt!675036) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105380 (_ BitVec 32)) SeekEntryResult!13725)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575448 (= lt!675036 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1575447 () Bool)

(declare-fun res!1076570 () Bool)

(assert (=> b!1575447 (=> (not res!1076570) (not e!878683))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575447 (= res!1076570 (validKeyInArray!0 k0!761))))

(declare-fun b!1575449 () Bool)

(declare-fun lt!675035 () SeekEntryResult!13725)

(assert (=> b!1575449 (= e!878682 (and (not ((_ is Undefined!13725) lt!675035)) ((_ is Found!13725) lt!675035) (or (bvslt (index!57299 lt!675035) #b00000000000000000000000000000000) (bvsge (index!57299 lt!675035) (size!51377 _keys!605)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105380 (_ BitVec 32)) SeekEntryResult!13725)

(assert (=> b!1575449 (= lt!675035 (seekKeyOrZeroReturnVacant!0 (x!142264 lt!675036) (index!57300 lt!675036) (index!57300 lt!675036) k0!761 _keys!605 mask!898))))

(assert (= (and start!135934 res!1076568) b!1575446))

(assert (= (and b!1575446 res!1076569) b!1575447))

(assert (= (and b!1575447 res!1076570) b!1575448))

(assert (= (and b!1575448 res!1076571) b!1575449))

(declare-fun m!1447797 () Bool)

(assert (=> start!135934 m!1447797))

(declare-fun m!1447799 () Bool)

(assert (=> start!135934 m!1447799))

(declare-fun m!1447801 () Bool)

(assert (=> b!1575448 m!1447801))

(declare-fun m!1447803 () Bool)

(assert (=> b!1575448 m!1447803))

(assert (=> b!1575448 m!1447803))

(declare-fun m!1447805 () Bool)

(assert (=> b!1575448 m!1447805))

(declare-fun m!1447807 () Bool)

(assert (=> b!1575447 m!1447807))

(declare-fun m!1447809 () Bool)

(assert (=> b!1575449 m!1447809))

(check-sat (not b!1575449) (not b!1575448) (not start!135934) (not b!1575447))
(check-sat)
(get-model)

(declare-fun e!878709 () SeekEntryResult!13725)

(declare-fun b!1575486 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575486 (= e!878709 (seekKeyOrZeroReturnVacant!0 (bvadd (x!142264 lt!675036) #b00000000000000000000000000000001) (nextIndex!0 (index!57300 lt!675036) (x!142264 lt!675036) mask!898) (index!57300 lt!675036) k0!761 _keys!605 mask!898))))

(declare-fun b!1575487 () Bool)

(declare-fun c!145719 () Bool)

(declare-fun lt!675053 () (_ BitVec 64))

(assert (=> b!1575487 (= c!145719 (= lt!675053 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!878710 () SeekEntryResult!13725)

(assert (=> b!1575487 (= e!878710 e!878709)))

(declare-fun b!1575488 () Bool)

(declare-fun e!878711 () SeekEntryResult!13725)

(assert (=> b!1575488 (= e!878711 e!878710)))

(declare-fun c!145718 () Bool)

(assert (=> b!1575488 (= c!145718 (= lt!675053 k0!761))))

(declare-fun lt!675054 () SeekEntryResult!13725)

(declare-fun d!165263 () Bool)

(assert (=> d!165263 (and (or ((_ is Undefined!13725) lt!675054) (not ((_ is Found!13725) lt!675054)) (and (bvsge (index!57299 lt!675054) #b00000000000000000000000000000000) (bvslt (index!57299 lt!675054) (size!51377 _keys!605)))) (or ((_ is Undefined!13725) lt!675054) ((_ is Found!13725) lt!675054) (not ((_ is MissingVacant!13725) lt!675054)) (not (= (index!57301 lt!675054) (index!57300 lt!675036))) (and (bvsge (index!57301 lt!675054) #b00000000000000000000000000000000) (bvslt (index!57301 lt!675054) (size!51377 _keys!605)))) (or ((_ is Undefined!13725) lt!675054) (ite ((_ is Found!13725) lt!675054) (= (select (arr!50825 _keys!605) (index!57299 lt!675054)) k0!761) (and ((_ is MissingVacant!13725) lt!675054) (= (index!57301 lt!675054) (index!57300 lt!675036)) (= (select (arr!50825 _keys!605) (index!57301 lt!675054)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!165263 (= lt!675054 e!878711)))

(declare-fun c!145720 () Bool)

(assert (=> d!165263 (= c!145720 (bvsge (x!142264 lt!675036) #b01111111111111111111111111111110))))

(assert (=> d!165263 (= lt!675053 (select (arr!50825 _keys!605) (index!57300 lt!675036)))))

(assert (=> d!165263 (validMask!0 mask!898)))

(assert (=> d!165263 (= (seekKeyOrZeroReturnVacant!0 (x!142264 lt!675036) (index!57300 lt!675036) (index!57300 lt!675036) k0!761 _keys!605 mask!898) lt!675054)))

(declare-fun b!1575489 () Bool)

(assert (=> b!1575489 (= e!878711 Undefined!13725)))

(declare-fun b!1575490 () Bool)

(assert (=> b!1575490 (= e!878709 (MissingVacant!13725 (index!57300 lt!675036)))))

(declare-fun b!1575491 () Bool)

(assert (=> b!1575491 (= e!878710 (Found!13725 (index!57300 lt!675036)))))

(assert (= (and d!165263 c!145720) b!1575489))

(assert (= (and d!165263 (not c!145720)) b!1575488))

(assert (= (and b!1575488 c!145718) b!1575491))

(assert (= (and b!1575488 (not c!145718)) b!1575487))

(assert (= (and b!1575487 c!145719) b!1575490))

(assert (= (and b!1575487 (not c!145719)) b!1575486))

(declare-fun m!1447839 () Bool)

(assert (=> b!1575486 m!1447839))

(assert (=> b!1575486 m!1447839))

(declare-fun m!1447841 () Bool)

(assert (=> b!1575486 m!1447841))

(declare-fun m!1447843 () Bool)

(assert (=> d!165263 m!1447843))

(declare-fun m!1447845 () Bool)

(assert (=> d!165263 m!1447845))

(assert (=> d!165263 m!1447801))

(assert (=> d!165263 m!1447797))

(assert (=> b!1575449 d!165263))

(declare-fun b!1575550 () Bool)

(declare-fun e!878746 () SeekEntryResult!13725)

(assert (=> b!1575550 (= e!878746 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1575551 () Bool)

(declare-fun lt!675076 () SeekEntryResult!13725)

(assert (=> b!1575551 (and (bvsge (index!57300 lt!675076) #b00000000000000000000000000000000) (bvslt (index!57300 lt!675076) (size!51377 _keys!605)))))

(declare-fun res!1076604 () Bool)

(assert (=> b!1575551 (= res!1076604 (= (select (arr!50825 _keys!605) (index!57300 lt!675076)) k0!761))))

(declare-fun e!878743 () Bool)

(assert (=> b!1575551 (=> res!1076604 e!878743)))

(declare-fun e!878744 () Bool)

(assert (=> b!1575551 (= e!878744 e!878743)))

(declare-fun b!1575553 () Bool)

(declare-fun e!878745 () SeekEntryResult!13725)

(assert (=> b!1575553 (= e!878745 (Intermediate!13725 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575554 () Bool)

(assert (=> b!1575554 (and (bvsge (index!57300 lt!675076) #b00000000000000000000000000000000) (bvslt (index!57300 lt!675076) (size!51377 _keys!605)))))

(assert (=> b!1575554 (= e!878743 (= (select (arr!50825 _keys!605) (index!57300 lt!675076)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1575552 () Bool)

(assert (=> b!1575552 (and (bvsge (index!57300 lt!675076) #b00000000000000000000000000000000) (bvslt (index!57300 lt!675076) (size!51377 _keys!605)))))

(declare-fun res!1076602 () Bool)

(assert (=> b!1575552 (= res!1076602 (= (select (arr!50825 _keys!605) (index!57300 lt!675076)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1575552 (=> res!1076602 e!878743)))

(declare-fun d!165269 () Bool)

(declare-fun e!878742 () Bool)

(assert (=> d!165269 e!878742))

(declare-fun c!145747 () Bool)

(assert (=> d!165269 (= c!145747 (and ((_ is Intermediate!13725) lt!675076) (undefined!14537 lt!675076)))))

(assert (=> d!165269 (= lt!675076 e!878745)))

(declare-fun c!145749 () Bool)

(assert (=> d!165269 (= c!145749 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!675075 () (_ BitVec 64))

(assert (=> d!165269 (= lt!675075 (select (arr!50825 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!165269 (validMask!0 mask!898)))

(assert (=> d!165269 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!675076)))

(declare-fun b!1575555 () Bool)

(assert (=> b!1575555 (= e!878742 e!878744)))

(declare-fun res!1076603 () Bool)

(assert (=> b!1575555 (= res!1076603 (and ((_ is Intermediate!13725) lt!675076) (not (undefined!14537 lt!675076)) (bvslt (x!142264 lt!675076) #b01111111111111111111111111111110) (bvsge (x!142264 lt!675076) #b00000000000000000000000000000000) (bvsge (x!142264 lt!675076) #b00000000000000000000000000000000)))))

(assert (=> b!1575555 (=> (not res!1076603) (not e!878744))))

(declare-fun b!1575556 () Bool)

(assert (=> b!1575556 (= e!878745 e!878746)))

(declare-fun c!145748 () Bool)

(assert (=> b!1575556 (= c!145748 (or (= lt!675075 k0!761) (= (bvadd lt!675075 lt!675075) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1575557 () Bool)

(assert (=> b!1575557 (= e!878746 (Intermediate!13725 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575558 () Bool)

(assert (=> b!1575558 (= e!878742 (bvsge (x!142264 lt!675076) #b01111111111111111111111111111110))))

(assert (= (and d!165269 c!145749) b!1575553))

(assert (= (and d!165269 (not c!145749)) b!1575556))

(assert (= (and b!1575556 c!145748) b!1575557))

(assert (= (and b!1575556 (not c!145748)) b!1575550))

(assert (= (and d!165269 c!145747) b!1575558))

(assert (= (and d!165269 (not c!145747)) b!1575555))

(assert (= (and b!1575555 res!1076603) b!1575551))

(assert (= (and b!1575551 (not res!1076604)) b!1575552))

(assert (= (and b!1575552 (not res!1076602)) b!1575554))

(declare-fun m!1447863 () Bool)

(assert (=> b!1575552 m!1447863))

(assert (=> d!165269 m!1447803))

(declare-fun m!1447865 () Bool)

(assert (=> d!165269 m!1447865))

(assert (=> d!165269 m!1447797))

(assert (=> b!1575551 m!1447863))

(assert (=> b!1575554 m!1447863))

(assert (=> b!1575550 m!1447803))

(declare-fun m!1447867 () Bool)

(assert (=> b!1575550 m!1447867))

(assert (=> b!1575550 m!1447867))

(declare-fun m!1447869 () Bool)

(assert (=> b!1575550 m!1447869))

(assert (=> b!1575448 d!165269))

(declare-fun d!165275 () Bool)

(declare-fun lt!675088 () (_ BitVec 32))

(declare-fun lt!675087 () (_ BitVec 32))

(assert (=> d!165275 (= lt!675088 (bvmul (bvxor lt!675087 (bvlshr lt!675087 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165275 (= lt!675087 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165275 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076609 (let ((h!38315 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142272 (bvmul (bvxor h!38315 (bvlshr h!38315 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142272 (bvlshr x!142272 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076609 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076609 #b00000000000000000000000000000000))))))

(assert (=> d!165275 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!675088 (bvlshr lt!675088 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1575448 d!165275))

(declare-fun d!165277 () Bool)

(assert (=> d!165277 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135934 d!165277))

(declare-fun d!165285 () Bool)

(assert (=> d!165285 (= (array_inv!39761 _keys!605) (bvsge (size!51377 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135934 d!165285))

(declare-fun d!165287 () Bool)

(assert (=> d!165287 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1575447 d!165287))

(check-sat (not b!1575550) (not b!1575486) (not d!165269) (not d!165263))
(check-sat)
