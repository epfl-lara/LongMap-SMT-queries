; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135938 () Bool)

(assert start!135938)

(declare-fun res!1076648 () Bool)

(declare-fun e!878821 () Bool)

(assert (=> start!135938 (=> (not res!1076648) (not e!878821))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135938 (= res!1076648 (validMask!0 mask!898))))

(assert (=> start!135938 e!878821))

(assert (=> start!135938 true))

(declare-datatypes ((array!105443 0))(
  ( (array!105444 (arr!50858 (Array (_ BitVec 32) (_ BitVec 64))) (size!51408 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105443)

(declare-fun array_inv!39585 (array!105443) Bool)

(assert (=> start!135938 (array_inv!39585 _keys!605)))

(declare-fun b!1575658 () Bool)

(declare-fun res!1076647 () Bool)

(assert (=> b!1575658 (=> (not res!1076647) (not e!878821))))

(assert (=> b!1575658 (= res!1076647 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51408 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575659 () Bool)

(declare-fun res!1076649 () Bool)

(assert (=> b!1575659 (=> (not res!1076649) (not e!878821))))

(declare-fun k0!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575659 (= res!1076649 (validKeyInArray!0 k0!761))))

(declare-datatypes ((SeekEntryResult!13723 0))(
  ( (MissingZero!13723 (index!57290 (_ BitVec 32))) (Found!13723 (index!57291 (_ BitVec 32))) (Intermediate!13723 (undefined!14535 Bool) (index!57292 (_ BitVec 32)) (x!142253 (_ BitVec 32))) (Undefined!13723) (MissingVacant!13723 (index!57293 (_ BitVec 32))) )
))
(declare-fun lt!675277 () SeekEntryResult!13723)

(declare-fun b!1575660 () Bool)

(get-info :version)

(assert (=> b!1575660 (= e!878821 (and ((_ is Intermediate!13723) lt!675277) (not (undefined!14535 lt!675277)) (not (= (select (arr!50858 _keys!605) (index!57292 lt!675277)) k0!761)) (not (= (select (arr!50858 _keys!605) (index!57292 lt!675277)) #b0000000000000000000000000000000000000000000000000000000000000000)) (or (bvslt (index!57292 lt!675277) #b00000000000000000000000000000000) (bvsge (index!57292 lt!675277) (size!51408 _keys!605)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105443 (_ BitVec 32)) SeekEntryResult!13723)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575660 (= lt!675277 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898))))

(assert (= (and start!135938 res!1076648) b!1575658))

(assert (= (and b!1575658 res!1076647) b!1575659))

(assert (= (and b!1575659 res!1076649) b!1575660))

(declare-fun m!1448641 () Bool)

(assert (=> start!135938 m!1448641))

(declare-fun m!1448643 () Bool)

(assert (=> start!135938 m!1448643))

(declare-fun m!1448645 () Bool)

(assert (=> b!1575659 m!1448645))

(declare-fun m!1448647 () Bool)

(assert (=> b!1575660 m!1448647))

(declare-fun m!1448649 () Bool)

(assert (=> b!1575660 m!1448649))

(assert (=> b!1575660 m!1448649))

(declare-fun m!1448651 () Bool)

(assert (=> b!1575660 m!1448651))

(check-sat (not b!1575660) (not start!135938) (not b!1575659))
(check-sat)
(get-model)

(declare-fun b!1575715 () Bool)

(declare-fun e!878857 () Bool)

(declare-fun lt!675292 () SeekEntryResult!13723)

(assert (=> b!1575715 (= e!878857 (bvsge (x!142253 lt!675292) #b01111111111111111111111111111110))))

(declare-fun b!1575716 () Bool)

(declare-fun e!878855 () SeekEntryResult!13723)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575716 (= e!878855 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000 mask!898) k0!761 _keys!605 mask!898))))

(declare-fun b!1575717 () Bool)

(declare-fun e!878858 () SeekEntryResult!13723)

(assert (=> b!1575717 (= e!878858 e!878855)))

(declare-fun c!145790 () Bool)

(declare-fun lt!675291 () (_ BitVec 64))

(assert (=> b!1575717 (= c!145790 (or (= lt!675291 k0!761) (= (bvadd lt!675291 lt!675291) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1575718 () Bool)

(assert (=> b!1575718 (and (bvsge (index!57292 lt!675292) #b00000000000000000000000000000000) (bvslt (index!57292 lt!675292) (size!51408 _keys!605)))))

(declare-fun res!1076676 () Bool)

(assert (=> b!1575718 (= res!1076676 (= (select (arr!50858 _keys!605) (index!57292 lt!675292)) k0!761))))

(declare-fun e!878856 () Bool)

(assert (=> b!1575718 (=> res!1076676 e!878856)))

(declare-fun e!878854 () Bool)

(assert (=> b!1575718 (= e!878854 e!878856)))

(declare-fun d!165473 () Bool)

(assert (=> d!165473 e!878857))

(declare-fun c!145791 () Bool)

(assert (=> d!165473 (= c!145791 (and ((_ is Intermediate!13723) lt!675292) (undefined!14535 lt!675292)))))

(assert (=> d!165473 (= lt!675292 e!878858)))

(declare-fun c!145789 () Bool)

(assert (=> d!165473 (= c!145789 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!165473 (= lt!675291 (select (arr!50858 _keys!605) (toIndex!0 k0!761 mask!898)))))

(assert (=> d!165473 (validMask!0 mask!898)))

(assert (=> d!165473 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!761 mask!898) k0!761 _keys!605 mask!898) lt!675292)))

(declare-fun b!1575719 () Bool)

(assert (=> b!1575719 (= e!878858 (Intermediate!13723 true (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575720 () Bool)

(assert (=> b!1575720 (and (bvsge (index!57292 lt!675292) #b00000000000000000000000000000000) (bvslt (index!57292 lt!675292) (size!51408 _keys!605)))))

(assert (=> b!1575720 (= e!878856 (= (select (arr!50858 _keys!605) (index!57292 lt!675292)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1575721 () Bool)

(assert (=> b!1575721 (= e!878857 e!878854)))

(declare-fun res!1076674 () Bool)

(assert (=> b!1575721 (= res!1076674 (and ((_ is Intermediate!13723) lt!675292) (not (undefined!14535 lt!675292)) (bvslt (x!142253 lt!675292) #b01111111111111111111111111111110) (bvsge (x!142253 lt!675292) #b00000000000000000000000000000000) (bvsge (x!142253 lt!675292) #b00000000000000000000000000000000)))))

(assert (=> b!1575721 (=> (not res!1076674) (not e!878854))))

(declare-fun b!1575722 () Bool)

(assert (=> b!1575722 (= e!878855 (Intermediate!13723 false (toIndex!0 k0!761 mask!898) #b00000000000000000000000000000000))))

(declare-fun b!1575723 () Bool)

(assert (=> b!1575723 (and (bvsge (index!57292 lt!675292) #b00000000000000000000000000000000) (bvslt (index!57292 lt!675292) (size!51408 _keys!605)))))

(declare-fun res!1076675 () Bool)

(assert (=> b!1575723 (= res!1076675 (= (select (arr!50858 _keys!605) (index!57292 lt!675292)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1575723 (=> res!1076675 e!878856)))

(assert (= (and d!165473 c!145789) b!1575719))

(assert (= (and d!165473 (not c!145789)) b!1575717))

(assert (= (and b!1575717 c!145790) b!1575722))

(assert (= (and b!1575717 (not c!145790)) b!1575716))

(assert (= (and d!165473 c!145791) b!1575715))

(assert (= (and d!165473 (not c!145791)) b!1575721))

(assert (= (and b!1575721 res!1076674) b!1575718))

(assert (= (and b!1575718 (not res!1076676)) b!1575723))

(assert (= (and b!1575723 (not res!1076675)) b!1575720))

(declare-fun m!1448673 () Bool)

(assert (=> b!1575723 m!1448673))

(assert (=> d!165473 m!1448649))

(declare-fun m!1448675 () Bool)

(assert (=> d!165473 m!1448675))

(assert (=> d!165473 m!1448641))

(assert (=> b!1575720 m!1448673))

(assert (=> b!1575716 m!1448649))

(declare-fun m!1448677 () Bool)

(assert (=> b!1575716 m!1448677))

(assert (=> b!1575716 m!1448677))

(declare-fun m!1448679 () Bool)

(assert (=> b!1575716 m!1448679))

(assert (=> b!1575718 m!1448673))

(assert (=> b!1575660 d!165473))

(declare-fun d!165481 () Bool)

(declare-fun lt!675304 () (_ BitVec 32))

(declare-fun lt!675303 () (_ BitVec 32))

(assert (=> d!165481 (= lt!675304 (bvmul (bvxor lt!675303 (bvlshr lt!675303 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!165481 (= lt!675303 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!165481 (and (bvsge mask!898 #b00000000000000000000000000000000) (let ((res!1076678 (let ((h!38271 ((_ extract 31 0) (bvand (bvxor k0!761 (bvlshr k0!761 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!142258 (bvmul (bvxor h!38271 (bvlshr h!38271 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!142258 (bvlshr x!142258 #b00000000000000000000000000001101)) mask!898))))) (and (bvslt res!1076678 (bvadd mask!898 #b00000000000000000000000000000001)) (bvsge res!1076678 #b00000000000000000000000000000000))))))

(assert (=> d!165481 (= (toIndex!0 k0!761 mask!898) (bvand (bvxor lt!675304 (bvlshr lt!675304 #b00000000000000000000000000001101)) mask!898))))

(assert (=> b!1575660 d!165481))

(declare-fun d!165485 () Bool)

(assert (=> d!165485 (= (validMask!0 mask!898) (and (or (= mask!898 #b00000000000000000000000000000111) (= mask!898 #b00000000000000000000000000001111) (= mask!898 #b00000000000000000000000000011111) (= mask!898 #b00000000000000000000000000111111) (= mask!898 #b00000000000000000000000001111111) (= mask!898 #b00000000000000000000000011111111) (= mask!898 #b00000000000000000000000111111111) (= mask!898 #b00000000000000000000001111111111) (= mask!898 #b00000000000000000000011111111111) (= mask!898 #b00000000000000000000111111111111) (= mask!898 #b00000000000000000001111111111111) (= mask!898 #b00000000000000000011111111111111) (= mask!898 #b00000000000000000111111111111111) (= mask!898 #b00000000000000001111111111111111) (= mask!898 #b00000000000000011111111111111111) (= mask!898 #b00000000000000111111111111111111) (= mask!898 #b00000000000001111111111111111111) (= mask!898 #b00000000000011111111111111111111) (= mask!898 #b00000000000111111111111111111111) (= mask!898 #b00000000001111111111111111111111) (= mask!898 #b00000000011111111111111111111111) (= mask!898 #b00000000111111111111111111111111) (= mask!898 #b00000001111111111111111111111111) (= mask!898 #b00000011111111111111111111111111) (= mask!898 #b00000111111111111111111111111111) (= mask!898 #b00001111111111111111111111111111) (= mask!898 #b00011111111111111111111111111111) (= mask!898 #b00111111111111111111111111111111)) (bvsle mask!898 #b00111111111111111111111111111111)))))

(assert (=> start!135938 d!165485))

(declare-fun d!165493 () Bool)

(assert (=> d!165493 (= (array_inv!39585 _keys!605) (bvsge (size!51408 _keys!605) #b00000000000000000000000000000000))))

(assert (=> start!135938 d!165493))

(declare-fun d!165495 () Bool)

(assert (=> d!165495 (= (validKeyInArray!0 k0!761) (and (not (= k0!761 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!761 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1575659 d!165495))

(check-sat (not d!165473) (not b!1575716))
(check-sat)
